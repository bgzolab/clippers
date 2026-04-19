---
title: Kazumi
aliases:
  - Kazumi
  - Predidit/Kazumi
created: 2025-04-13T19:25:23
modified: 2026-04-19T16:36:45
description: 基于自定义规则的番剧采集APP，支持流媒体在线观看，支持弹幕，支持实时超分辨率。
source: https://github.com/Predidit/Kazumi
tags:
  - github/star
  - tool/using
---

# Kazumi

![](https://img.shields.io/github/stars/Predidit/Kazumi?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/Predidit/Kazumi?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/Predidit/Kazumi?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=Predidit&repo=Kazumi&bg_color=00000000)](https://github.com/Predidit/Kazumi)

## IPA 测载

因为默认没有签名，所以无法正常用 Sidestore 或者 Altserver 测载，报错：

```shell
/Users/rileytestut/iCloud Drive (Archive)/Documents/Developer/Projects/AltStore/Dependencies/AltSign/AltSign/ldid/../../Dependencies/ldid/ldid.cpp(1354): _assert(): end >= size - 0x10
```

但是可以用 Live Container via:

- https://github.com/Predidit/Kazumi/issues/819
- https://github.com/altstoreio/AltStore/issues/1034#issuecomment-1998081907
- https://github.com/khcrysalis/Feather

## Waiting feature:

1. [ ] 接入 [[bangumi]]，via: https://github.com/Predidit/Kazumi/issues/912
	1. 这破玩意绝对能做，用 AccessToken 就是发一个请求的事情，完全不需要处理 Oauth 的问题
