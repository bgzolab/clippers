---
comments: true
created: '2026-10-28T14:17:01'
draft: true
modified: '2026-10-28T14:17:01'
source: https://www.zhihu.com/question/2097770426529330690/answer/2098780317775556841
title: OpenCode 提供的 deepseek-v4.1-flash 是量化版本吗？
type: archive-web
---

opencode
以前只有glm是三家提供商（两家不是官方）。而deepseek有两家提供商（一个官方，一个非官方）。不过现在新增了不少模型，也说不准其它还有没有非官方的。

量化不量化的先不提，opencode go目前肉眼可见的变慢了。尤其你会发现超过 200k 上下文，deepseek就明显开始慢下来。而官网的速度相对正常。

这意味着：限制你的开销其实没必要搞量化，只要限速就行了。反正限速之后你打死也跑不完给你的份额，那个份额就只剩下一个数字。

类似的小米模型也差不多，opencode go的小米比小米官方的小米要慢，虽然智商没有明显差别。

许多网友用opencode go实际体感的是降速而非量化降智。

要说它究竟有没有量化，我不好说，但我认为，既然都已经限速了，就没必要再搞量化了。