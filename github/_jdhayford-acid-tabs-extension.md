---
title: "jdhayford/acid-tabs-extension"
aliases: acid-tabs-extension
released: 2021-05-03T00:41:29Z
modified: 2026-05-23T18:11:52
created: 2026-05-23T18:11:52
description: "Chrome extension for auto-grouping tabs by URL patterns"
source: "https://github.com/jdhayford/acid-tabs-extension"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/jdhayford/acid-tabs-extension?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/jdhayford/acid-tabs-extension?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/jdhayford/acid-tabs-extension?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=jdhayford&repo=acid-tabs-extension&bg_color=00000000)](https://github.com/jdhayford/acid-tabs-extension)


# acid-tabs-extension

Chrome extension for auto-grouping tabs by URL patterns

## README

# Acid Tabs

Store Link - https://chrome.google.com/webstore/detail/acid-tabs/hgceopemmcmigbmhphbcgkeffommpjfc

## Feature Requests

If you have any feature requests for the Acid Tabs chrome extension, please submit an Issue describing the feature and use case. Please do this before you consider opening up a pull request for any changes that would largely impact the UX as I'd prefer to discuss that on an issue first.

## General Organization

Popup - https://github.com/jdhayford/acid-extension/tree/master/src/pages/Popup

Contains React interface logic to allow users to create and modify rules. These rules are persisted in chrome's sync storage.

Background - https://github.com/jdhayford/acid-extension/tree/master/src/pages/Background

In charge of orchestrating actual tab groups, including grouping/ungrouping tags, updating order, colors and names of groups.

## Local Dev

To run and use the extension locally:

**Note:** Use Node version 10

```
npm install
npm start
```

This should start a webpackdev server and creates a local `build/` folder with the proper source files. You can then select this folder from the "Manage Extensions" page on chrome, activate the developer settings and "Load Unpacked Extension".

### Credits

Shoutout to @lxieyang for creating one of my favorite chrome extension boilerplates out there https://github.com/lxieyang/chrome-extension-boilerplate-react





## Notes

