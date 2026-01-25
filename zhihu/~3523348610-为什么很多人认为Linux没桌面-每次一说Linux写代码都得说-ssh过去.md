---
comments: true
created: '2024-06-07T17:10:27'
draft: true
modified: '2024-06-07T17:13:01'
source: https://www.zhihu.com/question/566292923/answer/3523348610
title: 为什么很多人认为Linux没桌面，每次一说Linux写代码都得说 ssh过去？
type: archive-web
---

因为X11架构本身就是一个“草台班子”：

  * 内核、X Server、window manager到X client都是不同的团队开发
  * 不同部件的开发者之间各自为政、缺乏协调、甚至其开发理念是冲突的
  * 各个发行版、甚至用户自己都可以自由装配不同的组件，一致性很差

因此，诊断一个Linux桌面问题需要从头到尾啃一个遍。**如果Linux桌面跟业务无关，最好规避这一部分，减少维护负担。**

![](https://picx.zhimg.com/50/v2-e7d36350dad1bf960db6c0f81da857b4_720w.jpg?source=2c26e567)

**我举一个例子，虽然它是针对旧版本的，但也因如此，它涉及的组件较少，适合展示诊断Linux图形界面的一般流程**
，由于今天的Linux桌面远比当年复杂，多出mesa、wayland等等组件，诊断图形界面的负担远比早期Linux更重。

## 一个典型的Linux桌面问题诊断案例

在[《在中国接入互联网30周年之时，搭一台1994年的Linux服务器（下）](https://zhuanlan.zhihu.com/p/701922083)》一文中，有这样一段，是在这篇文章完成之后快一天才补上的：

**386SX加载Mosaic过慢的对策**

在没有FPU的386SX/486SX电脑上，有时会遇到打开Mosaic很慢或卡死的问题，这是由于Mosaic尝试加载矢量字体，而这一操作又非常依赖系统的浮点性能的原因。此时需要修改Xconfig的FontPath设置：

    
    
    # Multiple FontPath entries are allowed (which are concatenated together),
    # as well as specifying multiple comma-separated entries in one FontPath
    # command (or a combination of both methods)
    #
    FontPath        "/usr/X386/lib/X11/fonts/misc/"
    #FontPath        "/usr/X386/lib/X11/fonts/Type1/"
    FontPath        "/usr/X386/lib/X11/fonts/Speedo/"
    FontPath        "/usr/X386/lib/X11/fonts/75dpi/"
    # FontPath      "/usr/X386/lib/X11/fonts/100dpi/"

将Type1字体注释掉就可以大幅加快Mosaic加载的速度，如果需要，也可以将Speedo字体注释掉，但注释掉75dpi将导致Mosaic无法正确显示字体的大小和样式，不建议注释这一行。

**这一段看起来文字不多，需要改动的地方只有一行（确切的说只有一个字符），但诊断它我将整个技术栈从头到尾挖了一圈。**

### 故障是如何被发现的？

这个问题的起因是我发现Softlanding Linux System（下面简称SLS）1.05版和1.03版（版本号只差了0.02）的性能出现严重不一致：

  * SLS 1.05在386SX上启动Mosaic有些时候需要一分多钟才能加载完成
  * 而在SLS 1.03上却只要10秒左右
  * 在类似的Slackware 1.2.1上也只需要十多秒

### 首先排查X Client（应用程序）

我替换了几个不同版本的Mosaic二进制，1.3/2.0/2.4/2.5版本，均出现类似症状

### 其次排查内核

用Slackware 1.2.1的0.99内核替换，问题依旧

### 然后排查硬件

我发现在486DX上速度正常，在386SX+387 FPU的情况下正常，**在没有FPU的486SX上，即使提高主频，速度也非常慢，但SLS
1.03和Slackware 1.2.1在上述几种配置上都正常。因此我们不能简单下结论是硬件的问题。**

### 接下来排查X Server

这一部分绝对是深水区，SLS 1.05搭配的X Server是XFree86 2.0，而SLS 1.03和Slackware 1.2.1搭配的都是XFree
86 1.3。而这往下又出现了好几个不同排查分支，我只好一个一个的去试：

  * 使用不同的XFree86 Server，如VGA16、Mono等（相当于换驱动）：**无效**
  * 使用不同参数，比如soft-fp编译XFree86：**无效**
  * 将Slackware 1.2.1的XFree86 1.3覆盖安装到SLS 1.05：**无效**

**解决问题的转机**

到这一步其实是非常让人困扰的，因为它排除了CPU和XFree86二进制之间不兼容性的可能。但仍然存在下面的可能性

  * SLS 1.05中的某些配置选项导致不兼容
  * SLS 1.05中某些动态链接库导致不兼容

为了缩小排查的范围，**我决定使用SLS 1.05的base和Slackware
1.2.1的X11安装包拼装一套自己的发行版，来确定不兼容的文件究竟在哪个范围。**

![](https://pic1.zhimg.com/50/v2-4a2504cc015ab7731d0e9d432cf51482_720w.jpg?source=2c26e567)
这是缺少字体配置运行Mosaic的状态

然后我发现这个Mosaic在这个“拼装”的版本准里顺利运行了，只是报告一堆缺少字体的错误，原本菜单上的斜体字也变成了默认字体。

![](https://pica.zhimg.com/50/v2-da961abe920218736499ba8c05e8b954_720w.jpg?source=2c26e567)这是正常字体配置的Mosaic

**原来这个严重的性能问题和字体有关！**

### **确定最终的解决方案**

既然确定了某些特定的字体会拖慢系统，那么接下来可以作的选项有两种

  * 找到有问题的字体，删除它
  * 在配置文件中禁用相关字体

删除字体可能导致其他软件出问题，禁用字体是优选项，Xconfig选项里字体路径只有四行，一个个试下去就可以，最终发现是Type1字体的问题。这时故障原因也变得清晰：**Type1字体是PostScript字体，绘制它所需的运算量不低，在没有FPU的机器上加载很慢，**
最终这个问题得到了完整的解答：知其然，也知其所以然。

## 尽量别碰Linux桌面

虽然SLS 1.03、1.05和Slackware
1.2.1都是1993~1994年间的“古董”，但**这种排错的思路在今天的Linux上仍然适用。类似的问题在当代Linux桌面上也并不罕见：哪怕是小数点后两位的版本改动，都可能出现南辕北辙的表现。**

**今天的Linux桌面环境更加复杂，上面的过程其实是排查现代Linux桌面故障的简化版。而这个“入门级”的问题，也足够让经验丰富的技术人员扎扎实实地花上8小时工作量去排查。**

因此如果你的业务与之无关，那最好的解决方案是：**远离它。**