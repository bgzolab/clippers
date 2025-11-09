---
draft: true
aliases:
  - Mac 自带截屏软件将截图保存到剪切板之后，如何从剪切板保存到访达？
created: 2025-08-10T09:11:40
modified: 2025-08-10T09:11:46
source: "https://www.v2ex.com/t/811634"
tags: []
title: Mac 自带截屏软件将截图保存到剪切板之后，如何从剪切板保存到访达？
type: "archive-web"
---
# Mac 自带截屏软件将截图保存到剪切板之后，如何从剪切板保存到访达？

自带的截屏软件可以设置保存路径，我的使用习惯是一般存到剪切板使用，但是有时候也会想把截图存下来，有没有办法可以把剪切板里的照片直接保存到访达中呢？

## Comment

> 没有。
Finder 只有个「显示剪贴板」内容的菜单在「编辑」下。只能看，不支持保存到文件。
pbpaste 命令也只支持保存剪贴板里的文本，不支持图片。
只能经过其他软件读取剪贴板的图片然后保存文件，例如微信、QQ 、图床 web 等。
系统自带的「预览」支持从剪贴板新建文件然后保存。
也有个专门干这事的工具叫 pngpaste : [https://github.com/jcsalterego/pngpaste](https://github.com/jcsalterego/pngpaste)
