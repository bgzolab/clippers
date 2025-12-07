---
comments: true
created: '2025-11-20T13:37:53'
draft: true
modified: '2025-11-20T13:37:53'
source: https://sspai.com/post/103293
title: 零基础 Vibe Coding 到上架，我做了一款 Apple Watch「带壳截图」
type: archive-web
---

**Matrix 首页推荐**  

[Matrix](https://sspai.com/matrix)
是少数派的写作社区，我们主张分享真实的产品体验，有实用价值的经验与思考。我们会不定期挑选 Matrix 最优质的文章，展示来自用户的最真实的体验和观点。

文章代表作者个人观点，少数派仅对标题和排版略作修改。

* * *

作为一名内容创作者，前阵子我每天「不务正业」地沉迷于写代码（基本是 AI 写的），在踩了无数坑之后，我开发的人生第一款 iOS app 终于上架了！

![](https://cdnfile.sspai.com/2025/10/23/6aac7825d9383db6da23bb9536574ce4.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

做 app 并不是一时兴起，很多年前我还在小厂当程序员（Web 开发）的时候，就很想开发 app 来实现自己的几个小想法，只不过自己学习能力不行，当年也没有
vibe coding 工具，每次都不了了之。

步入 2025 年，各种 vibe coding 工具愈发强大，我觉得时机已经成熟，但还是打算先做一个小 app 试试水，边做边学。

![](https://cdnfile.sspai.com/2025/10/23/b87f17afaeca4953b6cf18c2712dde83.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)什么是 vibe coding？

前阵子我给 Apple Watch 升级了 watchOS 26，新的「照片」表盘配合我自己拍的一些云的照片非常好看，可惜直接截屏分享有点干巴巴。

![](https://cdnfile.sspai.com/2025/10/23/1697ed6091d0c89b12fdf6dfe72d4b4e.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

我想找一个 Apple Watch 截屏美化工具，找了一圈没有让自己满意的，要么是界面太丑、多年没更新，要么是套壳不够全。于是我想，干脆第一款 app
就做一个 **Apple Watch 截屏美化工具** 吧！功能逻辑简单，也可以快速验证这种 app 开发方式的可行性。

关于我这一个多月 vibe coding 开发 app 的体验和经验，下次单独一篇文章再来分享（如果有人感兴趣的话），今天先介绍一下我这个 app。

App 名为 **WatchNice** ，意为「Watch 截屏图美化」。它目前提供的功能也比较简单，三两句话就能讲完。

首先可以用它给 Watch 截屏加一个**背景色** ，app
提供了「经典」「表盘」「年度色」「中国传统色」等单色，以及渐变色，甚至可以用自选颜色（支持取色器）和透明背景。

![](https://cdnfile.sspai.com/2025/10/23/88ab106bda9e604568196b9f7a0072e1.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)Apple Watch 截屏加背景色

然后是**套壳** ，支持最新的 Series 11 和 Ultra 3 等各种材质的表壳和各种款式的表带。

![](https://cdnfile.sspai.com/2025/10/23/e79828a5fb64de3afd25533c489140f1.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)Apple Watch 截屏加套壳

市面上能下载到的 Watch 截屏美化工具基本都是套壳，有一点千篇一律，于是我加了一个我自己也很喜欢的截屏加**边框**
工具，可以定义边框的颜色、粗细和阴影。

![](https://cdnfile.sspai.com/2025/10/23/9091b5c152c4179c231953507ff9962e.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)Apple Watch 截屏加边框

这个边框功能虽然简单，但目前应该是针对 Apple Watch 截屏美化的独家提供方案，说实话，这个小功能让我有一点点引以为傲（嘻嘻）。

![](https://cdnfile.sspai.com/2025/10/23/0db2e06479a26a9d27065e91d26997b6.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)![](https://cdnfile.sspai.com/2025/10/23/976adda7afa6a0ca2858a7d55c614da8.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)![](https://cdnfile.sspai.com/2025/10/23/e8b5fe491ce92964de4ec2f1e0c406c8.PNG?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)![](https://cdnfile.sspai.com/2025/10/23/a19be65372470864835caa090d03e2b7.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

最后可以改变图片的布局，比如比例、截屏缩放，按照你想要的展现方式分享。

![](https://cdnfile.sspai.com/2025/10/23/bac39fb3abe8d5e7b338043834396607.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)Apple Watch 美化截屏布局

WatchNice 的功能就这些，很简单，但开发起来要考虑的细节却非常之多。目前 app 还处于早期版本，一些功能和界面还需要优化完善，甚至可能还存在
bug，留给以后吧，不然太追求完美就上架不了了。

![](https://cdnfile.sspai.com/2025/10/23/8f332517d390f2a021c49283cccedbae.jpeg?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)在合柴「旧物仓」某咖啡馆撸代码

关于 app 的定价，我也想了很久，最终决定简单一点：免费下载和使用部分美化功能，内购 Pro 可以解锁全部功能，Pro 功能定为 **¥15**
人民币（对应美区 $1.99），不到一杯咖啡的钱，且**一次付费永久更新和使用** 。

因为 app 刚上线，又是我的第一款 app，不搞点福利有点说不过去，所以当前设置了**早鸟价格 ¥8** （对应美区 $0.99），本月底（10 月 31
日）恢复原价，以后也不打算搞什么活动优惠。所以如果正好用得上这样一款小工具，不妨趁此机会将它收入囊中，也是对我创作的一种支持🙏。

像这样一款极其冷门的买断制小工具 app，我本也没指望靠它赚钱，去掉各种成本（GPT plus
每月缴、云服务器和域名每年缴、苹果开发者资格每年缴）以及苹果抽成后，能回本就不错了。毕竟靠做视频恰饭可比开发这样一款 app
赚钱容易多了。当然，买断制定价不代表我上架了就不管了，我也会根据我自己的需要和大家的反馈建议日常迭代新功能，以及每年更新新表壳样式。

从今往后，除了「内容创作者」这个身份，我也可以对外宣称自己是「苹果软件独立开发者」了（嘻嘻）！

![](https://cdnfile.sspai.com/2025/10/23/d2af57c4778a80e3b7c0747c2f515221.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

> 关注
> [少数派小红书](https://www.xiaohongshu.com/user/profile/63f5d65d000000001001d8d4)，感受精彩数字生活
> 🍃

> 实用、好用的 [正版软件](https://sspai.com/mall)，少数派为你呈现 🚀