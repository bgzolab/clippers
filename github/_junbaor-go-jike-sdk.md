---
title: "junbaor/go-jike-sdk"
aliases: go-jike-sdk
released: 2022-04-10T08:06:32Z
modified: 2026-05-23T17:15:32
created: 2025-06-08T08:17:41Z}
description: "Go 版本的 Jike SDK"
source: "https://github.com/junbaor/go-jike-sdk"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/junbaor/go-jike-sdk?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/junbaor/go-jike-sdk?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/junbaor/go-jike-sdk?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=junbaor&repo=go-jike-sdk&bg_color=00000000)](https://github.com/junbaor/go-jike-sdk)


# go-jike-sdk

Go 版本的 Jike SDK

## README

# go-jike-sdk

Go 版本的 Jike SDK

## Usage
```go
// create client
client := jike.NewJike(areaCode, phone)

// passport login
loginOutput, err := client.UserService.PasswordLogin(content, areaCode, phone, password)

// follower timeline
timeline, err := client.UserService.FollowingTimeline(content, 10, jike.TimelineLoadMoreKey{})
```

## Alternatives
- [jike-cli](https://github.com/junbaor/jike-cli) - 即刻命令行客户端 (Java)
- [jike-sdk](https://github.com/open-jike/jike-sdk) - jike-sdk Ⓙ (Node.js / 浏览器 / Deno)


## Notes

