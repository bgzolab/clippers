---
comments: true
created: '2026-10-14T12:53:44'
draft: true
modified: '2026-10-14T12:53:44'
source: https://sspai.com/prime/story/dev-env-on-android-with-termux
title: 基于 Termux 的 Android 手机开发服务器实操
type: archive-web
---

最近在折腾 Hermes、Pi 这类终端 AI
Agent，和网页上的聊天框不同，这类工具最大的特点是能直接在命令行里跑脚本、改代码、自动排错，能当个真正的干活助手。

如果想让这类 Agent 随时可用，最顺手的设备其实就是每天带在身上的手机：电脑不可能时时刻刻带在身边，租云服务器又要多付一份钱，而手头的 Android
手机随时有网有电，性能也完全带得动现代的 Linux 命令行环境。比如在 Termux 里把 Agent
跑起来之后，顺手配好后台保活和内网穿透，手机本身就能变成一台随身小服务器，无论用笔记本，还是在外面用平板，敲一行 SSH 就能直接连进去测试或改代码。

当然，在 Android 上折腾这些，主要麻烦在两点：一是系统杀后台，二是某些命令行工具在 Android 上的底层兼容问题。本文记录基于小米 15
Ultra，不 root、不刷机，把整个环境配置、后台防杀以及连通穿透的方案，分享给同样想用手机跑 Agent 和轻量开发环境的朋友。

## 为什么要在手机上跑 Agent？

平时在手机上用常规 AI，基本停留在打字问答。但真要让它处理点具体事情，往往就会卡壳。而在 Termux 里跑 Agent，它就拥有了手机本地 Shell
权限和文件环境。

举个例子，在手机上用普通对话框，最别扭的地方在于偶尔想让它做个数据格式转换、写个排错脚本或清洗工具，它往往只输出一段 Python
代码。在电脑上还能拷出来跑，但在手机里没有运行环境。

但如果终端 Agent 本身跑在 Linux 环境里，写完脚本就可以后台直接运行，生成好的结构化文件（比如格式化好的 Markdown、JSON
或处理后的文件）也可以直接存到本地目录。我们最终拿到的是跑完的结果，而不是一段只能干瞪眼的代码。

另外，虽然调用 API
依然要走网络，但几十、上百兆的原始归档或数据集也不需要往网页上传了。尤其是代码包、日志归档和开源测试集这类文件，在手机小屏幕上解包、翻找既费事又容易中断，而在
Termux 里，Agent 可以在本地跑 Python 脚本、调用 `unzip`、`tar` 或 `grep`
工具，先把大文件在本地解包、过滤，只提取出需要分析的核心片段再去调模型。

最后，对于本文的使用场景，配合 Termux 官方的 `termux-api` 插件，它还能接通一些手机特有的能力：

  * **后台跑完弹通知** ：让它跑一个耗时较长的批量任务，手机直接息屏塞兜里。执行完毕后 Agent 自动调用 `termux-notification`，手机震动并在通知栏弹窗提醒
  * **剪贴板联动** ：在别的 App 里复制了内容，切到终端让 Agent 处理，它直接读取系统剪贴板，处理完再写回剪贴板，切回去就能直接粘贴

