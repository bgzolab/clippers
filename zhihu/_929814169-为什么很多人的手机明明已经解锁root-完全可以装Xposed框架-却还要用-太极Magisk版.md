---
comments: true
created: '2019-12-10T12:40:22'
draft: true
modified: '2020-05-09T11:15:52'
source: https://www.zhihu.com/question/315803151/answer/929814169
title: 为什么很多人的手机明明已经解锁root，完全可以装Xposed框架，却还要用“太极Magisk版”？
type: archive-web
---

如果题主想问为什么不装原版Xposed，这个原因楼上都讲了，原版Xposed停更了，所以才出现EdXposed、TaiChi（分两种版本，一种免root，是基于虚拟App技术的）这些项目。

而且Xposed也是有Magisk模块的，可以在较低版本Android上安装使用——Magisk本身不就是root方式的一种么……题主这问题问的，好像magisk不是root一样。实际上就是因为后来版本的Android要拿到root早已不是给su改个setuid那么简单（至少还需要搞定各种namespace和selinux），才会出现Magisk这种复杂但完善的root解决方案。

  

我觉得题主想问的是为啥不直接修改system分区的文件来安装Xposed吧。

  

为什么要有Magisk，首先是因为system分区被dm-verity锁住，一旦可写挂载就会触发dm-
verity。这个也是和OTA更新有关，因为OTA增量更新是直接在块（可以理解为电脑上的概念“扇区”）级别上打补丁，如果不保持只读，那就直接改岔行了，会把数据改坏。

Magisk通过巧妙利用bind mount，把修改过的文件挂载回去，达到“既不实际修改system分区数据、又能在使用中改变system分区内容”的目的。

即使没有dm-verity和OTA，我也觉得这种看似限制自由的框架是有好处的，可以防止把系统改坏——有哪个模块惹了事，可以在recovery下把它禁用。

哈哈，2020年5月8日，Magisk增加了安全模式识别，这样不需要recovery也可以临时禁用模块了。这样万一某个模块导致系统不能启动，只要禁用就可以了：

[https://github.com/topjohnwu/Magisk/commit/a5d7c41d209527fe7b45a2ef7d031add9b6fad24](https://link.zhihu.com/?target=https%3A//github.com/topjohnwu/Magisk/commit/a5d7c41d209527fe7b45a2ef7d031add9b6fad24)

  

还有，某些手机不解锁bootloader（也就是“PBL->SBL->aboot->Linux内核”这条启动链中的aboot）也能通过9008强刷进Magisk，不过这样的话开机可能还是会出现警告，这说明secure
boot机制还是存在的（aboot还是执行了数字签名检查），只是厂商没把它彻底关掉而已。