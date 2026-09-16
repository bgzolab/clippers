---
comments: true
created: '1970-01-01T08:00:00'
draft: true
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/103281301
title: 如何在 Chrome、Firefox、Edge、Safari 之间进行跨平台书签同步？
type: archive-web
---

## 废话区

总有人和我一样，每过一段时间就会想着换个浏览器用用，换换口味。比如我最近发现 Firefox 升级到 70 以后，在 macOS 上的性能大幅提升，就决定让
Firefox 替代 Chrome 当主力浏览器一段时间。频繁换浏览器的一个痛点就是书签的同步问。相比较插件和脚本等，书签的增删频率要大很多，每次从 A
导出，B 导入肯定太麻烦，还可能因为双向更改出现错误。下面就简单说说我找到的书签同步方法。

## Chrome、Edge 与 Firefox 之间的书签同步

由于新的 Edge 采用了 Chromium 内核，所以 Edge 和 Chrome 插件都是通用的，所以对 Chrome 的方法对 Edge 也有效。

### 方案一: 开箱即用，就用 EverSync

官网链接：

[https://www.everhelper.me/synchronizer.php](https://link.zhihu.com/?target=https%3A//www.everhelper.me/synchronizer.php)

Firefox 和 Chrome 的商店其实也能直接找到，本质类似已经关闭的 Xmarks。界面虽然比较粗糙，但是功能还是简洁好用的。

![](https://picx.zhimg.com/v2-72691499678a19bd65617dde20df7841_1440w.jpg)EverSync

  

### 方案二：Floccus 搭配坚果云

GitHub 链接：

[https://github.com/marcelklehr/floccus](https://link.zhihu.com/?target=https%3A//github.com/marcelklehr/floccus)

搭配坚果云是因为 Floccus 支持 WebDav 进行同步，而坚果云就支持 WebDav，本来还想多写几句如何配置的，结果搜 GitHub
页面的时候，直接搜索到了别人的教程，索性偷懒，贴下链接就好 ️

[不同浏览器书签同步方案：坚果云+Floccus_详细使用教程 | 奶爸建站笔记](https://link.zhihu.com/?target=https%3A//blog.naibabiji.com/ji-qiao/jian-guo-yun-floccus-shu-qian-tong-bu.html)

  

### 方案三：让书签管理脱离浏览器，由第三方服务接管

前面两种其实本质都是通过让插件获取浏览器书签管理器的内容，然后通过一个云服务同步。而第二种思路就是直接让第三方服务代替浏览器自带的书签管理器，**这样书签不再依赖于浏览器。并且它们往往还提供更加强大的管理功能，比如标签化管理，智能文件夹**
，**批注等等** 。缺点，可能是很多高级服务一般都要收费。

下面推荐一些：

首先国外的一个比较典型的就是
[Raindrop.io](https://link.zhihu.com/?target=http%3A//raindrop.io/)

[Raindrop.io — All in One Bookmark
Manager](https://link.zhihu.com/?target=https%3A//raindrop.io/)[Topbook：这款堪称神器的谷歌插件
Raindrop.io，可以全平台高效管理网页书签。](https://zhuanlan.zhihu.com/p/33279847)

另外一个是 Pinboard

[social bookmarking for
introverts](https://link.zhihu.com/?target=https%3A//pinboard.in/)[其貌不扬，管理书签却是能手：Pinboard
入门指南 - 少数派](https://link.zhihu.com/?target=https%3A//sspai.com/post/41817)

  

而国内比较推荐的是 Cubox 和 Pinbox ，两个界面都比较美观，按需选择。我个人自己用的 Cubox，价格也相对便宜点。

[Cubox -
全能书签管理器，智能网页收藏夹](https://link.zhihu.com/?target=https%3A//cubox.pro/)[Pinbox -
跨平台收藏工具](https://link.zhihu.com/?target=https%3A//withpinbox.com/)

关联阅读：

[使用 Pinbox
的正确姿势？](https://www.zhihu.com/question/279310702)[从书签收藏夹到「私人信息助手」：Cubox -
少数派](https://link.zhihu.com/?target=https%3A//sspai.com/post/62557)

  

## **Safari 与 Firefox 和 Chrome 之间的同步**

这个其实比较简单，Windows 上安装 iCloud 这个软件后，打开 iCloud 的控制面板就能看到

![](https://pic1.zhimg.com/v2-418b92d5af958f0eaa428d8b254c26e8_1440w.jpg)iCloud
书签同步

选择以后会在 Chrome 或者 Firefox 上安装一个 iCloud 的书签同步插件。同步过程无感，移动端的 iPad 或者 iPhone 在
iCloud 地方开启 Safari 书签同步后 （默认就是开启的），可以在 Safari 上直接看到 Chrome 或者 Firefox 的书签。

但是我好像并没有在 macOS 上的 iCloud 找到这个选项，因为 Mac 上的 Safari 的书签可能来自移动版 Safari
的同步，所以我无法确定这个 iCloud 插件在 macOS 上是否有效。懂的朋友可以来评论区说说。**但是可以期待下新的 macOS 系统，据说
Safari 开始支持 WebExtensions，所以 floccus 插件有可能可以移植到上面。**

## 结尾

至此，就可以在你的多个平台，多个浏览器上实现书签的同步啦 ！水文 Over ️