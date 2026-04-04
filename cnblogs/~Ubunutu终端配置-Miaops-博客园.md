---
aliases:
  - Ubunutu 终端配置 - Miaops
created: 2025-08-18T11:28:47
modified: 2025-08-30T21:04:03
source: https://www.cnblogs.com/timothy020/p/19042169
title: Ubunutu 终端配置 - Miaops
type: archive-web
---
# Ubunutu 终端配置 - Miaops

## 最终成果

\n

## Zshell

### 安装 zshell

若命令输出如/usr/bin/zsh，说明安装成功并且可执行路径已就绪。

### 设为默认终端

将 zsh 设为当前用户的默认登录 Shell，推荐用 chsh 并指向 zsh 的绝对路径。

注销后重新登录，或新开一个终端，确认默认 Shell：

正常应看到/usr/bin/zsh 或/bin/zsh；若 chsh 报错或无效，检查/etc/shells 是否包含 zsh 路径，必要时追加并重试。

### 安装 oh-my-zsh

Oh My Zsh 是 zsh 的配置框架，推荐使用官方安装脚本（可用 curl 或 wget），国内网络环境可用 install.ohmyz.sh 镜像地址\n 使用 GitHub Raw：

或使用镜像：

安装过程中脚本会建议切换默认 Shell 为 zsh，若之前已切换可直接确认继续；安装后会生成新的~/.zshrc，并将旧文件备份为~/.zshrc.pre-oh-my-zsh。

[](\"https://github.com/ohmyzsh/ohmyzsh\")

### Dracula 主题

[Dracula 主题](\"https://draculatheme.com/zsh\")

如果要完全统一，不仅要把 zshell 设置为 dracula 主题，最好也把终端模拟器（如 Windows Terminal，item 2，kitty 等）的主题也设置为 Dracula

## 安装 zsh 插件

### Autosuggestions

[autosuggestions](\"https://github.com/zsh-users/zsh-autosuggestions\")

当我们输入命令过程中，可以预览历史命令，按 → 便可输出这些命令。

1. 克隆项目到本地 $ZSH_CUSTOM/plugins 路径下
1. 编辑~/.zshrc 配置文件，添加到 plugins 列表中

### Autojump

[autojump](\"https://github.com/wting/autojump\")

用 j <目录名>的方式快速跳转到以前访问过的目录。

1. 克隆代码
1. 安装
1. 配置：编辑~/.zshrc 配置文件，添加到 plugins 列表中

### Zsh-syntax-highlighting

[zsh-syntax-highlighting](\"https://github.com/zsh-users/zsh-syntax-highlighting\")

在 shell 中高亮语法。

1. 克隆代码
1. 配置：编辑~/.zshrc 配置文件，添加到 plugins 列表中

## 安装 NerdFront 字体

访问 Nerd Fonts 网站下载一个自己喜欢的字体。解压，然后点击安装每一个字形。\n

[Nerd Fonts 网站](\"https://www.nerdfonts.com/font-downloads\")

设置 Ubununtu 终端字体（其他终端软件同理）：

- 点击右上角选项，打开 Preference
- 选择刚刚下载的字体，注意需要是 Mono 后缀的（保证等宽，代码才能对齐）\n\n

## 安装 lsd

[lsd](\"https://github.com/lsd-rs/lsd\")

lsd 可以为 ls 命令中的不同类型文件或文件夹添加不同颜色, 并且使用对应的图标进行标识, 简洁直观。\n

- 使用 apt 安装：如果找不到包，说明 ubuntu 版本不够，采用 cargo 安装。
- Cargo 安装
lsd 命令举例：

- lsd: 最基础命令, 显示当前目录结构
- lsd -l: 以竖向列表显示当前目录结构
- lsd -la: 以竖向列表显示当前目录结构 (含隐藏文件)
- lsd --tree: 以目录树格式显示当前目录结构
如果图标显示不出来，是因为没有安装 NerdFront 字体

可以在.zshrc 中添加别名：

## 安装 homebrew

很多时候用 apt 找不到的包，都可以用 homebrew 安装。

## 安装 fzf

[fzf](\"https://github.com/junegunn/fzf\")

它是一个用于任何类型列表的交互式过滤程序；无论是文件、命令历史、进程、主机名、书签还是 Git 提交等。它实现了一种“模糊”匹配算法，因此您可以快速输入省略字符的模式，仍然获得想要的结果。

然后重启 shell，就可以开始使用了，如果每次打开终端都要开启 fzf 的 shell 集成，还需要在~/.zshrc 中添加下面一行代码。

默认快捷键：

- ctrl t：搜索当前目录
- ctrl r：搜索历史
- [搜索界面中]ctrl j：，下一个选项
- [搜索界面中]ctrl k：上一个选项
- [搜索界面中]tab：多选\nShell 集成：连续输入**后按下 tab 即可触发搜索。
预览功能：fzf 提供了一些预览脚本，比如 fzf --preview 'fzf-preview.sh {}可以实现预览当前目录的文件。\n

如果要预览图片，需要安装终端图片预览工具。

添加预览命令的别名：在~/.zshrc 中添加如下命令，之后执行 source ~/.zshrc 即可生效。

## 安装图片预览工具

你的 fzf-preview.sh 脚本需要调用这些工具来生成图片预览。你至少需要安装其中一个。

- viu：一个比较通用的工具，兼容多种终端，但在不支持的终端上会用字符块（block characters）来近似显示。
- chafa：功能强大，支持多种协议，也可以用字符块显示，效果通常比 viu 好。
- icat：专门为 Kitty 终端设计，效果最好。
- imgcat：专门为 iTerm2 终端设计。
