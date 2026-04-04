---
created: '2026-01-27T09:00:48.657'
modified: '2026-01-27T09:00:48.657'
source: https://www.cnblogs.com/longronglang/p/19530212
title: Claude Skills 保姆级教程：无脑照做就能用出效果 - 久曲健 - 博客园
type: archive-web
---



大家好，我是六哥。

Claude Skills我也是上周一才知道有这么个东西，具体是什么完全没概念，想想还是自己知道的太晚了。

但说实话，这玩意成功的引起了我的好奇心，所以就有了这篇文章！

没有所谓的方法论和废话，下面我们直接开始。

## 一、什么是 Claude Skills？
Claude Skill就是让AI学会你的方法，然后一直按你的方法做事。

什么？还是有些不太懂？

好的，那么我来举个例子：

就像你给别人演示一次“怎么帮你整理书包”，\n以后你告诉他“帮我整理书包”，\n它就会按照你教的顺序——先放课本、再放文具、最后放水杯——\n自动帮你整理好。

Claude Skill就是这个“教AI记住你做事方式”的功能。

## 二、Skill、MCP 到底有什么关系
Skill是教AI怎么做事的“方法”，MCP是AI能用来帮忙的“工具”。

还是感觉太抽象？

好的，那我再来举个例子：

你教 AI：“整理书包要先放课本、再放文具、最后放水杯。”\n这是 Skill（方法）。\nAI 整理书包时，需要用到“手”“眼睛”“小推车”这些工具，\n这些工具就是 MCP。

有了方法 + 工具，AI才能又快又好地帮你整理书包。

## 三、Claude Skills 的使用
看到这，相信你对Claude Skills心里会有个大概印象了，但还是缺乏实践上的理解。

好的，那么我们下面一起来动手强化这部分的理解。

### 1、安装 Claude Code
#### 官网方式安装
这里我Mac系统为例，其他同学按需选择，终端输入如下：

#### npm 方式安装
电脑必须安装 Node.js，如没有请自行安装



终端输入以下命令安装

npm install -g @anthropic-ai/claude-code

安装好后，输入如下命令验证

claude --version



### 2、登陆Claude code
Claude Code需要账户才能使用，具体操作如下：

成功如下：



这里大家也不难看到，不管是用API方式，还是账号方式登陆，选择官方的Claude模型，真的非常贵，可以选择中转的API，性价比高，当然你也可以选择 GLM 4.7，相对划算。

这里我建议安装CC Swtich来管理各种API的配置，具体安装如下：

点击下载链接→传送门←，进入CC-Switch的Github Release页面

