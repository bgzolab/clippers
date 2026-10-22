---
comments: true
created: '2025-02-05T01:38:14'
draft: true
modified: '2025-10-05T04:28:08'
source: https://www.zhihu.com/question/11065704164/answer/92935285604
title: 为什么 Windows 没有比较成熟的第三方桌面环境（explorer.exe）？
type: archive-web
---

## 外观

微软在ui设计语言方面跟谷歌一个级别。Win7的 Aero，WIn 8.1的Metro Design，Win10的Fluent 2，Win11的Fluent
UI。Revel HighLight，Reveal Focus。

除了metro因为win8.1本身不行没发展起来，其余三个都是超级热门的。你想要设计出比微软还好的UI？不可能。谷歌和苹果在移动端搞的，Flat
Design，拟物化，Material Design也是同理。

![](https://picx.zhimg.com/50/v2-dd4de131e2311505f8174ec7eb750ec6_720w.jpg?source=2c26e567)

性能和占用更不要说了，vscode一个electron软件，性能比很多qt软件都强。

兼容性是最重要的，比如打开文件的对话框之类的，是通过Windows api实现的。而Windows
api就是一堆c语言的头文件声明的函数，它能正常运行，是假定explorer，dwm等进程是操作系统管理而且优化过调度的，还可能存在优先级，其他软件的钩子之类的东西。

linux那种更新个软件都能导致系统崩溃的兼容性自然想象不到windows底层都干了什么。你随便改，其他应用程序时调用出了问题就会导致异常，异常了就会直接终止进程。

微软巅峰之作，Windows 10。它这个光效叫Reveal HighLight。是用c++和dx写的，对指定控件生效的一个光源，跟随鼠标移动。

![](https://picx.zhimg.com/50/v2-959fff9de25a95455d9044e050855dfd_720w.jpg?source=2c26e567)

底层是用颜色转换矩阵，alpha通道蒙版等技术制作的，本身是内嵌在ui框架里的，计算量很小还有GPU加速，性能消耗非常小，并且效果非常好。如果要仿制只能用c#的这几个框架，有微软提供的xamlLight可以用。

否则，以vue为例，你要监控鼠标移动事件，获取位置，获取控件的尺寸，位置，边框和背景的颜色，然后计算尺寸，制作选区蒙版，叠加一个径向渐变笔刷，然后要传给v8引擎解析，v8引擎和浏览器的渲染引擎还有一大套工作要弄。

这一套流程下来，跟微软用DirectX + c++实现的原生效果相比消耗要多得多，还无法完全模拟光源的效果。

![](https://pic1.zhimg.com/50/v2-2b5b41d34744da868cc2fe02c9e77654_720w.jpg?source=2c26e567)

从功能性来讲，还有不同设备的支持，大到100寸的电视，32寸的带鱼屏，小到14寸的笔记本，各种dpi，都要能提供清晰的显示效果，还要能维持基本相同的使用方法。

  

linux这种劣质ui甚至不配跟window放在一起比。唯一的优势就是内核开源，所以能做到风格统一和高度自定义。

![](https://picx.zhimg.com/50/v2-189f0cb253835e285a1e2531b2bec9c7_720w.jpg?source=2c26e567)

既然没资格跟微软比ui设计，就只能像stardock一样加小组件，fence+groupy+开始菜单，或者是explorer
patcher那样允许你回退到上一代设计语言的风格，还有破解主题，部分修改外观的，但是系统更新时会炸掉。windows上跟shell有关的也就这些。

假如你说的shell指的是与操作系统内核对应的整个shell，而不是交互界面，那你还需要窗口管理，负责提供窗口渲染等东西，那就更加复杂了。

此外你还无法使用windows提供的独占全屏，用户态全屏进程直接对接显卡，绕过dwm这个管理窗口的进程，

还有directx stroge这种显卡绕过cpu直接读取rom上文件的技术你也不一定能兼容，即使你兼容了，跟我举得reveal
highlight的例子一样，你做的也肯定没有微软强。

除此之外你还要自己写2d渲染引擎，Windows现在已经用directwrite取代了ClearType，你能写出相同级别的库吗？文本排版引擎是极其复杂的，用skia画的libraoffice至今仍然半死不活的，只有office，google
docs和wps这种自己渲染的能打。

微软因为早年间跟adobe那些公司竞争过，还有自研的office
word，还有自家游戏平台xbox，他的渲染引擎技术也是几乎无敌的，最起码比那个bug一堆甚至会回退到cpu软渲染的skia要强很多，此外微软直接掌控dx，假如重要的话，是可以使用定制版本的sdk的。

* * *

补充一点。你知道为什么explorer一般情况还好，但涉及媒体文件就极卡吗？

对于家用电脑的情况。你是ntfs+windows。此时文件的基本属性，比如创建日期的时间戳，是文件还是文件夹，是否加密，是存在mft里的。

mft表存了一个卷（一个分区）上所有文件和文件夹的属性。是一个元数据区

而，媒体文件，它们的额外属性，如专辑，艺术家，音轨号，碟号，专辑缩略图，它们全是文件在数据区，自己划分一块固定大小的区域存元数据，叫文件头。

Windows为了提供基本的媒体管理功能，是给每种文件注册一个com用的dll。

而这些dll可能很老旧，而且因为被其他服务依赖，无法兼容的更新。这些dll的代码可能极其老旧，性能就很差。

## 解决方案：

基于electron+vue，用c写的核心功能，没看，但大概就是我说的那些查元数据，查拓展属性的功能。

如果动画全开，鼠标乱飘触发一堆弹窗和动画时，峰值cpu占用是

![](https://pic1.zhimg.com/50/v2-dae3f5d91d8a9efd9d3260c1bff734a7_720w.jpg?source=2c26e567)

因为界面是这样的：

![](https://pic1.zhimg.com/50/v2-accfda05e7af67a0c6a61f52ff356334_720w.jpg?source=2c26e567)

核心占用只有200mb

![](https://pic1.zhimg.com/50/v2-c6bcbde2d0469a6ec463d612f21fb4cc_720w.jpg?source=2c26e567)

对于一般操作，耗时更高一点，但因为它的异步用的很正确，不会导致ui线程变卡，而且用了动画，这样你的感觉上这个软件就很流畅。常用的功能也都有。

## explorer性能慢的原因：

首先明确一个概念：

  * 扇区是物理存储设备的**最小可寻址单元。**
  * 硬盘上的主控芯片控制文件系统，它把一个簇作为**最小逻辑单元** 。1簇=N扇区
  * 内存没有自己的主控芯片，操作系统全权管理内存，它会把实际内存地址映射到许多**虚拟页** 。

它们的大小通常都是**4kb** ，以便进行**对齐** 。

###  大量小文件进行复制

此时会发生以下的工作流程：

> **一。Shell**

explorer.exe用**IFileOperation** （一个**COM接口** ）枚举所有文件，用下边这个win32 api进行复制。

![](https://picx.zhimg.com/50/v2-12bcd95fc2bebdea97a2af6721021aac_720w.jpg?source=2c26e567)

根据红圈所述，它是支持异步进行的，但在explorer里，它没有**await**
，我也不知道为什么。因此它同时就只能有一个线程进行复制，这个线程同时只能处理一个文件。这样就非常的慢。

  * 每个文件复制都包含两次打开 (`CreateFile`)、读写循环、关闭 (`CloseHandle`)；
  * 期间还要更新进度、计算剩余时间、响应取消。因为该函数是同步使用，所以这些操作都会阻塞复制过程。**真正要进行复制的工作会被卡住** ，等着explorer.exe在这算剩余时间。

> **二。CopyEngine**

调用该函数，会把实际工作下发到内核里的**CopyEngine** ，

首先，**Request Dispatcher** 把这些任务添加到队列。**I/O Worker Threads**
这个线程池执行实际的IO任务，下一步是**Metadata Updater，** 它会异步并发的进行：

  * 更新目标文件的 MFT 条目，
  * 写入 USN Journal，
  * 更新拓展属性，如文件属性、时间戳、ACL 等信息

下一步是性能瓶颈所在，**Cache Manager** ,

  * `ReadFile` 提交到内核 → Cache Manager 检查页缓存；
  * 如果页未在缓存中（小文件可能只占半页），Cache Manager 会分配内核页缓存（4KB），读取整页到缓存；
  * 2–3KB 文件实际占用整页，但只填充一半，剩余空间浪费。

然后：

  * `WriteFile` 提交到 Cache Manager；
  * Cache Manager 分配脏页缓存（Dirty Page），把小文件写入页缓存；
  * 因为页面大小 4KB，所以剩余空间未满 → 延迟写回时可能触发额外 I/O（写放大）。

Cache Manager 定期刷脏页到磁盘。

假如我要写入一个2kb的文件，文件系统会给我分配一个目标簇，这个簇的剩余空间是大于2kb的。除非该簇完全空，否则**Lazy Writter**
会读取这一整个簇，然后在内存里合并进去，再整个写入该簇。

这个是**RMW效应** 。

所以：

  * 每个文件写入时，NTFS 的 Metadata、MFT 和 USN Journal 都需要写入，产生大量**短生命周期的 IRP 对象** 和 **MDL（内存描述符）** 。  

  * Cache Manager 必须协调这些元数据页与数据页的一致性，增加锁和同步开销。

在大量小文件复制时，windows不会合并它们，写入请求落在随机的LCN（逻辑簇号）上。此时不能找到一个连续的扇区，统一写入这些小文件，因此顺序写变成随机写，
IO调度器就被干爆了。

成千上万个小块随机写意味着成千上万个 IRP 同时进到调度器队列里，导致：

  * 调度器队列堆积
  * Storport 层不得不频繁调度小 I/O
  * 驱动上下文切换和 DPC（Deferred Procedure Call）暴增

**简化一下就是这样：**

  1. Cache Manager 每次写回一个 4KB 页；
  2. Lazy Writer 把这些页打包成一个 **散列（scatter/gather）I/O 列表** ；
  3. NTFS 试图排序这些页 → 发现逻辑簇不连续；
  4. 调度器无法合并；
  5. 于是每个 4KB 页都触发一次单独的设备写。

对于 HDD 来说，这导致 **寻道风暴 (seek storm)** ；  
对于 SSD来说，则是 **IOPS 饱和 + 调度队列抖动** 。

而一个专业的复制软件，它会

  1. 自行保证 **扇区对齐（sector alignment），** 自行维护 **写入顺序和缓冲。**
  2. 它会把小文件合并到一个文件页，把文件页合并在一起连续写入，此时，**随机写入** 变成了**顺序写入** 。
  3. 它使用 **事务缓冲** ：延迟元数据提交，或批量提交多条文件修改；避免每个小文件单独触发 MFT 和USN修改。

可以看一下硬盘性能，Sequence是顺序，random是随机。

![](https://pic1.zhimg.com/50/v2-2b64ef5c03e32962f1066b933b51802f_720w.jpg?source=2c26e567)

Windows之所以不这么做，不是因为微软傻。

批量更新 MFT 或延迟提交虽然快，但一旦系统崩溃，容易导致文件系统不一致。这个叫强一致性。

同步操作保证了即使系统崩溃也不会破坏元数据，这个叫原子性。

必须对HDD，SSD，SMB等各种协议各种文件系统的卷都兼容，这是第一目标，而不是最高吞吐量。例如，不是所有卷都允许
NO_BUFFERING，网络共享根本无法控制簇对齐。

## Windows假定专业人员要做专业任务会找专业软件，如wiztree，spacesniffer，diskgenius，sigma file
manager，localsend，teracopy，fastcopy这些东西。

## 但总有大傻子，既要吞吐量，又要向后兼容性，又要普适性。连个激活码都不买，我命也给你好不好？

就这个Windows11上，你要个现代化的文件资源管理器。sigma file manager, files哪个不行？