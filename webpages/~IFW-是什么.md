---
draft: true
aliases:
  - IFW 是什么？
created: 2025-07-19T12:35:39
description: "专注于发现和分享安卓周边的协作小众网站。"
modified: 2025-07-19T12:35:49
source: "https://cn.apkjam.com/blog/ifw.html"
tags: []
title: IFW 是什么？
type: "archive-web"
---
# IFW 是什么？

> 本文最近更新于 2019 年 7 月 9 日「 星期二 」

---

IFW 全称为 Intent Firewall，简单来说就是安卓自带的系统防火墙。

## 基础知识

安卓系统的 Activity、服务和广播接收器，是通过名为 Intent 的消息进行启动的，可以将 Intent 视为从其他组件请求操作的信使，无论组件属于这个应用还是其他应用。

- 对于 Activity 和服务，Intent 传达要执行的操作。例如，Intent 传达的请求可以是打开应用设置界面的 Activity，或是启动下载某文件的服务。
- 对于广播接收器，Intent 只会定义要广播的通知，可以响应这个广播的接收器会被启动以执行下一步操作。

Intent 防火墙不是 Android 框架官方支持的功能，没有官方文档，只能通过阅读源代码了解。

每一个在 Android 框架中启动的 Intent，包括由操作系统创建的 Intent，都会通过 Intent 防火墙。这意味着 Intent 防火墙有权允许或拒绝任何 Intent。Intent 防火墙在决定如何处理传入 Intent 时不考虑发送方，只考虑 Intent 的细节和其预期的接收者。

IFW 配置文件存储于 `/data/system/ifw/*.xml` ，记录着什么样的 Intent 会被终止传递。XML 文件被写入到 `/data/system/ifw/` 目录且可以被更新和删除，这使得 Intent 防火墙可以动态更新其规则集。

在系统匹配到存在于规则内的 Intent 时就会丢弃这个 Intent 使之失效，即利用系统防火墙来进行限制，达到阻止唤醒的目的。

## 「IFW」，「写轮眼」和「绿色守护」

「 [写轮眼](https://cn.apkjam.com/mat.html) 」是通过关闭组件来达到效果，而 IFW 配置文件则是拦截了启动组件。

> 「写轮眼」（My Android Tools）使用的是非单纯的杀后台抑制唤醒的方法，深受 Android 折腾党的喜爱。但任何 App 都可以使用公开的接口 [Android Developer](https://developer.android.com/reference/android/content/pm/PackageManager.html?hl=zh-cn#setComponentEnabledSetting) 来重新激活自己的组件。「写轮眼」作者也考虑到了这个问题，同时也推出了一个 [Xposed](https://cn.apkjam.com/xposed.html) 模块阻止这个 API 的调用。

「 [绿色守护](https://cn.apkjam.com/system/2014/04/23/greenify/) 」在 V3.0 时新推出的 “处方” 功能，使用了 IFW 特性。

## Intent Firewall 的编写规则？

下面是一个实例，broadcast 为广播，service 为服务，activity 为活动，我们应该很容易理解其书写规则。

注意：使用 IFW 规则时，组件会被始终拦截。所以需要结合自身实际使用情况进行 IFW 编写。例如拦截了 location 相关的某个组件试图达到省电目的，但是该应用的「定位」功能就会无法使用，这和手机是否开启 GPS 定位无关。

```xml
1 
<rules>
 2 
<broadcast block="true" log="false">
 3 
<component-filter name="com.tencent.mobileqq/cooperation.dingdong.DingdongPluginProxyBroadcastReceiver" />
 4 
<component-filter name="com.tencent.mobileqq/cooperation.qzone.QzoneProxyReceiver" />
 5 
<component-filter name="com.tencent.mobileqq/com.tencent.open.downloadnew.common.DownloadReceiver" />
 6 
<component-filter name="com.tencent.mobileqq/com.tencent.open.downloadnew.common.DownloadReceiverWebProcess" />
 7 
<component-filter name="com.tencent.mobileqq/com.tencent.open.business.base.appreport.AppReportReceiver" />
 8 
<component-filter name="com.tencent.mobileqq/cooperation.weiyun.WeiyunProxyBroadcastReceiver" />
 9 
<component-filter name="com.tencent.mobileqq/cooperation.weiyun.WeiyunBroadcastReceiver" />
10 
<component-filter name="com.tencent.mobileqq/com.tencent.mobileqq.msf.core.NetConnInfoCenter" />
11 
</broadcast>
12 
<service block="true" log="false">
13 
<component-filter name="com.tencent.mobileqq/com.tencent.mobileqq.app.CoreService" />
14 
<component-filter name="com.tencent.mobileqq/com.tencent.mobileqq.app.CoreService$KernelService" />
15 
<component-filter name="com.tencent.mobileqq/cooperation.qzone.remote.logic.QzoneWebPluginProxyService" />
16 
<component-filter name="com.tencent.mobileqq/com.tencent.tmdownloader.TMAssistantDownloadService" />
17 
</service>
18 
<activity block="true" log="false">
19 
<component-filter name="com.tencent.mobileqq/com.tencent.mobileqq.activity.UpgradeActivity" />
20 
<component-filter name="com.tencent.mobileqq/com.tencent.mobileqq.activity.UpgradeDetailActivity" />
21 
</activity>
22 
</rules>
```

要进一步了解 IFW 可以访问： [http://www.cis.syr.edu/~wedu/android/IntentFirewall/](http://www.cis.syr.edu/~wedu/android/IntentFirewall/)

> 附： [安卓果酱的 IFW 规则](https://github.com/apkjam/IFW)

扩展阅读：

- [从「写轮眼」到 IFW](https://cn.apkjam.com/blog/mat-ifw.html)

[加入「知识星球」并打赏](https://wx.zsxq.com/mweb/views/topicdetail/topicdetail.html?topic_id=15455241528852&user_id=281881852481)

**关于作者**

果酱，资深安卓玩家，「安卓果酱」创建者。

长居深圳，活跃于港澳粤一带。

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

[0](https://github.com/apkjam/apkjamComments/issues/1974) 条评论

未登录用户
