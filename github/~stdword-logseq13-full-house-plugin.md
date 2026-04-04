---
title: stdword/logseq13-full-house-plugin
aliases: logseq13-full-house-plugin
created: 2024-08-22T12:00:00
modified: 2025-01-19T12:38:07
description: Logseq Templates you will really love ❤️ 🏛️
source: https://github.com/stdword/logseq13-full-house-plugin
tags:
  - logseq
  - github/star
type: repo
---

![](https://img.shields.io/github/stars/stdword/logseq13-full-house-plugin?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/stdword/logseq13-full-house-plugin?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/stdword/logseq13-full-house-plugin?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=stdword&repo=logseq13-full-house-plugin&bg_color=00000000)](https://github.com/stdword/logseq13-full-house-plugin)

## Notes


## Documents
### [Tutorial](https://stdword.github.io/logseq13-full-house-plugin/#/tutorial)
- **模板使用**：`{{renderer :template, xxx }}` 语法广泛，可以能支持引用与页面，就算没有声明模板，也可以直接套用，默认是带父级元素的，可以用 `-` 去除
  - `{{renderer :template, - ((64004111-...)) }}`
  - `{{renderer :template, + [[page name]] }}`
- **上下文**：比较重要的一个变量是 `c`，它代表上下文 (context)，拥有四个成员变量，`c.block`、`c.page`、`c.template`、`c.self`，使用的语法比较特别：

```
``c.page.name``
```

  - 上下文不连贯条件支持，直接看 Demo，玩得比较转，有点抽象

```
- template: if-logic
- ``{ !
          if ((c.page.propsRefs.tags || []).includes('book')) {
              let [ authors, title ] = c.page.name.split(' — ', 2)
              authors = authors.split(', ').map(ref)
   }``
  name: ``title``
  authors: ``authors.join('; ')``
  ``{ !
          } else logseq.App.showMsg('The page is not a book', 'info', {timeout: 3000})
   }``
```

- **属性访问**：使用名空间 `props`(如果需要引用，可以使用 `propsRefs`)
  - 有一点疑问是，模板名字 template.name 是在二级挂着，为什么其他属性要挪到 props 三级呢？全挂在二级不更好吗？
- **日期访问**：依赖于模块 https://day.js.org/, 可以使用绝大多数变量，如 `date.now`、`date.yesterday`、`date.tomorrow`，如果需要引用，可以用 `ref()`；格式化日期可以用 `.format()`；
- **JS 环境**：本质上，以上的变量大都支持 JS 的 API，比如字符串可以切片，日期可以格式化，全都是 JS 的 API，甚至是 lambda 表达式；

### [Commands](https://stdword.github.io/logseq13-full-house-plugin/#/reference__commands)
- 命令有两种：模板、视图（行内视图），前者如教程第一点所属，后者位实时渲染，暂时不清楚试图有什么用处；

## [Logseq Templates you will really love ❤️](https://github.com/stdword/logseq13-full-house-plugin)
- [Any way to get variables' value in custom commands? - #7 by Roby_Ho - Questions & Help - Logseq](https://discuss.logseq.com/t/any-way-to-get-variables-value-in-custom-commands/15994/7)
- [danxiangli/index.html at main · yhkang/danxiangli · GitHub](https://github.com/yhkang/danxiangli/blob/main/index.html)
- Insert image by year
- ![[]]
template: insert image by year
template-including-parent: true
- https://stdword.github.io/logseq13-full-house-plugin/#/reference__configuring?id=default-usage
- template: Name
template-usage: :age 21
title: " 尺之木必有节目, 寸之玉必有瑕瓋 "
template-including-parent: true
- 尺之木必有节目, 寸之玉必有瑕瓋 "
- `{{renderer :template, Name, :age 21}}`
- 尺之木必有节目, 寸之玉必有瑕瓋 "
- template-usage: :age 21
title: " 尺之木必有节目, 寸之玉必有瑕瓋 "
- 尺之木必有节目, 寸之玉必有瑕瓋 "
