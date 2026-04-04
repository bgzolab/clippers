---
created: '2026-02-03T15:23:59'
modified: '2026-02-03T15:23:59'
source: https://sspai.com/post/104564
title: 停更但好用的 DriveDroid：把 Android 手机变成 USB 启动盘
type: archive-web
---

**编注：** 本文为[少数派 12 月主题征稿活动](https://sspai.com/post/104329)****
中**「可惜！那些好用但停更了的 App」** 主题入选投稿之一，我们将在日后开展更多不同领域和话题的征稿活动，敬请留意。

* * *

## 前言

作为一个将 Arch Linux 作为主力系统使用多年的人，虽然我曾经说过它没有多数人刻板印象中的那么不稳定，但我也不敢百分百保证我的 Arch Linux
系统每次更新都不会滚挂。不过好在我遇到的大部分严重到无法开机的所谓「滚挂」的情况其实都是 GRUB 更新时出问题导致系统引导损坏，要进行修复，只需制作一个
Arch Linux 安装 U 盘，用这个启动盘启动电脑并修复 GRUB 即可。但问题是有时候我并没有随身携带 U 盘，那么这时候 DriveDroid
就会派上用场了。

DriveDroid 的功能十分简单也十分小众，就是把 Android 手机变成 USB 启动盘，太过于小众以至于停更多年我仍然没有找到合适的替代品。关于
DriveDroid 是何时停更的已经很难考证了，因为我写这篇文章的时候已经在 Play
商店找不到它了，它还有一个付费版本，但也已经无法付费，甚至它[官网](https://softwarebakery.com/projects/drivedroid)上的下载链接都失效了。

我在 APKMirror
上面找到的[下载链接](https://www.apkmirror.com/apk/softwarebakery/drivedroid/drivedroid-0-10-50-release/)最后更新于
2018 年 11 月，所以 DriveDroid 已经停更了至少 7 年了。尽管 DriveDroid 版本已经非常老旧，但在我安装了最新版
Android 16 的 Nothing Phone (3a) 上似乎还能正常工作，不过据说在某些型号的的手机上 DriveDroid
已经不能正常用了，如果发现 DriveDroid 在你的手机上不能使用，可以尝试安装 [DriveDroid-fix-Magisk-
module](https://github.com/overzero-git/DriveDroid-fix-Magisk-module) 这个
Magisk 模块，能够修复 DriveDroid 不能在新版 Android 设备上正常工作的问题。

## 首次打开

DriveDroid 需要 ROOT 权限才能正常工作，并且因为不同型号和系统的设备对于 USB 传输的处理方式不同，所以在第一次打开 DriveDroid
时需要运行一个设置向导来检测 APP 是否能正常工作。

首先需要授予 ROOT 授权，并设置一个文件夹用来存储系统镜像，记住这个文件夹路径，后面会用到。

![](https://cdnfile.sspai.com/2025/12/12/32180cc0ab38bad61ed251b57a3171ab.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

接着需要使用数据线连接手机和电脑，点击 NEXT 后选择 USB System，用来适配不同的设备，我这里只有一个 Standard Android
可选，如果有多个可选，尽量选择第一个，如果不能用，就依次往后尝试。

![](https://cdnfile.sspai.com/2025/12/12/43a028ed70d0b81de504af425cde959b.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

再次点击 NEXT 后 DriveDroid 会尝试启动，此时需要在电脑上检查是否出现了一个新的 USB 设备或是 CD-ROM 设备，如果出现了，就说明
DriveDroid 能够正常工作，在 Windows 上，USB
设备可能不会在文件管理器中出现，但是系统会有新设备插入的提示音，这种应该也算是正常工作。如果正常工作就选择「Android shows up in
OS」并点击 NEXT，如果没有新设备出现，就回到上一个页面尝试不同的 USB System，如果都不行，那就可能是设备不兼容，可以尝试安装前文提到的
Magisk 模块。

![](https://cdnfile.sspai.com/2025/12/12/b0720fc4635959890a3011ed791fc852.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

之后不要断开数据线连接，重启电脑进入
BIOS，会发现有一个新的启动项可用，确认关闭了安全启动，并选择这个启动项启动电脑，如果电脑能够成功启动并显示「DriveDroid booted
succesfully」，就说明一切配置完成了。

![](https://cdnfile.sspai.com/2026/01/04/836badf8f3172a6d2c68b16c8a2f244c.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)![](https://cdnfile.sspai.com/2026/01/04/a4a3d5aef300294b82638399f6a573ee.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

## 功能限制

在配置完成后的 Summary 界面，可以看到一行「The device cannot act as CD-ROM device」，说明当前设备不能模拟
CD-ROM 设备，只能够模拟 U 盘。这对于大部分 Linux 发行版的 ISO 文件来说不成问题，因为这些 ISO 文件既可以直接作为 CD
盘使用，也可以模拟成 U 盘使用，但是一部分系统 ISO（比如 Windows）只能作为 CD 盘使用，就不能使用 DriveDroid 启动。

![](https://cdnfile.sspai.com/2025/12/12/d34a1ee4247b52ccf4009c210a9f5347.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

对于这个问题有两个解决方案：一个是为手机安装定制的内核或 ROM 使手机获得模拟 CD-ROM
的能力，这个方案比较复杂且不一定适用于所有手机；另一个是将不支持的 ISO 文件转换为支持的格式，这会在后文中提到。

## 直接启动 ISO 文件

对于可以直接模拟成 U 盘的 Linux 系统 ISO，启动方式很简单，只需下载想要的 ISO 并在 DriveDroid
启动就可以了，DriveDroid 内置了一些 Linux 系统 ISO 的下载链接，只需点击主页面的加号选择「Download image」即可，不过因为
DriveDroid 已经停更很久了，所以它内置的下载链接年代也都很久远，并不推荐使用，付费版本可以自定义下载仓库，但是目前 DriveDroid
已经无法付费了。目前更推荐手动下载 ISO 文件。

以 Arch Linux
为例，我可以从[国内镜像站](https://mirrors.cernet.edu.cn/list/archlinux)下载最新版本的 ISO
文件，将文件放入之前配置好的用来存储系统镜像的文件夹。在 DriveDroid
主界面下拉刷新，会发现除了之前运行设置向导时创建的测试镜像，也出现了刚刚下载的 Arch Linux 镜像。

![](https://cdnfile.sspai.com/2025/12/12/e4bafc295c0b8c150495189354ed7312.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

点击 Arch Linux 镜像，会弹出三个选项，分别是只读 USB、可读写的 USB 以及 CD-ROM，因为我的设备不支持模拟 CD-
ROM，且系统镜像不需要读写，所以我选择只读 USB，当 Arch Linux 镜像旁边出现了一个带锁的 USB 图标，就说明 DriveDroid 正在把
Arch Linux 模拟为只读 USB 启动盘。

![](https://cdnfile.sspai.com/2025/12/12/58705022a2f367ede36cf49d11f7328c.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

使用数据线连接手机和电脑，重启电脑，选择新出现的启动项启动电脑，如果手机的接口是 USB 2.0 协议的，启动可能会稍慢些，耐心等待一小会，就可以进入
Arch Linux 的安装环境了。

## 转换 ISO 文件

对于 Windows ISO 这样不支持的文件，除了为手机安装定制的内核或 ROM，另一个方法是转换 ISO 文件，其实思路很简单，创建一个空白的 img
文件并用 DriveDroid 模拟成可读写的 USB 设备，连接到电脑后在电脑上用写盘软件把系统镜像写入进去，和正常制作启动 U
盘差不多。为了方便起见下面的演示我依然用的 Arch Linux 的 ISO 文件，对于 Windows ISO 步骤是一样的，只是要注意按需更改文件大小。

首先在 DriveDroid 主界面点击右下角加号，选择「Create blank image」。

![](https://cdnfile.sspai.com/2025/12/12/8638281bf61045761bf05b667c407da9.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

为镜像文件命名，因为只有付费版 DriveDroid 才能重新调整 img
文件大小，所以这里的文件大小需要一步到位，要不小于镜像文件的大小，但也不要太大占用多余的存储空间，因为 Arch Linux ISO 文件大小约为
1.4G，为了保险，我将空白文件大小设为了 2G，文件系统选择 None 不指定，因为后面写盘软件会对其格式化，配置完毕点击右上角完成。

![](https://cdnfile.sspai.com/2025/12/12/1c43c4d6a0d1e76de54575ead00f13df.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

在主界面点击刚刚创建的空白 img 文件，选择模拟成可读写 USB，当旁边出现一个不带锁的 USB 图标，就说明 DriveDroid 正在把空白 img
文件模拟为可读写 U 盘。

![](https://cdnfile.sspai.com/2025/12/12/cd86dcd3627ea0eb89dd9d32d522412a.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

使用数据线连接手机和电脑，在电脑上使用写盘软件（我这里用的是 Raspberry Pi Imager）把系统 ISO 镜像写入到模拟的 USB 设备上。

![](https://cdnfile.sspai.com/2025/12/12/ee6af4829c622911fe326f8dcb38c04e.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

之后就可以按照上一节的步骤将创建的 img 镜像模拟为 USB 启动盘了。

使用同样的方法，理论上也可以将空白 img 文件写入成 Ventoy 启动盘来启动任意系统镜像，或是将其格式化成 U
盘用来存储资料，我没有试过，不过这样的话仍需要将其连接到电脑上才能进行读写，在手机上不能直接读写，感觉意义不大。

## 总结

DriveDroid 是一个功能十分小众的应用，也许平时用不到，但如果遇到特殊情况是真的能够救急的，在手机中常备这个软件还是挺有必要的。

**相关阅读：**[Matrix 圆桌 | 可惜！聊聊那些好用但停更的 App](https://sspai.com/post/105134)

> 关注 [少数派公众号](https://sspai.com/s/J71e)，解锁全新阅读体验 📰

> 实用、好用的 [正版软件](https://sspai.com/mall)，少数派为你呈现 🚀
