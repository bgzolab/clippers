---
comments: true
created: '1970-01-01T08:00:00'
draft: true
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/2054931412093081471
title: 「BBT」你的 opencode 并非 opencode —— 由 Bun 崩溃引发的 opencode 的身世之谜
type: archive-web
---

![](https://picx.zhimg.com/v2-1d0b11a758c2b0b01cfb49428626f2f9_1440w.jpg)

一周前的晚上，我照常在 PowerShell 里中使用 opencode 执行任务，毫无征兆地，我的 opencode 崩溃了。

![](https://pica.zhimg.com/v2-39e7ac79f9d5182b538a0cb8ed4e32c6_1440w.jpg)[图0]
Bun has crashed. This indicates a bug in Bun, not your code.

我重启，再敲，执行到一半却依旧再崩，重启电脑还是一样。

一小时前还在帮我批量改代码、跑测试、推 commit 的“赛博黑奴”，现在变成了一坨二进制垃圾。

当我开始调查这个崩掉的 Bun 究竟是个什么东西，尝试修复这个 BUG 时，却莫名其妙挖出开源社区的一段历史 —— **我们现在使用的
opencode，或许根本不是 opencode** 。

* * *

## **理想与背叛：opencode 早期发展史**[1]

![](https://pic3.zhimg.com/v2-14efb8197ae611031df97e93fcdd9412_1440w.jpg)[图1]
Kujtim Hoxha

故事要从一个叫 @Kujtim Hoxha 的程序员说起：2025 年初，他独自开启了一个名为 TermAI 的开源项目 —— 一个基于 Charm 公司的
_Bubble tea_ 框架，基于 _Golang_ 语言写就的终端 AI 编程助手。

随着项目的推进，开源社区的两位重量级网红加入了这个项目，一位是 SST 框架的作者 @Dax Raad，另一位是 StatMuse 的联合创始人
@Adam。

![](https://picx.zhimg.com/v2-c704bae12632799e4144032f665fd5e3_1440w.jpg)[图2]
Adam 照片

@Dax 买下了 `_opencode.ai_` 这个域名，并将项目名称修改为 opencode，持续利用自己的影响力疯狂推广，这便是 opencode
的前身。

随着大量的社区贡献者的涌入，项目呈现爆炸式增长，opencode 的星星一路冲到了十几万，一时间风头无两。

然而，就在这勃勃生机，万物竞发之际，项目团队出事了 —— 前文提到的 Charm 公司（此时 opencode 都是基于 Charm 的 bubble
tea 开发的），直接挖走了创始人 @Kujtim Hoxha —— 不是收购项目，而是直接挖走了创始人。

![](https://pic4.zhimg.com/v2-d7c4f4a0b44a993f730bf1c5e461597b_1440w.jpg)[图3]开发
bubble tea 的 Charm

@Kujtim 作为 opencode Github 仓库的拥有者，在接受了 Charm 公司的 offer 之后，居然直接把凝聚了开源社区心血的
opencode 项目，转移到了 Charm 公司的 Github 组织之下，自此引起了轩然大波。

@Dax 与 @Adam 认为，自己投入了品牌（域名是 Dax 买的）、推广（流量是他们带的）、代码（UI/UX
是他们改的）的项目，被另一个人连根拔走，送进了一家 VC 投资的商业公司，完全是对开源社区成果的一次盗窃。

更炸裂的是，Charm 接管仓库后，直接重写了项目的 Git 历史，@Dax 的提交记录被清理，@Adam
被仓库封禁，一切针对本次事件的批评都被删除，局面一度极为混乱。

此时的 @Dax 与 @Adam 迅速 fork 了原始代码，继续用自己手里的 _opencode.ai_ 域名和自身在开源社区的影响力，运营
opencode 项目；

Charm 和 @Kujtim 则继续持有 opencode 原始的 GitHub 仓库（和那十几万星星），依旧使用 opencode的名义继续开发项目；

**所以此时，世界上同时存在着两个 opencode 项目。**

直到 2025 年 7 月，Charm 在开源社区的巨大压力之下做出了让步，将手中的 opencode 原始项目更名为 #Crush，迁移到
charmbracelet/crush；opencode 的官方名称，则留给了 @Dax 和 @Adam。

在纷争结束之际，@Dax 和 @Adam 做出了一个激进的决定：将原本基于 Bubble tea 使用 Golang 开发的 opencode 项目，彻底用
TypeScript 和 Bun 重写了一遍，由此引出了导致我 opencode 本次崩溃的元凶 —— #Bun。

* * *

## 赛车引擎在家用车上的水土不服

![](https://pic3.zhimg.com/v2-741fdf9da0377fcc1a60661c0b9976c4_1440w.jpg)[图4]
Bun 官网

**TypeScript + Bun** 的组合，的确很快、很新、很酷，但 Windows 并非 Bun 的主战场，就像 F1
方程式赛车的引擎，无法适应家用车的应用场景一样。

Bun 对 Windows 的支持，官方措辞是“实验性的”（experimental），也就是说能用是你运气，不能用是你活该。

所以，站在当下这个时间点（2026.06.26）回顾，当初 @Dax 和 @Adam 把重构的 opencode 绑死在一个对 windows
只提供实验性支持的框架上时，未免显得有些过于激进和乐观了。

为什么说“绑死”呢？因为 opencode 的 Windows 版本，并非调用 Bun，而是将其完整焊死在了 opencode.exe 里 ——
就像这台装着方程式发动机的家用车，其车身和发动机是热熔一体的，无法通过更换发动机让汽车跑起来。

具体到 Bun 在 Windows 出现的问题上，3 个 bug 每一个都足以单独坑死你：

1\. spawn 内存越界，开启任何一个子进程，总有一只脚在别人家里：GitHub Issue oven-sh/bun#26026，1.3.5时代就发现的
bug，至今挂着 open 标签；

2\. Bun 的垃圾回收器触发 bug，保洁阿姨丢垃圾的时候会把你的家具一并丢掉：Issue #26625，修了复发，复发了修，`v1.3.8` 还在崩；

3\. Node-API 层 worker 线程回收
bug，一个线程手里攥着还没清掉的异常，另一个线程试图创建一个新的错误对象——`napi_create_error` 发现前一个异常还没消，直接
panic。Issue #30286，PR 已经交了，但截至我写下这些字的时候，还没合入。

![](https://pic4.zhimg.com/v2-fbb4f7dded4dd7ef1b6fdd36c0585869_1440w.jpg)[图5]Issue
#26026![](https://pic4.zhimg.com/v2-d0bf4c0ca884e7706526de31afd0f453_1440w.jpg)[图6]
Issue
#26625![](https://pic1.zhimg.com/v2-9367b29b09959c24996e8bea4935c6c4_1440w.jpg)[图7]
Issue #30286

以上三者无论哪个触发，都足以让你的 opencode 原地升天。

加上 opencode 和 bun 一出厂就绑死的关系，你除了等 OpenCode 团队重新编译一个新的 exe 外，别无他法 ——
当然，也有社区用户试过自己从源码编译，在理论上是可行的，你只要 clone opencode 仓库，把 Bun 依赖从 `1.3.5` 改成
`1.3.6`，然后重新 build 出新的 exe 即可。

但我先不说 Rust + Node + Tauri 的工具链配起来有多痛苦，光是搞清楚 OpenCode 的 monorepo
结构就够你喝一壶的，这不是自己修一下的难度，是给自己找了个全新的工作的难度。

所以在那个束手无策的晚上，我做了个违背祖宗的决定，尝试一下被 Charm 收编，由 opencode 创始人维护的嫡长 opencode —— Crush。

* * *

## 被创始人带走的嫡子：Crush

![](https://pic2.zhimg.com/v2-5c88afafcd66b62923fccbcc5784e0df_1440w.jpg)[图8]
Crush 官网截图

Charm 这家公司做了十年终端 UI —— 无论是 Glow、Gum 还是 Soft Serve，随便拎一个出来都是各自品类里的颜值天花板。

而 Crush，正是是他们把这十年功力砸进一个 AI 编程工具里的作品，配色、间距、Markdown 渲染、代码高亮，TUI 比 opencode
好看太多（个人觉得不如 Claude Code，过于花里胡哨，美学不够克制）。

![](https://picx.zhimg.com/v2-e8b679446e8a4c7ff34a44c7009a4e49_1440w.gif)[图9]
Crush TUI 截图

理论上，这么现代且美丽的东西应该是好用的，但实际上 Crush 的硬伤颇多。

首先，Bubble Tea 的 TUI 模型就是一个 goroutine 跑一个事件循环，所有渲染和交互都串行，因此 Crush
是一个单线程、单消息队列、单状态机的程序，你无法像使用 opencode 一样通过 /new 或者 /session
命令，同时开启一个独立的新任务，当任务A在执行时，你只能在那干等着。

其次，Crush 不像 opencode 一样喜欢暴漏命令：在 opencode 按 `/`，弹出一排命令：  
`/new` 开新会话，/sessions 切换历史，`/compact` 压缩上下文，`/undo` 撤销（包括文件改动），/redo
恢复，每一条都是精确的原子操作。

Crush 的设计哲学是 AI 自己去判断该调什么命令，你用自然语言交互就够了，不过你无法根据特性任务，实现精确操作。

最后是网络搜索的问题，这不是 Crush 的错，是**天恩** 导致的。

无论是和他同样设计的 codex，还是不同设计的 Claude Code、Antigravity，都存在搜索的问题，目前有且仅有 opencode
拥有这个优势 —— **当然，其背后的原因，是个谈都不能谈话题** 。

具体到 Crush 上，就是并发搜索时的一堆❌，烧你的 Token，浪费你的时间。

![](https://pic1.zhimg.com/v2-0b3b90010214a1cf975507a6ae623c10_1440w.jpg)[图10]
一堆❌的并发搜索

那么 Crush 的优点是什么呢？第一是 100 点/月的免费额度，换算过来大概 5 美刀，你可以在Charm
官方维护的模型列表里随便挑，譬如近期刚刚登顶国模榜首的 GLM 5.2 你就能免费使用，选择比 opencode 要多很多。

![](https://picx.zhimg.com/v2-68968b200806755c5ff7633d38824ca7_1440w.jpg)[图11]输入验证码可白嫖信用点

其次是 TUI 的提示面板设计，这是 Bubble Tea 十年功力的集中体现，opencode
有很多快捷操作是完全不给提示的，比如对话页面怎么上下翻页？怎么把焦点切到输入框？怎么快速跳到上一个 Agent
消息？这些操作你都得提前背，或者在肌肉记忆里培养，忘了就只能干瞪眼。

![](https://pic4.zhimg.com/v2-384bda93791c7f4c149b30ae2a40647d_1440w.jpg)[图12]
opencode 命令大全

Crush 没有这个问题。你的光标移到哪个交互区域，它就在屏幕底部提示你对应的快捷键。你不用记，不用背，跟着提示走就行。

这是一个真正从用户体验出发的设计决策 —— 不是"用户应该学会"，是"工具引导用户"。

![](https://picx.zhimg.com/v2-656561246fd6f02255bb9fb1f4c702dd_1440w.jpg)[图13]Crush的提示面板

可惜，我对 Harness 的需求不是好看，而是打硬仗，多 Agent 并发、复杂任务拆解、长会话不崩、以及Subagent
指哪打哪，对我而言都是刚需，综上所述，目前 opencode + OMO 没有对手。

老读者都知道 @所长同志 对单核软件的厌恶，所以我必须让 opencode 活过来。

* * *

## 解决方案与双备份机制

换不了 opencode，我还换不了你 windows 吗？配置 WSL 文件，转战 Linux。Bun 虽然在 Windows 上崩，但在 Linux
上好歹是原生一等公民，足以支撑 opencode 稳定运行。

所以 WSL + opencode 可能就是 Windows 下稳定运行 opencode 的最终答案。

题外话，还记得我前几天吐槽过的小米 #MiMo Code 吗？那个小米基于 opencode 再开发的分支 Harness。在 opencode
崩掉的那个晚上， MiMo Code 帮了我大忙，我能这么快地把原来 opencode 中的 skills、AGENT.MD 等等配置迅速转移到
WSL，让“赛博黑奴”快速重生，投入工作，Mimo Code 功不可没。

据闻 Mimo Code 有针对 Bun 这一问题进行修复，所以它在 Windows 上是可以稳定运行的。

因此，在电脑还能顺利运行 Harness A 的时候，第一个任务就该叫它帮你安装好 Harness B，互为 AB 角，互相备份。

![](https://picx.zhimg.com/v2-02ed6285687883729499c9d0d7c0501b_1440w.jpg)[图14]
救火的 Mimo Code

此外，MiMo Code 这次救场，给我的印象比它刚首发的时候好太多了。首发那会儿 —— 功能少，反应慢，Bug 一堆，像个半成品。

但最近的版本完成度明显上来了，复杂任务的拆解质量和执行稳定度都到了一个可用的水平。

限免期，我推荐，毕竟白嫖算力才是 AI 时代促进发展的第一动力！

![](https://pic3.zhimg.com/v2-21e2c656db61c7d2019e207cb3651ea8_1440w.jpg)![](https://pic4.zhimg.com/v2-e2dd33a70ece631a5c98c681c287bb0d_1440w.jpg)