---
aliases: [chawyehsu/lxgw-wenkai-webfont, lxgw-wenkai-webfont]
created: 2025-07-02T22:43:17
description: webfont package for the LXGW WenKai typeface
modified: 2025-07-02T22:48:05
source: https://github.com/chawyehsu/lxgw-wenkai-webfont
tags:
  - github/star
  - fonts
title: chawyehsu/lxgw-wenkai-webfont
type: repo
---
# chawyehsu/lxgw-wenkai-webfont

![](https://img.shields.io/github/stars/chawyehsu/lxgw-wenkai-webfont?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/chawyehsu/lxgw-wenkai-webfont?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/chawyehsu/lxgw-wenkai-webfont?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=chawyehsu&repo=lxgw-wenkai-webfont&bg_color=00000000)](https://github.com/chawyehsu/lxgw-wenkai-webfont)

## 加载速度过慢 #issue/wontfix

总耗时 2.1 min 😅

![](https://img.bgzo.cc/2025/202507022245505.png)

对比 [Noto Serif Simplified Chinese - Google Fonts](https://fonts.google.com/noto/specimen/Noto+Serif+SC/about) 6s (当然也很慢)

![](https://img.bgzo.cc/2025/202507022246383.png)

一开始从 [Chrome 版 WebFeed 简介](https://taoshu.in/webfeed/webfeed-for-chrome.html) 发现的, 它网站的加载速度更慢...

---

- 仓库维护四个版本的字体：
	- `lxgw-wenkai-webfont`
	- `lxgw-wenkai-lite-webfont`
	- `lxgw-wenkai-tc-webfont`
	- `lxgw-wenkai-screen-webfont`

测试用的是 Screen 版本, 总共 10 M, 对比原版需要 30M, 感觉只有 Build-in App 才会用, 但这不标榜 Webfont 吗? Build-in 我直接去哪原版了, 来这里做什么?

作者应该是下了幸苦, 按一定分区大小进行划分, 每个包差不多 50 多 K, 合在一起的 CSS 差不多 100 多 K, 但是要全部包加载完才能渲染完, 2 分钟内一直在下载状态就非常不能忍;
