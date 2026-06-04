---
comments: true
created: '2025-10-25T10:42:47'
draft: true
modified: '2025-10-25T18:44:10'
source: https://www.zhihu.com/question/624925911/answer/1965367671173407322
title: Linux下的虚拟windows和windows下的虚拟Linux谁性能更好？
type: archive-web
---

我觉得高赞回答已经写得非常好了，把 CPU、GPU、IO 这些性能都分析了。

我是桌面用户，我说一下我的感受。

我使用虚拟机的场景只有两种，一种是在 Windows 中使用 VMWare Workstation，虚拟机中运行 Linux 桌面系统，用来学习
Linux。另一种是在 Linux 桌面中使用 QEMU/KVM 和 VirtualBox，虚拟机中运行 Windows，用来解决 Linux
办公的后顾之忧。

我的体验就是，在 Windows 中用虚拟机跑 Linux，比在 Linux 中用虚拟机跑 Windows，体验要好得多。

主要还是 Windows 的显卡驱动的问题。

使用 QEMU/KVM 虚拟机跑 Windows，听说可以使用 virtio 的显卡驱动。但是请问，我在 Windows 下去哪里找 virtio
驱动呢？根本找不到呀。没办法，只能使用 QXL 显卡。

![](https://pica.zhimg.com/50/v2-f533469caece4b7f0601c8dcb2d5cd2b_720w.jpg?source=2c26e567)图1、使用
QEMU/KVM 安装 Windows

使用体验非常差。虚拟机中的 Windows 根本就不流畅。

没办法，我只能使用 Virtual Box。Virtual Box 还不错，至少它提供用于 Windows 的驱动：

![](https://picx.zhimg.com/50/v2-094800de6b6a336344513fa6651112be_720w.jpg?source=2c26e567)图2、使用
VirtualBox 安装 Windows

把 Virtual Box 提供的 iso 挂载成光盘，在 Windows 中就可以安装光盘中的驱动了。使用体验会好一些。我用这个方法解决 Linux
办公的后顾之忧，比如要使用 Excel VBA 的时候：

![](https://picx.zhimg.com/50/v2-d6d397c985a2cc69c08480f95763955b_720w.jpg?source=2c26e567)图3、在虚拟机的
Windows 中跑 Excel

安了驱动之后，VirtualBox 还可以设置 Windows 和 Linux 的共享文件夹，也不用麻烦地去开 Samba 服务了。

在 Windows 中使用 VMWare Workstation 体验就比较好了，它直接提供 VMWare open-tools 供 Linux
安装，虚拟机中的 Linux 桌面跑得很流畅。

![](https://picx.zhimg.com/50/v2-90aa58069678aa04de1a3bbb0f23b770_720w.jpg?source=2c26e567)图4、在
Windows 中虚拟机跑 Ubuntu

其他的虚拟机软件我没怎么用过。

\-------- 补充 --------

知乎就是人才多呀，几个评论就解决了困扰我多年的找 virtio 驱动的问题。

然后就是其中有个答案提到把核显硬件直通给虚拟机，让我茅塞顿开呀。以前我只想着怎么把独显直通给虚拟机，没想过其实不管独显核显，既然我有两个
GPU，那直通一个给虚拟机，留一个给主机，那岂不是性能都上去了吗。

经常逛知乎还是挺有帮助的。