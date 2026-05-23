---
title: 真正解决你的痛点，那些良心的 Android 独占应用：隐私工具篇
aliases:
  - 真正解决你的痛点，那些良心的 Android 独占应用：隐私工具篇
created: 2026-04-12T23:48:47
modified: 2026-04-12T23:48:57
description: "这一篇向大家带来 5 款可以提升我们在日常生活中的信息安全，更好防止隐私泄露的小工具。"
source: "https://sspai.com/post/43018"
tags:
  - "archive-web"
---

# 真正解决你的痛点，那些良心的 Android 独占应用：隐私工具篇

Android 系统的开放性和自由性对开发者来讲是十分友好的，这意味着开发者们不仅可以实现一些在其他操作系统上实现困难甚至「禁止」实现的一些需求，还能跳过繁琐的审核流程轻松向全世界分享他们独特的 idea。

利用这个合集，我会分享一些你可能在 Play 商店上或主流渠道找不到的良心应用，在阅读完这个合集之后你会感叹：原来不用那些臃肿的「毒瘤」也能优雅地解决一个个痛点，Android 也可以如此轻盈流畅。

接着上一篇「下载工具篇」的推荐，我们来到了这个系列的第二篇 —— **隐私工具篇** ，如果还没有看过第一篇的朋友可以点击这个传送门： [下载工具篇](https://sspai.com/post/42039)

这一篇主要向大家带来 **5 个可以提升我们在日常生活中的信息安全，更好防止隐私泄露的工具** ，以及相关的小知识与小技巧，接下来就直接进入正题吧。

## App Ops：自动化你的应用权限

想要保护手机上的隐私，最好的方法就是让应用获取不到数据。我们可以通过权限管理软件轻松地拒绝应用获取敏感权限。不过当 Android 6.0 Google 将权限改为运行时申请，一些十分想要你的个人信息的应用想出了一个绝妙的法子 —— 拒绝就不给用，每次运行应用都会向你申请诸如「电话信息」「地理位置」等相关不相关的权限，如果拒绝就直接退出应用，即使这个应用的功能和这些权限毫无关联。

![](https://cdnfile.sspai.com/2018/01/26/d3b902dd5dfdb8f001e7fb32a33aa1b4.png?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

这个时候 [App Ops](https://sspai.com/link?target=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Drikka.appops) 就可以满足你既不想泄露自己的个人信息又想要用这些应用的愿望了。它的作用是提供一套半独立与 Android 权限服务体系外的，针对每一个 App 的权限设置，不仅可以在用户允许相关权限后通过返回空数据等「禁用」权限，还可以禁止许多系统权限管理本身不提供的权限。

就以微信为例，App Ops 提供的权限如下：

![](https://cdnfile.sspai.com/2018/01/26/81250165adbe591030714d6d62641702.png?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

而且 App Ops 的权限操作不 **会影响到系统权限的开关** ，也就是说如果你在系统权限管理允许了权限而在 App Ops 禁止了权限，那么应用检测权限返回的结果是允许但实际上并不能获取到正确的数据。这就解决了那些「不给权限不给用」应用的使用难题。

App Ops 比系统管理方便的地方还在于它提供了根据应用名称和权限集中管理，支持按照应用名称，安装时间和更新时间排序。其他特点有：

- 支持通过自定义的模板自动对每一个新安装的应用设置权限；
- 支持通过模板批量设置应用权限；
- 支持备份和恢复权限管理文件；
- **无需 ROOT；**
- 可以通过应用行为推测出系统检测不到的相关权限。

### 💡 小技巧：不要让奇怪的支付宝「吱口令」污染了你的剪贴板

最近支付宝的「吱口令」被一些流氓开发者和网站主们发掘出了新用途，在不告知用户的情况下偷偷地把自己的吱口令放到了用户的剪贴板上，用户打开支付宝就会自动领取他们的吱口令红包。虽然没有造成用户的财产损失，但是这种「薅羊毛」的行为会让一些人反感（当然一些开发者告知用户后让用户手动复制吱口令的行为是十分推荐的，毕竟用户不用花钱就能给开发者捐赠）。

推荐大家通过 App Ops 把除了输入法以外的应用的修改剪贴板权限全部拒绝，除非你清楚地知道应用申请这个权限是用来干嘛的不然不要允许，这样子你的剪切板就不会再出现奇奇怪怪的吱口令了。

## 照片保险箱：你的秘密文件夹

每个人的手机上都会有一些文件（图片，视频）是出于各种原因不想除了自己以外的任何人看到的，这个时候就需要一款好用的文件保护 App 来帮忙了，照片保险箱就是由我挑选出来同类应用中能够比较好得保护文件的一款 App。

![](https://cdnfile.sspai.com/2018/01/28/bf4c1243984802dff954251c27a40ee4.png?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

既然要加密隐藏文件，那么用来解密和查看这些文件的 App 当然也得隐藏地足够深，不然别人一看到「 [照片保险箱](https://sspai.com/link?target=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.thinkyeah.galleryvault) 」这个名字就知道是干嘛的了（当然设置虚假密码之后你也可以故意让别人看到）。照片保险箱提供了两种隐藏自己的方式：

- 一种是把自己伪装成人畜无害又无聊的计算器，就算你打开它也是一个真正可以用的计算器，只有长按计算器界面左上角的图标（当然也是要密码的）者用计算器输入密码再双击「=」才能进入真正的保险箱。

![](https://cdnfile.sspai.com/2018/01/28/af29cdac099a9d5b9abe3ece19c2e7cd.png?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

- 第二种是让自己从启动器上「消失」，没有可以直接点击的入口，用电话拨打 ##你设置的密码 或者访问 [http://open.thinkyeah.com/gv](https://sspai.com/link?target=http%3A%2F%2Fopen.thinkyeah.com%2Fgv) 才能进入保险箱。

照片保险箱其他优点和好玩的地方：

- 不是简单地隐藏文件，是真正的本地加密文件（所以记得恢复出厂设置之前解密文件）。
- 符合 Material Design 设计标准，界面美观（支持切换主题），功能专一，后台纯净。
- 支持设置虚假密码，当你被迫输入密码的时候输入虚假密码可以展示你设置好的虚假文件（再也不怕被查手机啦）。
- 开启闯入警报后解锁失败时会自动通过前置摄像头拍摄照片，轻松知道谁动了你的手机。
- 支持直接拍摄加密照片和视频，解密时支持直接还原到原来的路径。
- 自带隐私浏览器，直接保存图片和视频到保险箱。

照片保险箱几乎拥有关于加密和隐藏文件的所有用到的功能，比起同类应用更加成熟和全面，这下子就更加放心把自己的小秘密放在手机里面啦。

![](https://cdnfile.sspai.com/application/4acfb11150cd02f9d8c0a94c14c2f86f.jpg?imageMogr2/auto-orient/thumbnail/!100x100r/gravity/center/crop/100x100/ignore-error/1)

Gallery Vault - Hide Pictures And Videos

[相关文章](https://sspai.com/app/Gallery%20Vault%20-%20Hide%20Pictures%20And%20Videos)[扫码 或 点击前往](https://sspai.com/d/zmyPyz)

## Avira AppLock+：给应用加道锁

说到身边的隐私烦恼，另一个难题就是如何防止别人打开手机上的某个应用（例如微信），隐藏应用是一个方法，不过当这个应用我们也想要频繁使用的时候这个方法就显得非常繁琐。另一个方法就是应用锁了，大部分系统现在都自带了这个功能，安全性还是可以的。

不过，当你的系统没有这项功能，又或者你只想要某些特定的时候才开启某个应用的应用锁怎么办呢？这里推荐一个由本职是制作杀毒引擎的小红伞推出的应用锁 —— [AppLock+](https://sspai.com/link?target=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.avira.android) 。

![](https://cdnfile.sspai.com/2018/01/31/25a1602158e1c55e1316e94ca4496c1c.png?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

它与市面上另外一堆同类不同的特色，除了界面好看意外还有它支持针对单个应用，根据特定位置和时间打开或者关闭应用锁，也支持简单的防卸载防护。

![](https://cdnfile.sspai.com/2018/01/31/46855834a0b97887d9616a2d02631f8a.png?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

不过，AppLock+ 与其他所有同类 App 都是 **只防君子不防小人** ，平时防止小朋友乱玩手机还是可以的，要是有人铁了心地想要解开你的应用锁方法有很多。无论是强行停止应用锁，清除应用锁数据还是直接禁止应用锁悬浮窗权限都可以干掉这层安全措施。给系统设置也加上应用锁和把应用锁本身隐藏起来可以一定程度上提高安全性。

![](https://cdnfile.sspai.com/application/7041a815b93274fb9707f0e4ef19cb1a.jpg?imageMogr2/auto-orient/thumbnail/!100x100r/gravity/center/crop/100x100/ignore-error/1)

Avira Antivirus Security 2018

[相关文章](https://sspai.com/app/Avira%20Antivirus%20Security%202018)[扫码 或 点击前往](https://sspai.com/d/KWeL1n)

## Haven：斯诺登想要保护你的私人空间安全

斯诺登的名字大家都应该听说过吧，自从揭露美国「棱镜计划」和监听门之后他的名字就经常与「网络隐私」同时出现。最近他的名字再次与一款名为 [Haven](https://sspai.com/link?target=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dorg.havenapp.main) 的 App 一起出现，这款斯诺登参与开发的 App 专注于一个很炫酷很像谍战片里面的功能 —— **入侵检测** 。

当你在 Play 上下载这款目前仍在测试中的 App 之后，除了一段乔治 - 梅瑞迪斯的经典名言，它还用一句简短的话语告诉你它唯一的用途：利用闲置手机作为运动，声音，振动和光线探测器，侦测家里，办公室或者酒店房间等私人空间是否在你离开时闯入不速之客。看来斯诺登关心的范围已经从网络隐私拓展到现实隐私了。

![](https://cdnfile.sspai.com/2018/01/26/034ecf10fe6f363ea1140d28ac56d7ca.png?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

你可以找一台旧 Android 手机，最好是扔掉都不心疼的那种，让 Haven 把它变成一个全方位的自动监控仪。第一次使用时需要校准各种传感器的基准，从前置/后置摄像头之间选择一个合适的，然后将手机静置（靠在桌子或者八爪鱼三脚架上），一边用手在画面内移动一边拨动下面的数字使其达到一种只要有移动物体画面黄色部分就会明显增多的状态。接下来的声音和运动传感器亦是同理（就是调整到有人的时候那条线会明显波动即可），也可以根据具体场景调整，这样子就可以开始使用了。

![](https://cdnfile.sspai.com/2018/01/26/4ac7e18aadf7fa4d9cf30438721cde3e.png?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

以后你只需要把手机藏好（静置），然后轻触现在开始，30 秒后就会进入工作模式了（屏幕上会显示「已激活」）。当 Haven 侦测到异常的时候会自动给你设定的号码（手机有 SIM 卡的话）发送警报短信，并且在本地保存包括 **摄像头画面和录音** 在内的相关日志，如果你有 Tor 的话还可以实时远程查看这些日志。有了 Haven，一台旧手机就能大大提高我们在现实中的隐私安全性，这也算是拿旧设备上的一堆传感器干了一回正事。

![](https://cdnfile.sspai.com/2018/01/26/cf37067f04f527da70f0ee2208a24f09.png?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

### 💡 小技巧：Haven 除了隐私之外的妙用

- 首先当然是利用它去抓拍宠物/野生动物啦，无论你想拍各种神出鬼没的野生动物，还是记录你家的哈士奇有没有进卧室用床脚磨牙，Haven 都可以胜任。
- 记录呼噜声/梦话，利用 Haven 的声音检测我们可以轻松地把自己或者别人睡觉发出的各种奇奇怪怪的声音准确录下来，第二天再查看说不定会发现惊喜哟。
- 出差的时候把手机放在床垫底下，振动阈值调整到比较高确保只有床垫剧烈震动的时候才会触发警报。如果不幸触发警报，远程听听 Haven 录下来的声音就有可能发现惊喜（出差时间较长记得加上移动电源）。

![](https://cdnfile.sspai.com/application/bcaa6813-38da-81a6-6851-1f01dd38fc3b.jpg?imageMogr2/auto-orient/thumbnail/!100x100r/gravity/center/crop/100x100/ignore-error/1)

Haven: Keep Watch

[相关文章](https://sspai.com/app/Haven%3A%20Keep%20Watch)[扫码 或 点击前往](https://sspai.com/d/ngejMK)## 应用变量：伪造 App 获取的隐私数据

最后再给大家推荐可以针对每个 App 伪造不同的隐私数据的 Xposed 模块 —— [应用变量](https://sspai.com/link?target=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.sollyu.xposed.hook.model%26hl%3Dzh_CN) 如果你还不知道什么是 Xposed 可以阅读我的文章「 [关于 Android 7.1 的 Xposed，你想知道的都在这](https://sspai.com/post/40121) 」）。

上至伪装 SIM 卡和手机号码，下至伪装手机型号和网络信息，加上伪装语言和 DPI，还能自动随机数据，应用变量的应用场景可谓十分宽广，至于除了保护隐私还能用它来干啥就靠大家的脑洞了（不能说不能说）。

![](https://cdnfile.sspai.com/2018/01/26/4af7e61de00f9942dfcf191c3d664ed9.png?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

![](https://cdnfile.sspai.com/application/5974311caddd1a606ca061c42f3b14af.jpg?imageMogr2/auto-orient/thumbnail/!100x100r/gravity/center/crop/100x100/ignore-error/1)

应用变量

[相关文章](https://sspai.com/app/%E5%BA%94%E7%94%A8%E5%8F%98%E9%87%8F)[扫码 或 点击前往](https://sspai.com/d/JQ35Wz)

## 结语

这就是本文的全部内容，我会不定期更新这个合集，如果你喜欢这个系列，可以持续关注少数派。

最后做个小广告：除了文中提到的隐私问题，其实我们平时最常遇到的下载操作，也跟隐私和安全有很大的关系。如果你想了解下载原理，搭建下载工具，提升下载速度和了解下载隐私监控方面信息，可以购买一份我在少数派的付费教程 [**《下载科普：隐私，稳定与速度》**](https://sspai.com/series/25) ，你想知道的都在里面，不在里面还可以评论私信直接问我，不要错过噢。

122

23

目录 6

- App Ops：自动化你的应用权限
- 照片保险箱：你的秘密文件夹
- Avira AppLock+：给应用加道锁
- Haven：斯诺登想要保护你的私人空间安全
- 应用变量：伪造 App 获取的隐私数据
- 结语

© 本文著作权归作者所有，并授权少数派独家使用，未经少数派许可，不得转载使用。

[Parallell](https://sspai.com/u/5vsqw63w/updates) 、 [yule](https://sspai.com/u/vyaz4i3a/updates) 、 [Daeniel](https://sspai.com/u/ioj2ew0x/updates) 等 122 人为本文章充电