[传送门](\"https://github.com/farion1231/cc-switch/releases/tag/v3.10.2\")
鼠标滚动到最下方选择适合自己版本的安装包，Windows系统推荐下载普通msi后缀的安装包进行安装



安装后运行CC-Switch主程序，界面如下。



### 3、Claude code配置
打开你下载的CC Switch软件，你会看到如下图的初始界面



在分组条中，将分组选择至“Claude”



在供应商分组中，选择如图的“PakcyCode”



回顾 创建API令牌，在PackyApi中创建 CC 分组的令牌，点击复制按钮，复制ApiKey到剪切板



下拉模态框，找到“API Key”配置项，填入你刚才复制的ApiKey，再点击右下角“添加”按钮



添加成功后，在主界面会看到我们配置的分组，在右侧点击“启用”按钮，显示“使用中”，则配置完成



在终端运行claude，看到对话界面并能正常回复即表示配置完成\n

### 4、在 Claude Code 中安装 Skills
在 Claude Code 中运行以下命令，将此存储库注册为Claude Code插件市场：

/plugin marketplace add anthropics/skills

然后，在插件市场中搜索相关插件：



安装好skills后，重启Claude Code。

ok，准备就绪

### 5、Skill的使用
下面我们开始一起实践操作。

#### 第一个例子
在Claude Code中输入如下内容

用 xlsx skill 创建一个生成一个 2025 年 1–12 月的销售报表



接着，就是你选择yes和no的过程了



中间有报错或者什么的你都不用操心的，它都会帮你解决，最终结果如下：





#### 第二个例子
这次我们通过自然语言来安装Skill（需要辅助才能链接github）

[辅助](\"https://www.nfsq.us/#/register?code=xLnGFvrn\")


安装成功



重启Claude Code，接下来，我们再来实践一个例子



然后，我们等待Skill被创建好，如下所示



接着，用我们创建的Skill开始干活，Claude Code输入如下内容：



现在，它开始给我们干活了。

很快,我们就可以看到结果，如下所示：



最终效果





真的非常给力呀，一个报表就这么愉快的搞定了。

做一个 skill 就几分钟时间，非常方便。

### 6、可能遇到的坑
#### 账号、API准备
- 获取订阅了Claude套餐的谷歌账号（考虑某宝店铺有卖，略贵）
- 需要辅助，公众号软件测试君 回复“农夫山泉”获取辅助，节点避雷大陆、香港、俄罗斯，建议美国、日本、新加坡。
- claude中转API
[claude中转API](\"https://www.packyapi.com/register?aff=jJeQ\")
#### Claude认证
问题1：运行claude命令时，报错：Unable to connect to Anthropic services \\n Failed to connect to api.anthropic.com: ERR_BAD_REQUEST ：

- 找到.claude.json文件（命令：ls -a ~/.claude.json）
- 进入编辑文件窗口（命令：nano ~/.claude.json）
- 在文件末尾（根字段）添加：\"hasCompletedOnboarding\": true 以跳过首次运行的引导界面
问题2：粘贴授权码后，报错： OAuth error: Request failed with status code 403 \\n Press Enter to retry.且重试无果：

- 查看公网地址信息，如果仍是国内则原因为代理失效（命令：curl ipinfo.io）
- 如果是代理失效，则手动添加代理，具体命令如下：（注意代理端口一般是7890但可能不一致）
执行完后重新查看公网地址，若显示为代理地址则成功（效果见下图）



可能有的同学会问我，为什么我启动Claude Code时，默认是智谱的GLM4.7，因为便宜！

[GLM4.7](\"https://www.bigmodel.cn/glm-coding?ic=VABLPWRMVY\")
Claude Code是可以切换默认模型的，如有需要，后面我会在更新一篇文章来写如何更换默认启动模型，如感兴趣，可以文末留言呢！

下面是我推荐一些通过API方式调用，比较省钱的方式，可以真正跑起来Claude Code，请按需选择:

- 智谱GLMhttps://www.bigmodel.cn/glm-coding?ic=VABLPWRMVY
- 硅基流动：https://cloud.siliconflow.cn/i/nyZIgvwa
- 辅助：https://www.nfsq.us/#/register?code=xLnGFvrn
- Claude Clode中转API：https://www.packyapi.com/register?aff=jJeQ
[智谱GLM](\"https://www.bigmodel.cn/glm-coding?ic=VABLPWRMVY\")
[https://www.bigmodel.cn/glm-coding?ic=VABLPWRMVY](\"https://www.bigmodel.cn/glm-coding?ic=VABLPWRMVY\")
[硅基流动](\"https://cloud.siliconflow.cn/i/nyZIgvwa\")
[https://cloud.siliconflow.cn/i/nyZIgvwa](\"https://cloud.siliconflow.cn/i/nyZIgvwa\")
[辅助](\"https://www.nfsq.us/#/register?code=xLnGFvrn\")
[https://www.nfsq.us/#/register?code=xLnGFvrn](\"https://www.nfsq.us/#/register?code=xLnGFvrn\")
[Claude Clode中转API](\"https://www.packyapi.com/register?aff=jJeQ\")
[https://www.packyapi.com/register?aff=jJeQ](\"https://www.packyapi.com/register?aff=jJeQ\")
## 四、一些好用的skill
### 1、用途速查表
### 2、相关资源
[code.claude.com/docs/en/skills](\"https://code.claude.com/docs/en/skills\")
[github.com/anthropics/skills/tree/main/spec](\"https://github.com/anthropics/skills/tree/main/spec\")
[awesomeclaude.ai/awesome-claude-skills](\"https://awesomeclaude.ai/awesome-claude-skills\")
[skillsmp.com](\"https://skillsmp.com\")
## 五、写在最后
从AI的整个发展史来看，从LLM→Agent→MCP→SKILL，每个阶段的出现，都是为了解决特定问题而应运而生。

所以，我有了的大胆的设想，这玩意应该可以移植到实际的开发应用中，应该会很有意思！
