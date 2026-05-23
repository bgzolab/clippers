---
title: "wxt2005/bangumi-list"
aliases: bangumi-list
released: 2015-06-23T23:29:08Z
modified: 2026-05-23T18:11:52
created: 2026-05-23T18:11:52
description: "大陆版权新番播放地址聚合站 V2"
source: "https://github.com/wxt2005/bangumi-list"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/wxt2005/bangumi-list?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/wxt2005/bangumi-list?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/wxt2005/bangumi-list?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=wxt2005&repo=bangumi-list&bg_color=00000000)](https://github.com/wxt2005/bangumi-list)


# bangumi-list

大陆版权新番播放地址聚合站 V2

## README

# [番组放送](http://bgmlist.com/) v2

新番放送兼版权引进播放地址聚合站

放送时间数据源：http://www.kansou.me

## Attention

本站点的数据已分离至单独的 Repository 维护，请需要大陆新番放送站点数据的同学们移步至：[bangumi-data](https://github.com/bangumi-data/bangumi-data)

从 2017 年 1 月开始，本目录下的 json 数据将不会再更新，视情况而定也可能会删除，谢谢大家的理解。

## deploy

```sh
npm install
cp src/js/_config.js src/js/config.js
npm run deploy
```

会在目录下生成 `dist` 文件夹和 `index.html` 文件。

## dev

### live development

```sh
npm run start
```

然后在浏览器中打开 http://localhost:8090/test.html 即可

## special thanks to
感谢 [@parameciumzhe](https://twitter.com/parameciumzhe) 提供的设计建议和优化方案


## Notes

