---
comments: true
draft: true
aliases:
  - android/app/termux
  - Termux-termux-app
changelog: https://github.com/termux/termux-app/releases
created: 2025-06-07T14:33:50
description: Termux - a terminal emulator application for Android OS extendible by variety of packages.
modified: 2026-01-03T22:26:41
source: https://github.com/termux/termux-app
tags:
  - github/star
title: Termux-termux-app
type: repo
---

# Termux-termux-app


![](https://img.shields.io/github/stars/termux/termux-app?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/termux/termux-app?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/termux/termux-app?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=termux&repo=termux-app&bg_color=00000000)](https://github.com/termux/termux-app)

## Notes

### Changelog

0.90 及以上 版本需要 Android7.0 及以上版本的系统. 此安装包由 F-Droid 编译并签名, 且保证与此源代码 tarball 保持一致.

### 模拟 Ubuntu (获取 ROOT)

- [[~2moe-tmoe]]

### Init History

```shell
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list sed -i 's@^\(deb.*games stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable@' $PREFIX/etc/apt/sources.list.d/game.list sed -i 's@^\(deb.*science stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable@' $PREFIX/etc/apt/sources.list.d/science.list apt update && apt upgrade
#then install vim
vim $PREFIX/etc/apt/sources.list.d/game.list
deb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable
vim $PREFIX/etc/apt/sources.list.d/science.list
deb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable
vim $PREFIX/etc/apt/sources.list
deb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main
# refer to https://mirrors.tuna.tsinghua.edu.cn/help/termux/
termux-setup-storage
# acquire the access of storage
```

### Run server via: https://www.v2ex.com/t/997001#reply3

### Run `exe` file

- [ ] #gtd/wait Termux 运行 EXE
  - https://zhuanlan.zhihu.com/p/573876989 使用了 `wineandlinuxfortermux.tar.xz`
  - https://ivonblog.com/posts/how-to-use-termux/
    - Termux Proot 安裝 Box64 與 Box86，Android 手機執行 Windows exe
      https://ivonblog.com/posts/termux-proot-box86-box64/
    - Termux 如何安裝 Debian 系統
      https://ivonblog.com/posts/termux-proot-distro-debian/
    - Android 手機安裝 Linux 發行版：Termux proot-distro 使用教學
      https://ivonblog.com/posts/termux-proot-distro/
- [ ] #gtd/wait Wine 在代理下运行 #proxies
  - https://askubuntu.com/questions/262876/run-wine-behind-proxy

### SSH Develop

```shell
git config –global user.name ‘xxxxx’
git config –global user.email ‘xxx@xx.xxx’
ssh-keygen -t rsa -C ‘上面的邮箱’
ssh -T git@github.com # 测试SSH到 GITHUB 是否通路
```

#### 电脑 SSH 到平板

```shell
termux-change-repo # 选择镜像源 USTC Best
apt install openssh
passwd
sshd # 开启SSH服务，之后每次重新打开APP都需要重新执行这条
ifconfig
ssh -p 8022 192.168.0.4
```

#### SSH 上传到 Github

> [!note]
> 注意不要使用 Clash For Android，否则无法建立连接，不清楚原因；

## Termux (Android) connect to the computer

- Path
  - `C:\ProgramData\ssh`
  - `C:\User\xxx\.ssh`
- Windows -> Manage optional features ->Install OpenSSH
- `ssh usr@ip -p 22`
  - `usr` 是**电脑用户名**! 不是计算机名! 目前不知道中文用户名会发生什么😂
  - `IP`: 内网 IP.
  - `22`: 端口号
  - 要求输入的密码对于我来说是自己的电脑密码. 这里容易和 PIN 码 搞混, windows 肯定是设置过一个复杂密码, 后来才有 PIN 码的替代
- **Reference**
  - [Windows 支持 OpenSSH 了！ - sparkdev - 博客园](https://www.cnblogs.com/sparkdev/p/10166061.html)
  - [Key-based authentication in OpenSSH for Windows | Microsoft Learn](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement)
  - **fix SSH Permission denied** via [How to Fix SSH Failed Permission Denied (publickey,gssapi-keyex,gssapi-with-mic)](https://phoenixnap.com/kb/ssh-permission-denied-publickey) and https://stackoverflow.com/questions/1556056/permission-denied-publickey-keyboard-interactive
  - [Remote Access - Termux Wiki](https://wiki.termux.com/wiki/Remote_Access#OpenSSH)

## 延长会话

```shell
ClientAliveInterval 30
ClientAliveCountMax 3
```

via https://15tar.com/linux/2017/07/31/ssh-session-timeout.html

### 关闭终端?

- 继续执行 `ssh -f`

## 备份还原

- [[~Backing-up-Termux-Termux-Wiki]]

## References

- [[~有用安卓-termux-的吗-感觉问题好多]]
- https://www.sqlsec.com/2018/05/termux.html#Termux-Styling
- http://blog.lujun9972.win/blog/2018/01/24/%E4%BD%BF%E7%94%A8termux%E6%8A%8Aandroid%E6%89%8B%E6%9C%BA%E5%8F%98%E6%88%90ssh%E6%9C%8D%E5%8A%A1%E5%99%A8/index.html
