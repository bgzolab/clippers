---
created: '2025-09-03T11:08:55.157'
modified: '2025-09-03T11:08:55.157'
source: https://www.cnblogs.com/danieldaren/p/18912626
title: 如何使用MCP开发一个客户端和服务端 - 高冷的程序员大大 - 博客园
type: archive-web
---



# 如何使用MCP开发一个客户端和服务端
### 一、MCP和API以及Function Call核心概念对比
### 二、 MCP 协议
### 1. 什么是MCP协议
模型上下文协议（Model ContextProtocol）是一种专为大语言模型设计的标准化协议，它允许LLM以安全、一致的方式与外部系统交互。MCP协议常被描述为\"AI的USB-C接口\"，提供了一种统一的方式连接LLM与它们可以使用的资源。

MCP协议的核心功能包括：

- •资源（Resources）：类似于GET端点，用于将信息加载到LLM的上下文中
- •工具（Tools）：类似于POST端点，用于执行代码或产生副作用
- •提示（Prompts）：可重用的LLM交互模板
- •上下文（Context）：提供额外的交互功能，如日志记录和进度报告
### 2. 核心价值
- •标准化：统一 AI 与外部服务的交互格式，解决工具碎片化问题
- •解耦设计：模型无需硬编码 API 逻辑，通过声明式函数描述调用服务
- •异步支持：适用于多步骤工作流（如爬取数据→分析→存储）
### 3. 工作流程
MCP 大概的工作方式： Claude Desktop、Cursor 这些工具，在内部实现了 MCP Client，然后MCP Client 通过标准的 MCP 协议和 MCP Server 进行交互，由各种三方开发者提供的 MCP Server 负责实现各种和三方资源交互的逻辑，比如访问数据库、浏览器、本地文件，最终再通过 标准的 MCP 协议返回给 MCP Client，最终给用户进行展示。

下图是一个通过查询天气来简单展示其对应的工作方式：

### 3. 代码实现mcp客户端和服务端
现在python编写mcp server和mcp client的有两个分别是FastMCP和MCP，其中MCP是官方的pythonsdk,这两个之间的关系是官方收编了FastMCP的第一个版本的包，但官方集成的是 fastmcp 的 v1.0 版本。然而，jlowin 继续开发 fastmcp，还发布了 v2.0 版本，其中包含代理和客户端采样等新功能。以下的演示以官方版本MCP为例，

安装：uv add \"mcp[cli]”或者pip install \"mcp[cli]”

### (1)MCP 服务端
解释：

- • Tools（工具）是MCP中最常用的功能之一，它允许LLM执行特定的操作或函数。使用@mcp.tool()装饰器可以轻松将Python函数转换为LLM可调用的工具：
- • Resources（资源）用于向LLM提供数据和上下文信息。与工具不同，资源主要用于读取数据而非执行操作
- • Prompts（提示）允许您创建可重用的提示模板，这些模板可以被参数化并用于标准化LLM交互
简单验证服务端功能可以通过mcp dev server.py进入界面检测

### (2)MCP 客户端
MCP客户端一般分别按照服务端的stdio和sse分别写了两个，具体融合的最后修改一下即可。

1. 1. STDIO客户端
1. 1. SSE客户端
注意： sse链接，我增加了一个reconnect_sse_server函数，主要原因是sse链接过程中过2分钟会自然断开，不论什么办法都无法处理，因此增加这样一个操作。

### （3）版本的自然更新
有了上面两种客户端的连接方法，自然而然结合两个就可以做到同时结合sse和stdio的方法只需要增加一个分别调用的方法即可，后续代码微微改动便可使用。

当然官方的MCP也是在不段更新的，看了官方有发布Streamable HTTP Transport ,这种方式在取代sse,以及通过with来启动执行服务的更新等等，一些简单的更新参考下面，更多更新可以前往github上看

其余高级用法可参考页面：https://github.com/modelcontextprotocol/python-sdk#advanced-usage

### 三、典型应用场景
### 1. MCP 适用场景
- •企业系统整合将 CRM/ERP 封装为 MCP 服务，供多个 Agent 安全调用\n\n\n\n# MCP 连接数据库示例@app.post(\"/mcp\")def query_database(request: dict):if request[\"function\"] == \"get_user_orders\":user_id = request[\"parameters\"][\"user_id\"]# 执行SQL查询 (伪代码)return {\"orders\": db.query(f\"SELECT * FROM orders WHERE user_id={user_id}\")}
- •跨平台自动化组合 GitHub + Slack 的 MCP 服务实现 CI/CD 流程：\n\n\n\n# 自动化工作流：提交代码→构建→通知def ci_cd_pipeline():call_mcp(\"github\", {\"action\": \"pull_code\", \"repo\": \"my-app\"})build_result = call_mcp(\"jenkins\", {\"job\": \"build\"})call_mcp(\"slack\", {\"channel\": \"dev-team\", \"message\": f\"构建结果：{build_result}\"})
### 2. Function Call 适用场景
### 3. 传统 API 调用
### 四、技术选型建议
关键结论：MCP 的核心价值在于建立企业级 AI 基础设施。当系统需要连接多个异构数据源、要求严格的协议标准化或涉及长周期任务时，MCP 是优于 Function Call 的选择。

🌟 如果您对前沿科技、人工智能，尤其是多模态语言模型的应用前景充满好奇，那么这里就是您获取最新资讯、深入解析的绝佳平台。我们不仅分享创新技术，还探讨它们如何塑造我们的未来。

🔍 想要不错过任何一篇精彩内容，就请订阅我们的公众号吧！您的关注是我们持续探索和分享的动力。在这里，我们一起揭开AI的神秘面纱，见证科技如何让世界变得更加精彩。
