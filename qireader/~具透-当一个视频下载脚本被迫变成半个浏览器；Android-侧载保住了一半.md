---
comments: true
created: '2025-11-24T16:48:36'
draft: true
modified: '2025-11-24T16:48:36'
source: https://sspai.com/prime/story/inside-release-notes-251119
title: 具透 | 当一个视频下载脚本被迫变成半个浏览器；Android 侧载保住了一半
type: archive-web
---

yt-dlp开始依赖外部JavaScript运行时@PlatyHsu：yt-dlp是开源社区非常有名的视频下载工具，也是youtube-
dl停止更新之后，少数保持活跃和可用的选项。除了在终端直接使用外 ...

## **yt-dlp 开始依赖外部 JavaScript 运行时**

[@PlatyHsu](https://sspai.com/u/platyhsu)：yt-dlp 是开源社区非常有名的视频下载工具，也是 youtube-
dl 停止更新之后，少数保持活跃和可用的选项。除了在终端直接使用外，不少图形界面软件也会嵌入 yt-
dlp，实现从播放地址获取视频的功能。（是的，包括那些你可能被忽悠用重金买下的付费野鸡软件。）

一周之前的 11 月 12 日，yt-dlp [宣布](https://github.com/yt-dlp/yt-
dlp/issues/15012)，从当天发布的 2025.11.12 版本起，必须要额外安装外部的 JavaScript
运行时（runtime）才能正常下载 YouTube 视频。此前，维护者已经在 9 月[预告](https://github.com/yt-dlp/yt-
dlp/issues/14404)了这次变更。

所谓 JS 运行时，通俗地说，就是一套让 JS 代码能「动起来」的环境。运行时负责读取、理解和执行
JS，实现网络请求、读写文件、事件循环等能力。在任何现代浏览器中，JS 运行时都是决定了浏览性能和体验的重要组件。因此，yt-dlp
的这次变更，某种程度上就像是要求同时安装一个精简版的浏览器一样。

为什么需要这么重的额外组件呢？这还要从下载器和 YouTube 的「猫鼠游戏」说起。出于显而易见的原因，YouTube
并不希望用户用官方客户端之外的工具下载视频。近年来，它限制第三方工具的一个主要机制，就是视频流 URL 请求中的一个特殊参数 `n`。

[社区研究](https://blog.0x7d0.dev/history/how-they-bypass-youtube-video-download-
throttling/)表明，当合法的客户端请求视频播放时，YouTube 的播放器脚本（base.js 或类似文件）会执行一段复杂的 JS 函数对 `n`
的值做变换计算，视频服务器进而会校验 `n` 的正确性。如果请求中缺少该参数，或者计算结果错误，服务器就会静默地将下载速度限制在 50KB/s 至
70KB/s。这意味着几分钟长度的高清视频也要数小时才能下载完，事实上让第三方工具不可用。

yt-dlp 不是浏览器，自然没有运行这段解密代码的能力。过去，它找到的变通方法是用 Python 写一个精简的「JS 解释器」模块
`jsinterp`。之所以「解释器」要打引号，是因为 yt-dlp 并不能真正理解 JS，而只是用正则表达式提取负责 n 参数变换的目标函数，然后在
Python 环境中模拟执行 JS 运算，得出最终的签名。

但好事不长，在 2024 年至 2025 年间，YouTube 开始部署更为激进的混淆技术。负责 n
参数变换的代码不再是简单的函数调用，而是被打散、随机化和混淆，使得基于文本匹配的正则表达式完全失效。不仅如此，YouTube 还越发频繁地更新加密代码。据
yt-dlp 的维护者说法，每次 YouTube
更新代码，就要花费数天时间，人工逆向新的混淆模式，然后修补正则表达式。这种打地鼠式的更新，显然对于维护者和用户都是不可持续的。

因此最终，维护团队得出了结论：继续维护基于正则表达式的方案已不再可行，yt-dlp 必须具备执行真实 JS 代码的能力。这就是 2025.11.12
版本的主要变更。从这个版本起，yt-dlp 引入了一个「[外部 JS 系统](https://github.com/yt-dlp/yt-
dlp/wiki/EJS)」（External JS System, EJS），将复杂的解密逻辑从 Python 代码中剥离到独立的 JS
脚本中，并且转交给一个真正的 JS 引擎去执行。

决定了新的架构，剩下的问题就是选择什么 JS 运行时。这方面，yt-dlp 可以兼容 Node、Deno、Bun 等几种主流选择，但官方推荐使用
Deno，主要是出于安全性的考虑。维护者认为，YouTube 的解密代码本质上是来自 Google 的不可信代码，如果使用
Node，这段代码在理论上可以任意访问用户的文件系统、发起任意网络请求。相比之下，Deno 采用默认拒绝的安全策略，除非明确授权，否则 Deno
进程无法访问磁盘或网络，而 yt-dlp 的应用场景本来也就不需要这些权限。

（另一种讨论过的方案是直接用 Selenium 或 Puppeteer 调用无头浏览器，但维护者明确拒绝了这一路线，认为采用无头浏览器方案，就等于将 yt-
dlp 降格为浏览器的包装，相当于对 YouTube 拱手投降，违背了项目的精神。因此，除了作为最后的手段，维护者对这种做法没有任何兴趣。）

从网上各处评论看，社区目前对 yt-dlp 的这次变化情绪比较复杂。诚然，能继续稳定下载是利好，而且 Deno 几十 MB
的体积放在今天也不算太「重」（何况会用 yt-dlp 的群体里很多人本来就要安装 JS 运行时）。目前，官方渠道下载的版本已经将 Python
解释器、必要的库、Deno 可执行文件，以及用于解密的 EJS 脚本打包在一个二进制文件中，可以「开箱即用」。

问题在于，yt-dlp 的很多用户并不是从 GitHub 发布页下载的，而是使用 `pip`、`brew`、`apt`
等包管理工具安装。这些包管理器及其仓库有的根本不支持其他语言的依赖项（如 `pip`），有的要求将外部脚本另行打包（如
Gentoo），还有的更新周期太慢，跟不上新机制的频繁更新（如 Debian）。虽然官方提供了适用于各种环境的安装指南，但现实情况就是以后安装 yt-
dlp，再不可能再是一行命令一劳永逸的事情了。

最后一个坏消息：尽管引入外部 JS 运行时和 EJS 脚本解决了暂时的问题，更大的挑战还在后面。在加密参数之上，YouTube
已经逐渐开始推广一种更严格的防下载措施——PO Token（Proof of Origin Token，来源证明令牌）。PO Token 是 Google
的反爬系统 BotGuard 生成的加密凭证，而 BotGuard 本质上是一个在浏览器 JS
环境中运行的虚拟机。它会收集浏览器的各种指纹信息，并结合当前的请求环境，生成一个加密 token。如果请求没有携带有效的 token，或者 token
表明客户端环境异常，YouTube 将拒绝服务或限制访问。

因此，如果 PO Token 被全面推行，yt-dlp 仅仅支持 JS 执行环境也是不够的，还要能模拟浏览器环境。可是，Deno
本质上是一个服务端运行时，它并不具备 `window`、`document` 或 `canvas` 等浏览器特有的对象，也就不足以应对 PO Token
的严苛要求。

目前，yt-dlp 社区开发了一个插件 [`yt-dlp-get-pot`](https://pypi.org/project/yt-dlp-get-
pot/)，试图通过在 Deno 中兼容（polyfill）这些浏览器 API，欺骗 BotGuard 虚拟机。问题在于，Google 可以随时更新
BotGuard 的逻辑，检查更多细微的浏览器特征。即使 yt-dlp 能不断更新兼容，者也意味着它会越来越像一个针对 YouTube
定制的无头浏览器——它自己最讨厌的样子。

## Android：侧载不会消失，但万物基于 MIUI

[@克莱德](https://sspai.com/u/clyde)：有过从 Android 到 iOS 阵营转换经历的人，应该都会怀念那种
GitHub、F-droid 开源应用随心装的自由——这可能是应用质量整体不如 Apple 生态的大前提下，Android 平台相比 iOS
少有的优势之一。可惜 Google 又打起了歪主意。

今年 8 月，Google 公布了一项名为开发者认证的新计划。该计划要求所有在 Play
商店之外分发应用的开发者，创建开发者控制台账号并完成身份验证，Google
表示这个计划就像「机场安检但没有开箱检查」，主要用于检验开发者身份，并不审查具体的应用内容和来源。验证流程方面，个人和组织开发者需要提交的身份验证资料略有差别，包括但不限于驾照或护照等政府颁发的身份证明文件、公司注册证书等。

**这个流程还要求开发者缴纳至少 25 美元的账号创建费用** 。

Google 给出的理由无非是防诈，尤其是巴西、印度尼西亚、新加坡和泰国这几个地区的恶意应用和金融诈骗问题。所以上述尽管 Google
援引了不少当地官方组织的肯定和赞许，但这项计划在开发者和用户群体中难免引发了不小的争议——所以随后 Google
又补充了针对学生、爱好者不收取账号创建费用和仍然允许连接电脑后通过 ADB 侧载应用等信息。

考虑到 Google 近年在 Play Integrity API（注：一种由 Google Play 为载体，验证设备是否解锁、root
的设备环境检测机制，参见[Android 玩机社区正在走向消亡 ｜ 少数派会员
π+Prime](https://sspai.com/prime/story/play-integrity-and-the-demise-of-the-
android-mod-community)）、AOSP 开源计划等问题上的做法和态度，人们对「侧载不会就此消亡」这种说法当然不会买账。知名开源
Android 应用分发平台 F-Droid 就在 9 月、10 月先后通过两篇博文狠狠抨击了 Google 的相关说法。

F-Droid 的确提到了几个值得一般用户注意的细节，其中最为核心的部分在于，Google
的开发者身份验证流程中包含了「将应用标识符与应用签名提交至开发者控制台」的[流程](https://developer.android.com/developer-
verification#register-your-apps)，在这个过程中，开发者也需要将应用标识符对应的签名一并上传提交——这与 F-Droid
的核心分发机制相悖。在 F-Droid，所有应用都会直接从应用对应的开源仓库拉取源码、由 F-Droid 的服务器完成编译、并最终由 F-Droid
的私钥完成签名分发。开发者在 Google 上传提交的私钥签名和 F-Droid 的私钥签名不一致，必然会导致从 F-Droid
下载的安装包无法正常安装或更新。

![](https://cdnfile.sspai.com/2025/11/19/article/7b481720bcf8edee2d69511c01edc938.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

签名不对，Android 应用安装过程中最常见的失败原因

**F-Droid 对这个政策的批评可谓辛辣** 。

一方面，F-Droid 质疑 Google Play 商店近年本就是恶意应用托管的「温床」，事实也的确如此，比如在 2024 年 5 月，定期监控
Google Play 商店恶意程序的安全企业 Zscaler
就[披露](https://www.kchuhai.com/report/view-62605.html)过 Google Play 商店中超过 90
款恶意程序，总计安装数量超过 500 万次，其中有两款夹杂金融木马程序 Anatsa，该机构 2024
年发布的[报告](https://www.techrepublic.com/article/zscaler-2024-mobile-iot-ot-
cyber-threat-report/)也指出，Vultur、Hydra 等恶意软件家族的主要分发渠道正是 Google Play 商店。

另一方面，Google Play 商店除了在玩机社区恶名昭著的 Play Integrity API 检测机制，也有用于扫描 Android
设备已安装应用的「Play
保护机制」服务，该服务会定期扫描设备上所有安装来源的应用，抛开隐私问题不谈，也已经足以应对恶意应用问题（作为中国大陆地区用户编者这里也要额外补充一句：这个保护机制确实是有用的——国产应用经常被标识为有害应用）。