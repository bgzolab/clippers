---
created: '2025-12-19T09:27:04'
modified: '2025-12-19T09:27:04'
source: https://sspai.com/prime/story/inside-release-notes-251217
title: 具透：微软改名部上线，Homebrew 弃用实用选项引起争议
type: archive-web
---

Windows112025-11预览更新：最擅长的只有改名了@克莱德：都说大公司最厉害的部门都是「改名部」，微软更是如此。从本月推送到稳定通道的KB5070311更新开始，Windows11系统更新的
...

## Windows 11 2025-11 预览更新：最擅长的只有改名了

[@克莱德](https://sspai.com/u/clyde)：都说大公司最厉害的部门都是「改名部」，微软更是如此。从本月推送到稳定通道的
KB5070311 更新开始，Windows 11 系统更新的补丁名称开始简化，打开「设置 > Windows 更新 >
更新历史记录」，你会发现近期安装的更新名字相比以往缩水了一大截：

![](https://cdnfile.sspai.com/2025/12/17/article/c031131cf94dff8af488e1f8c6ff9a05.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

根据微软的[博文](https://techcommunity.microsoft.com/blog/windows-itpro-
blog/simplified-windows-update-titles/4465287)，后续的 Windows 11
更新补丁名称将更多地考虑可读性，因此取消了名称中补丁适用平台架构这样的技术信息，调整后的更新补丁名称大多以 `时间戳+更新类型+补丁编号+详细版本号`
为基本格式，要说真没什么必要吧，更新历史记录的视觉观感确实更清爽了，我们的小标题里现在确实也放得下正式的更新名字了。另外从补丁安装历史记录来看确实没什么必要在名字里重复适用平台——毕竟我更新都安装成功了，你总不能把
arm64 的补丁装到我 x64 的系统上来吧？

还真不敢排除这种可能。

除了命名简化，Windows 11 2025-11
预览更新的确带来了一些可圈可点的更新内容，比如资源管理器和「运行」的深色模式体验在完善，现在资源管理器的复制、粘贴等对话框背景、进度动画以及运行窗口，都能跟随系统正确显示为深色了。更新后看不到效果也不必急躁，虽然很难理解但这项更新目前被微软划分在「分批推送」列表里，实在着急的朋友不妨搜一搜相关代码然后借助
ViVeTool 手动开启。

扩展阅读：[第一时间用上 Windows 11 新功能，尝鲜用户必备小工具：ViVeTool](https://sspai.com/post/74286)

![](https://cdnfile.sspai.com/2025/12/17/article/bf4902db0e23c34e40f36c55c1346411.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

再比如参考了 iOS 应用资源库的新版开始菜单，除了已经测试了挺长时间的移动设备面板，现在开始菜单默认也会以分类文件夹的方式显示「全部」应用，甚至连布局都与
iOS 一致：

![](https://cdnfile.sspai.com/2025/12/17/article/6f447c46a0a6a86488ec403160e48793.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

但就像本次更新后资源管理器在深色模式下依然会「闪白」一样，一方面 Windows 11
目前有待修复的问题远比已经解决的问题多，关乎基础体验的改进在实际推送时间上却严重滞后于宣传，另一方面 Windows 11
又不遗余力引入了大量在用户看来[完全没必要](https://github.com/zoicware/RemoveWindowsAI/)的 AI
功能和体验，并且这些功能的推送反而不用等太久。

更糟糕的是，在 Windows 四十周年之际微软毫不犹豫地抛出了要将 Windows
打造为「[代理式操作系统](https://www.theverge.com/tech/825022/microsoft-windows-40-year-
anniversary-agentic-os-future)」的口号，但实际交付的 AI 体验却是一个[连「系统设置」都认不明白的
Copilot](https://www.windowscentral.com/artificial-intelligence/microsoft-
copilot/baffling-microsoft-ad-shows-copilot-ai-incorrectly-identifying-
windows-11-setting-then-pretending-it-was-working-as-intended)。长久以来 Windows
都被视为是受众最为广泛的操作系统之一，但在 AI 蓬勃发展的 2025 年，微软的重心却显然放在了 AI 而不是基本的用户体验上。这很难不让人失望。

这样的忧虑也并非杞人忧天——根据 Windows Latest
的[消息](https://www.windowslatest.com/2025/12/07/windows-11s-agenda-view-in-the-
notification-center-is-a-webview2-web-app-component-not-
native/)，即将到来的新版通知中心日历视图竟然是用 WebView2 来写的，它就像当年的 [Active
Desktop](https://en.wikipedia.org/wiki/Active_Desktop)
一样，通过加载网络资源的方式来渲染本应是本地资源的操作系统界面……尽管经 Windows Latest 测试这个功能仅会带来 100MB
左右的额外资源占用并且有着正常工作的后台休眠机制，但连系统功能都要依赖 WebView2
而非原生组件，很难不让人感慨这是否有点过于随便了——还是说微软现在的 Windows 11 系统开发就像你身边那个总把快速交付和 Vibe Coding
挂嘴边的同事一样，速度第一、质量和落地效果都是以后的事了？

![](https://cdnfile.sspai.com/2025/12/17/article/ee7a47967b5268fb5a85adf88387c516.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

您干脆做个 Web OS 吧

[@PlatyHsu](https://sspai.com/u/platyhsu)：上个月，macOS 上的主流包管理工具 Homebrew 在更新
4.7.0 版时，正式[弃用](https://github.com/Homebrew/brew/pull/20973)了绕过 macOS
应用安全检查机制的命令行选项 `--no-
quarantine`。这项变动最初是在九月宣布的，在当时和正式更新后，都引发了一些讨论和争议。那么，这个选项是做什么的，为什么会引起一些用户的不满呢？

这个选项名称中的 quarantine（隔离），是指 macOS 对应用施加的一项安全策略标记。根据 macOS 的
[Gatekeeper](https://support.apple.com/guide/security/gatekeeper-and-runtime-
protection-sec5599b66df/web)（门禁）机制，任何从外部下载（除少数例外）的应用，都会被附加一个 extended
attribute（扩展属性），其名称为
`com.apple.quarantine`，值则[记录了](https://eclecticlight.co/2017/12/11/xattr-com-
apple-quarantine-the-quarantine-flag/)该应用是否经检查、何时下载、由什么软件下载等信息。

如果一个应用处于隔离状态，那么初次运行时将会显示一个提示框，具体内容则取决于该应用是否经过苹果的
notarization（公证）。所谓公证，是苹果近年开始对非 App Store
渠道应用执行的一项「备案」机制。该机制[提倡](https://developer.apple.com/documentation/security/notarizing-
macos-software-before-
distribution)，任何应用分发之前都必须上传到苹果服务器，接受恶意软件、签名完整性等检查，然后获得苹果发放的凭证。而苹果为了推广这项机制采用的「大棒」，就是提高未经公证软件的运行门槛。

具体而言，当经过公证的应用从隔离状态中首次运行时，macOS
将会提示用户该应用是从网上下载，要求确认是否运行；一经允许，隔离状态即告解除，下次运行便不会再次提示。

![](https://cdnfile.sspai.com/2025/12/17/917dc052bde228fc337472022f9a26c7.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1) 经公证的隔离状态应用首次运行时的提示

而如果隔离状态下的应用未经公证，双击运行则会被 macOS 拒绝，弹窗警示用户该应用未经苹果检查，并默认建议将其删除。

![](https://cdnfile.sspai.com/2025/12/17/5b17a79a1315101a32c965ce17cf9837.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1) 未公证的隔离状态应用首次运行时的提示

在过去，用户可以通过在右键菜单中选择「打开」来绕过这项限制。但从 2024 年的 macOS Sequoia
开始，苹果取消了这个「捷径」；要运行未经公证的应用，目前[唯一的方法](https://support.apple.com/zh-
cn/102445)是在看到上述警告后，手动前往系统设置的「隐私与安全性」页面，在「已阻止 [应用名称] 以保护 Mac」的提示旁边，点击「仍要打开」按钮。

![](https://cdnfile.sspai.com/2025/12/17/40e1402936d328120dbe9176e7bbb436.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

可见，只要应用是从非 App Store 渠道下载的，首次启动时都要经过或简或繁的 Gatekeeper 确认过程。不过，触发 Gatekeeper
检查的前提是应用处于隔离状态。如果一个应用已经解除隔离，那么无论是否经过公证，都不需要再额外确认，就像从 App Store 下载的应用那样可以直接运行。

（提交公证的前提是应用经过有效签名，即附有表明开发者身份的加密凭证。在 Apple silicon 机型上，未签名的 arm64
架构应用无论是否处于隔离状态，都会直接被拒绝运行，并且没有绕过方式。）

这个被新版 Homebrew 弃用的 `--no-quarantine` 选项本来就是为了解决上述麻烦。如果在用 Homebrew
安装应用时附加该选项，Homebrew 会在安装完成后，清空应用上附着的 `com.apple.quarantine`
扩展属性，也就是将应用解除隔离。这样，就省去了首次运行时的确认步骤。

那么，Homebrew 为什么要移除这个选项呢？根据维护者在预告这项变更的 issue 中的说法，苹果正在逐步加大绕过 Gatekeeper
的难度（例如上面提到的对未公证或未签名应用的额外限制），因此以后这个选项的作用只会越来越小。同时，Homebrew
的官方立场也一直是不鼓励使用这个选项，并且计划在明年拒绝接收不能通过 Gatekeeper 的应用入库，届时这个选项也没有意义了。

但在该 issue 的评论区中，其他人也提出了一些合理的反对观点。首先，移除该标志并不会阻止绕过 Gatekeeper
的行为：打包者只要在安装后运行的脚本中加入 `xattr -d com.apple.quarantine`，就能静默将应用解除隔离，理论上比目前用户主动输入
`--no-quarantine` 更加不安全。此外，像 Homebrew
这样的包管理器的受众是「知道自己在做什么」的进阶用户，它应当为这些用户提供充分的自主权和灵活性，而不是跟从苹果面向大众用户的限制。

对此，维护团队的回应大意是，这更多是一个责任界定的问题。如果 Homebrew
提供了这个绕过手段，就会对由此产生的安全问题承担隐性责任。而如果打包者或者用户通过手动方式来绕过，那么也就要自行承担审慎义务。项目负责人
MikeMcQuaid 明确表示，让绕过变得更难本身就是目标。

客观地说，双方的立场都有一定的道理，这次对话本来可以成为一次有意义的安全实践讨论。可惜的是，评论区并没有向友好、协作的方向发展。随着一些用户表露出更加不满的语气，维护团队似乎也丧失了继续解释的耐心，在几条略显傲慢和轻蔑的回复后，直接关闭了这个
issue。在我将这个话题转发到 Hacker News
下（对不起）的[讨论](https://news.ycombinator.com/item?id=45907259)中，不少人对于维护者的态度表示了不满。（但也参见
MikeMcQuaid [本人的答复](https://news.ycombinator.com/item?id=45913068)，他合理地指出了
Homebrew 项目已经声明 issue 区不用于讨论，而另设有专门的讨论区。）

还应当看到苹果在这次争议背后的角色。近年来，用户社区对于 macOS
里的「权限弹窗」越来越多，而留给用户的自定义空间越来越少，一直多有抱怨，而进一步收紧强制「公证」要求只是这一趋势的最新例证。正如很多评论所指出，这些弹窗对于各类用户的效用都是值得商榷的。对于普通用户，弹窗提示并不能提高安全性，因为其更可能听从网上的指示，或出于「弹窗疲劳」，而机械完成任何授权步骤，进而可能被一些[伪装成系统提示的恶意软件](https://wts.dev/posts/tcc-
who/)钻空子。而对于进阶用户，过多的警告则纯粹是一种贬低和限制。

此外，苹果对于第一方 app 和通过 App Store 分发的 app 施加的额外弹窗较少，也构成了一种不正当的竞争优势和隐性强制。尽管苹果声称会严格审查
App Store 上架的 app，但事实表明这些 app
最多只在技术上是安全的（没有病毒或恶意软件），但包含操纵用户、诱导购买等灰色功能的漏网之鱼不在少数，很难说比 Homebrew
这些经过社区验证和检查的来源「安全」到哪去。

![](https://cdnfile.sspai.com/2025/12/17/328ee6940624222dbb536464da5bbf7a.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1) 新装 macOS 的弹窗迷幻效果（ _Six Colors_ ）

最后还是说点好新闻：后续发布的 Homebrew 5.0 新增了一个 `HOMEBREW_USE_INTERNAL_API` 环境变量，如果将其设为
`1`，Homebrew 将会启用目前在测试中的[新版
API](https://github.com/Homebrew/brew/pull/20051)。与目前的 API
相比，它通过压缩、分片和精简，大大减少了拉取的软件包时读取的数据量（仅为目前版本的 8% 或以下）。可以说，这是 [Homebrew
4.0](https://sspai.com/post/78587) 将软件包信息从 Git 仓库迁移到 API 以来，Homebrew
为改进速度做的又一次主要努力。可以预期，正式启用后，`brew install`、`brew upgrade` 等操作都会更快。

## 记得要及时升级你的图书管理工具 Calibre
