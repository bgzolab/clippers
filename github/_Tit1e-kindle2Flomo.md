---
title: "Tit1e/kindle2Flomo"
aliases: kindle2Flomo
released: 2021-05-22T07:55:42Z
modified: 2026-05-23T18:11:52
created: 2026-05-23T18:11:52
description: "Kindle、Apple Books、微信读书书摘与笔记导入至 flomo"
source: "https://github.com/Tit1e/kindle2Flomo"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/Tit1e/kindle2Flomo?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/Tit1e/kindle2Flomo?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/Tit1e/kindle2Flomo?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=Tit1e&repo=kindle2Flomo&bg_color=00000000)](https://github.com/Tit1e/kindle2Flomo)


# kindle2Flomo

Kindle、Apple Books、微信读书书摘与笔记导入至 flomo

## README

# Send2flomo

![kindle2flomo downloads](https://img.shields.io/github/downloads/Tit1e/kindle2Flomo/total)
&nbsp;&nbsp;&nbsp;&nbsp;
![](https://img.shields.io/badge/license-GPL-green.svg)
&nbsp;&nbsp;&nbsp;&nbsp;
[![](https://img.shields.io/badge/即刻-@直走的螃蟹-FFE440.svg)](https://web.okjike.com/u/FFDB1E46-63DC-43BE-AA1A-36F3D9CD0017)

### 将 Kindle、Apple Books、KOReader、微信阅读笔记一键导入至 flomo

[中文](./README.md) | [English](./README_en_US.md)

## 预览
![](./screenshot/home.png)

![](./screenshot/help.png)

![](./screenshot/edit.png)

![](./screenshot/reset.png)
## 注册
### [flomo](https://flomoapp.com/register2/?MTAzNDE)

## 网页版（仅支持 html 与 txt 格式导入）
### [Send2flomo](https://tit1e.github.io/kindle2Flomo/)

## Mac 应用下载
### [网盘下载](https://wwr.lanzoui.com/b02c3nkyf) 访问密码：47if
### [Github Releases](https://github.com/Tit1e/kindle2Flomo/releases)

## 问题反馈
![](./screenshot/qrcode.png)


## 开发注意事项
**bplistParser** 这个依赖需手动修改 `maxObjectSize` 与 `maxObjectCount` 这两个常量的数值，修改得大一些，否则当 `Books.plist` 中图书数量过多时会出现无法解析的问题。
```js
exports.maxObjectSize = 1000 * 1000 * 1000;
exports.maxObjectCount = 32768 * 2;
```


## Notes

