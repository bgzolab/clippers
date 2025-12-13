---
comments: true
created: '2025-09-30T13:59:33.703'
draft: true
modified: '2025-09-30T13:59:33.703'
source: https://www.cnblogs.com/BNTang/p/19114832
title: B站油管抖音一键笔记 - BNTang - 博客园
type: archive-web
---

在最近，我有一个需求就是需要对视频内容进行一个总结，做成一个笔记，但是又不想自己手动去写，于是我找到了一个项目 BiliNote，BiliNote 是一个开源的 AI 视频笔记助手，支持通过哔哩哔哩、YouTube、抖音等视频链接，自动提取内容并生成结构清晰、重点明确的 Markdown 格式笔记。支持插入截图、原片跳转等功能。

## 体验地址
- https://www.bilinote.app(暂不可用)
[https://www.bilinote.app](\"https://www.bilinote.app\")
注意：由于项目部署在 Cloudflare Pages，访问速度可能存在一些问题，请耐心等待。

## Windows 版本
本项目提供了 Windows 系统的 exe 文件，可在 GitHubrelease进行下载。

- https://github.com/JefferyHcool/BiliNote/releases/tag/v1.1.1
[https://github.com/JefferyHcool/BiliNote/releases/tag/v1.1.1](\"https://github.com/JefferyHcool/BiliNote/releases/tag/v1.1.1\")


请注意，Windows 版本的已经落后于最新版本，建议根据下文的部署教程自行部署，或使用体验地址进行体验。也可以自己重新打包。

## BiliNote 功能特性
- 支持多平台：Bilibili、YouTube、本地视频、抖音、快手等平台（持续开发中...）
- 支持返回笔记格式选择
- 支持笔记风格选择
- 支持多模态视频理解
- 支持多版本记录保留
- 支持自行配置 GPT 大模型
- 本地模型音频转写（支持 Fast-Whisper）
- 自动生成结构化 Markdown 笔记
- 可选插入截图（自动截取）
- 可选内容跳转链接（关联原视频）
- 任务记录与历史回看
## 截图预览






## 本地运行
环境要求:

- Python 3.10+：https://www.python.org/downloads/
- Node.js 18+：https://nodejs.org/zh-cn
- ffmpeg：https://ffmpeg.org/download.html
- conda：https://anaconda.org/anaconda/conda
[https://www.python.org/downloads/](\"https://www.python.org/downloads/\")
[https://nodejs.org/zh-cn](\"https://nodejs.org/zh-cn\")
[https://ffmpeg.org/download.html](\"https://ffmpeg.org/download.html\")
[https://anaconda.org/anaconda/conda](\"https://anaconda.org/anaconda/conda\")
## Docker 快速部署
环境要求：

- Docker：https://www.docker.com/
- Docker Compose：https://docs.docker.com/compose/install/
[https://www.docker.com/](\"https://www.docker.com/\")
[https://docs.docker.com/compose/install/](\"https://docs.docker.com/compose/install/\")
这里分为两个版本，最新版即 Github 版本，该版本需要 docker-compose 构建镜像，稳定版即已经构建好的版本。

最新版：

稳定版:

## 访问
部署成功后，访问http://localhost:3015或.env文件中配置的FRONTEND_PORT所指定的端口，即可访问 BiliNote。

[http://localhost:3015](\"http://localhost:3015\")
若端口已被占用，可在.env文件中修改FRONTEND_PORT的值并重新部署。



## BiliNote 当前支持平台
- YouTube
- 哔哩哔哩（Bilibili）
- 抖音（Douyin）
- 快手（Kuaishou）
- 本地视频文件上传（支持.mp4等格式，可修改源码进行支持音频转写）