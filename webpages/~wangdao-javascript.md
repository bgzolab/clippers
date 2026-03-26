---
title: JavaScript 教程
aliases:
  - JavaScript 教程
created: 2026-03-26T22:29:57
modified: 2026-03-26T22:30:32
comments: true
draft: true
description:
source: "https://wangdoc.com/javascript/"
tags: []
type: "archive-web"
---

# JavaScript 教程

- 1. 入门篇
- 2. 数据类型
- 3. 运算符
- 4. 语法专题
- 5. 标准库
- 6. 面向对象编程
- 7. 异步操作
- 8. [[dom]]
  - 概述
    - Rather than **接口规范**; 只不过 [[javascript]] 操作地比较多
    - DOM 作用
      - 将网页转为一个 JavaScript 对象，从而可以用脚本进行各种操作 (增删内容)
    - [[browser]]
      - 根据 DOM 模型，将结构化文档 (比如 HTML 和 XML) 解析成一系列的节点，再由这些节点组成一个树状结构 (DOM Tree)。所有的节点和最终的树状结构，都有规范的对外接口
    - Node (7)
      - `Document` ：整个文档树的顶层节点
      - `DocumentType` ： `doctype` 标签（比如 `<!DOCTYPE html>` ）
      - `Element` ：网页的各种 HTML 标签（比如 `<body>` 、 `<a>` 等）
      - `Attr` ：网页元素的属性（比如 `class="right"` ）
      - `Text` ：标签之间或标签包含的文本
      - `Comment` ：注释
      - `DocumentFragment` ：文档的片段
    - Node Tree
  - Node 接口
  - NodeList 接口，HTMLCollection 接口
  - ParentNode 接口，ChildNode 接口
  - Document 节点
  - Element 节点
  - 属性的操作
  - Text 节点和 DocumentFragment 节点
  - CSS 操作
  - Mutation Observer API
- 9. 事件
- 10. 浏览器模型
- 11. 附录：网页元素接口
