---
title: "nihaojob/markdown-css-smartisan"
aliases: markdown-css-smartisan
released: 2021-03-15T23:27:20Z
modified: 2026-05-23T18:11:52
created: 2026-05-23T18:11:52
description: "按照锤子便签调整的markdown-css 主题。"
source: "https://github.com/nihaojob/markdown-css-smartisan"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/nihaojob/markdown-css-smartisan?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/nihaojob/markdown-css-smartisan?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/nihaojob/markdown-css-smartisan?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=nihaojob&repo=markdown-css-smartisan&bg_color=00000000)](https://github.com/nihaojob/markdown-css-smartisan)


# markdown-css-smartisan

按照锤子便签调整的markdown-css 主题。

## README

# markdown-css-smartisan

> 一个基于锤子便签的markdown主题。

[体验编辑器](https://nihaojob.github.io/markdown-css-smartisan/examples/index.html)
[<img src="https://raw.githubusercontent.com/nihaojob/markdown-css-smartisan/main/editor.png" width="100%">](https://nihaojob.github.io/markdown-css-smartisan/examples/index.html)

Markdown 主题
[<img src="https://nihaojob.github.io/markdown-css-smartisan/demo.png" width="100%">](https://nihaojob.github.io/markdown-css-smartisan)


## [Demo](https://nihaojob.github.io/markdown-css-smartisan)
可以[体验编辑器](https://nihaojob.github.io/markdown-css-smartisan/examples/index.html)
, 或[预览](https://nihaojob.github.io/markdown-css-smartisan)我们的主题，和[锤子便签](https://yun.smartisan.com/apps/note/md.html)对比一下。

## Install

Download [manually](https://github.com/nihaojob/https://nihaojob.github.io/markdown-css-smartisan/blob/main/github-markdown.css), from [CDNJS](https://cdn.jsdelivr.net/npm/markdown-css-smartisan/github-markdown.css), or with npm or yarn:

```shell
# use npm
$ npm install markdown-css-smartisan
# use yarn
$ yarn add markdown-css-smartisan
```

## Usage



```bash
import 'markdown-css-smartisan'
```
Import the `github-markdown.css` file and add a `markdown-body` class to the container of your rendered Markdown and set a width for it.

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/markdown-css-smartisan/github-markdown.css" />
<style>
.markdown-body {
  width: 80%;
  margin: 0 auto;
}

</style>
<article class="markdown-body">
	<h1>Unicorns</h1>
	<p>All the things</p>
</article>
```

If you want code syntax highlighted, use GitHub Flavored Markdown rendered from [GitHub's `/markdown` API](https://docs.github.com/en/free-pro-team@latest/rest/reference/markdown).

## How

See [`generate-github-markdown-css`](https://github.com/sindresorhus/generate-github-markdown-css) for how it's generated and ability to generate your own.

<!-- ## Dev

Run `npm run make` to update the CSS. -->


## Notes

