---
comments: true
created: '2025-10-16T10:03:05.923'
draft: true
modified: '2025-10-16T10:03:05.923'
source: https://www.cnblogs.com/hayaso/p/18869604
title: Astro前端框架踩的坑-1 - EricS9999 - 博客园
type: archive-web
---

Astro可以选择SSG和SSR两种模式：

SSG模式（Static Site Generation)\n本地生成html上传到静态服务器，所以构建时（npm run build）就需要在本地就预先生成路径并生成对应的html页面上传\n本地构建时路径需要预定义：使用getStaticPaths（）明确列出\nAstro根据getStaticPaths（）返回的路径生成对应的静态html文件

SSG模式下的[slug].astro示例：

SSR模式（Server-Side Rendering）\nserver端生成html，所以就不需要构建，也就不需要路径\n路径不需要预定义，Astro是使用内容集合的方式来获取本地的md文件数据并以此进行数据匹配，需要进行内容格式的定义defineCollection

- 设置内容集合
1. 定义集合配置：在 src/content/config.ts 文件中，使用 defineCollection 和 z（来自 astro:content）定义内容集合和前言（frontmatter）结构。
1. 组织 Markdown 文件：将 .md 文件放置在 src/content/blog/ 目录下，每个文件代表一篇文章，并包含符合上述 schema 的 frontmatter。
- 在 SSR 模式下动态获取内容\n在 SSR 模式下，在动态路由页面（如 src/pages/blog/[slug].astro）中，根据请求的 slug 参数动态获取对应的 Markdown 内容。astro页面：
在上述示例中：\n•\tgetEntry('blog', slug)：根据 slug 动态获取对应的 Markdown 内容。也就是[slug].astro或者[...slug].astro中的slug值，这个是从客户访问路径获取，比如访问\nwww.xxx.com/blog/post-1,那么这个post-1就是slug的值，会传递到[slug].astro页面上\n•\tentry.render()：将 Markdown 内容渲染为 HTML。\n•\tAstro.params.slug：获取 URL 中的 slug 参数。

请注意，export const prerender = false; 表示该页面在构建时不会被预渲染，而是在每次请求时动态生成。

Astro 的内容集合允许组织和管理项目中的内容文件（如 Markdown 文件）。每个内容项都有一个唯一的标识符 id，通常是文件名（不包括扩展名）。可以使用 getEntry() 函数通过集合名称和 id 获取特定的内容项。

Astro中有些逻辑很奇怪，比如为什么要设置两种甚至多种路径的获取方式，比如完全可以同一路径逻辑输入，输出不同结果即可，徒添不必要的学习成本