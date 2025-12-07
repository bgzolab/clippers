---
comments: true
created: '2025-11-24T16:45:52'
draft: true
modified: '2025-11-24T16:45:52'
source: https://sspai.com/post/103833
title: App Store 大更新：推出新的开发者计划，降低计划分成比例
type: archive-web
---

在全面推出[网页版](https://apps.apple.com/)之后，App Store 也没有闲着，又在今日宣布了本年度的重要更新：推出 [Mini
Apps Partner Program](https://developer.apple.com/programs/mini-apps-
partner/)，助力开发者打造全新「小程序」体验生态。

![](https://cdnfile.sspai.com/2025/11/14/1e3e8a77b963b6dbd8ff87203316d4fb.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

虽然包括彭博社在内的不少媒体已经通过「捕风捉影」的爆料信息，提前报道了这一消息，并将其称为 Apple
与腾讯微信方面达成的全新支付协议，但是这一报道其实并不准确。

简单来说，Mini Apps Partner Program 与腾讯方面并无直接关联，而是 Apple 在各种背景下推进 App Store
生态发展的全新尝试。在该项目推出之际，我们也与 Apple 方面有了一次简单交流的机会，在此将相关信息介绍给你。

## 什么是 mini app

由于拥有大量用户基础以及广泛认知，不少人都会将 mini app 直接理解为微信小程序，进而造成了误会；又或者是将其与同样有「轻量」之意的[轻
App](https://developer.apple.com/documentation/appclip) 挂钩。事实上，App Store 对于
mini app 这一应用体验形态的支持，要比 2020 年推出的轻 App 早了不少。

在 2017 年举办的 WWDC17 全球开发者大会期间，[Apple Developer App
审核指南](https://developer.apple.com/cn/app-store/review/guidelines/) 就增加了条目为 4.7
的新条款，指出：

> App 可包含或运行未嵌入二进制文件的代码 (如基于 HTML5 的游戏和聊天机器人等)，前提是 app
> 的主要目的并非代码分发，代码亦没有在商店界面或类似商店的界面中提供。

随着 Mini Apps Partner Program 推出，Apple 也对 4.7 条款作出了进一步明确和完善：

> App 中可以提供未嵌入二进制文件的某些软件，尤其是 HTML5 迷你 App 和迷你游戏、流媒体游戏、聊天机器人以及插件。此外，复古游戏主机和 PC
> 模拟器 App 可以提供游戏下载服务。你应对你的 App 中提供的所有此类软件负责，包括确保此类软件符合本指南的各项准则和所有适用法律。

结合 [Apple Developer
新闻](https://developer.apple.com/cn/news/?id=xcz1s7cz)，Apple 所谓的小程序是使用 HTML5 和
JavaScript 等网页技术构建、并嵌入于已有 app 内的独立体验形式，它可以是一种特定的应用功能，也可以是一种轻量的游戏体验。从呈现上而言，mini
app 可以是微信内的一个小程序、[ChatGPT 内的对话式应用](https://openai.com/zh-Hans-
CN/index/introducing-apps-in-chatgpt/)，或是 [Discord 群组内集成的一款
app](https://discord.com/discovery/applications)，前提是这些「超级 app」的开发者们遵循了相关开发规范。

![](https://cdnfile.sspai.com/2025/11/14/30230149bfe154f59300a35c5b1bc6ab.jpeg?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)Discord 的 App 页面。

## 什么是 Mini Apps Partner Program

如果说支持 mini app 是 Apple 对于未来技术趋势、开发方向的一种预见和思考，那么 Mini Apps Partner Program 就是
App Store 在此基础上的一个阶段性成果和答案。

顾名思义，要想加入 Mini Apps Partner Program，开发者必须在 app 中开发支持 mini app 功能体验，即具备以 HTML5
和 JavaScript 等网页技术构建、并嵌入于已有 app 内的独立体验形式。除此之外，Apple 对于申请加入此项计划还有几项要求，其中也有对宿主
app 的相关需求：

  * 宿主 app 必须为 iOS 或 iPadOS 平台应用。
  * Mini app 必须遵循 Apple Developer App 审核指南的所有要求准则。
  * Mini app 必须使用以下 Apple 提供的技术能力：
    * [Advanced Commerce API](https://developer.apple.com/cn/in-app-purchase/advanced-commerce-api/)：用于管理和展示 mini app 内的商品及购买流程。
    * [Declared Age Rating API](https://developer.apple.com/documentation/declaredagerange)：用于根据用户年龄提供适龄内容，并保护未成年人。
    * [In-App Purchase](https://developer.apple.com/cn/in-app-purchase/)：用于完成数字商品交易。
    * [Send Consumption Information](https://developer.apple.com/documentation/appstoreserverapi/send-consumption-information)：向 Apple 传送用户购买记录，以改进交易透明度和退款流程。

![](https://cdnfile.sspai.com/2025/11/14/eef4698a85ae733fe88d579991e5b23f.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)通过 Advanced Commerce API 展示商品和购买流程。

在过去的十年时间里，Apple 一直在内容消费领域持续布局，陆续推出了 Video Partner Program、News Partner
Program、Small Business Program ([App Store
小型企业计划](https://sspai.com/post/63686))，符合相关要求的开发者及服务提供方可以在加入计划之后，获得更加优惠的佣金费率政策，即获取比例为
85% 的销售收入，Apple 仅抽取销售金额的 15%。

最新推出的 Mini Apps Partner Program 也是如此，参与计划的开发者在销售符合条件的 App 内购买项目时，仅需向 Apple
提供比例为 15% 的销售收入抽成。

但与同样是为开发者推出的 App Store 小型企业计划有所不同，不论收益规模如何，只要符合该计划要求，开发者均可获得销售金额的 85% 收入，即使
mini app 部分的营收已经达到百万甚至千万美元的规模；而在 App Store 小型企业计划方面，只有当开发者收入未达到 100 万美元时，才能享受
15% 的佣金费率优惠。

## Mini app 的前世今生

从 2017 年支持开发者创建 mini app，到如今正式推出 Mini Apps Partner Program，我们当然可以说是 Apple
对于技术发展、市场态势远见的一次提前布局。尤其是在近年以 AI
技术为首带来的快速编程和轻量应用体验越来越普及之后，不论是开发者还是用户，都能从这些「类小程序」的体验中更快速地解决需求，以更短的路径达到各种目的。

而在 mini app 生态持续发展的如今，适时推出 Mini Apps Partner Program 也是对完善 App Store
应用生态、确保安全体验的重要举措。一方面通过更低的佣金费率吸引更多开发者加入，一方面通过合理的准入要求，向用户提供完善的安全审核机制、流畅的数字商品消费体验。

[截至今年 5 月](https://www.apple.com.cn/newsroom/2025/05/the-app-store-prevented-
more-than-9-billion-usd-in-fraudulent-transactions/)，App Store 已经在过去 5
年时间里累计阻止了超过 90 亿美元欺诈交易，仅 2024 年阻止的金额就超过了 20 亿美元。能在 App Store
应用生态持续快速增长的情况下，为用户提供不断更甚以往的安全交易体验，正是 Apple 越来越多、更加周全的技术体系下的成果。有了 Mini Apps
Partner Program 的加入，不仅通过 App Store 分发和下载 app
的安全举措又更进了一步，也让开发者和用户能够更好地从前沿技术中受益。

![](https://cdnfile.sspai.com/2025/11/14/58b4bc4aa6c2e2c4ac9684e044525d3b.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)![](https://cdnfile.sspai.com/2025/11/14/ed787ac0fa121f018d26d4147a105a81.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

不过，我们同样也需要看到，包括 Mini Apps Partner Program 在内的多项举措，也有来自社会舆论、法律监管的多方影响。

[2024 年 3 月 21 日](https://www.congress.gov/crs-product/LSB11154)，美国司法部对 Apple
公司提起民事反垄断诉讼，指控其部分平台政策在过去对「超级 App」生态的成长造成了限制，使那些能够在自身平台内承载第三方服务的「小程序型」体验，难以在
iOS 上充分发展。[2025 年 6 月 30 日](https://www.reuters.com/sustainability/boards-
policy-regulation/apple-loses-bid-dismiss-us-smartphone-monopoly-
case-2025-06-30/) 美国新泽西州联邦地区法院拒绝了 Apple 就该案提出的「驳回诉讼」动议，诉讼程序将继续往实体审理阶段推进。

Mini Apps Partner Program 的推出，相信也是 Apple
为了强调其控制权在法律上有权利、其生态服务是为了保护用户隐私、安全与体验而做出的一次有力回应。

## 未来可期

在 Apple 公布 Mini Apps Partner Program
不久之后，微信方面发布[公告](https://mp.weixin.qq.com/s/ZjeVjjh9VfNNr6OC56PtTA)表示欢迎 Apple
推出 Mini Apps Partner Program，并将尽快为开发者提供接入服务。

对于微信还要多少时间才能真正利用 Apple 的系统级 API，向用户提供更加完善的小程序体验，我们不得而知。但可以预见的是，Apple
的开发者计划一定能够得到众多开发者的支持响应，正如以往一样。

对于 Mini Apps Partner Program 的未来，我们也有不少可以期待之处。比如拓展至更多平台，让 macOS 和 visionOS
开发者也能加入这一计划，享受更低佣金费率的同时，为用户提供更完善和安全的 mini app 体验；比如通过 App Store 的 mini app
推荐入口，让开发者的产品获得更多、更好的曝光等等。

至于 Apple 对于 mini app 的此次布局，会在接下来对于 App Store
应用生态、对于用户掌上的软件体验产生怎么样的变化与影响，也期待未来告诉我们答案。