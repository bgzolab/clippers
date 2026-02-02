---
comments: true
created: '2026-01-31T23:24:52'
draft: true
modified: '2026-01-31T23:24:52'
source: https://sspai.com/prime/story/on-dsstore
title: 再谈 .DS_Store：兼论 Windows 与 macOS Finder 的布局理念差异
type: archive-web
---

本文希望从 .DS_Store 出发，基于与 Windows 平台下的类似文件 Desktop.ini 和 Thumbs.db 的对比，论述 Finder
与 Windows 资源管理器在某些设计方面的差异。

## 引

你是否在 Windows 与 macOS 之间频繁切换工作、互传数据？你是否拥有 NAS 并且局域网内同时存在 Mac 和 PC
访问其资源？或者，你是否拥有一位使用 Mac 的朋友、同事、同学，并使用储存介质在他们的 Mac 上拷贝过文件？如果满足上述任一条件，那么你应该大概率见过
.DS_Store 文件。

如果你进入互联网搜索 .DS_Store 文件，扑面而来的却可能是大量「讨伐」.DS_Store 的声音。主流的搜索结果包括「如何删除 .DS_Store
文件」「如何阻止 .DS_Store 生成」「如何在项目/仓库中排除 .DS_Store」「.DS_Store 文件清理工具」等等。

可以说，大多数搜索结果以及针对 .DS_Store 的批评意见其，实围绕着 .DS_Store 文件本身展开，而「.DS_Store」与产生这一文件的
macOS Finder 之间的关联却常常被人忽视。抛开 Finder 谈 .DS_Store 就如同抛开前提条件谈问题——在很大程度上失去讨论问题的意义。

因此，本文希望从 .DS_Store 出发，基于与 Windows 平台下的类似文件 Desktop.ini 和 Thumbs.db 的对比，论述
Finder 与 Windows 资源管理器在某些设计方面的差异。

## 概述

在开始 macOS 的 Finder 与 Windows 资源管理器的比较前，这里还是有必要对本文将要讨论的几个对象做出简要概述。

首先是 .DS_Store 文件，其英文全称为 Desktop Services Store（桌面服务存储），诞生于 1999 年 Mac OS X
Finder 重写时期。这是一种由 macOS 自动创建的隐藏文件，本质上是一个采用 B-树（B-tree）结构的专有二进制文件。它主要用于存储
Finder 文件夹的自定义属性与元数据，这些数据通常无法直接由文件系统本身记录，例如用于记录图标位置的 `Iloc`、用于存储 Finder
注释（Finder Comments）的 `cmmt`、以及文件夹背景图片 `BKGD` 等。

![](https://cdnfile.sspai.com/2026/01/16/f3735ffe9648f2e541db0db3c43925d1.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

第二是 Desktop.ini 文件。这是一种隐藏的受保护 Windows 系统配置文件
(*.ini)。它用于存储所在文件夹的自定义设置，包括图标、显示名称 (本地化名称) 或文件夹说明等。

![](https://cdnfile.sspai.com/2026/01/16/877c92e5c20b49968afd22a4c3af3402.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

最后是 Thumbs.db 文件。Thumbs（缩写自 thumbnails）即缩略图数据库，这是一种 Windows 系统文件，采用 OLE
复合文档结构。它用于储存文件夹中图像和视频的缩略图预览缓存，以加速 Windows 资源管理器对缩略图的加载。

可见，在 Windows 中，功能设计上与 .DS_Store 更相近的则应该是 Desktop.ini（尽管它的出现频率没有 Thumbs.db
那么高）。

## 基础差异比较

既然 Windows 中也有 Desktop.ini 与 .DS_Store，那么为什么对于移除 .DS_Store
的需求更为突出，甚至视其为垃圾文件呢？这里笔者认为主要有以下几点因素，包括生成策略以及隐藏文件策略的差异。

### 生成策略

生成策略直接决定了文件是否会频繁出现。虽然 Apple 并未公开其完整技术文档，但根据日常观察和逆向工程的研究，.DS_Store 的生成策略极为激进。

一方面，.DS_Store 是跟随文件夹的，每个文件夹都会产生自己的 .DS_Store。

另一方面，打开文件夹、修改视图、排列、文件夹窗口大小和位置等大多数操作都有可能触发文件夹下 .DS_Store 的生成。

（一些例外情况包括：在仅包含文件而不存在次级文件夹目录的文件夹中调整设置并不会使 .DS_Store
生成；在部分采用非日志式文件系统的外置存储介质上，调整文件夹的配置不会生成 .DS_Store。）

相比之下，Desktop.ini 文件虽然也是跟随文件夹的，但其生成策略要保守得多。

根据日常观察，Desktop.ini 主要常见于用户目录下几个系统预置的文件夹中，如桌面、下载、文档等。这是因为 Windows
为这些特殊文件夹定制了图标和本地化名称，必须通过 Desktop.ini 记录。

而在普通文件夹中，单纯修改视图或排列方式往往不会生成 Desktop.ini——Windows
资源管理器似乎更倾向于在注册表或系统盘的特定位置中心化地存储这些配置。因此，普通用户在日常文件操作中遇到 Desktop.ini 的频率远低于
.DS_Store。

![](https://cdnfile.sspai.com/2026/01/16/621d15eb62fcff590e43b6d9444070e2.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1) 某个 Desktop.ini 文件中记录的信息

至于 Thumbs.db，在 Windows 早期版本中确实随文件夹存储，但自 Windows Vista 起，缩略图缓存已被改为中心化存储在用户的
AppData 目录下（文件名为 thumbcache_xxx.db）。这一改变使得该文件淡出了普通用户的视野。

![](https://cdnfile.sspai.com/2026/01/16/51da8d7fc672055b0848085045ccbafd.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1) 上述目录与其中的文件

### 隐藏文件策略

隐藏文件的展示策略也是影响用户感知的关键因素。macOS 默认不显示以点号开头的文件，而在 Windows 上，用户开启「显示隐藏文件」后即可看到
.DS_Store。但「显示隐藏文件」并不会展示
Desktop.ini，因为后者还被标记为「受保护的操作系统文件」，需要更深层级的设置才能取消隐藏。因此，如果用户经常在 macOS 与 Windows
间交换数据，对 .DS_Store 文件的感知还会更加强烈。

![](https://cdnfile.sspai.com/2026/01/16/908df9c9d999688251676a6ce1d10db6.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)
![](https://cdnfile.sspai.com/2026/01/16/93fb6cfb674b8b8fcd928d0c84250f3e.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1) 二次确认对话框
![](https://cdnfile.sspai.com/2026/01/16/f842db22f7cb036f50c69bb47a0fe456.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1) ls -a 呈现的目录下所有项目

## 设计差异比较

然而，要正确评价 .DS_Store 或是 Desktop.ini，我们不可能脱离产生它们的平台孤立地看待问题，而是要落脚到 macOS 访达与
Windows 资源管理器的设计哲学比较上。

Windows
的资源管理器是一个有边界的、强调秩序的内容呈现窗口。在窗口内，所有内容均强制按照某种特定的顺序（如名称、日期、类型）排列，并严格对齐网格。资源管理器仅有一个例外，那就是桌面。只有在桌面上同时取消「自动排列图标」和「将图标与网格对齐」后，图标才可以像画布一样自由放置。

这种设计导致 Windows 文件夹在拷贝到另一台电脑时，虽然会丢失视图配置，但也保证了文件夹状态的「相对干净」和展示逻辑的统一性。