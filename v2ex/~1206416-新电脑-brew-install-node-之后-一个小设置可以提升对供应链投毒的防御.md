---
comments: true
created: '2026-04-16T19:17:30'
draft: true
modified: '2026-04-16T19:17:30'
source: https://www.v2ex.com/t/1206416
title: 新电脑 brew install node 之后，一个小设置可以提升对供应链投毒的防御
type: archive-web
---

vi ~/.npmrc

然后在里面加入这行：

```
min-release-age=7
```