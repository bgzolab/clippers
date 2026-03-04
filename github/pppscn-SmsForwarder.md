---
draft: true
aliases:
  - "SmsForwarder"
  - SmsForwarder
created: 2025-10-31T05:45:45
description: "短信转发器——监控Android手机短信、来电、APP通知，并根据指定规则转发到其他手机：钉钉群自定义机器人、钉钉企业内机器人、企业微信群机器人、飞书机器人、企业微信应用消息、邮箱、bark、webhook、Telegram机器人、Server酱、PushPlus、手机短信等。包括主动控制服务端与客户端，让你轻松远程发短信、查短信、查通话、查话簿、查电量等。（V3.0 新增）PS.这个APK主要是学习与自用，如有BUG请提ISSUE，同时欢迎大家提PR指正"
modified: 2025-10-31T06:59:49
source: "https://github.com/pppscn/SmsForwarder"
title: SmsForwarder
type: "repo"
---
# SmsForwarder

![](https://img.shields.io/github/stars/pppscn/SmsForwarder?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/pppscn/SmsForwarder?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/pppscn/SmsForwarder?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=pppscn&repo=SmsForwarder&bg_color=00000000)](https://github.com/pppscn/SmsForwarder)

## 设置

1. 应用详情 > 允许敏感权限
2. 设置里面把权限全部打开

## 短信转发模板

```text
#短信转发 {{DEVICE_NAME}} {{BATTERY_PCT}} {{RECEIVE_TIME}}
From {{FROM}} to {{CARD_SLOT}}

{{SMS}}
```
