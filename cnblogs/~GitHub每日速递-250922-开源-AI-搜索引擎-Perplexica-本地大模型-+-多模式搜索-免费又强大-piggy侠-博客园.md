---
created: '2025-09-23T09:10:18.707'
modified: '2025-09-23T09:10:18.707'
source: https://www.cnblogs.com/freedom-w/p/19103694
title: 【GitHub每日速递 250922】开源 AI 搜索引擎 Perplexica：本地大模型 + 多模式搜索，免费又强大！ - piggy侠 - 博客园
type: archive-web
---



原文:https://mp.weixin.qq.com/s/F7KwZlUd5OQg5CbAEbZGug

[https://mp.weixin.qq.com/s/F7KwZlUd5OQg5CbAEbZGug](\"https://mp.weixin.qq.com/s/F7KwZlUd5OQg5CbAEbZGug\")
# MarkItDown：多格式文件转Markdown神器，助力LLM文本分析！
markitdown 是一个将文件和办公文档转换为 Markdown 的工具。简单讲，它能帮你把 Word、Excel 等文档一键转成简洁的 Markdown 格式。适用人群：需要频繁处理文档转换的开发者、技术写作者和内容创作者。

项目地址：https://github.com/microsoft/markitdown

[https://github.com/microsoft/markitdown](\"https://github.com/microsoft/markitdown\")
主要语言：Python

stars: 77.16k

### 仓库核心功能
MarkItDown 是一个轻量级的 Python 工具，主要用于将各种文件转换为 Markdown 格式，以用于大语言模型（LLMs）和相关文本分析管道。它支持多种文件格式的转换，包括 PDF、PowerPoint、Word、Excel、图片、音频、HTML、基于文本的格式（如 CSV、JSON、XML）、ZIP 文件、Youtube 链接、EPubs 等。

### 优势
- 保留文档结构：与 textract 相比，MarkItDown 更注重将重要的文档结构和内容保留为 Markdown 格式，如标题、列表、表格、链接等。
- 适合文本分析：输出的 Markdown 内容虽然也具有一定的可读性，但主要是为文本分析工具设计的。
- Markdown 的优势：Markdown 接近纯文本，标记和格式最少，主流的大语言模型（如 OpenAI 的 GPT - 4o）原生支持 Markdown，并且在训练中接触过大量 Markdown 格式的文本，理解能力强，同时 Markdown 约定在处理时具有较高的令牌效率。
### 可能的应用场景
- 文本分析：将各种文件转换为 Markdown 后，可以方便地输入到文本分析工具中进行处理，如情感分析、主题建模等。
- 大语言模型交互：为大语言模型提供结构化的输入，以便更好地理解文档内容。
### 关键信息
### 前提条件
- 需要 Python 3.10 或更高版本。
- 建议使用虚拟环境来避免依赖冲突，并给出了标准 Python 安装、uv 和 Anaconda 创建虚拟环境的方法。
### 安装
- 可以使用pip install 'markitdown[all]'进行安装。
- 也可以从源代码安装，先克隆仓库，再使用pip install -e 'packages/markitdown[all]'进行安装。
### 使用方法
- 命令行：支持直接指定输入文件并输出到 Markdown 文件，也可以使用o指定输出文件，还支持管道输入。
- 可选依赖：可以根据需要单独安装特定文件格式的依赖，如pip install 'markitdown[pdf, docx, pptx]'。
- 插件：支持第三方插件，默认禁用，提供了列出和启用插件的命令，可在 GitHub 搜索#markitdown - plugin查找可用插件，开发插件可参考packages/markitdown - sample - plugin。
- Azure 文档智能服务：可使用 Microsoft 文档智能服务进行转换，需要提供端点信息。
- Python API：提供了基本的 Python 使用示例，包括是否启用插件、使用文档智能服务和使用大语言模型进行图像描述的示例。
- Docker：提供了 Docker 构建和运行的命令。
# 开源AI搜索引擎Perplexica来袭！支持本地大模型，多模式搜索超强大
Perplexica 是一个 AI 驱动的开源搜索引擎。简单讲，它能像Perplexity AI一样通过人工智能帮你快速找到并总结网络信息，但代码完全开放免费。适用人群：需要高效获取准确信息的研究者、开发者及普通网民。

项目地址：https://github.com/ItzCrazyKns/Perplexica

[https://github.com/ItzCrazyKns/Perplexica](\"https://github.com/ItzCrazyKns/Perplexica\")
主要语言：TypeScript

stars: 25.21k

### 仓库整体介绍
Perplexica 是一个开源的人工智能搜索引擎，受 Perplexity AI 启发而开发。它不仅能进行网页搜索，还能理解用户问题，使用先进的机器学习算法（如相似性搜索和嵌入技术）优化搜索结果，并清晰地给出答案且附带信息来源。该项目借助 SearxNG 保证信息的时效性和隐私性，让用户获取最新信息。

### 核心功能
- 本地大语言模型支持：可使用 Qwen、DeepSeek、Llama 和 Mistral 等本地大语言模型。
- 两种主要模式\n\nCopilot 模式：仍在开发中，通过生成不同查询来找到更相关的互联网资源，会访问搜索结果的页面直接查找与用户查询相关的内容。\n正常模式：处理用户查询并进行网页搜索。\n\n
- Copilot 模式：仍在开发中，通过生成不同查询来找到更相关的互联网资源，会访问搜索结果的页面直接查找与用户查询相关的内容。
- 正常模式：处理用户查询并进行网页搜索。
- 多种聚焦模式\n\n全模式：搜索整个网络以找到最佳结果。\n写作助手模式：对无需网络搜索的写作任务有帮助。\n学术搜索模式：查找文章和论文，适合学术研究。\nYouTube 搜索模式：根据搜索查询查找 YouTube 视频。\nWolfram Alpha 搜索模式：使用 Wolfram Alpha 回答需要计算或数据分析的查询。\nReddit 搜索模式：在 Reddit 上搜索与查询相关的讨论和观点。\n\n
- 全模式：搜索整个网络以找到最佳结果。
- 写作助手模式：对无需网络搜索的写作任务有帮助。
- 学术搜索模式：查找文章和论文，适合学术研究。
- YouTube 搜索模式：根据搜索查询查找 YouTube 视频。
- Wolfram Alpha 搜索模式：使用 Wolfram Alpha 回答需要计算或数据分析的查询。
- Reddit 搜索模式：在 Reddit 上搜索与查询相关的讨论和观点。
- 实时信息获取：利用 SearxNG 这个元搜索引擎获取结果并重新排序，确保用户获得最新信息，无需每日更新数据。
- API 支持：开发者可将其集成到现有应用程序中。
- Copilot 模式：仍在开发中，通过生成不同查询来找到更相关的互联网资源，会访问搜索结果的页面直接查找与用户查询相关的内容。
- 正常模式：处理用户查询并进行网页搜索。
- 全模式：搜索整个网络以找到最佳结果。
- 写作助手模式：对无需网络搜索的写作任务有帮助。
- 学术搜索模式：查找文章和论文，适合学术研究。
- YouTube 搜索模式：根据搜索查询查找 YouTube 视频。
- Wolfram Alpha 搜索模式：使用 Wolfram Alpha 回答需要计算或数据分析的查询。
- Reddit 搜索模式：在 Reddit 上搜索与查询相关的讨论和观点。
### 代码架构特点
项目使用 Next.js 运行并处理所有 API 请求，在同一网络中可直接使用，通过端口转发也能保持可访问性。

### 安装方式
- 使用 Docker（推荐）\n\n确保 Docker 已安装并运行。\n克隆仓库：git clone https://github.com/ItzCrazyKns/Perplexica.git\n进入项目目录，将sample.config.toml重命名为config.toml，按需填写相关字段（如不同模型的 API 密钥等）。\n在包含docker-compose.yaml文件的目录下执行docker compose up -d。\n等待几分钟，在浏览器中访问http://localhost:3000即可使用。\n\n
- 确保 Docker 已安装并运行。
- 克隆仓库：git clone https://github.com/ItzCrazyKns/Perplexica.git
- 进入项目目录，将sample.config.toml重命名为config.toml，按需填写相关字段（如不同模型的 API 密钥等）。
- 在包含docker-compose.yaml文件的目录下执行docker compose up -d。
- 等待几分钟，在浏览器中访问http://localhost:3000即可使用。
- 非 Docker 安装\n\n安装 SearXNG 并允许JSON格式。\n克隆仓库，重命名sample.config.toml为config.toml并填写所需字段。\n运行npm i安装依赖。\n执行npm run build。\n运行npm run start启动应用。\n\n
- 安装 SearXNG 并允许JSON格式。
- 克隆仓库，重命名sample.config.toml为config.toml并填写所需字段。
- 运行npm i安装依赖。
- 执行npm run build。
- 运行npm run start启动应用。
- 确保 Docker 已安装并运行。
- 克隆仓库：git clone https://github.com/ItzCrazyKns/Perplexica.git
- 进入项目目录，将sample.config.toml重命名为config.toml，按需填写相关字段（如不同模型的 API 密钥等）。
- 在包含docker-compose.yaml文件的目录下执行docker compose up -d。
- 等待几分钟，在浏览器中访问http://localhost:3000即可使用。
- 安装 SearXNG 并允许JSON格式。
- 克隆仓库，重命名sample.config.toml为config.toml并填写所需字段。
- 运行npm i安装依赖。
- 执行npm run build。
- 运行npm run start启动应用。
### 常见问题解决
- 本地 OpenAI - API 兼容服务器问题：确保服务器在0.0.0.0上运行，指定正确的模型名称和 API 密钥。
- Ollama 连接错误：检查 API URL，根据不同操作系统更新 URL，Linux 用户需将 Ollama 暴露到网络并确保端口未被防火墙阻止。
- Lemonade 连接错误：检查 API URL，根据不同操作系统更新 URL，确保 Lemonade 服务器运行，配置为接受所有接口连接且端口未被防火墙阻止。
### 使用方法
- 作为搜索引擎使用：在浏览器设置的“搜索引擎”部分添加新的站点搜索，URL 为http://localhost:3000/?q=%s，可直接从浏览器搜索栏使用。
- 使用 API：开发者可参考API 文档将其集成到自己的应用中。
[API 文档](\"https://github.com/ItzCrazyKns/Perplexica/tree/master/docs/API/SEARCH.md\")
### 一键部署
提供了在 Sealos、RepoCloud、ClawCloud 和 Hostinger 等平台的一键部署方式。

### 即将推出的功能
- 目前已完成添加设置页面、支持本地大语言模型、历史保存功能、引入多种聚焦模式、添加 API 支持和发现功能。
- 待完成的功能为完善 Copilot 模式。
# OpenAI Codex CLI来袭！本地运行编码神器，多种安装使用方式揭秘
一个在终端中运行的轻量级编程代理工具。简单讲，它能帮你自动生成代码、理解代码逻辑并完成编程任务，就像一个会写代码的助手。适用人群：开发者、程序员及终端重度用户。

项目地址：https://github.com/openai/codex

[https://github.com/openai/codex](\"https://github.com/openai/codex\")
主要语言：Rust

stars: 42.0k

OpenAI Codex CLI 是 OpenAI 推出的一款本地运行的编码代理工具，以下是它的详细介绍：

- 安装与运行\n\n可以使用包管理器全局安装，如使用 npm 安装，命令为npm install -g @openai/codex；若使用 Homebrew，命令为brew install codex。安装完成后，运行codex即可启动。\n也能前往最新 GitHub Release页面，根据自己的平台下载合适的二进制文件。不同系统有对应的文件，如 macOS 有适用于 Apple Silicon/arm64 的codex-aarch64-apple-darwin.tar.gz和适用于 x86_64 的codex-x86_64-apple-darwin.tar.gz；Linux 有适用于 x86_64 的codex-x86_64-unknown-linux-musl.tar.gz和适用于 arm64 的codex-aarch64-unknown-linux-musl.tar.gz。解压后建议重命名为codex。\n\n
- 可以使用包管理器全局安装，如使用 npm 安装，命令为npm install -g @openai/codex；若使用 Homebrew，命令为brew install codex。安装完成后，运行codex即可启动。
- 也能前往最新 GitHub Release页面，根据自己的平台下载合适的二进制文件。不同系统有对应的文件，如 macOS 有适用于 Apple Silicon/arm64 的codex-aarch64-apple-darwin.tar.gz和适用于 x86_64 的codex-x86_64-apple-darwin.tar.gz；Linux 有适用于 x86_64 的codex-x86_64-unknown-linux-musl.tar.gz和适用于 arm64 的codex-aarch64-unknown-linux-musl.tar.gz。解压后建议重命名为codex。
- 与 ChatGPT 计划结合使用\n\n运行codex后选择“Sign in with ChatGPT”，推荐使用 ChatGPT 的 Plus、Pro、Team、Edu 或 Enterprise 计划账号登录使用。若想了解 ChatGPT 计划包含的内容，可查看相关文章。\n也能使用 API 密钥，但需要 额外设置。若之前使用 API 密钥进行按使用量计费，可参考 迁移步骤。若登录遇到问题，可在此问题下留言。\n\n
- 运行codex后选择“Sign in with ChatGPT”，推荐使用 ChatGPT 的 Plus、Pro、Team、Edu 或 Enterprise 计划账号登录使用。若想了解 ChatGPT 计划包含的内容，可查看相关文章。
- 也能使用 API 密钥，但需要 额外设置。若之前使用 API 密钥进行按使用量计费，可参考 迁移步骤。若登录遇到问题，可在此问题下留言。
- 模型上下文协议（MCP）：支持 MCP 服务器，在~/.codex/config.toml中添加mcp_servers部分即可启用。
- 配置：支持丰富的配置选项，偏好设置存储在~/.codex/config.toml中，完整配置选项可查看 Configuration。
- 文档与常见问题解答：涵盖了从入门到高级使用的各个方面，包括入门指南、沙盒与审批、认证、高级功能、零数据保留、贡献、安装与构建等内容。
- 可以使用包管理器全局安装，如使用 npm 安装，命令为npm install -g @openai/codex；若使用 Homebrew，命令为brew install codex。安装完成后，运行codex即可启动。
- 也能前往最新 GitHub Release页面，根据自己的平台下载合适的二进制文件。不同系统有对应的文件，如 macOS 有适用于 Apple Silicon/arm64 的codex-aarch64-apple-darwin.tar.gz和适用于 x86_64 的codex-x86_64-apple-darwin.tar.gz；Linux 有适用于 x86_64 的codex-x86_64-unknown-linux-musl.tar.gz和适用于 arm64 的codex-aarch64-unknown-linux-musl.tar.gz。解压后建议重命名为codex。
[最新 GitHub Release](\"https://github.com/openai/codex/releases/latest\")
- 运行codex后选择“Sign in with ChatGPT”，推荐使用 ChatGPT 的 Plus、Pro、Team、Edu 或 Enterprise 计划账号登录使用。若想了解 ChatGPT 计划包含的内容，可查看相关文章。
- 也能使用 API 密钥，但需要 额外设置。若之前使用 API 密钥进行按使用量计费，可参考 迁移步骤。若登录遇到问题，可在此问题下留言。
[相关文章](\"https://help.openai.com/en/articles/11369540-codex-in-chatgpt\")
[此问题](\"https://github.com/openai/codex/issues/1243\")
### 优势
- 本地运行：可在本地计算机上运行，一定程度上保障数据安全和隐私。
- 多方式使用：既可以结合 ChatGPT 计划使用，也能使用 API 密钥。
- 丰富配置：支持多种配置选项，可根据需求灵活调整。
### 应用场景
- 开发人员在命令行中快速获取代码生成、代码解释等帮助。
- 用于持续集成（CI）流程，结合非交互模式自动完成代码相关任务。
- 辅助教学，帮助学生学习编程时快速获得代码示例和解释。
