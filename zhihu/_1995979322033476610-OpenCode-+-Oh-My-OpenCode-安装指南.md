---
created: '1970-01-01T08:00:00'
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/1995979322033476610
title: OpenCode + Oh My OpenCode 安装指南
type: archive-web
---

**说明：** 这是一篇写给纯小白的安装教程，覆盖从环境配置到工作流管理，以及一些好用的插件。如果你已经是 AI 编程领域的大神，熟练大战
ClaudeCode 之类的，那就可以直接自由探索去了！

### 教程目标

在 Windows 系统上，从零开始安装并配置 OpenCode 及其增强插件 Oh My OpenCode，打造你的专属 AI 编程团队。

> 但是需要明确的是，任何的框架能力都是需要模型能力支持的，国产模型虽然便宜，但是可能会差点意思。

### 核心工具

| 工具           | 说明                                     |
| -------------- | ---------------------------------------- |
| OpenCode       | AI 编程助手，免费开源、支持多种模型      |
| Oh My OpenCode | 增强插件，多模型协作、智能体系统（可选） |
| Node.js        | 基础环境，一次安装，两处通用             |
| Bun            | 一个新时代的 Node.js 运行环境            |
![](https://pic3.zhimg.com/v2-cc43ba3e31c3573bb3c5df2a2a9723b6_1440w.jpg)

* * *

### 什么是 OpenCode 和 Oh My OpenCode？

### OpenCode 是什么？

### 核心能力

  * **理解代码库** \- 自动分析项目结构和编码模式
  * **生成新功能** \- 根据自然语言描述实现完整功能
  * **修改优化** \- 重构代码、修复 bug、优化性能
  * **解答问题** \- 解释代码逻辑，帮助理解实现细节  

  * 主要特点

  1. **开源灵活** ：完全开源，代码透明，支持多种 LLM：Claude、ChatGPT、Gemini、GLM-4、Deepseek 等，可自由切换 AI 模型
  2. **多种形态** ：终端界面 (TUI) / 桌面应用 / IDE 扩展
  3. **智能工作流** ： 

  * Plan 模式 - 先规划再执行
  * Build 模式 - 直接修改代码
  * 支持撤销/重做，随时回退

**强大上下文** ：

    * `@` 快速引用文件
    * 拖拽图片作为设计参考
    * 通过 `AGENTS.md` 记忆项目知识

  1. **团队协作** ： 

  * 一键分享对话链接
  * `AGENTS.md` 可提交 Git，团队共享

> **简单理解：** OpenCode 是一个开源的 AI 编程搭档，用自然语言告诉它需求，它就能帮你写代码、解释逻辑、优化项目。关键是完全开源，支持多种
> AI 模型。  
>  Oh My OpenCode 是什么？

Oh My OpenCode 是 OpenCode 的增强插件（类似 Oh My Zsh 对 Zsh 的增强），让 OpenCode 从单个 AI
助手变成完整的 AI 开发团队。

### 核心特性

**1\. 专业智能体团队**

  * **Sisyphus (主编排)** ：Claude Opus 4.5，任务规划和分配
  * **Oracle** ：GPT-5.2，架构设计和代码审查
  * **Frontend-UI-UX-Engineer** ：Gemini 3 Pro，前端界面开发
  * **Librarian** ：GLM-4.7，文档查询和代码搜索
  * **Explore** ：Grok/Gemini Flash，快速代码探索

**2\. 并行任务系统**

  * 后台运行多个智能体，互不干扰
  * 主智能体继续工作，子任务完成后通知
  * 可配置并发限制，控制成本

**3\. 增强工具集**

  * **LSP 重构工具** ：rename、code actions、diagnostics
  * **AST-Grep** ：结构化代码搜索和替换
  * **内置 MCP** ：Exa 网页搜索、Context7 文档查询、Grep.app 代码搜索

**4\. 智能工作流**

  * **`ultrawork` (ulw)**：输入关键词自动启用最强模式
  * **Ralph Loop** ：自动循环执行直到任务完成
  * **Todo Enforcer** ：强制完成所有待办事项
  * **Auto Recovery** ：会话错误自动恢复

> **简单理解：** 安装 Oh My OpenCode 后，OpenCode 从单兵作战变成团队协作 —— Sisyphus 是项目经理，Oracle
> 做架构设计，Librarian 查文档，Frontend Engineer 写界面，多个任务并行执行，直到完成为止。

![](https://pic1.zhimg.com/v2-3677ad404ea5ec81ec6a6ea963eb3af0_1440w.jpg)

* * *

### 安装前准备

### 1\. 检查你的系统环境

确保你的电脑是 **Windows 10** 或更高版本。

> 低版本跟不上 AI 时代咯。

### 2\. 安装 Node.js（必选）

OpenCode 和 Oh My OpenCode 都需要 Node.js 环境。

**安装步骤：**

  1. 访问 [Node.js — 下载 Node.js®](https://link.zhihu.com/?target=https%3A//nodejs.org/zh-cn/download)

![](https://pic4.zhimg.com/v2-e31643e49a6ba0050075599a78bb3f4f_1440w.jpg)

> 注意，现在伪造官网多发，请到官网中下载，避免感染银狐木马。

  1. 下载左边的 **LTS 版本** （推荐给大多数用户，长期支持版）

![](https://picx.zhimg.com/v2-ce99e78ee7be8ff9a082730c84cc959f_1440w.jpg)

  1. 双击安装包  

  2. 一路点击 “Next”（下一步） 直到完成  

  3. 安装完成后，在 PowerShell 中输入以下命令验证安装：

    
    
    node --version

如果显示版本号（如 `v22.x.x`），说明安装成功！

* * *

### 安装 OpenCode

OpenCode 提供了桌面端和 CLI（也就是命令行）版本，有多种安装方式，Windows 用户推荐使用以下两种之一：

### 方法一：使用 npm/bun 安装（推荐）

> 注意：npm 和 bun 只需要选择一种安装即可，避免出现冲突。

### 使用 npm

上面的步骤中，我们已经安装了 Node.js，直接在 PowerShell 中运行：

    
    
    npm install -g opencode-ai

**说明：**

  * `npm` 是 Node.js 的包管理器
  * `-g` 表示全局安装
  * 安装完成后，可以在任何目录使用 `opencode` 命令

这个时候，可能会遇到问题，就是明明安装了 OpenCode 但是无法执行，这个是国内镜像源的问题，这时候需要使用官方镜像源：

    
    
    npm config set registry https://registry.npmjs.org

### 使用 bun（这里留下伏笔）

![](https://pic1.zhimg.com/v2-9a58f3532b799a811e8f98eb82165d6c_1440w.jpg)

我们需要先安装 bun 的运行环境，使用下面的命令：

    
    
    powershell -c "irm bun.sh/install.ps1 | iex"

![](https://pic3.zhimg.com/v2-771abc4b6b598db574a21ffafd103896_1440w.jpg)

等待安装完成后，重启终端，使用 bun 安装 OpenCode：

    
    
    bun add -g opencode-ai

### 方法二：使用 PowerShell 安装脚本

如果你不想用 npm，可以使用官方提供的安装脚本：

  * 打开 PowerShell
  * 运行以下命令：

    
    
    Invoke-WebRequest -Uri https://opencode.ai/install -UseBasicParsing | Invoke-Expression

  * 等待安装完成

### 验证安装

安装完成后，运行以下命令验证是否安装成功：

    
    
    opencode --version

如果显示版本号（如 `1.0.150` 或更高），恭喜你，OpenCode 安装成功了！

> 注意：有些时候你可能需要把 npm 或者 bun 的可执行文件路径添加到环境变量，不然还是找不到 OpenCode。

* * *

### 选择免费模型并开始使用

安装 OpenCode 后，启动即可直接使用免费的 GLM-4.7 模型开始编程！

### 启动 OpenCode

在 PowerShell 中运行：

    
    
    opencode

然后我们会看到类似下面的界面，目前没有发现什么终端会渲染爆炸的问题，比隔壁的 ClaudeCode 强多了，而且 TUI（终端用户界面）也有一定的设计感。

![](https://pic2.zhimg.com/v2-86f9fdacb0c5265cccc34d27eaad2d6f_1440w.jpg)

### 选择免费模型

启动后，按下快捷键 `Ctrl + P` 打开命令面板，选择 “Select model”，然后选择 **GLM-4.7**
模型。很有意思的是，这边的几个免费模型都是国产的，说明现在国内大模型也受到了老外的认可。

![](https://pic2.zhimg.com/v2-18ad25e887972f63b425fdec92431315_1440w.jpg)![](https://picx.zhimg.com/v2-ca558d2f4f64223d9b8f68b1d4836b81_1440w.jpg)

> 这里我想大家会有个问题，这个 **Big Pickle** 是什么玩意？这是个各家厂商用于收集数据的模型，应该是智谱的 GLM4.6
> 微调后的版本。既然免费白嫖了，那肯定是要付出一些代价的。

### 为什么推荐 GLM-4.7？

| 优势           | 说明                                         |
| -------------- | -------------------------------------------- |
| 完全免费       | 不需要 API Key 或付费订阅                    |
| 中文能力强     | 智谱出品，专门针对中文优化                   |
| 国内访问友好   | 无需科学上网，网络稳定                       |
| Agent 场景优化 | 知道什么时候该读文件、运行测试、自愈能力最好 |
![](https://pic4.zhimg.com/v2-1fc8efb2f66b790cb37e69e6a575cedd_1440w.jpg)

### 开始使用

现在就可以直接输入你的需求开始编程了！比如：

  * 请帮我创建一个待办事项应用
  * 分析这个项目的代码结构

### 后续如何切换模型

如果你以后想尝试其他模型（如 GPT-5 Nano、Big Pickle），同样按 `Ctrl + P` → “Select model” →
选择对应模型即可。

> **提示：** 对于新手，GLM-4.7 已经足够强大，无需复杂配置，直接开始编程即可！

* * *

### 安装 Oh My OpenCode

Oh My OpenCode 是一个增强插件，安装后会让 OpenCode 变得更强大。没有 OMO 的 OpenCode 就是不完整的。

**好消息是：** 我们在前面已经安装了 Node.js，可以直接用 `npx` 安装，不需要额外安装其他工具！

### 安装步骤

  1. 打开 PowerShell  

  2. 直接运行以下命令：

    
    
    npx oh-my-opencode install

### 这一步在做什么？

  * `npx` 是 Node.js 自带的工具，可以直接运行安装包
  * `oh-my-opencode install` 是安装命令

这里有一个坑，如果你的电脑里没有 bun 的环境，那么就会出现下面的问题：

![](https://pic1.zhimg.com/v2-b3477400a79b4da9da957ef6b983389a_1440w.jpg)

所以还是要安装。。。请参考前面的教程吧。

  1. 等待安装完成（可能需要 1-2 分钟，实际就是几秒的事情）
  2. 然后会进入终端引导界面，会提示你是否需要登录国外御三家的订阅套餐，然后配置一些模型即可

> 注意：现在如果你有 Claude 的订阅，最好不要登录，不然就要喜提封号大礼包了，而且现在不退款哦。

安装成功的标志：看到类似 “Installation complete” 或 “Successfully installed” 的提示信息。具体如下：

![](https://picx.zhimg.com/v2-66d220989bb2d16c33951bf6bdafa811_1440w.jpg)

### 验证是否安装成功

**方法 1：快速验证（推荐）**

安装完成后，在 PowerShell 中运行：

    
    
    opencode

打开 opencode 后，输入 `hello`，打声招呼，看到 ohMyOpenCode 的弹窗，说明安装成功。

**方法 2：查看配置文件**

如果方法 1 看不清，可以用这个方法：

  1. 按 `Win + R` 键
  2. 输入 `%USERPROFILE%\.config\opencode` 并回车
  3. 用记事本打开 `opencode.json` 文件
  4. 搜索 `"oh-my-opencode"` 字样
  5. 如果找到了，说明安装成功！

![](https://pic4.zhimg.com/v2-7e6ae8ed4bbffa62f00183280d37853d_1440w.jpg)

### 新手提示

  * Oh My OpenCode 是可选安装，如果你觉得 OpenCode 已经够用，可以跳过这一步
  * 安装后默认配置已经很好，新手不需要额外调整
  * 如果安装失败，请检查是否安装了 Node.js（运行 `node --version` 验证）

* * *

### 配置 Oh My OpenCode（可选，新手可跳过）

Oh My OpenCode 安装后，默认配置已经完全够用，新手可以直接跳过这一部分，开始使用即可！

如果你想自定义一些设置，可以参考以下内容。

### 配置文件位置

  * **全局配置：** `%USERPROFILE%\.config\opencode\oh-my-opencode.json`
  * **项目级配置：** 在你的项目文件夹下创建 `.opencode\oh-my-opencode.json`

### 基础配置示例

打开配置文件（用记事本或 VS Code），添加以下内容：

    
    
    {
      "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json"
      // 使用默认配置，无需额外设置
    }

这是一个最小化的配置。

### 完整配置示例

    
    
    {
      "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json",
      
      // Sisyphus 主编排器配置
      "sisyphus_agent": {
        "disabled": false,              // 启用 Sisyphus
        "default_builder_enabled": false, // 不使用默认构建器
        "planner_enabled": true          // 启用规划器
      },
      
      // 智能体模型配置
      "agents": {
        "oracle": {
          "model": "openai/gpt-5.2"     // 架构设计用 GPT-5.2
        },
        "frontend-ui-ux-engineer": {
          "model": "google/gemini-3-pro-preview" // UI 用 Gemini
        },
        "explore": {
          "model": "opencode/grok-code"  // 免费快速探索
        }
      },
      
      // 后台任务并发配置
      "background_task": {
        "defaultConcurrency": 5,         // 默认最多 5 个并发任务
        "providerConcurrency": {
          "anthropic": 3,                // Claude 最多 3 个
          "google": 10                   // Gemini 可以开 10 个（便宜）
        }
      }
    }

### 配置说明

| 配置项                              | 说明                         | 默认值     |
| ----------------------------------- | ---------------------------- | ---------- |
| sisyphus_agent.disabled             | 是否禁用 Sisyphus 主编排器   | false      |
| sisyphus_agent.planner_enabled      | 是否启用规划器（Prometheus） | true       |
| agents..model                       | 指定智能体使用的模型         | 内置默认值 |
| agents..disable                     | 禁用某个智能体               | false      |
| background_task.defaultConcurrency  | 默认后台任务并发数           | 无限制     |
| background_task.providerConcurrency | 按提供商限制并发             | 无限制     |
  
**可用智能体：**

  * `Sisyphus`：主编排器（Claude Opus 4.5）
  * `oracle`：架构师（GPT-5.2）
  * `librarian`：文档专家（GLM-4.7）
  * `explore`：快速搜索（Grok Code / Gemini Flash / Haiku）
  * `frontend-ui-ux-engineer`：前端专家（Gemini 3 Pro）
  * `document-writer`：文档撰写（Gemini 3 Flash）
  * `multimodal-looker`：多模态分析（Gemini 3 Flash）

> **新手提示：**  
>

  * 首次使用建议不修改配置，体验默认设置
  * 熟悉后再根据需要调整模型和并发数
  * 使用免费模型（如 `opencode/grok-code`）可节省成本

### 认证配置

如果使用付费模型，需要完成 OAuth 认证：

    
    
    opencode auth login

选择你的提供商（Anthropic/OpenAI/Google），然后在浏览器中完成登录。

推荐认证插件：

  * Google Gemini：安装 `opencode-antigravity-auth` 插件，支持多账号负载均衡

    
    
    npx opencode-antigravity-auth install

* * *

### 快速上手指南

现在，OpenCode + Oh My OpenCode 已经安装配置完成，让我们来实际使用一下吧！

### 1\. 进入项目目录

    
    
    cd 你的项目路径

例如：

    
    
    cd D:\my-projects\my-app

### 2\. 启动 OpenCode

    
    
    opencode

这会打开 OpenCode 的终端界面（TUI）。

### 3\. 初始化项目

在 OpenCode 界面中，输入：

    
    
    /init

这个命令会：

  * 分析你的项目结构
  * 自动生成 `AGENTS.md` 配置文件
  * 定义编码规则和项目规范

![](https://picx.zhimg.com/v2-ca558d2f4f64223d9b8f68b1d4836b81_1440w.jpg)

> 注意：这里还有一个 `/init-deep` 指令，可以更加详细的初始化项目。

### 4\. 基本使用示例

**示例 1：询问代码**

    
    
    请问这个项目使用了哪些技术框架，请详细的介绍

Oh My OpenCode 的智能体会帮你分析代码并给出解答。

**示例 2：使用 Plan 模式规划任务**

  1. 按 `Tab` 键切换到 Plan 模式（右下角会显示 “Plan”）
  2. 输入需求：

    
    
    添加一个删除笔记的功能，在数据库中标记为已删除，并创建一个恢复界面

  1. AI 会生成详细的实施计划
  2. 如果你满意计划，按 `Tab` 切换回 Build 模式
  3. 输入：

    
    
    Go ahead!

  1. AI 会自动执行代码修改

**示例 3：使用多 Agent 协作**

只需在提示词中包含 `ultrawork`（或简写 `ulw`），Sisyphus 就会：

  * 启动最大性能模式
  * 并行编排多个智能体
  * 持续执行直到任务 100% 完成

示例：

    
    
    ulw 帮我构建一个完整的 REST API，包括用户认证、权限管理和数据验证

然后坐下来喝咖啡，Sisyphus 会处理一切。

**其他关键词**

  * `search` / `find` / `찾아` / `検索`：最大化搜索力度
  * `analyze` / `investigate` / `분석` / `調査`：深度分析模式
  * `ultrathink`：扩展思考模式

**示例 4：调用特定智能体**

    
    
    让 @oracle 设计数据库 schema

`@oracle` 是 Oh My OpenCode 的架构顾问智能体，专门负责架构设计和复杂决策。

### 5\. 常用命令

在 OpenCode 界面中，以下命令很常用：

| 命令      | 功能                                     |
| --------- | ---------------------------------------- |
| /init     | 初始化项目，生成 AGENTS.md               |
| /connect  | 连接或切换 AI 模型                       |
| /model    | 选择模型                                 |
| /new      | 创建新会话                               |
| /undo     | 撤销修改                                 |
| /redo     | 重做操作                                 |
| /terminal | 显示或隐藏终端                           |
| /agent    | 选择智能体                               |
| /mcp      | 开启或关闭 MCP（Model Context Protocol） |
  
### 快捷键

| 快捷键   | 功能                 |
| -------- | -------------------- |
| Tab      | 切换 Plan/Build 模式 |
| Ctrl + P | 打开命令面板         |
| Ctrl + C | 退出 OpenCode        |
  
* * *

### 新手常见问题

### Q: 如何卸载 Oh My OpenCode？

如果需要卸载，运行以下命令：

    
    
    # 1. 从配置中移除插件
    jq '.plugin = [.plugin[] | select(. != "oh-my-opencode")]' \
        ~/.config/opencode/opencode.json > /tmp/oc.json && \
        mv /tmp/oc.json ~/.config/opencode/opencode.json
    
    # 2. 删除配置文件（可选）
    rm -f ~/.config/opencode/oh-my-opencode.json
    rm -f .opencode/oh-my-opencode.json
    
    # 3. 验证
    opencode --version

### Q: 我只想用免费模型，可以吗？

完全可以！配置示例：

    
    
    {
      "agents": {
        "explore": { "model": "opencode/grok-code" },
        "librarian": { "model": "opencode/glm-4.7-free" }
      }
    }

### Q: 如何禁用某些智能体？

方法一：

    
    
    {
      "agents": {
        "oracle": { "disable": true }
      }
    }

方法二：

    
    
    {
      "disabled_agents": ["oracle", "frontend-ui-ux-engineer"]
    }

### Q: 后台任务太多，怎么限制？

配置并发数：

    
    
    {
      "background_task": {
        "defaultConcurrency": 3,
        "modelConcurrency": {
          "anthropic/claude-opus-4-5": 1  // 贵的模型限制到 1
        }
      }
    }

### Q: 与 Claude Code 有什么关系？

Oh My OpenCode 完全兼容 Claude Code 的配置（Commands、Skills、Hooks、MCP），可以无缝迁移。

* * *

### 更高级的食用建议

### 1\. 学习使用不同的 Agent

Oh My OpenCode 内置了多个专业智能体，每个都有自己的专长：

| Agent                               | 专长                             |
| ----------------------------------- | -------------------------------- |
| Sisyphus（主编排器）                | 自动分配任务，协调其他 Agent     |
| Oracle（架构顾问）                  | 复杂架构决策、代码分析、疑难解答 |
| Explore（代码探索）                 | 搜索代码库、理解项目结构         |
| Librarian（文档查询）               | 搜索外部文档、参考最佳实践       |
| Frontend-UI-UX-Engineer（前端专家） | UI 设计、样式、布局              |
| Document-Writer（文档专家）         | 写 README、API 文档、使用指南    |
  
**使用方法：** 在对话中输入 `@agent名称`，如 `@oracle`、`@frontend-ui-ux-engineer`

![](https://pic3.zhimg.com/v2-6655f6300ae63c3e57ef74d13ae777f8_1440w.jpg)

### 2\. 使用 @ 引用文件和目录

在对话中输入 `@` 可以引用项目中的文件、目录、代码片段作为上下文：

    
    
    请修改 @components\ui\button.tsx，添加更好的动画效果

这样 AI 会基于你指定的文件进行修改，更准确。

![](https://pic2.zhimg.com/v2-98dba9885c70c88b1397ebe5aa8ed9f1_1440w.jpg)

> 这里会有个问题，就是关于 `/` 和 `\` 的，注意保持统一。

### 3\. 充分利用 Plan/Build 模式

我们在处理日常问题时就要先列好完备的计划，对于 AI 来说也是一样的。对于复杂任务，强烈建议：

  1. 先用 **Plan 模式** 规划
  2. 检查计划，确保 AI 理解正确（其实很多时候，都是不检查的，但总是好一些）
  3. 确认后切回 **Build 模式** 执行
  4. 观察 AI 的操作，及时发现问题

> 这样可以避免 AI 误改代码。

![](https://pica.zhimg.com/v2-f9a3aa238a85daf39b07ee0c4af0748c_1440w.jpg)

### 4\. 自定义 Skills

Skills 是目前比较火的概念，简单来说，就是把工作流变成可复用的，让 AI 自行选择使用。Oh My OpenCode 支持
Skills（技能），你可以：

  * 创建自定义的技能
  * 让 AI 执行特定的任务流程
  * 自动化重复性工作  

![](https://pic1.zhimg.com/v2-8300d9095abdc0dca0b05f36fffa5fea_1440w.jpg)

* * *

### 学习资源

  * **OpenCode 官网：** [https://opencode.ai](https://link.zhihu.com/?target=https%3A//opencode.ai/)
  * **OpenCode 文档：** [https://opencode.ai/docs](https://link.zhihu.com/?target=https%3A//opencode.ai/docs)
  * **Oh My OpenCode GitHub：** [https://github.com/code-yeongyu/oh-my-opencode](https://link.zhihu.com/?target=https%3A//github.com/code-yeongyu/oh-my-opencode)  

* * *

### 总结

恭喜你！现在你已经成功安装并配置了 OpenCode + Oh My OpenCode，获得了最前沿的 AI 神力！希望这篇教程能帮你快速上手，享受 AI
带来的开发效率提升！

> 但其实，对于已经习惯 ClaudeCode 的人，感觉还是 Claude Code
> 用的更顺畅，可能也是之前一直使用习惯了。不过对于新手用户来讲，OpenCode 的免费模型的使用，还是很不错的。