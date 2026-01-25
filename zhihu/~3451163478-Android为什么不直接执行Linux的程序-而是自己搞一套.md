---
comments: true
created: '2024-04-01T20:29:46'
draft: true
modified: '2025-06-27T10:18:08'
source: https://www.zhihu.com/question/20596433/answer/3451163478
title: Android为什么不直接执行Linux的程序？而是自己搞一套？
type: archive-web
---

安卓其实是可以执行Linux程序的，因为安卓自己就是基于Linux内核，底层的那些东西仍然是靠Linux ELF可执行文件实现。

但是，安卓并不能直接运行传统的基于glibc的Linux软件。由于glibc是遵守LGPL许可的运行库，但是Google的Android为了实现商业用途，就将包括glibc在内的遵守(L)GPL的组件都给砍掉了，并自行开发了一套名为bionic的运行库。实际上bionic库本质上也是libc的一种实现，只不过适用于手机等小型设备，并且Android
NDK也是使用bionic库进行编译的。再加上安卓系统默认是不提供shell界面的(需要借助第三方软件或者adb
shell实现),图形界面也并非Linux那套标准，所以想要运行Linux程序有点难度。

除此之外，安卓系统本身的文件系统也有限制，同样也限制了Linux软件的安装使用。

不过好在，运行Linux软件我们还有别的方案。其中最典型的方案就是Linux容器，可以借助Termux等软件实现。实际上Termux本身就自带了Linux上的常见软件，可以通过apt/pkg命令安装，其实质上就是将Linux上的常见软件用bionic库重新移植以便在安卓系统运行。

![](https://picx.zhimg.com/50/v2-25f37fc479a027409ce5c613f25ab607_720w.jpg?source=2c26e567)

当然，termux自带的那些软件还是不够用。不过好在termux提供了chroot和proot这两种构建容器的方案（前者需要获取root，后者不需要）。关于二者的使用，网上的教程有很多，这里就不再赘述了。

通过容器运行Linux发行版可以实现更丰富的功能，除了能运行Linux上的常见软件，运行图形界面也是没问题的（可以借助vnc
x11等进行画面输出，如果使用vnc的话还可以远程连接）

![](https://picx.zhimg.com/50/v2-3f39508c51659454b0969dd6070bbab8_720w.jpg?source=2c26e567)WPS
for Linux在Linux容器的运行效果（非P图）

甚至可以用Linux容器，借助wine-ce运行Windows软件。

![](https://pic1.zhimg.com/50/v2-75cead347633d0bff2db083018c1cb75_720w.jpg?source=2c26e567)

当然，Linux容器的缺陷还是不少的，例如无法使用systemd（因为无法确保init的PID为1），以及无法调用某些硬件（不过有些缺陷倒是可以用曲线救国的方式解决，除了x11本身就有的转发功能外，声音输入输出可以借助pulseaudio，GPU渲染可以借助virglrenderer（需要挂载/tmp目录到termux的tmp目录）等实现）。不管怎么说，Linux容器还算是可玩性比较高的。

另外，理论上静态编译的程序也可以在安卓平台直接使用，因为静态编译并不需要引用其他动态库，完全可以独立运行。例如qemu经过静态编译后就可以在安卓平台借助终端模拟器直接运行，不过功能上肯定会有所缺失，因为不少功能只能动态编译(例如gtk)。

* * *

补充:

有消息称安卓15将引用原生的Linux环境(类似于Windows的WSL),
采用的是Debian发行版。目前已知Google旗下的Pixel已内置该功能，不确定其他手机厂商是否也会引用该功能（据我所知该功能可能会在安卓16上大规模推送给其他品牌设备）。如果真的是这样的话，那么后续在手机上使用Linux将会更便捷。

![](https://picx.zhimg.com/50/v2-d28a5e474edb1ee92f56d90b7f48ca95_720w.jpg?source=2c26e567)