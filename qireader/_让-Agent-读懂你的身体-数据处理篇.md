---
comments: true
created: '2026-10-30T16:46:58'
draft: true
modified: '2026-10-30T16:46:58'
source: https://sspai.com/prime/story/how-to-analyze-health-data-with-agent
title: 让 Agent 读懂你的身体：数据处理篇
type: archive-web
---

在上一篇文章《让Agent读懂你的身体：数据获取篇》中，我花了很大的篇幅讲清楚了第一个问题：Agent怎样拿到数据。如果照着实践完，你大概率已经收获了一份存储了运动健康数据的SQLite、Markdo
...

在上一篇文章《[让 Agent 读懂你的身体：数据获取篇](https://sspai.com/prime/story/how-to-obtain-
data-for-agent-analysis)》中，我花了很大的篇幅讲清楚了第一个问题：Agent
怎样拿到数据。如果照着实践完，你大概率已经收获了一份存储了运动健康数据的 SQLite、Markdown 或 JSON 文件。

此时，大多数人大概就忍不住让 AI Agent 来帮忙分析一下文件了——

「Claude，这是我的健康运动数据，帮我做一下详细的分析。」

我自己起初也是这么做的。在简短的提问之后，Claude 就能生成一个精美的
HTML。上面有每个动作的训练趋势、恢复状态的图标以及按照日历排列的训练日历图等。信息排得很满，但研究一下就会发现，它除了好看，并没有什么用。

这就是问题所在——AI Agent 擅长描述，而如果想让它分析实际问题并给出建议，比如下一次训练该加多少重量，则需要用户自己对需求的判断与适当引导。

所以，在这篇文章中，我会根据我的实际经验，来详细回答后面的两个问题：拿到数据以后，怎样让它正确地处理？它给出的结论能信几分？

**注：** 目前我这套方法只适用于辅助日常的运动训练，不建议用于排查身体的实际症状，也不应用于应对医疗情况。

### **我的整体方案**

以我自己为例，我用：

  * Apple Watch 记录运动训练数据，包括有氧和抗阻训练；
  * Oura Ring 记录睡眠、夜间恢复以及日常活动数据；
  * 训记 App 专门记录抗阻训练的容量和组数（同时使用训记和 Apple Watch 不会重复计入运动数据）

其中，Apple Health 和 Oura 的数据都接进第三方服务 Freddy。它通过 Oura 的官方接口授权读取，所以 Oura
自己算出的准备指数（Readiness）等算法数据也能拿到。

接着，通过 Agent 预先写好的 Python 脚本，经 Freddy 和训记的 API 将数据拉取到本地，存进 SQLite
数据库。而体脂、体重这类低频指标和训练感受等，我会用文字或图片的形式直接发给 Agent，由它整理后录入数据库。

上述项目搭建在家里的 NAS 上，Python 脚本定时拉取最新的生理和训练数据；网页看板设置好端口，通过局域网地址就可以直接访问。

去健身房之前，我用手机或电脑通过局域网连上 NAS 触发任务。常规任务在网页看板上留有按钮，可以一键启动；复杂的任务则通过终端里的 CLI
工具对话进行。触发后，AI Agent
读取最新的身体数据和训练记录，先由两个「教练」给出动作、组数和重量建议，再由「循证教练」核查训练量和强度。最终由我自己确认后，将计划作为一条训练记录，通过
API 写进训记。

到了健身房，我只要打开训记照着计划练，并给每组动作备注余量和训练感受。这些内容最终会通过 API 回传给 AI，完成一次循环。

