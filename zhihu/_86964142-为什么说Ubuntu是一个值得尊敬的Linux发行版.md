---
comments: true
created: '1970-01-01T08:00:00'
draft: true
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/86964142
title: 为什么说Ubuntu是一个值得尊敬的Linux发行版
type: archive-web
---

Ubuntu用了好长时间了，最早接触的是RedHat，个人使用体验并不好，当时一直在想，为什么就没有一个更好用的Linux操作系统呢？别万年不变的Windows不行吗？（当时作为一个穷学生党，完全不想还有高大上的MacOS可用），直到我看到了Ubuntu。

译者是从14.04版本开始跟Ubuntu的，16.04，18.04，一路走来，Ubuntu从没让我失望，毕竟是我用过的最友好的Linux发行版了。Ubuntu简化了许多操作，支持的应用也非常丰富，界面也非常友好，而且，支持许多新的项目和方案，比如OpenStack火的时候，Ubuntu介绍了一些便于用户使用OpenStack的相关方案，K8s火的时候，Ubuntu也发布了跟K8s相关的软件方案。

Makeusof网站的Bertel
King总结了Ubuntu以及Ubuntu的开发者Canonical为Linux世界带来的变化，他一共总结了八点，译者还是比较认可这些说法的。这八点基本可以说明Ubuntu和它的开发者Canonical对Linux生态的贡献是值得尊重的。

**1，Ubuntu比较专注做桌面端**

