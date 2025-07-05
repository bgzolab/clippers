---
aliases: [多端 GUI 真的没有银弹吗]
created: 2025-07-03T21:20:42
modified: 2025-07-03T21:20:48
source: "https://www.v2ex.com/t/1142560#reply22"
tags: []
title: 多端 GUI 真的没有银弹吗
type: "archive-web"
---

# 多端 GUI 真的没有银弹吗

程序员 - @Leon6868 - 关注多端 GUI 解决方案将近十年了。十年来，像 RN 、Flutter 这样的自绘 UI 不少，大多都是昙花一现。当前无论做什么应用，一旦涉及到多端，最终都会回到 Web 技术栈。但

## Comment

因为 GUI 太复杂。GUI 可以分成 retained 和 immediate 模式。Web 以及原生都是 retained 模式。style 和 layout 和 event 等影响渲染因素轮不到开发者控制，只能遵循平台规范。同样的效果要编写的代码又是不一样的。根本没办法复用。immediate 可以让开发者使用同一套逻辑渲染所有平台的效果。但难以实现复杂的动画效果以及每次重新渲染带来的性能损耗和功耗。

此外还有一个最大的难点就是异步处理。主 ui 渲染时候如何和数据线程同步也是非常头痛的问题。不同平台的方案又不一样。尤其是 web ，不光要写前后端代码，还要尽可能避免大数据量交互时候性能问题。
