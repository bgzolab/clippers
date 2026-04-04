---
aliases:
  - .nomedia 文件的作用
created: 2025-07-19T12:36:50
description: "专注于发现和分享安卓周边的协作小众网站。"
modified: 2025-07-19T12:37:38
source: "https://cn.apkjam.com/tricks/nomedia.html"
tags: []
title: .nomedia 文件的作用
type: "archive-web"
---
# .nomedia 文件的作用

> 本文最近更新于 2018 年 5 月 25 日「 星期五 」

---

如何禁止多媒体库扫描指定文件夹下的多媒体文件？

---

Android 默认情况下会将每个多媒体文件的信息保存在一个数据库中（在系统收到某些消息，比如开机、插拔 SD 卡、设备连接上电脑等这种涉及到可能更改文件系统内容的情况下，会触发系统扫描文件系统中的多媒体文件变化情况，并同步到媒体数据库中；或者应用发送更新多媒体库广播时，也会触发多媒体数据库的更新），应用在需要读取设备内指定格式的多媒体文件信息时，可以直接读取这个数据库，相比于文件全盘检索效率会高很多。

但是，有时候我们并不希望某些多媒体文件被媒体库扫描到，也就是说，我们不希望在相册和音乐的媒体应用中看到类似这些内容：

- 一些应用的音效
- 一些应用的介绍视频或者图片
- 一些应用的缓存图片

以上这些情况，可以在不希望被保存到多媒体数据库中的文件夹下新建一个文件，并将其命名为 `.nomedia` 即可。

Android 官网并没有明确介绍 `.nomedia` 文件的使用，但搜索下 Android 的 frameworks 源码，会发现文件 `frameworks/base/media/java/android/media/MediaScanner.java` 里有 `isNoMediaPath` 函数，再查看调用该函数的位置的处理代码，就一目了然了。

其中 `isNoMediaPath` 发现当前目录下有 `.nomedia` 文件，就返回 true，即该目录下不存在可用的媒体文件，MediaScanner 也就不会搜索该目录下的文件了。所以 `.nomedia` 文件主要是屏蔽目录下的媒体文件，不让不想显示的文件显示在相册和音乐的媒体应用里。

这样就做到了屏蔽媒体应用扫描，尤其是扫描时创建的缩略图目录（thumbnails 目录），而我们通常并不需要显示该目录下的文件。

**说明：**

如果文件夹中放入 `.nomedia` 一段时间后依然没有显示出屏蔽效果，或者删除该特殊文件后，媒体文件没有正常显示出来，可以尝试如下的操作：

`设置` — `应用程序` — 找到 `媒体存储` — `清除数据` — 重启手机

重启后稍等几分钟应该就可以看到相册更新后的效果了。

**应用：**

除了手动添加 `.nomedia` 的方法，我们也可以通过 [Nomedia](https://play.google.com/store/apps/details?id=com.mrck.nomedia&hl=en_US) 应用进行修改。

![](https://cn.apkjam.com/images/2018/05/Screenshot_2018-05-25-20-36-07-935_com.mrck.nomedia.png)

![](https://cn.apkjam.com/images/2018/05/Screenshot_2018-05-25-20-35-46-665_com.mrck.nomedia.png)

关于使用方法和问题，请参考上图。

下载地址： [Google Play](https://play.google.com/store/apps/details?id=com.mrck.nomedia&hl=en_US)

[加入「知识星球」并打赏](https://wx.zsxq.com/mweb/views/topicdetail/topicdetail.html?topic_id=15455241528852&user_id=281881852481)

**相关文章**

- [除了 Google Play 还可以从这里下载 App](https://cn.apkjam.com/tricks/download-app.html)
- [怎样彻底关闭拍照和录像声音？](https://cn.apkjam.com/tricks/mute-camera-video.html)
- [如何解决 MIUI 的 wlan\_logs 不断写入调试信息的问题？](https://cn.apkjam.com/tricks/miui-wlan-logs.html)
- [国产 ROM 出国以后如何优化 GPS？](https://cn.apkjam.com/tricks/gps-optimization.html)
- [安卓推送的那些事儿](https://cn.apkjam.com/fcm.html)
- [怎么在 MIUI 中启用 Home 键激活绿色守护？](https://cn.apkjam.com/tricks/mhg.html)
- [如何找到隐藏的“电池优化”入口？](https://cn.apkjam.com/tricks/find-battery-optimization.html)
- [如何在 Telegram 里截图？](https://cn.apkjam.com/flag-secure.html)
- [在电脑上一键抓取 Android 运行 log](https://cn.apkjam.com/tricks/logcat.html)
- [怎么查看曾连接过的 wifi 的密码？](https://cn.apkjam.com/tricks/wp.html)

**最近更新**

- [为音频制作可视化声谱 - 视频生成工具](https://cn.apkjam.com/60s/vvm.html)
- [语言学习者的音频播放利器](https://cn.apkjam.com/60s/workaudiobook.html)
- [「安卓果酱」的写作规范](https://cn.apkjam.com/blog/wsg.html)
- [更优雅地修改 MIUI 布局](https://cn.apkjam.com/bmgs.html)
- [仅 205KB 的 Linux 模拟神器——Termux](https://cn.apkjam.com/termux.html)
- [「安卓果酱」会员计划](https://cn.apkjam.com/blog/member.html)
- [MI 5s 和 MIUI 11](https://cn.apkjam.com/60s/mi5s-miui11.html)
- [修改 MIUI「快捷开关」布局](https://cn.apkjam.com/quick-settings-grid.html)
- [关于「安卓果酱」的一些 Q&A](https://cn.apkjam.com/blog/faq.html)
- [关于「开放写作计划」](https://cn.apkjam.com/blog/awp.html)

**留言互动**

[0](https://github.com/apkjam/apkjamComments/issues/2013) 条评论

未登录用户

来做第一个留言的人吧！
