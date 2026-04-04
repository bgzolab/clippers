---
created: '2026-02-10T07:11:45.133'
modified: '2026-02-10T07:11:45.133'
source: https://www.cnblogs.com/zlt2000/p/19577443
title: 从Prompt工程到Skill工程：Agent Skills开放标准彻底改变了AI协作方式 - zlt2000 - 博客园
type: archive-web
---



## 一、为什么 Agent Skill 突然火了？
你是不是也有过这样的崩溃时刻？

- 每次让Claude写代码，都要重复粘贴请使用我们的代码规范：驼峰命名、2空格缩进、必须写单元测试——像极了每天入职新公司；
- 好不容易调教好的Prompt换个项目就完全失效，之前的调教经验归零；
- 团队里每个人给 AI 的指令不一样，导致输出的内容一会儿像资深架构师，一会儿像刚毕业的新手。
这些问题的根源，其实是AI的专业能力无法沉淀。直到 2025 年 10 月Anthropic推出Agent Skill（又名 Claude Code Skill）正是为解决这些问题而生。这不仅是Claude的新功能，更是一个开放的跨平台标准，目前已被OpenAI、Cursor、Trae等主流工具跟进支持。

本文将带你从是什么到怎么用在实际工作中，彻底掌握这个比Prompt更高级、比MCP更易用的AI编程神器。



## 二、到底什么是 Agent Skill？
用最通俗的比喻：Agent Skill是AI的入职手册 + 工具箱。

想象你招了一位天才实习生Claude他智商极高但不懂你们公司的业务。传统的做法是每次布置任务都口头交代一遍Prompt而Agent Skill则是给他一本完整的标准作业程序SOP：

- 📋 入职手册（SKILL.md）：包含岗位描述、工作流程、注意事项
- 🧰 工具箱（Scripts）：处理特定任务的脚本和代码
- 📚 参考资料（References）：行业规范、模板素材、API文档
技术本质：Agent Skill是一个标准化的文件夹结构，核心必须包含SKILL.md文件（YAML元数据 + Markdown说明），可选包含脚本、模板等资源文件。

当AI检测到相关任务时，会自动翻开对应的手册，严格按照既定流程执行，无需你每次都重复交代。



## 三、Skill工作原理
Skill最精妙的设计，是它的渐进式加载机制—— 就像你查字典，先看目录，再翻对应章节，最后查附录，不会一上来就把整本书塞进脑子里。

### 3.1. 三层加载：用最少的 Token 做最多的事


### 3.2. 四步执行流程


1. 🎯 意图匹配：AI 扫描所有 Skill 的元数据，找到最匹配当前任务的技能
2. 📖 读取指南：加载对应 SKILL.md，掌握执行步骤、检查点、输出规范
3. 🔧 按需执行：调用 scripts/ 中的脚本，查询 references/ 中的资料
4. ✅ 反馈结果：按模板输出成果，或询问缺失信息


## 四、现有技术的对比
### 4.1. Agent Skill vs Prompt
一句话总结：Prompt 是口头交代，Skills 是书面 SOP + 工具箱。

### 4.2. Agent Skill vs 多 Agent 架构
### 4.3. Agent Skill vs MCP
MCP 让 AI 能连上数据库，Skill 教 AI 怎么按你们公司的规范查数据、生成报表、处理异常。两者配合，AI 才能真正成为\"懂行的专家\"。



## 五、创建你的第一个 Agent Skill
下面用会议纪要整理助手为例，从零创建一个 Skill

场景：开会录音转文字后，需要整理成结构化会议纪要。不同会议类型（周会/项目复盘/客户沟通）需要不同的整理模板。

### 5.1. 创建 Skill 文件夹结构
新建一个名为meeting-minutes的文件夹，总体的文件结构如下：

### 5.2. SKILL.md（核心文件）
#### 5.2.1. 元数据
在SKILL.md文件最开头以上下两个---作为元数据标识

#### 5.2.2. SKILL内容


### 5.3. 编写模块化配置references


通过文件分离，AI每次只读取当前任务所需的规则，避免 Context 污染

### 5.4. 测试你的 Skill（以 Trae 为例）
Trae作为国内的AI IDE已原生支持Agent Skills

- \n官网：https://www.trae.cn/\n
- \n下载并安装TRAE IDE\n
官网：https://www.trae.cn/

下载并安装TRAE IDE

#### 5.4.1. 导入Skill
1. 创建一个文件夹，例如my_skills
2. 使用TRAE IDE打开这个文件夹
3. 将meeting-minutes文件夹复制到 my_skills/.trae/skills/ 目录下
#### 5.4.2. 输入提示词
需要切换为SOLO模式，然后在对话框输入以下提示词：

#### 5.4.3. 执行Skill


#### 5.4.4. 最终输出以下内容




## 六、本文Skill下载地址
本文案例会议纪要整理助手Skill 的下载地址如下：

- Gitee地址：
https://gitee.com/zlt2000/my-agent-skill/tree/master/meeting-minutes

[https://gitee.com/zlt2000/my-agent-skill/tree/master/meeting-minutes](\"https://gitee.com/zlt2000/my-agent-skill/tree/master/meeting-minutes\")
- Github地址：
https://github.com/zlt2000/my-agent-skill/tree/master/meeting-minutes

[https://github.com/zlt2000/my-agent-skill/tree/master/meeting-minutes](\"https://github.com/zlt2000/my-agent-skill/tree/master/meeting-minutes\")
在实际使用过程中本文 Skill 还可以进行以下迭代优化：

1. 在references里扩展更多的会议类型模板；
2. 在script文件夹写Python脚本，实现输出内容导出word文档或者同步给飞书。


## 七、总结
Agent Skills的正式发布，标志着 AI 协作从提示词工程正式迈入技能工程的全新范式。它将人类专家的经验、标准化流程与行业最佳实践，封装成AI可理解、可执行、可复用的数字资产。

核心价值优势：

1. 降本增效：通过渐进式披露、按需加载机制，大幅减少 Token 消耗，同时让 AI 聚焦核心任务，推理效率与执行稳定性同步提升；
2. 跨平台互通：作为开放标准，实现 “一次构建、多端复用”，Skill 可无缝适配 Claude、Cursor、Trae、Copilot 等主流平台，打破工具壁垒；
3. Skill 市场：构建起类似 VS Code 插件市场的 Skill 生态，官方与社区共同打造技能商店，让专业能力可分享、可迭代、可规模化应用。
