---
created: '2025-11-24T16:49:12'
modified: '2025-11-24T16:49:12'
source: https://blog.csdn.net/zpj779878443/article/details/155064218
title: 【AI省流快讯】Cloudflare 炸了 / Gemini 3 来了 / Antigravity 独家实测 (附：无法登录解法)
type: archive-web
---

### Cloudflare 挂了

🤡 昨晚陆续刷到 “**CF挂了** ” 的消息，没太在意，直到无法打开" **盗版漫画** " 站点，我才意识到问题的严重性：

![](https://i-blog.csdnimg.cn/img_convert/6bfd760033c5be4d47af8a2a579fa24e.png)

🤣 原因众说纷纭，刷到这哥们的 “**梗图** ”，差点把我笑岔气：

![](https://i-blog.csdnimg.cn/img_convert/1c58ba4c12a3134c3ccea7c9fe2342ff.png)

![](https://i-blog.csdnimg.cn/img_convert/54ee2e80b4a9d6f25c17e7ef6434388f.png)

😃 还有人猜测可能是 **Google** 发布的 “**哈基米 3** ” (Gemini) 发起的攻击：

![](https://i-blog.csdnimg.cn/img_convert/cb069d05b5d914ead4e746a9ce484c7a.jpeg)

**时间线** ：

  * 【**19:30** 】用户开始报告网站无法访问，出现10xx、52x、50x系列错误；Cloudflare Dashboard无法访问；部分Cloudflare域名解析中断。
  * 【**19:48** 】Cloudflare正式确认服务异常，启动紧急调查。
  * 【**20:03** 】持续调查中，未发现明显进展。
  * 【**20:13** 】部分服务开始恢复，但错误率仍高于正常水平。
  * 【**20:21** 】监测到部分服务恢复迹象；多次反复出现故障与恢复的波动；20:23、20:55等时间点再次中断。
  * 【**21:04** 】技术团队紧急关闭伦敦节点的WARP服务接入以控制影响范围。
  * 【**21:09** 】官方确认定位到根本原因，开始实施修复方案。
  * 【**21:13** 】Cloudflare Access与WARP服务全面恢复，错误率回落至日常水平。
  * 【**22:12** 】X应用恢复。
  * 【**22:22** 】Cloudflare状态页更新：“我们正在继续努力修复此问题”。
  * 【**22:34** 】状态页再次更新：“我们已经部署了一项变更，已恢复仪表板服务。我们仍在努力解决对整体应用服务的影响”。
  * 【**22:42** 】全局恢复完成，Cloudflare宣布事件解决，后续监控与处理继续进行中。

**Cloudflare** 发言人 **Jackie Dutton** 在官方声明中表示，故障源于一个 **用于管理威胁流量的自动生成配置文件**
。该配置文件原本用于防护潜在安全威胁，但由于文件规模异常庞大，导致多项内部系统在处理流量时发生故障：

![](https://i-blog.csdnimg.cn/img_convert/7e1aefe8e9c8ab2ebcf32a384ee6f28f.png)

截止目前，**Cloudflare **全球网络服务已全面恢复，受影响的X、ChatGPT、Facebook 等主流平台均已恢复正常使用。😀
在网上看到大佬的原因分析，也贴下：

![](https://i-blog.csdnimg.cn/img_convert/4037ea07b06fb81aded95dde9efeae7b.png)

😆 难兄难弟啊，前阵子 **亚马逊AWS **的大规模宕机
(10.20，**美东区域数据库权限和DNS管理系统配置故障**)，故障持续约15小时，直接造成全球互联网大面积混乱。

![](https://i-blog.csdnimg.cn/img_convert/fde592564c4d1d81518c1c8428b6b505.png)

### Gemini 3 来了

😄 千呼万唤的 “**哈基米 3** ” (**Gemini**) 终于来了，不过竟然没搞个发布会，只是在 **官方博客 **发下文章：

[《A new era of intelligence with Gemini
3》](https://blog.google/products/gemini/gemini-3/#note-from-ceo)

先简要回顾了一下 Gemini 系列的发展历程：

  * **Gemini 1** ：着重在 “**原生多模态** ” (文本+图像) 和 “**长上下文窗口** ”。
  * **Gemini 2** ：开始推动 “**智能代理式 (agentic)** ” 与 “**推理与思考** ” 能力。

**Gemini 3** 在上述基础上进一步提升，方称其为迄今 “**最智能、最安全** ” 的模型：

  * **推理能力 & 多模态理解**：在各种 AI 基准测试 (benchmarks) 上表现优异：LMArena (1501 Elo)、GPQA Diamond (91.9%)、MMMU-Pro (81%)、Video-MMMU (87.6%)、SimpleQA Verified (72.1%)。**模型能更好理解背景、意图，给予更有深度、少空话的回答** 。
  * **Gemini 3 Deep Think** ：“**深思** ” 增强模式，可进行更深的链式推理、更强代码执行与工具调用，提升复杂问题的求解能力，Humanity’s Last Exam (41.0%)、GPQA Diamond (93.8%)、ARC-AGI-2 (带代码执行，45.1%)。该模式将在数周内向 **Google AI Ultra** 订阅用户开放。

* * *

**三大应用场景**

① **学习**

  * 模型支持文本、图像、视频、音频、代码等多模态输入，**100w token** 的上下文窗口。
  * 如：可将手写不同语言的食谱翻译并制作家庭食谱；分析视频运动比赛 (如Picklebal) 帮助你提高训练。
  * 可在 Google 搜索中的 “AI Mode” 借助 Gemini 3 提供生成式 UI、互动工具、仿真体验。

② **构建**

  * 强 “**零样本生成** ” 能力：不用给示例、不用教，只说想法，直接生成你想要的东西。能处理复杂 **提示/指令** (提示/指令)，生成更丰富、互动性更强的 **Web UI** 。基准测试：WebDev Arena (比谁能更好地完成Web开发任务，1487 Elo，战绩亮眼)、Terminal-Bench 2.0 (54.2%，命令行处理真实开发任务的能力)、SWE-bench Verified (软件工程能力-修bug、补功能，76.2%-非常高，大部分模型在30%-40%)。
  * 可在 Google 的 AI Studio、Vertex AI、Gemini CLI、以及新出的 AI IDE-**Google Antigravity **中使用。第三方平台也支持，如：Cursor、GitHub、JetBrains、Manus、Replit 等。

③ **计划**

  * 在长期多步骤任务中表现提升，如：Vending-Bench 2 中可 “模拟一年” 运营决策。
  * 新增 **Gemini Agent** 工具，能够代表用户自动完成多步骤复杂任务，如管理邮箱、自动化工作流程和旅行计划，且仍受用户控制。已向 Google AI Ultra 用户开放早期体验。

😄 打开 **ai.studio** 直接就能看到最新的模型了：

![](https://i-blog.csdnimg.cn/img_convert/5bcff29650f5901d97c84873d4e4d1c7.png)

* * *

**谷歌官方 **在演示中展示了三个 **Vibe Coding** 例子：

TODO-插入视频

  * **AI 课程平台登录页** ：通过简单 Prompt (“新布鲁特主义风格，创意有趣设计，平滑滚动动画，谷歌色彩，深浅主题”)，直接生成了一个完整的、具有动画效果和深浅主题切换的登陆页。
  * **SaaS 数据看板** ：用户上传 CSV 数据文件和参考设计截图，自动生成了一个具有图表、筛选器、深色主题的专业数据仪表盘。
  * **互动游戏** ：通过复杂 Prompt (涉及React、Three.js、3D 效果等技术细节)，生成一个完全可玩的3D游戏。

😄 国内 **自媒体** 基本都是在吹它的 “**前端能力** ” (看效果图确实挺6的)：

  * **能生成精确的 SVG 矢量图** ：包括复杂的动画 SVG (如：旋转风扇动画)，而非简单栅格图。
  * **3D 和动画** ：支持生成 Three.js 3D 模型、WebGL 着色器、CSS 动画等高级视觉效果。
  * **完成应用框架** ：能理解复杂的技术栈要求 (React、Three.js Fiber、TypeScript 等)，生成模块化、结构清晰的代码。
  * **注解修改** ：用户可以在生成的界面上用 “**标注** ” 的方式指出要修改的地方 (画圈、画箭头、添加文字)，Gemini 3 会理解这些视觉标注并精确修改代码。这得益于它 **多模态理解能力的显著提升** (对屏幕截图的理解准确率达到 72.7%，达到现有水平的两倍)。
  * 去 “**AI味** ”：排版、色彩搭配、组件结构看起来是 “**精心设计** ” 的，而非生硬地套模版。

🤔 目前杰哥还没 **深度体验 **这个新模型，不好评价，只实测下这个新出的 **AI IDE** —— **Antigravity** 吧~

### Google Antigravity (反重力)

#### 下载安装

下载地址：

[下载 Google Antigravity ](https://antigravity.google/download)

下载完双击安装：

![](https://i-blog.csdnimg.cn/img_convert/59d1681b0cf15a32d31af4f2edc3fd86.png)

接着是不断按 **Next** 的 傻瓜式安装 (是否从VS Code 或 Cursor 导入设置)：

![](https://i-blog.csdnimg.cn/img_convert/3becafeaa3303a9ceb0b9076483d0561.png)

选主题：

![](https://i-blog.csdnimg.cn/img_convert/b04c3129093abf32da09bd7758591061.png)

选使用 Agent 的方式 & 编辑器配置 (默认就好)：

![](https://i-blog.csdnimg.cn/img_convert/49e69366f14bf9b7b82af0752ede148f.png)

![](https://i-blog.csdnimg.cn/img_convert/e1c954d8fd512191e6e569a2610b4b1c.png)

![](https://i-blog.csdnimg.cn/img_convert/09c6dab7fed36d3f9f82d6aa229a70d5.png)

😐 最后，大部分人会卡在登录这里，杰哥也是折腾了一早上，买了两个号才登上的。

#### 登录问题的解决

##### 代理问题

![](https://i-blog.csdnimg.cn/img_convert/549423c0edd2950726b959d72579dc8c.png)

如图，先检查 **TUN** (全局/系统代理) 模式有没有开：

![](https://i-blog.csdnimg.cn/img_convert/0bdc4a9103c783b3fd58aa3e3a728ac5.png)

接着看 **代理** 的 “**地区** ”，香港是不行滴，群里有人说新加坡/日本可以，杰哥用的 **美国** ，其次是 **代理 **的 “**质量**
”。

##### 账号问题

代理没问题了，基本是能自动打开浏览器，跳转到授权页，然后授权成功的：

![](https://i-blog.csdnimg.cn/img_convert/ff79194e8e2b80999ff60185d08732db.png)

接着返回 **Antigravity** 可能会出现这两种情况：

![](https://i-blog.csdnimg.cn/img_convert/8104f6cce66d9d5f49909c88f7624206.png)

![](https://i-blog.csdnimg.cn/img_convert/b10d9514aef30232802d40eeb8077279.png)

这极大概率就是 “**Google账号** ” 的问题，先访问下述网址，查看：**账号当前的国家或地区版本** 。

[《Google 服务条款》](https://policies.google.com/terms)

比如我的号：

![](https://i-blog.csdnimg.cn/img_convert/914cabb468d54a320a724e6e41c85f62.png)

🤷‍♀️ 香港肯定是不行的，可以访问下述地址申请修改 (**一年只能改一次 **❗️)

[《账号关联地区更改请求》](https://policies.google.com/country-association-form)

具体操作：

![](https://i-blog.csdnimg.cn/img_convert/4321b73e6c69a40b0d5fd47fecb02e2b.png)

😐 改完，如果还不行的话，那应该是 “**账号本身有问题** ” 或者触发了 Google 莫名其妙的拦截规则。我一开始在海鲜市场买了一个 “**美区**
” 的老号，一直卡 Setting Up 那里转。后面又收了个 “**日区** ” 的号，**秒进** ❗️❗️❗️

😄 还有个群友提供了一个野路子：

> 登Google play，在美区买本0刀的免费电子书，就成美区了。

💡 反正进不去，就是 “**代理** ” 和 “**账号** ” 的问题！我现在的组合是：**日区号** +**
美国代理**。都没问题，会进入这个是否允许采集信息的页面，取消勾选，然后 **Next** ：

![](https://i-blog.csdnimg.cn/img_convert/717f712d3177501cd9bfc5704c468aa0.png)

接着就能来到 IDE 的主页面了：

![](https://i-blog.csdnimg.cn/img_convert/673817c35228e214572c0a012cde24d2.png)

#### 初体验

🤣 熟悉的 **VS Code** 套壳界面，还是很有亲切感的，右侧有常规的 **AI Chat** ：

![](https://i-blog.csdnimg.cn/img_convert/2a37fd6fcab2e18c9afd0b484916aa90.png)

除了选模型外，还支持选模式：

![](https://i-blog.csdnimg.cn/img_convert/54d4a098021d4ea58222c042ab195d21.png)

按 **Ctrl + E** 可以打开类似于 **Cursor Agents** 模式的 “**Agent Manager** ”：

![](https://i-blog.csdnimg.cn/img_convert/4c10c16e4d26cf1e0a01ff5051e37ddd.png)

上面我写了一个，让 **Antigravity** 基于 **Claudeflare** 故障信息生成一个用于发布到 **自媒体平台**的长图的 简单的**
Prompt**，发送后可以看到 **Agent** 开始干活：

![](https://i-blog.csdnimg.cn/img_convert/cf4c55e7cbb1676ae2b024f51bd187e0.png)

涉及到命令执行，让你 **Accept** ：

![](https://i-blog.csdnimg.cn/img_convert/2b59312e2cf039997397c7849b34d79b.png)

觉得烦可以点下右侧切成 **Turbo** 模式：

![](https://i-blog.csdnimg.cn/img_convert/3c205376102533c5ccc0a7b2ac9cfa74.png)

活干完，要预览，跳转 **Chrome** ，提示安装一个 **浏览器插件** ：

![](https://i-blog.csdnimg.cn/img_convert/0517e71eacee83e1a49d458047b9ead6.png)

以便 **Agent** 能直接操作浏览器 (如获取页面节点、自动化、截图等)。最后看下生成效果：

![](https://i-blog.csdnimg.cn/img_convert/dd7285bbe5a15da79f960f9ed52af62d.png)

🤔 同样的 **Prompt** ，分别看下 **Claude 4.5** 和 **GPT 5** 的生成效果：

![](https://i-blog.csdnimg.cn/img_convert/cbbbfea76c9db67771c50ee287a25d61.png)

![](https://i-blog.csdnimg.cn/img_convert/ac744f9364a04ede3ad2bf0fcfd74634.png)

🤣 哈哈，你更 **Pick** (喜欢) 哪个模型生成的页面呢？

#### 限额

群里有小伙伴没蹬几次就出现了这个：

![](https://i-blog.csdnimg.cn/img_convert/858b0755e0fe4abd9e3f965ba74e1949.png)

看了下官网：

[《Google Antigravity Plans》](https://antigravity.google/docs/plans)

![](https://i-blog.csdnimg.cn/img_convert/6dd0862fea349a5a13d8c0d7c3c17910.png)

> 💡 **额度** 由Google动态决定 (基于系统容量、防止滥用)，每五小时刷新一次，额度与任务复杂度相关。🐶 官方表示：只有
> **极少数高强度用户** 会撞到每5小时上限。

😄 所以这个额度是 “**不透明** ” 的，**L站 **有人说不一定得等五个小时，等了十几分钟又可以用了~
