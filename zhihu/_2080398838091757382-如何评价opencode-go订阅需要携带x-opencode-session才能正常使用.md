---
comments: true
created: '2026-09-07T20:55:34'
draft: true
modified: '2026-09-07T21:54:49'
source: https://www.zhihu.com/question/2080331793551696173/answer/2080398838091757382
title: 如何评价opencode go订阅需要携带x-opencode-session才能正常使用？
type: archive-web
---

申请了退款，opencode 答复说不能退，只能忍到到期就换掉了。

真不明白，opencode 怎么也开始自己捅自己了？

难道它也像 DeepSeek（DS）那样，因为缺卡而训不了模型？

其实，缺少他们新要求的请求头，适配责任完全在他们自己和各大平台这边。

首先，用户根本无法修改平台客户端的代码，这事本来就不该由用户来解决；

其次，他们提供的过渡期极短，根本没留出合理的缓冲时间；

最后，他们还一刀切，直接把用户花钱购买的额度停用了。

要知道，OpenAI 当年力推 Responses API 时，可没有一刀切砍掉 Completions API 啊。

如此行径极其恶劣。

![](https://picx.zhimg.com/50/v2-d943fe62b36ab47d2ff58dff7fbe2175_720w.jpg?source=2c26e567)

这也完全与其官网所宣称的“可配合任何代理使用”相违背。

> 我可以在其他编程代理中使用 Go 吗？  
> 可以，您可以在任何代理中使用 Go。请遵循您首选编程代理中的设置说明。

![](https://picx.zhimg.com/50/v2-c69227d2fc8c4ed39f9e4b668681251b_720w.jpg?source=2c26e567)

这句话的含义在于，opencode应当主动兼容或者积极与其他代理适配opencode。

用户严格遵循了各个代理链接opencode的要求，

但现在，opencode正要求用户去做一件他们无法做到的事情，

试问哪位用户可以去直接修改各大平台的代码？

而当用户无法做到的时候，用户的订阅将被限制，

这是一种变相的强盗行为。

并且在服务变得不可用的时候，申请退款时，

opencode答复无法为我办理退款，

官网的“如有需要可充值。随时取消”，也成了屁话

实际上你只是可以取消连续订阅，并不能真正的取消订阅