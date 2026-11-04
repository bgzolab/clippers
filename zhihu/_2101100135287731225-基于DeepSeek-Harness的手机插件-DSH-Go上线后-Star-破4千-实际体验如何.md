---
comments: true
created: '2026-11-03T23:55:08'
draft: true
modified: '2026-11-04T00:19:17'
source: https://www.zhihu.com/question/2099981630773400745/answer/2101100135287731225
title: 基于DeepSeek Harness的手机插件 DSH Go上线后 Star 破4千，实际体验如何？
type: archive-web
---

谢邀，也感谢知友们对 DSH Go 的关注。我是 DSH Go 和 DSH-TUI 的作者 ccch1mneyyy。

项目地址放在这里，觉得不错的话欢迎点个 Star：

  * DSH Go：[https://github.com/ccch1mneyyy/dsh-go](https://link.zhihu.com/?target=https%3A//github.com/ccch1mneyyy/dsh-go)
  * DSH-TUI：[https://github.com/ccch1mneyyy/dsh-TUI](https://link.zhihu.com/?target=https%3A//github.com/ccch1mneyyy/dsh-TUI)
  * GitHub主页：[https://github.com/ccch1mneyyy](https://link.zhihu.com/?target=https%3A//github.com/ccch1mneyyy)

![](https://picx.zhimg.com/50/v2-cb49ad756afb9d72e5bc930ea33fc4c1_720w.jpg?source=2c26e567)DSH
Go主视觉图

首先叠个甲。DSH Go 公测才不到一周，还有很多不完善的地方，GitHub 上还开着不少大家反馈的
issue，在浩如烟海的系统和手机型号中，也出现了不少兼容性bug，不过后续我都会慢慢完善的，大家敬请期待！

关于体验如何，还是以大家的实际使用为准吧，要我作为作者谈使用的话，难免会有点自卖自夸（毕竟是DSH
Go源自于我自身需求和审美的孩子hhh）。我主要讲讲为什么要做这个项目，以及为什么这样做。

首先，为什么要做手机端？

初心当然是想为 DSH
社区做点贡献。市面上有些产品我自己用着不习惯，有些地方我总觉得还能做得更好。我想着大家说不定也有类似的需求，而我恰好有这个能力，于是就决定自己写一个心中理想的产品，开源出来，既满足自己，也能造福大家~

另一方面也有一点小私心。我之前写 DSH-TUI 投了很多心力，社区评价也不错，但 star
数一直不是特别高。为此我还是有些小小的遗憾~我个人的理解是，这主要受限于用户群体和使用场景，不够普惠。**所以这次我想做一个新手小白也能愉快用上 AI
的产品。** 思来想去，最普惠的平台便是手机了。于是，DSH-Go 应运而生！

那么，为什么叫 **DSH Go** ？

我取 Go 的寓意是随时随刻，想走就走。不用被束缚在电脑桌前，带着手机就能在任何地方满足自己的需求，这也恰恰是移动端 agent
最大的优势之一。同时也和之前 DeepSeek 4 Flash 干活时喜欢唱 Let Me Go 的梗有关 hhh 大肥鱼喜欢 Let Me
Go，那作为用户的我们在拥有 DSH Go 之后也能“随时随刻，想 go 就 Go”个人觉得是一个比较有意思的双关（

那具体怎么让新手也能用，同时不丢掉 DSH 本身的能力？我主要想做到四点。

第一，**上手要尽量无感。** 对新手来说，最劝退的也许就是装环境和配 API Key。所以我把整套运行环境都打包进了
App，第一次打开时自动解压，不用敲任何命令。解压的同时配了比较详细的引导，可以顺手把外观和账号设置好，不用干等。API Key 也不用去研究，直接用
DeepSeek 官方账号登录即可，和平时登录别的 App 差不多，符合小白群体的使用习惯。

![](https://picx.zhimg.com/50/v2-2c8495b78f4448497833216e0d2108f4_720w.jpg?source=2c26e567)引导页

第二，**界面要像一个正常的手机应用。** 官方网页版是给电脑设计的，强行放到手机上则不太兼容。所以我把功能逐项做成了精美的原生UI界面，使得DSH
Go整体更像一个移动端产品，而不是被强行打包到手机的电脑端应用。

![](https://picx.zhimg.com/50/v2-c69d4787a63683e86e3e3ba78adc07bf_720w.jpg?source=2c26e567)原生UI

第三，**有没有电脑都能用。** 手机上可以直接本地运行，不需要 Root，也不需要折腾Termux；想用电脑或服务器上的 DSH，也可以通过 SSH 或
DSH Remote 远程连接自己的电脑。

![](https://picx.zhimg.com/50/v2-086be684914e2b31389936ed045dd649_720w.jpg?source=2c26e567)本机和远程连接

第四，**不为了易用性放弃可定制性** 。DSH 的核心理念是**「一切皆插件」** ，这一点我认为不应该为了做不同的平台而抛弃。因此 DSH Go
也保留了社区插件的兼容性，同时插件作者也可以用仓库里的 SDK 做原生界面，最大程度地定制自己的 DSH Go。

除此之外也有一些不那么严肃的小设计。比如等 Agent
干活比较枯燥，所以思考栏的文案是我精心设计的，比如「别催别催」「快好了，真的」，特殊时间点和节假日还有彩蛋文案。用到一定时长之后，还会有一个可爱的鲸娘跳出来向大家恳求
Star。剩下的就靠大家自己去发掘啦hh

![](https://picx.zhimg.com/50/v2-e6ae7a9dfca65fcd573872ad73a195c2_720w.jpg?source=2c26e567)一些思考小文案~![](https://pic1.zhimg.com/50/v2-9d7aeb908ba0e57226678b8659c68a03_720w.jpg?source=2c26e567)吉祥物小鲸鱼deepy![](https://picx.zhimg.com/50/v2-dd823a4b8d715b7590f1475c853c5a0a_720w.jpg?source=2c26e567)可爱的deepy娘

接下来的大计划是适配鸿蒙和 iOS，这一点我也是被大家催得不行了hhh。当时我立下flag说上线达到 1000 star
就开始适配，本意是想让自己休息一下，没想到上线不到一个小时就破 1000
了，真是幸福的烦恼（）没办法，只好继续爆肝了~目前两边都已经动工，我依旧会尽力给大家带来最好的体验，不过iOS和鸿蒙做起来确实有不少障碍，也请大家耐心等待。

目前这个 App 基本是我一个人在开发，暂时不接受外部 PR，不过我想等项目稳定之后会开放，到时候欢迎大家一起共建，适配更多的机型，开发更多的功能~

最后要特别感谢[@李国宝](https://www.zhihu.com/people/4e8ca77fdc8e77c18f3f1aac94d15c56)老师！DSH
Go的远程模块基本借鉴了李老师的ds-harness-
remote，真的是省了我很大的心力，大家记得也给李老师点点star哦~同时也要感谢内测和公测期间参与体验、反馈意见的大家，以及帮助DSH
Go让更多人看到的各大自媒体老师们，感谢各位一路相伴！DSH
Go才开源不到一周，我相信它还有很大进步的空间，欢迎大家多提建议和issue，也希望大家多多star，多多宣传，让更多的人能够用上好的产品，也帮助DSH
Go走得更远！！

![](https://picx.zhimg.com/50/v2-114e0874ee83a01e2c41627743830f7f_720w.jpg?source=2c26e567)7000star贺图，感谢大家支持！！

  

  

  

  

  

  

  

  

经朋友们提醒，这里小小宣传一下DSH生态你能用到的最好的tui项目（支持DSH、ClaudeCode、Codex三种内核）：

[https://github.com/ccch1mneyyy/dsh-
TUI](https://link.zhihu.com/?target=https%3A//github.com/ccch1mneyyy/dsh-TUI)

如果觉得不错的话麻烦也给冷门小众嘉豪项目点点star（）