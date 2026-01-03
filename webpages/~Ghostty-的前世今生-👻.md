---
created: 2026-01-03T17:39:15
modified: 2026-01-03T17:39:15
description: "Ghostty 是一个用 Zig 写的终端模拟器，尽管采用的是邀请制，它的热度也一直不减，其作者 Mitchell Hashimoto 时不时就会在 X 上更新 Ghostty 最新的进展，Mitchell 在 10 月份也发表了题为 Ghostty 1.0 is Coming 的文章，谈到 Ghostty 1.0 计划在 12 月正式对外发布， 但眼看 12 月底就要到了，真不知道在元旦前能否如期而至 （已经在 2024-12-27 正式发布：https://ghostty.org/）。"
draft: true
source: "https://liujiacai.net/blog/2024/12/26/hi-ghostty/"
tags:
type: "archive-web"
---
# Ghostty 的前世今生 👻

Ghostty 是一个用 Zig 写的终端模拟器，尽管采用的是邀请制，它的热度也一直不减，其作者 Mitchell Hashimoto 时不时就会在 X 上更新 Ghostty 最新的进展，Mitchell 在 10 月份也发表了题为 [Ghostty 1.0 is Coming](https://mitchellh.com/writing/ghostty-is-coming) 的文章，谈到 Ghostty 1.0 计划在 12 月正式对外发布， ~~但眼看 12 月底就要到了，真不知道在元旦前能否如期而至~~ （已经在 2024-12-27 正式发布：[https://ghostty.org/](https://ghostty.org/)）。

作为 Build in Public 的典范，Mitchell 最近又去 Changelog 录了一期播客（[We ain't afraid of no Ghostty](https://changelog.com/podcast/622)），时长 100 分钟，可谓干货满满，节目里聊到了 Ghostty 项目诞生的契机、目标以及开发过程中的心得体会，强烈推荐大家去听听这一期，如果对英文听力不好，我已经用 [whisper.cpp](https://github.com/ggerganov/whisper.cpp) 转出了[文本](https://liujiacai.net/transcript/the-changelog-622)，供大家参考阅读。下文是我自己的总结。

Ghostty 诞生契机

Mitchell 之前是 HashiCorp 创始人，一直从事的是 Server 端开发，并于 23 年退休，但他其实很喜欢编码，想找些有意思的、之前没做过的事情，对他来说这就是：non-infrastructure, non-server side, desktop side, software, 于是就有了 Ghostty

最重要的特色

Fast、cross-platform、native

如何定义一个终端快

读文件（cat、tailf）、输入延迟、渲染速度（frame rate）

如何实现

- 原生应用、针对不同平台做特定优化，比如 ARM 平台的特定指令，Intel 上的 SIMD 指令
- 渲染层面，在 Mac 上使用 Metal 框架（很有少终端支持，目前有 iTerm2 支持，但在开启连字符时则会禁用），在 Linux 上使用 OpenGL

畅想终端的功能边界

扩展终端的能力，能不能直接在终端里打开 HTML 文档、PDF 文档？为什么要离开终端？

Tmux

是一种嵌套的终端，而且可能限制终端的能力，一个好的终端应该直接集成它的能力。但目前来说，Tmux 的功能没有替代者。

Ghostty 项目的未来

libghostty，虽然现在只有 Linux/Mac 版本，但可以基于这个 core 模块开发 Windows 版本

最想从 ghostty 获得什么

影响力

为什么不直接开源

陪两岁半的女儿！不希望自己有太大压力，毕竟人家已经没有经济困扰。

Ghostty 为什么选择 Zig？

因为 Zig 写起来很有趣，Rust 也是门好语言，但写起来乐趣要少些

Ghostty 对 Zig 的影响

编译器稳定性，core team 的人用 ghostty 来测试是否出现问题。包管理器就是 Mitchell 给 Andrew 提的需求，便于在 Linux 上分发（apt、yum 之类）

开发 Ghostty 过程中遇到最棘手的问题是什么？

- 开发 Ghostty 70% 的时间花在了字体渲染上
- 如何选一个默认字体！
- 配置文件格式的选择，目前 Ghostty 采用的是最最简单的 `key = value` 的格式，这样的好处是配置文件和命令行参数保持一致，而且这种方法解析也非常快，只需要遍历一遍配置文件即可。

体验要不要和 Warp 一样，劫持某些按键来达到快速移动光标的效果？

虽然方便，但可能会破坏 TUI 的使用，NeoVim 在 Ghostty 中的体验最好（代码高亮漂亮😍）！

发布 1.0 正式版的 block 点

好看的图表；搜索没有实现，这可能是大多数人最希望的功能，但 1.0 大概率不会有了

Ghostty 到底好在哪里？

就像 Apple 的 Retina 屏一样，你只有用上了才知道什么叫舒服！

## 总结

听完整期播客，深刻感受到 Mitchell 的激情以及不断打破边界的勇气与能力，为什么终端就只能支持纯文本？为什么不能直接把一个纯文本文件拖到终端里打开？

虽然 Ghostty 目前还没正式发版，但感兴趣的读者可以发邮件给我，我可以把 Mac 版的应用程序发给你，可通过 `ghostty +show-config --docs --default` 命令查看详细的配置文档。

最后，Thank Mitchell！❤️