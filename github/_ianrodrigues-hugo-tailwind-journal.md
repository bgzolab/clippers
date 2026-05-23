---
title: "ianrodrigues/hugo-tailwind-journal"
aliases: hugo-tailwind-journal
released: 2019-11-15T10:04:57Z
modified: 2026-05-23T18:11:52
created: 2026-05-23T18:11:52
description: "A minimalist journal template for Hugo."
source: "https://github.com/ianrodrigues/hugo-tailwind-journal"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/ianrodrigues/hugo-tailwind-journal?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/ianrodrigues/hugo-tailwind-journal?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/ianrodrigues/hugo-tailwind-journal?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=ianrodrigues&repo=hugo-tailwind-journal&bg_color=00000000)](https://github.com/ianrodrigues/hugo-tailwind-journal)


# hugo-tailwind-journal

A minimalist journal template for Hugo.

## README

# TailwindCSS Journal

_TailwindCSS Journal_ is a minimalist theme for [Hugo](https://gohugo.io) using [TailwindCSS](https://tailwindcss.com).

Based on [Journal](https://dashdashzako.github.io/hugo-journal-demo/), it also focuses on improving reading experience with no fancy effect.

It uses [Chroma](https://gohugo.io/content-management/syntax-highlighting/) for the syntaxic coloration of code snippets.

Demo is available [here](https://ianrodrigues.github.io/hugo-tailwind-journal-demo/).

## Installation

Please refer to the [Hugo documentation](https://gohugo.io/themes/installing/).

## Configuration

A few parameters should be adjusted in the site config:

```toml
baseURL = "https://username.github.io/"
disqusShortname = "username"
googleAnalytics = "UA-XXXXXXXXX-X"
title = "Tailwind Journal"
theme = "hugo-tailwind-journal"
pygmentsCodeFences = true
pygmentsUseClasses = true

[taxonomies]
    tag = "tags"

[permalinks]
    posts = "/posts/:year/:month/:title/"

[params]
    author = "John Doe"
    avatar = "images/avatar.jpg"
    description = "A minimalist journal template for Hugo using TailwindCSS."
    tagline = "A minimalist journal template for Hugo using TailwindCSS."

[languages]
    [languages.en]
        contentDir = "content/english"
        languageCode = "en-us"
        languageName = "🇺🇸 English"
        weight = 1

    [languages.pt-br]
        contentDir = "content/portuguese"
        description = "Um template minimalista para Hugo usando TailwindCSS."
        languageCode = "pt-br"
        languageName = "🇧🇷 Português"
        tagline = "Um template minimalista para Hugo usando TailwindCSS."
        weight = 2

    [languages.de]
        contentDir = "content/german"
        description = "Eine minimalistische Journalvorlage für Hugo mit TailwindCSS."
        languageCode = "de"
        languageName = "🇩🇪 Deutsch"
        tagline = "Eine minimalistische Journalvorlage für Hugo mit TailwindCSS."
        weight = 3
```


## Notes

