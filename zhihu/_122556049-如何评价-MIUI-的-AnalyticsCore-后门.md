---
comments: true
created: '2016-09-18T19:11:53'
draft: true
modified: '2016-09-18T23:28:30'
source: https://www.zhihu.com/question/50722052/answer/122556049
title: 如何评价 MIUI 的 AnalyticsCore 后门？
type: archive-web
---

看到

[@vczh](https://www.zhihu.com/people/0970f947b898ecc0ec035f9126dd4e08)

轮子哥关注了这个问题，正好有相关背景，回答一记。

利益相关： 米黑(小米1,小米4用户)。

先说结论：这个锅不能让小米背。

很多 Android 用户很诟病的一点是国内 Android 手机都没有 GMS 服务，并且称其为“安卓”或者说是阉割版的 Android。

>
> 有人说谷歌移动服务(简称GMS，包括gtalk，gmail等)是Android的精髓，没有GMS就不算真正的Android，这个说法不太对，连谷歌自己都不是这么认为的。谷歌开源的Android代码不包含任何GMS应用；在谷歌内部，Android和GMS是两个独立的团队，GMS经常先推出iPhone版然后才发布Android版的。  
>

现在 Google 已经越来越收紧对 Android 的控制权限，AOSP 中 CPS(联系人，电话，短信)应用已经万年不更新，倒是这些模块的 GMS
版本都更新的很勤快，这不，最近连骚扰拦截这种 MIUI 几乎从最初版本就有的“高大上”的功能也上线了。打个岔，听说最近的 iOS 10 也有这个功能了。

[http://www.androidpolice.com/2016/07/25/googles-phone-app-now-shows-a-
warning-about-spam-callers-and-makes-it-easy-to-block-and-report-them-apk-
download/](https://link.zhihu.com/?target=http%3A//www.androidpolice.com/2016/07/25/googles-
phone-app-now-shows-a-warning-about-spam-callers-and-makes-it-easy-to-block-
and-report-them-apk-download/)

。

但是，有点实力的 OEM 其实都不太关心这个了，因为大家要做差异化，要做用户体验，这些模块当然自己开发了。比如 CPS 好像是 MIUI
的重点，大家可以自行搜索 11 年的旧闻 “雷军揭秘小米:用CPS重新发明手机”。

回到正题，

请问非小米的 Android 用户，你们的手机中在 /system/app 中有没有一个 PlayAutoInstallConfig.apk
的应用呢。（各位国产机和国行用户就别找了，你们是肯定不会有的。因为，你们连 Google 服务都没有啊！）

    
    
    Nexus 用户：
    android.autoinstalls.config.google.nexus
    android.autoinstalls.config.google.fugu
    ASUS 用户：
    android.autoinstalls.config.asus.pai
    HTC 用户：
    android.autoinstalls.config.htc.htc_pmeuhl-1
    其他厂商的就不一一找出来列举了。
    

AOSP中包管理的程序是：

    
    
    PackageInstaller.apk pkgName=com.android.packageinstaller
    

而带有 GMS 包中有 Google 的一堆应用，其中包含：

    
    
    GooglePackageInstaller.apk pkgName=com.google.android.packageinstaller
    

注意到了没有？这两个用于管理（安装，卸载等）程序的程序是 不一样 的！

Google Play 静默安装

![](https://pic1.zhimg.com/50/41e246b4bfe808dc004e16d2f3999849_720w.jpg?source=2c26e567)  

Google 在 Android L 之后引入了一个新的功能"PlayAutoInstalls"，简称 PAI。

相关功能介绍：

[Android 5.0 Lollipop feature: Play Auto Installs bloatware
removal](https://link.zhihu.com/?target=http%3A//bgr.com/2014/10/29/android-5-0-lollipop-
feature/)[http://www.androidpolice.com/2014/10/28/android-5-0-lollipop-
feature-spotlight-carriers-can-now-have-google-play-install-their-crapware-
automatically-which-is-good-
maybe/](https://link.zhihu.com/?target=http%3A//www.androidpolice.com/2014/10/28/android-5-0-lollipop-
feature-spotlight-carriers-can-now-have-google-play-install-their-crapware-
automatically-which-is-good-maybe/)  
  

官方开发者页面戳这：

[https://developers.google.com/android-
partner/reference/rest/v1/playAutoInstalls](https://link.zhihu.com/?target=https%3A//developers.google.com/android-
partner/reference/rest/v1/playAutoInstalls)

简单来说，就家伙是在用户第一次开机的时候，走开机引导流程，登录 google
账户的过程中，在后台默默的给你装一些应用，一般来说会是运营商全家桶。本来嘛，这个功能就是为了 OEM 适应不同的地区，不同的运营商做的。

当然， Google 得知道你的一些信息才能给你装上**对应** 的全家桶，

不然难道给一个联通的用户装一堆移动或者电信的全家桶？

既然它可以在第一次开机的过程中做这些事情，那你们猜猜，不是第一次开机的时候它能不能做这些呢？给你们一次机会，我相信你们是不会猜错的。

它不止可以在后台安装程序哦，还可以修改你的桌面布局

[https://android.googlesource.com/platform/packages/apps/Launcher3/+/android-5.0.2_r1/src/com/android/launcher3/AutoInstallsLayout.java](https://link.zhihu.com/?target=https%3A//android.googlesource.com/platform/packages/apps/Launcher3/%2B/android-5.0.2_r1/src/com/android/launcher3/AutoInstallsLayout.java)

    
    
        static final String ACTION_LAUNCHER_CUSTOMIZATION =
                "android.autoinstalls.config.action.PLAY_AUTO_INSTALL";
    

  
  

如果非要说小米收集你的信息了，那请仔细阅读一下小米手机的《用户协议》。

综上，

所谓的漏洞，其实是小米开发的一个功能，会有签名检查一类的机制来尽量保障大家的设备不被利用；所谓的信息收集，我觉得其实是对小米的不信任，同样的事情
Google 在做，Apple 也在做。

不过话说回来，小米使用HTTP进行连接，有点说不过去。