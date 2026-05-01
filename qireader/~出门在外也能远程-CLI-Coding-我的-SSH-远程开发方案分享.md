---
comments: true
created: '2026-03-24T13:41:03'
draft: true
modified: '2026-03-24T13:41:03'
source: https://sspai.com/post/105621
title: 出门在外也能远程 CLI Coding：我的 SSH 远程开发方案分享
type: archive-web
---

**Matrix 首页推荐**  

[Matrix](https://sspai.com/matrix)
是少数派的写作社区，我们主张分享真实的产品体验，有实用价值的经验与思考。我们会不定期挑选 Matrix 最优质的文章，展示来自用户的最真实的体验和观点。

文章代表作者个人观点，少数派仅对标题和排版略作修改。

* * *

我的主力电脑是一台 iMac，在固定的房间，这限制了我使用电脑的时间和场景。不过随着
[Codex](https://github.com/openai/codex)、[Claude
Code](https://github.com/anthropics/claude-code) 等 CLI Coding Agent 的出现，我可以在
iPad 或手机上，通过 SSH 远程连接 Mac，在乘坐地铁等碎片时间远程开发，随时随地为「[HEIF & HEVC
转换器](https://blanboom.org/2025/heif_converter/)」添加新功能。

在通过 SSH 远程开发的过程中，我对自己的开发环境进行了一系列配置和优化，例如：

  * 通过 [Bark](https://github.com/Finb/Bark) 将 Claude Code/Codex 的通知推送到 iPhone
  * 解决移动端网络变化/杀后台导致 SSH 断连
  * 修改 SSH 配置文件让 1Password SSH Agent 与远程连接共存

我将自己进行的配置改动记录到这篇文章中，供自己后续维护和回顾，也方便各位读者参考。

利用碎片时间远程开发，无法像使用电脑那样，盯着屏幕随时观察 CLI Coding Agent 的执行结果，所以我使用下面的 Python 脚本，通过
[Bark](https://github.com/Finb/Bark) 将执行结果发送到手机上。

此脚本同时兼容 Claude Code、Codex 和 OpenCode，并对推送内容做了加密处理，Bark 服务器和 Apple 都无法获取推送内容。

相关代码也[已上传到 GitHub](https://github.com/blanboom/bark-notification-for-claude-
codex-opencode):

### Bark 通知脚本，同时兼容 Codex、Claude Code 和 OpenCode

`notify_claude_codex_bark.py`

    
    
    #!/usr/bin/env python3
    import base64
    import json
    import sys
    import urllib.parse
    import urllib.request
    
    # Dependency: brew install cryptography
    from cryptography.hazmat.primitives.ciphers.aead import AESGCM
    
    BARK_BASE = "https://api.day.app/xxx"
    ENCRYPTION_KEY = "xxx"
    ENCRYPTION_IV = "xxx"
    
    OPENAI_ICON_URL = "https://images.ctfassets.net/j22is2dtoxu1/intercom-img-d177d076c9a5453052925143/49d5d812b0a6fcc20a14faa8c629d9fb/icon-ios-1024_401x.png"
    # Claude symbol (CC0) from Wikimedia, publicly accessible without auth.
    CLAUDE_ICON_URL = "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Claude_AI_symbol.svg/960px-Claude_AI_symbol.svg.png"
    # OpenCode icon
    OPENCODE_ICON_URL = "https://opencode.ai/apple-touch-icon.png"
    
    def _load_key_iv():
        key_bytes = ENCRYPTION_KEY.encode("utf-8")
        if len(key_bytes) != 32:
            return None, None
    
        iv_bytes = ENCRYPTION_IV.encode("utf-8")
        if len(iv_bytes) != 12:
            return None, None
    
        return key_bytes, iv_bytes
    
    
    def _encrypt_aes_gcm(plaintext: bytes, key: bytes, iv: bytes):
        aesgcm = AESGCM(key)
        encrypted = aesgcm.encrypt(iv, plaintext, None)
        return base64.b64encode(encrypted).decode("ascii")
    
    
    def _load_payload() -> dict:
        if len(sys.argv) > 1:
            try:
                return json.loads(sys.argv[1])
            except json.JSONDecodeError:
                return {}
        try:
            if not sys.stdin.isatty():
                raw = sys.stdin.read().strip()
                if raw:
                    return json.loads(raw)
        except Exception:
            return {}
        return {}
    
    
    def _detect_source(payload: dict) -> str:
        """Detect the source of the payload: 'claude', 'opencode', or 'codex'."""
        if payload.get("hook_event_name"):
            return "claude"
        if payload.get("session_id") or payload.get("transcript_path"):
            return "claude"
        title = payload.get("title") or ""
        if "Claude" in title:
            return "claude"
        if "OpenCode" in title or "opencode" in title.lower():
            return "opencode"
        event_type = payload.get("event") or payload.get("type") or ""
        if event_type.startswith("session.") or event_type in ("session_completed", "file_edited"):
            return "opencode"
        return "codex"
    
    
    def main() -> None:
        payload = _load_payload()
        source = _detect_source(payload)
    
        event_type = (
            payload.get("hook_event_name")
            or payload.get("type")
            or payload.get("event")
        )
        if source == "claude":
            title = payload.get("title") or "Claude Code"
            icon_url = CLAUDE_ICON_URL
        elif source == "opencode":
            title = payload.get("title") or "OpenCode"
            icon_url = OPENCODE_ICON_URL
        else:
            title = payload.get("title") or "Codex"
            icon_url = OPENAI_ICON_URL
        subtitle = event_type
        message = (
            payload.get("last-assistant-message")
            or payload.get("message")
            or payload.get("summary")
        )
        if not message:
            cwd = payload.get("cwd")
            if cwd and event_type:
                message = f"{event_type} in {cwd}"
            elif cwd:
                message = f"Event in {cwd}"
            elif event_type:
                message = f"Event: {event_type}"
            else:
                message = "Event"
        push_payload = {
            "title": title,
            "markdown": message,
            "icon": icon_url,
            "action": "none",
        }
        if subtitle:
            push_payload["subtitle"] = subtitle
        key_bytes, iv_bytes = _load_key_iv()
        if not key_bytes:
            return
    
        plaintext = json.dumps(push_payload, ensure_ascii=False, separators=(",", ":")).encode(
            "utf-8"
        )
        try:
            ciphertext = _encrypt_aes_gcm(plaintext, key_bytes, iv_bytes)
        except Exception:
            return
        if not ciphertext:
            return
    
        form = urllib.parse.urlencode({"ciphertext": ciphertext, "iv": ENCRYPTION_IV})
        req = urllib.request.Request(
            BARK_BASE,
            data=form.encode("utf-8"),
            headers={"Content-Type": "application/x-www-form-urlencoded"},
            method="POST",
        )
        try:
            with urllib.request.urlopen(req, timeout=5) as response:
                response.read()
        except Exception:
            # Do not block Codex runs on notification failures.
            return
    
    
    if __name__ == "__main__":
        main()

### Codex 配置文件

`.codex/config.toml`

    
    
    notify = ["python3", "/path/to/notify_claude_codex_bark.py"]

### Claude Code 配置文件

`.claude/settings.json`

    
    
    {
      "hooks": {
        "Notification": [
          {
            "hooks": [
              {
                "command": "python3 /path/to/notify_claude_codex_bark.py",
                "type": "command"
              }
            ],
            "matcher": ""
          }
        ]
      }
    }

### OpenCode 配置文件

`~/.config/opencode/plugin/notify.ts`

    
    
    import type { Plugin } from "@opencode-ai/plugin";
    
    const NOTIFY_SCRIPT = "/path/to/notify_claude_codex_bark.py";
    
    const plugin: Plugin = async ({ client, $ }) => {
      const notify = (type: string, message: string) => {
        const payload = JSON.stringify({ title: "OpenCode", type, message });
        $`echo ${payload} | python3 ${NOTIFY_SCRIPT}`.quiet().catch(() => {});
      };
    
      return {
        event: async ({ event }) => {
          if (event.type === "session.idle") {
            const { sessionID } = event.properties;
            const sessions = await client.session.list({ limit: 50 });
            const session = sessions.data?.find((s: { id: string }) => s.id === sessionID);
            if (!session || session.parentID) return;
    
            notify("session.idle", session.title || "Task completed");
          }
    
          if (event.type === "permission.asked") {
            const { permission, patterns } = event.properties;
            const detail = patterns.length ? `: ${patterns.join(", ")}` : "";
            notify("permission.asked", `${permission}${detail}`);
          }
        },
      };
    };
    
    export default plugin;
    

### 备选方案

目前我在 iPhone 和 iPad 上使用的 SSH 终端是 [Secure
ShellFish](https://secureshellfish.app/)（选择这款终端的原因请见下文），这个 App 也支持用类似 Bark
的方式发送推送通知。

## 选择合适的 SSH 终端

为了在移动设备上获得更好的终端体验，我选择使用 [Secure ShellFish](https://secureshellfish.app/)。

### 选择 Secure ShellFish 的理由

#### 适配移动设备的使用场景

使用移动设备时，经常遇到网络环境变化导致 SSH 断连的问题。Secure ShellFish 内置了优秀的
[tmux](https://github.com/tmux/tmux) 支持，可通过 tmux 保持和自动恢复 Shell 会话。

同时，这款 App 还能在图形化界面上创建、删除、重命名 tmux 会话，或者将 tmux 会话绑定到新的标签页上。

另外，Secure ShellFish 还是实现了可选的后台保活优化，可通过监听地理位置变化、画中画浮窗等，实现 App 长时间在后台运行。

#### 支持丰富的终端特性，适配带有复杂 TUI 的 Coding Agent

Claude Code、OpenCode、[Gemini CLI](https://github.com/google-gemini/gemini-cli)
拥有复杂的 TUI，需要在现代的终端模拟器下，才能更好地工作。

Secure ShellFish 基于
[SwiftTerm](https://github.com/migueldeicaza/SwiftTerm)，支持现代终端特性。同时这款 App
一直在积极更新，例如最近的 2026.4 版本更新，就带来更好的 Claude Code 的兼容性。

#### Files App 与第三方代码编辑器支持

Secure ShellFish 支持与 iOS 自带的文件应用整合。能够让文件应用，或者任何第三方代码编辑器通过打开 Mac 上的文件。

### 备选 App

  * [Blink Shell](https://blink.sh/)：更专业的 SSH 终端，同时支持 [mosh](https://mosh.org/)

## 移动端使用 Textastic 代替 Vim 等命令行代码编辑器

虽然有 AI 帮忙编写和修改代码，但是很多时候，我还是需要临时手动修改代码。

在 iPhone 等小屏幕设备上，通过软键盘在 SSH 客户端中，使用 Vim 等文本编辑器编辑代码，体验不是很好。

所以在移动设备上，我使用的代码编辑器是
[Textastic](https://www.textasticapp.com/iphone.html)，Secure ShellFish 内置了
Textastic 集成，在终端中输入 `textastic <文件名>`，即可跳转到 Textastic 并打开指定的文件。

## 1Password SSH Agent 与远程 SSH 会话共存

我在 Mac 本地使用 [1Password SSH
Agent](https://developer.1password.com/docs/ssh/agent/) 管理 SSH 私钥，平时执行 `git
push` 等操作时通过 Touch ID 确认，兼顾了体验和安全性。

但是在 iPhone 和 iPad 上通过 SSH 远程连接 Mac 时，就无法进行 Touch ID 认证了。对于这个问题，我的解决方法是：

  * **移动端** ：使用支持 Agent Forwarding 的 SSH 客户端（例如 [Secure ShellFish](https://secureshellfish.app/) 或 [Blink](https://blink.sh/)），将 iPad 侧的 SSH agent 转发到 Mac；
  * **Mac 端** ：修改 SSH 配置文件，仅在当前会话没有可用 SSH agent 时，才回退使用 1Password 的 `IdentityAgent`。

### SSH 配置文件

具体的 SSH 配置文件如下：

`.ssh/config`

    
    
    /# ------------------------------------------------------------------------------
    # SSH agent 回退策略（1Password 作为 fallback）
    #
    # 触发条件（任一满足即启用 1Password SSH agent）：
    #
    #   1. SSH_AUTH_SOCK 未设置
    #      - 当前会话没有可用的 SSH agent
    #
    #   2. SSH_AUTH_SOCK 字符串中包含 "com.apple.launchd"
    #      - launchd / launchctl 启动的临时 socket
    #      - 常见路径示例：
    #          /private/tmp/com.apple.launchd.xxxxxx/Listeners
    #      - 不稳定、不可复用，明确排除
    #
    #   3. SSH_AUTH_SOCK 指向的目标不是一个可用的 socket
    #      - 断掉的符号链接
    #      - 普通文件
    #      - agent 已退出
    #      - 注意：test -S 会自动顺着符号链接判断最终目标
    #
    # 不触发条件（保持现有 agent，不覆盖）：
    #
    #   - SSH_AUTH_SOCK 已设置
    #   - 路径不包含 com.apple.launchd
    #   - 且最终目标是一个有效的 socket
    #     （例如：agent 转发、tmux 继承、本地 GUI agent 等）
    #
    # 实现要点：
    #   - Match exec 的命令必须是“单行字符串”
    #   - 通过 shell 返回码控制匹配：
    #       * 返回 0  → Match 生效 → 使用 1Password agent
    #       * 返回非 0 → Match 不生效 → 保持原 agent
    #   - 仅使用 POSIX 工具（sh / test / grep）
    # ------------------------------------------------------------------------------
    
    Match host * exec "sh -lc 'test -z \"$SSH_AUTH_SOCK\" || echo \"$SSH_AUTH_SOCK\" | grep -q com.apple.launchd || ! test -S \"$SSH_AUTH_SOCK\"'"
        IdentityAgent ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

### 备选方案

如果不使用 1Password，还有如下两种方法将 SSH 私钥加载到 SSH Agent，不过在首次登录时，都需要额外的输入密码等确认操作。

#### 方案一：将 SSH 私钥密码保存到 macOS Keychain

参考[如下链接](https://apple.stackexchange.com/questions/48502/how-can-i-
permanently-add-my-ssh-private-key-to-keychain-so-it-is-automatically)。但是
macOS Keychain 不会随着 SSH 登录而自动解锁，需要额外敲命令解锁 Keychain。

#### 方案二：zsh 插件

可使用如下 [Oh My Zsh](https://ohmyz.sh/) 插件。但是首次登录时，也需要输入 SSH 私钥密码：

  * [ohmyzsh/plugins/ssh-agent/README.md at master · ohmyzsh/ohmyzsh · GitHub](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/ssh-agent/README.md)

## SSH Agent Forwarding 与 tmux 共存

Secure ShellFish 自带完善的 [tmux](https://github.com/tmux/tmux/wiki) 支持，能够解决断线重连后
Shell 会话丢失的问题。

但是 tmux 与 SSH agent forwarding 共存，会出现这样的问题：

  * 每次 SSH 连接建立时，转发的 `SSH_AUTH_SOCK` 路径可能不同；
  * tmux 的会话往往长期存在，如果 tmux 内仍指向旧的 socket，就会出现「重连后 tmux 里 `git push` 不工作」的现象。

对于这个问题，我根据 StackOverflow 上讨论，采用了如下解决方法：

  * 将 `SSH_AUTH_SOCK` 固化为稳定路径，并让 tmux 始终使用该路径

### SSH 与 tmux 配置文件

具体的配置文件如下：

`~/.ssh/rc`

    
    
    #!/bin/zsh
    
    # Source - https://stackoverflow.com/a
    # Posted by pymkin, modified by community. See post 'Timeline' for change history
    # Retrieved 2025-12-24, License - CC BY-SA 4.0
    # Fix SSH auth socket location so agent forwarding works with tmux.
    if test "$SSH_AUTH_SOCK" ; then
      ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
    fi

`~/.tmux.conf`

    
    
    # Source - https://stackoverflow.com/a
    # Posted by pymkin, modified by community. See post 'Timeline' for change history
    # Retrieved 2025-12-24, License - CC BY-SA 4.0
    # fix ssh agent when tmux is detached
    setenv -g SSH_AUTH_SOCK $HOME/.ssh/ssh_auth_sock
    
    
    # 不要让 client attach 覆盖 SSH_AUTH_SOCK
    set -g update-environment "DISPLAY KRB5CCNAME MSYSTEM SSH_ASKPASS SSH_AGENT_PID SSH_CONNECTION WINDOWID XAUTHORITY"

通过这种方式，tmux 内部不再依赖易变的 socket 路径，重连后也能自然继承新的 agent forwarding。

### 备选方案：通过 zsh 插件，从 tmux 同步环境变量

[Oh My Zsh](https://ohmyz.sh/) 的 tmux 插件支持通过设置 `ZSH_TMUX_AUTOREFRESH` 为 `true`
来触发环境变量刷新：

  * [ohmyzsh/plugins/tmux/README.md at master · ohmyzsh/ohmyzsh · GitHub](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/tmux/README.md)

此方法更加简单，但是必须在当前命令执行完，执行下一条命令时，才能自动刷新 `SSH_AUTH_SOCK` 环境变量。

## Git 提交签名

我经常让 CLI Coding Agent 在完成一个任务后自动提交代码，所以代码提交流程应该是没有用户交互的，无需输入密码，或者用 Touch ID
等方式二次确认。

同时，我也想保留对 [Git 提交的签名](https://git-scm.com/book/ms/v2/Git-Tools-Signing-Your-
Work)，而且不想在 macOS 文件系统中保持明文私钥。

### 方案一：使用 GPG + pinentry-mac 为 Git 提交签名

因此我最初选择使用 [GPG（GnuPG）](https://www.gnupg.org/) 来做 Git 提交签名，而不是 SSH
signing。这是因为在 macOS 上，[pinentry-mac](https://github.com/GPGTools/pinentry-mac)
可以 GPG key 的 passphrase 缓存到系统钥匙串。

pinentry-mac 和 macOS 自带的 SSH Agent 工作原理有差异，在 SSH 远程连接的情况下，也能访问 macOS Keychain
获取 passphrase 并解锁私钥。所以，此方法在使用 SSH 远程连接 Mac，并通过 tmux 运行 CLI Coding Agent 时，AI
也能稳定地在后台持续提交代码，并带上签名。

### 方案二：使用 SSH 签名，同时为 Coding Agent 设置权限，提交代码时询问用户

本来对我来说，方案一就是最好的方案。但是，最近 pinentry-mac 似乎出现了一些 bug，勾选了保存 passphrase 到 macOS
Keychain，也无法自动解锁私钥。我还没找到这个 bug 的具体解决或规避方式。

所以，现在我暂时使用方案二，为 Coding Agent 设置权限，执行 `git commit` 命令时询问用户。

结合上文中描述的 bark 通知，当我收到权限请求通知时，就回到 SSH 终端手动确认，再结合 SSH Agent Forwarding，也能实现免输密码对
Git 提交进行签名。

具体的权限设置，请见下一章节。

## 为 Coding Agent 设置合适的权限，兼顾安全性和体验

目前大部分 CLI Coding Agent 都具有一定的安全措施，能够避免 AI
执行危险或恶意命令。但是这些功能或者默认关闭，或者过于严格，需要一定的设置，才能更好地工作。

### Codex CLI 配置文件

其中 Codex CLI 默认启用的沙盒机制，对我来说体验最好。在沙盒内调用命令行工具，或者运行 Python
脚本，无需向用户请求权限。只有访问沙盒外的内容时，才会向用户请求权限。

由于我需要让 Codex 修改完代码后，执行 `xcodebuild` 命令编译验证，所以我在 Codex 配置文件中，放行了这条命令：

`~/.codex/rules/default.rules`

    
    
    prefix_rule(
        pattern = ["xcodebuild"],
        decision = "allow"
    ) 
    # 目前通过 SSH 对 Git 提交进行签名，需要人工确认，暂时注释掉
    #prefix_rule(
    #    pattern = ["git", ["add", "commit"]],
    #    decision = "allow"
    #)

### OpenCode 配置文件

对于 OpenCode，则需要更复杂的配置，放行大部分危险程度较低的命令。

`~/.config/opencode/opencode.json`

    
    
      "permission": {
        "bash": {
          "*": "ask",
          "git log*": "allow",
          "git add*": "allow",
          "git status*": "allow",
          "git checkout*": "allow",
          "git branch*": "allow",
          "git diff*": "allow",
          "git show*": "allow",
          "git rev-parse*": "allow",
          "gh repo clone*": "allow",
          "xcodebuild*": "allow",
          "ls*": "allow",
          "head*": "allow",
          "tail*": "allow",
          "rg*": "allow",
          "wc*": "allow",
          "sed*": "allow",
          "grep*": "allow",
          "find*": "allow",
          "cat*": "allow",
          "sort*": "allow",
          "yes*": "allow",
          "echo*": "allow",
          "ast-grep*": "allow"
        }
      }

> ⚠️ **注意** ：上述配置只是我个人的配置文件。请谨慎参考。  
> 即使只允许少量命令自动执行，攻击者依旧可以用这些命令进行恶意行为，例如用 `xcodebuild`
> 命令在编译过程中执行任意脚本，或编译运行一个恶意软件。

## Shift + Tab 快捷键

由于 iOS 软键盘的限制，无法在手机上方便地敲 Shift + Tab 快捷键。而这个快捷键，是 Claude Code 中，切换为 Plan
模式需要经常使用的。

大部分 SSH 终端 App 都支持 Snippets 功能，能够快速输入提前定义好的字符串。对于 Shift + Tab 快捷键，也可以用
Snippets 功能解决，参考[如下链接](https://github.com/blinksh/blink/discussions/1941)。

我在 Secure ShellFish 中，创建了这些用于 Coding Agent 的 Snippet。同时绑定在软键盘的快捷键上，实现一键输入：

    
    
    # Claude Code 的 Shift + Tab 快捷键
    ␛[Z
    # OpenCode 的 Ctrl + X，右箭头。用于显示 Sub Agent
    ^X␛[C
    # OpenCode 的 Ctrl + X，上箭头。用于显示 Parent Agent
    ^X␛[A

## 补充信息

Codex 和 Claude Code 除了命令行版本，还拥有网页版，Codex 甚至还可以使用 ChatGPT App 在手机上操作，直接修改
GitHub 上的代码。

另外还有一些工具，能够更方便地在移动端使用 Coding Agent：

  * [Pocket — Mobile OS for AI Agents](https://www.pocket-agent.xyz/)
  * [Happy - Claude Code Mobile Client](https://happy.engineering/)

但这些工具暂时还无法满足我的需求，例如带上 GPG/SSH
签名提交代码。建议读者在参考本文中的脚本和配置之前，先体验一下这些工具。在满足自己需求的情况下，这些工具能提供比 SSH 客户端更好的体验。

## AI 创作与利益相关声明

  * 题图使用 AI 生成；
  * 文中的代码与配置文件，除非注明来源，均在 AI 的辅助下生成；但笔者可以保证这些代码和配置实测可用，而且是自己正在使用的；
  * 文章初稿是笔者将代码和配置贴给 AI，让 AI 整理出来的；但是笔者对生成结果不满意，所以仅保留文章的整体结构，重写了约 70% 的正文；
  * 文中提到的「[HEIF & HEVC 转换器](https://blanboom.org/2025/heif_converter/)」是笔者开发的付费 App。其余工具均为笔者正在使用的工具，与笔者没有利益关联。

> 关注
> [少数派小红书](https://www.xiaohongshu.com/user/profile/63f5d65d000000001001d8d4)，感受精彩数字生活
> 🍃

> 实用、好用的 [正版软件](https://sspai.com/mall)，少数派为你呈现 🚀