![](https://pica.zhimg.com/v2-0971ab36f6db6758465851cdb1fb00a4_1440w.jpg)
Ubuntu 9.10版本 Karmic Koala

Ubuntu是2004年推出的，支持台式机和笔记本电脑，当时的使用体验并不好，Ubuntu致力于成为“人类友好型Linux”，增加了许多特性，这些特性可以让Ubuntu当主操作系统用，比如让驱动安装变得更容易了，比如支持多媒体应用了，比如，近年来开始支持各种游戏了。

Ubuntu的开发者Canonical曾提出过许多关于规范Linux桌面的倡议，Ubuntu将消息通知集成到桌面中，推出了Ubuntu
One文件同步服务和音乐存储服务，还设计了统一的接口，虽然后来Canonical叫停了这些项目，但还是给Linux桌面领域带来了很大影响。

Linux在服务器上用的更多，而当时的Ubuntu也表示最好用的Linux发行版，然而，Ubuntu的开发者和社区开发者为此付出了很多心血。

现在看来，整体Linux桌面比十五年前好用多了，Canonical功不可没。

**2，Linux支持的硬件类型越来越丰富**

Canonical为的是提供面向普通用户的桌面Linux，为此，他们跟许多硬件厂商勾搭，现在包括System
76、戴尔、惠普都推出了装着Linux操作系统的笔记本电脑，市场上还有许多像Purism Librem 13，ZaReason UltraLap 6440
i7等相对小众的笔记本。System76使用的Pop！_OS和Purism用的PureOS都是基于Ubuntu改造的。

**3，Ubuntu为Linux带来了上百万的用户**

Canonical聚焦在桌面端的做法吸引了许多用户，现在Ubuntu的用户远超别的发行版，知名度非常高，一般的电脑爱好者都知道它。很多人最开始接触Linux就是从Ubuntu开始的，可能有的人现在不用Ubuntu了，但很多人都知道，如果没有Ubuntu，也很难进入Linux世界的大门。

**4，Ubuntu是许多流行的发行版的基础**

Ubuntu不仅是最流行的发行版，而且还是许多流行的发行版的基础，很多都是基于Ubuntu打造的。

开启Ubuntu的时候，你会从软件库里下载应用，软件库是一台存放了所有程序和组件的服务器，开发者可以在这里创建和管理代码项目，而Ubuntu这样的发行版会从这里取代码。

不是所有的代码都是Canonical开发的，但是像Linux内核，一些测试和安全补丁都是Canonical提交的。

常见的包括Linux
Mint，ElementaryOS和Pop！_OS这样的Linux发行版也都是依赖于Ubuntu的库，而且完全不用付费就能使用，虽然不能靠这个挣钱，但并没有打消Canonical和Ubuntu社区为为Linux生态做贡献的热情。

**5，Canonical创建了一个新的通用包格式——Snap**

在Linux上怎么安装程序呢？常用的最方便的办法就是用通用的软件包格式，简单的一行命令就可以自动从服务器上拉下来软件进行安装，而不用非得先下载软件到本地，然后再手动安装了，Snap是一种Ubuntu贡献的软件包格式。

在有通用软件包格式之前，如果你针对Ubuntu开发了软件，而没有给别的发行版开发对应版本的软件，那就麻烦了。如果你用的Linux用的rpm的，想去安装一个基于deb的软件，根本不能安装下来，除非你拿过来源码重新针对新系统编译一下。

Snap无视版本差异，不管你用的是不是Ubuntu，只要你的Linux启用了Snap支持之后，就可以安装Snap版本的应用。Canonical如今正在大力推广Snap，面向开发者和一些大公司进行推广，Snap明显也是对大公司有利的。

**6，Ubuntu吸引了第三方商业软件**

Ubuntu吸引了许多第三方开发者，使得Ubuntu平台上引入了许多原来在Windows和MacOS下的商用、专有软件。

虽然有些第三方开发者的加入不一定对整个Linux生态带来积极效应，但对于第三方开发者本身来说，在Ubuntu上开发的软件可以很快传播到别的发行版上，比如Linux版本的Steam游戏平台就是如此，这不由得让游戏玩家和游戏厂商重新审视使用特定应用程序的前景。

有了Snap之后，很少有程序是Ubuntu独占的，因为Snap应用商店里的应用程序现在非常简单就能获取到。

**7，Canonical将GUN/Linux带到了手机领域**

安卓手机使用的也是Linux内核，这个你在电脑上安装的Linux是一样的，不过，两者也就内核一样，别的组件大部分都不一样。

Ubuntu
Touch移动操作系统是Canonical另一个雄心之作，这个想法跟译者很久以前的个人幻想如出一辙，就是推出一个手机版的Linux，就像在台式机上运行Ubuntu一样在手机上运行一个Linux发行版，Canonical做到了，但有局限性，但是分发和推广起来比较难，手机只在少数几个市场上使用。（中国的魅族也发布了一款Ubuntu手机）

Ubuntu
Toucu的发展现状限制了Canonical在该项目上的投资力度，现在作为UBports社区项目继续存在，社区成员可以继续在原有基础上进行开发，现在仍维持着更新。而且已经移植到了Librem
5 和PinePhone开源智能手机上，近期最还有新手机推出，但配置实在不够看的。

最近，国内某科技公司宣布正在开发可比肩iOS和Android的移动操作系统，但译者目前还不清楚背后的技术实现路径，不过，将Linux直接运行在手机上的路径不失为一种选择。

**8，Launchpad成了很多开源软件的家**

![](https://pic4.zhimg.com/v2-0c6196b0d839c66670ef27f33672ba13_1440w.jpg)

Launchpad是一个托管着数千个开源软件的软件协作中心，类似于Github。（跟Github不一样的是它没有跟微软绑定）

Launchpad原本是Canonical用来盈利的专有项目，Canonical用它来支撑Ubuntu未来的开发工作，这一做法遭到批评后，Canonical陆续开放了很多组件，最后在2009年开源了该项目。

过去十多年来，Launchpad一直作为开源基础设施项目，开发者可以用来共享源代码，跟踪bug，参与讨论等。包括Linux
Mint，elementaryOS，Inkscape，Exaile也都诞生于此。

Ubuntu是一个非常厉害的Linux操作系统，如果没有Windows和macOS的话，我很乐意用Ubuntu。Ubuntu为规范和壮大Linux社区和生态做出了很多贡献。

看完这八点介绍，能感觉出来Ubuntu作为一个免费的开源软件简直就是人见人爱的活雷锋啊，不是一昧的要挣钱，能接受别人批评，敢为人先，敢想（做出了许多译者想象中的事），敢失败，敢在失败之后继续尝试，这比还产品什么的都没有就要大肆宣传，稍微做点东西就急功近利要做私有化要商业化的公司要高尚的多。

**后话：**

不过，毕竟Canonical也是一家公司，虽然有很多社区的人利用空闲时间在做贡献，但终究还要给全职员工发工资啊，Ubuntu是怎么挣钱的呢？下图来自Ask
Ubuntu上的高赞回答，介绍了Canonical是怎么挣钱的。

![](https://pic3.zhimg.com/v2-a24f36486a1b8f32bccef79c3bde99e4_1440w.jpg)

简单说，Canonical是几个土豪出资成立的公司，原本对盈利的要求不高，后来为了盈利发工钱，一方面要做类似RedHat一样面向企业的付费服务，一方面跟OEM厂商合作盈利，还有一方面卖付费软件，还有一方面是闭源商业化Launchpad上的软件，最后，还有放置像Amazon电商网站这样的入口广告位，就像Firefox的默认搜索引擎是Google，Google会给Firefox一样，类似于国产手机的预装软件。