![](https://cdnfile.sspai.com/2026/10/29/d63d816fc198ebb1e3a7bd62bb75b41d.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

把这些环节串起来并不复杂。真正需要花心思的，是给 Agent 建立一套「行为规范」，让它稳定地分析已有的数据并输出建议。方法很简单，搞个 Skill 就行。

### **为什么不用现成 Skill**

「不要重复发明轮子」是软件开发领域的至理名言。一般来说，我们应该先看看社区里已有的 Skill，如果它们可以覆盖需求，直接套用即可。

其中，[Coach Paddy](https://github.com/BorisBW/claude-fitness-cn)
相对最接近我个人的需求。它内置了数据接口，能够读取 Garmin、COROS、WHOOP 和 Apple Watch 的数据，力量训练数据可以选配训记的
API；记忆存在用户的 Obsidian
里，包括运动员档案、训练计划和每日生理数据等。它会给出准备度评分，用来决定当天全力、降级还是休息，也能提供训练计划、进行每周复盘，算是一套相对完整的解决方案。

Coach Paddy 还有个值得借鉴的机制：出现数据缺失时，准备度评分就会降级，替换为 1 到 5 分的主观精力评分。

我最终没有选择 Coach
Paddy。首先，我不需要它的数据接口模块。而且它虽然自称支持多项运动，分析的重心却在耐力训练和赛事备战，有比赛信心分、比赛倒计时等功能，和我的应用场景不吻合。此外，项目的
Star 和 Fork 不多，说明实际效果可能验证不足。

其实，现有的 Skill 多多少少都有类似的问题。因为训练是一件很个人的事情：训练目标、关注的指标、可用的器械、作息习惯、运动体系等，人人都不一样，现成的
Skill 很难完美适配。同时，健康和训练类 Skill 的关注度普遍较低，我目前找到的最多也不过 200 多个 Star，使用反馈大都不足。

Skill | Stars | 类型 | 具体功能 | 可借鉴之处  
---|---|---|---|---  
[Coach Paddy](https://github.com/BorisBW/claude-fitness-cn) | 21 | 综合型 | 准备度评分、当日计划，训练后复盘，每周回顾训练量趋势 | 缺数据时在报告里注明；用 1–5 分的精力和酸痛自评替补；HRV 对照本人近 28 天的均值和标准差  
[health-skill](https://github.com/googlarz/health-skill) | 13 | 综合型（偏健康管理） | 把化验、用药和穿戴数据汇成本地档案；有跑步汇总和训练计划 | 每条数据记下来源，来源冲突时列出来，拿不准时说明缺什么  
[Claude Coach](https://felixrieseberg.github.io/claude-coach/) | 204 | 综合型（偏耐力） | 生成铁人三项、马拉松和超马的训练计划 | 接不上数据时，可以直接描述训练史；先定训练区间再排课，拿不准时宁可保守；耐力训练可以借鉴它的计划制定方法  
[health-self-investigation-skill](https://github.com/amydeng2000/health-self-investigation-skill) | 86 | 方法型（偏健康方面） | 针对原因不明的非紧急健康困扰，设计低风险的自我对照实验 | 每批只问 2 到 4 个具体问题；基线足够、过了「实验就绪」门槛才给完整方案；遇到急症先给安全指引  
[Health OS](https://github.com/werdan/health-os) | 0 | 方法型 | 按每周分化排课，只从动作库里挑动作，并按所在健身房的器械过滤 | 不许临场编动作；每个模型都要写明适用边界；排课先定目标，再按准备度和个人约束调整  
[training-log-analyzer](https://github.com/onewave-ai/claude-skills/blob/main/training-log-analyzer/SKILL.md) | - | 方法型 | 分析训练日志，找出进步趋势、平台期、休息恢复需求和伤病风险指标 | 无  
[google-health-sleep-skill](https://github.com/decadance/google-health-sleep-skill) | 0 | 方法型（只看google 睡眠数据） | 分析睡眠和恢复数据 | 至少有 10 晚的数据才算相关性；建立基线后再比较  
[apple-health-analysis](https://github.com/labrinyang/apple-health-analysis) | 10 | 方法型 | 用 21 种统计方法生成健康评估报告，含「30 种疾病风险筛查」 | 主要结论都标 A 到 D 的证据等级，只评有数据的维度，统计交给脚本算  
[gym-training-expert](https://github.com/frankxai/claude-skills-library/blob/main/free-skills/gym-training-expert/SKILL.md) | - | 知识型 | 讲训练量分档、渐进超负荷和三种周期化 | 可以当知识库，挂给其他分析流程用；按每个肌群每周给出训练量区间；不同时增加训练量和强度  
[workout-program-designer](https://github.com/onewave-ai/claude-skills/blob/main/workout-program-designer/SKILL.md) | - | 知识型 | 按目标生成训练计划；正文只有一句要素清单 | 无  
  
**注：**

  1. 统计时间为 2026.10.16；
  2. Stars 一栏中的「-」表示该 Skill 为项目的子文档，没有单独的 Star；
  3. 类型一栏是我的主观分类，仅供参考。

所以，如果你能接触到顶级模型（例如 Claude Fable 或 ChatGPT Astra 等），不如让 Agent 吸取现成 Skill
的可取之处，在此之上定制一个适配个人习惯的 Skill。

定制 Skill，最难也是最关键的一步就是把需求梳理清楚，然后制定详细的实施方案。我会先用 [grill-
me](https://github.com/mattpocock/skills/blob/main/skills/productivity/grill-
me/SKILL.md) 技能把需求问清楚。它来自 Matt Pocock 的开源 Skill 仓库，作用是让 Agent
反过来向你提问：从粗略的想法出发，一直追问到形成确定而详细的结论。坏处就是有时候你会觉得，它怎么还有这么多问题。

![](https://cdnfile.sspai.com/2026/10/29/e15607c1d0c974bba24845f88bddce03.PNG?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)  

### **统计数字交给代码**

在我与 AI 的第一轮对话中，AI 就问出了一个非常关键的问题：计算和决策分别由谁来做？