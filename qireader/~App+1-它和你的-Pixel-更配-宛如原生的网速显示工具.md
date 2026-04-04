---
created: '2026-01-30T10:33:45'
modified: '2026-01-30T10:33:45'
source: https://sspai.com/post/104972
title: App+1｜它和你的 Pixel 更配，宛如原生的网速显示工具
type: archive-web
---

**Matrix 首页推荐**  

[Matrix](https://sspai.com/matrix)
是少数派的写作社区，我们主张分享真实的产品体验，有实用价值的经验与思考。我们会不定期挑选 Matrix 最优质的文章，展示来自用户的最真实的体验和观点。

文章代表作者个人观点，少数派仅对标题和排版略作修改。

* * *

**AI 辅助创作声明：**

本文由 Gemini 生成题纲，我完成内容创作，文章由 Gemini 后期润色。个人文笔不好，如对 AI 生成内容敏感还请见谅！

* * *

## 引言：原生党的「网速焦虑」与「毛坯房」

正在使用 Pixel 或类原生系统的朋友，对「毛坯房」这个调侃应该也并不陌生。虽然我们享受着最纯粹的 Android
体验，但总有一些本地化功能的缺失让人抓狂，「实时网速显示」就是其中之一。

在国内复杂的网络环境下，网速显示对我而言几乎是刚需。但尴尬的是 Google 似乎从未打算在系统层面支持这一功能。于是我们不得不转向 Google Play
商店寻找第三方解决方案。然而当我翻遍了市场上的同类应用，如 NetSpeed Indicator、Internet Speed Meter
等，却发现这些「老牌应用」在 2026 年的今天体验依然难以令人满意：它们大多有着过时的 UI 设计，许多 App 的界面还停留在 Android 4.4
或初代 Material Design 时期，放在当下的 Android
系统中总会显得格格不入；实际网速显示效果也一般，要么是状态栏上那个看不清数字和单位的小图标，要么是拖着「正在其他应用上层显示」膏药的悬浮窗；另外功能臃肿也是个问题，我只想要一个网速显示，它们却往往附赠了流量统计、详单分析等一堆我不需要的功能。

更致命的是，它们都有一个共同的痛点：开启代理工具时网速统计严重虚高。Pixel 用户应该遇到过这种情况，明明下载速度只有 5MB/s，网速悬浮窗却显示
10MB/s。

**为什么这些工具的网速总是不准？**

简单来说，这是 Android 旧版统计机制的「锅」。 传统的网速 App 通常直接读取系统的总流量接口，开启代理工具后，数据包首先通过物理网卡（如
wlan0）进入被统计一次，随后数据被解包并转发到代理工具的虚拟接口（如 tun0），这里又会被统计一次。

大多数老牌 App 只是简单地将所有接口流量相加，导致显示速度往往是实际速度的 2 倍。

好在最近 AI 编程确实火热，既然找不到完美的替代品，我萌生了一个想法：**为什么不让 AI 帮我写一个专门适配 Pixel 的网速 App 呢？**

于是 Pixel Meter 诞生了。

## Pixel Meter 到底好在哪？

作为一款以解决个人需求为出发点的 App，Pixel Meter 主要解决了两个核心问题。

### 精准的流量统计（告别虚高）

Pixel Meter 摒弃了过时的全局统计方案，转而利用 Android S (API 31) 引入的新 API
`TrafficStats.getRxBytes(ifaceName)`。

这个 API 允许 App 精确获取指定网络接口的流量数据，通过内置的网卡白名单与黑名单机制，Pixel Meter
能智能过滤掉代理工具虚拟接口的重复数据。最重要的是，实现这一功能不需要 Root 也不需要 Shizuku 权限，做到了既高效又精准。

### 可能是目前最优雅的展示方式

实时活动通知（Live Update Notification）是我认为 Pixel Meter 最大的撒手锏，在 Android 16
及部分支持该特性的高版本系统中，实时活动通知相比于传统状态栏图标，不会有显示空间受限、可读性差等问题，允许我们灵活展示更丰富的内容。

不妨看个对比：

![](https://cdnfile.sspai.com/2025/12/29/3e1d76015d9c3bf6d25923418b6e3ffc.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)传统方案：拥挤的状态栏，数字和单位难以看清

Pixel Meter 则利用通知区域的实时更新特性，虽然有字符限制（ 7 个字符），但足以清晰地展示「数字+单位」：

![](https://cdnfile.sspai.com/2025/12/29/45fa3c39341f476ca04db997aa0477f3.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)实时活动方案以及悬浮窗

更重要的事，它看起来不像是第三方的补丁，而更像是系统自带的原生功能——做到了干净、自然、无缝融合。

## 幕后故事：我负责提想法，AI 负责写代码

AI 时代的到来彻底改变了个人开发的门槛。

以前我也曾尝试开发过一些小工具（比如自动跳过广告的
App），但往往因为初期繁琐的代码构建和漫长的正反馈周期而「弃坑」。投入精力太大、产出太慢，热情很容易被耗尽。

![](https://cdnfile.sspai.com/2025/12/29/86261f68136113ae3ff8fc1cba97adff.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)另一个从兴趣满满到再也不想打开的孵化项目

但这一次完全不同。在 Pixel Meter 的开发过程中，我采用了一种新的「人机协作」模式：

  * **我负责** ：架构设计、需求分析、以及在 AI 犯错时进行「代码审查」和方向纠正。
  * **Gemini 负责** ：编写具体实现代码、生成文档、甚至处理上架素材。

我使用了 [AntiGravity](https://sspai.com/post/104769)，配合自定义的 `GEMINI.md`
规则文件。这就像是给了 AI 一份「长期记忆」，让它能记住我们之前的架构讨论和代码规范；即使是新建会话，它也能读取这些「记忆文件」，快速进入开发状态。

![AI4](https://cdnfile.sspai.com/2025/12/29/article/98f227911308d7cd5e967244bd687445.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)让AI进行技术栈推荐与决策![AI5](https://cdnfile.sspai.com/2025/12/29/article/67e3aa2c86dc9ac841841659aacbed6f.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)架构设计讨论![](https://cdnfile.sspai.com/2025/12/29/de5d4b60f842fa49f36a70e61fe04e04.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)新建会话时读取「记忆」文件让Gemini快速「回想」起项目的需求

最终的数据令人惊讶：Pixel Meter 目前已发布了 3 个版本，其中**90% 的代码** 是由 Gemini 生成的。甚至连 GitHub 仓库的
README 文档、隐私政策，以及 Google Play 上的宣传文案和置顶图，都是由它操刀完成的。

## **邀请你来体验**

目前，Pixel Meter 已经在 [GitHub](https://github.com/Mystery00/PixelMeter?utm=sspai)
开源，你也可以直接前往 Google Play 商店搜索「[Pixel
Meter](https://play.google.com/store/apps/details?id=vip.mystery0.pixel.meter?utm=sspai)」即可下载安装使用。

无论你是想体验一个纯净的网速显示工具，还是对 AI 辅助开发的代码质量感兴趣，都欢迎来试一试 Pixel Meter。

> 关注 [少数派公众号](https://sspai.com/s/J71e)，让你的 Google Pixel 更好用 📱

> 实用、好用的 [正版软件](https://sspai.com/mall)，少数派为你呈现 🚀