![Hermes Agent 在 Termux
中直接调度本地脚本处理测试日志，完成后调用系统通知提醒](https://cdnfile.sspai.com/2026/09/19/3ed7d45ca7b84531e8cbbb8e79f6a8f3.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1) Hermes Agent 在 Termux 中直接调度本地脚本处理测试日志，完成后调用系统通知提醒

安装 Termux 的唯一注意事项是：不要从应用商店下载。Google Play 商店的版本早已停止维护，F-Droid 上的版本虽然新，但签名私钥和
GitHub Releases 不一样。如果后续想装 `Termux:API`、`Termux:Boot`
等插件，会因为混装的系统签名冲突，导致无法成功安装。

所以这里推荐直接去 [Termux GitHub Releases](https://github.com/termux/termux-
app/releases) 下载，顺便也可以把常用的几个插件一起装好：

  * `termux-app`（终端本体）
  * `termux-api`（调用手机通知、剪贴板等硬件功能）
  * `termux-boot`（开机自动拉起后台服务）

安装后打开 Termux，这里也建议先给存储权限并换个国内镜像源，避免后续下载太慢：

    
    
    # 1. 申请存储权限（允许终端访问手机本地文件）
    termux-setup-storage
    
    # 2. 更换国内源（按空格选中 Mirrors by USTC 或清华源，回车确认）
    termux-change-repo
    
    # 3. 升级基础系统组件
    pkg update && pkg upgrade -y

## 安装 Hermes 与环境配置

在手机端敲命令配环境比较繁琐，更省事的做法是先装好核心 Agent，后续的工具链直接让它在终端里帮你装。

这里我用的是 Hermes Agent（Nous Research 开源的 CLI Agent），自带终端执行、任务规划和文件读写能力，并且针对
Termux 环境做了单独适配。

我们先装好 Python 和编译依赖，然后拉取源码：

    
    
    # 安装基础依赖
    pkg install -y python clang cmake rust git
    
    # 拉取源码并安装
    git clone https://github.com/NousResearch/hermes-agent ~/.hermes/hermes-agent
    cd ~/.hermes/hermes-agent
    
    # 注意：使用 [termux] 特性安装，避免拉取不兼容的桌面依赖
    pip install -e .[termux] -c constraints-termux.txt

装好后不需要手写任何配置文件，直接在终端运行：

    
    
    hermes

首次启动便会自动进入交互式引导，包括选择模型提供商（我这里选择的 `DeepSeek`，按量计费便宜，推理和代码能力不错）、输入 API
Key、选择模型等。以后想切模型或改参数，在对话里输入 `/config` 或 `/model` 就能直接改。

配置完成后，我们让 Hermes 安装开发工具链，比如我这里直接在终端里输入：

> 帮我把日常开发需要的工具装上：nodejs, rust, uv, git, jq, ripgrep, yazi, tmux, neovim，以及
> openssh、termux-services、termux-api 几个系统包。

Hermes 会在后台自动执行 `pkg install`，然后把环境配齐。

附 2026 年主流 CLI AI 工具在 Termux 上的兼容情况：

工具 | Termux 支持情况 | 方案 / 说明 |    
---|---|---|---  
**Hermes Agent** | ✅ 原生支持 | `pip install -e .[termux]`，主力全能选手 |    
**Pi CLI** | ✅ 原生支持 | `curl -fsSL https://pi.dev/install.sh \` | `bash`，极简轻量，适合单次快速提问  
**OpenCode** | ⚠️ 需社区版 | [guysoft/opencode-termux](https://github.com/guysoft/opencode-termux)（修复了 Go CGO 在 Android 上的底层兼容问题） |    
**Codex CLI** | ⚠️ 需社区版 | [DioNanos/codex-termux](https://github.com/DioNanos/codex-termux)（社区打补丁修复了 glibc 依赖） |    
**Grok Build** | ⚠️ 可源码编译 | 开源 Rust 架构，在 Termux 里装好 rust 后可通过 `cargo build` 编译 |    
**Cursor CLI** | ⚠️ 需 Linux 容器 | 需通过 `proot-distro install ubuntu` 进轻量 Ubuntu 容器后跑官方二进制 |    
**Claude Code** | ❌ 暂无稳定方案 | 深度绑定 Node 桌面构建链，移动端底层依赖经常断裂 |    
  
## 后台保活与防杀

让 Android 手机充当服务器，最烦人的是系统本身的进程查杀机制，表现为手机一息屏，后台几分钟就被冻结，最终 SSH 掉线、跑一半的脚本直接被掐断。

想要让 Termux 全天候稳定在线，至少需要做好三层配置：

  * **省电策略设为「无限制」** ：长按 Termux 图标 → 应用信息 → 省电策略 → 改为「无限制」
  * **关闭锁屏清理** ：在系统「手机管家 / 电池」等设置中，关闭「锁屏后清理内存」（很多设备息屏十几分钟必掉线的根因就在这里）
  * **停用子进程限制** ：开启「开发者选项」，找到「停用子进程限制」（Disable child process restrictions，对应底层的 Phantom Process Killer）并打开

如果你在完成上述操作后依然遇到后台留存问题，还可以利用 Android 系统对媒体音频应用的天然后台豁免，让 Termux 在后台循环播放一段 1
分钟的静音 WAV 文件，换取系统的音频焦点。需要注意的是，如果无脑循环播放，当你戴着蓝牙耳机听歌或看视频时，这段静音音频可能会抢占耳机的 A2DP
蓝牙通道，导致耳机突然没声或出现跳音频设备的 bug。

不妨脚本里需要加入蓝牙状态判断：检测到当前连着蓝牙耳机，就主动暂停播放避让通道；耳机断开后再恢复静音保活。具体操作如下：

先用 ffmpeg 生成 1 分钟的静音音频：

    
    
    ffmpeg -f lavfi -i anullsrc=r=44100:cl=mono -t 60 -q:a 9 -acodec pcm_s16le ~/.termux/quiet_1min.wav

编写保活脚本 `~/.termux/scripts/keepalive.sh`：