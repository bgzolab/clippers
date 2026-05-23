---
created: '1970-01-01T08:00:00'
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/1951238505524093197
title: VSCode Copilot 也能支持其他OpenAI兼容接口啦，可以使用其他模型（DeepSeek、Kimi、Qwen）和第三方转发API
type: archive-web
---

![](https://pic4.zhimg.com/v2-a5dbcb97d1d8f537f75fc6c87a7411c3_1440w.jpg)

## **1** 前言

VSCode Copilot一直不支持使用OpenAI兼容接口来接入任意模型，默认的模型只有几个

![](https://picx.zhimg.com/v2-acd838583f457a50be0685818350eb6d_1440w.jpg)

免费模型写代码还算好用的只有GPT-5 mini和Grok Code Fast 1，其他模型都要消耗Premium requests

![](https://pic3.zhimg.com/v2-6013a5172b2956b054fae02cfff1cdde_1440w.jpg)

要自定义模型，只能用国外的几个API接口，充美刀太贵了

![](https://pic2.zhimg.com/v2-e28b8b0302a00c9b0bb7af76f7c6f895_1440w.jpg)

所以当我把Copilot的免费次数用完之后，之前都是用Kilo Code+第三方API来平替

虽然Kilo Code在Vibe Coding其实甚至是比Copilot好用的，但是也有如下缺点

‍**✦** 如果只是想要编辑单个文件、提问题，消耗的token就会过多了

‍**✦** 如果对文件进行多次编辑，不方便看多次编辑后的文件与一开始的差别，只能看每次编辑的差异

‍**✦** 撤回全部的交互不如Copilot，Copilot可以一键就撤回全部修改，Kilo
Code只能跑到聊天最开始的位置，在回溯点点击撤回，有时候太麻烦了

所以只是简单对单个文件进行编辑，我一般还是倾向于使用Copilot，Copilot的agent功能现在也挺好用的了

![](https://pic3.zhimg.com/v2-e83bbc906a5224f325f6bc21053b2616_1440w.jpg)

所以看到有插件实现了让VSCode Copilot也能支持其他OpenAI兼容接口还是非常开心的，和大家分享一下

## **2** 安装插件

VSCode搜索OAI Compatible Provider for Copilot，进行安装

![](https://pic4.zhimg.com/v2-7d9605f9643d23dc454ad9593da256c5_1440w.jpg)

备注：这个插件其实是根据Hugging Face Provider for GitHub Copilot Chat这个插件改的

![](https://pic2.zhimg.com/v2-25309ef09a659927b5de6ae6966b58b5_1440w.jpg)

## **3** 设置Base Url

打开VSCode 设置，找到插件设置，设置Base Url

只要是OpenAI兼容接口都可以使用（DeepSeek、Kimi等API接口都支持）

![](https://pic3.zhimg.com/v2-f98495bf4e5639f092152ad6d0de46ec_1440w.jpg)

我使用的Url为V3 API的Url：`https://api.gpt.ge/v1`​

优点

‍**✦** 国产和国外的各个模型基本都能用，这样只需要充值一个API，就可以使用所有模型，省去多个API充值的麻烦。

‍**✦** 按量付费，用多少花多少，比充值OpenAI、Claude的会员，每月都要交钱划算

‍**✦** 人民币比美刀算1:2，比直接充值国外模型的官方API会更便宜

欢迎使用我的邀请链接：[https://api.gpt.ge/register?aff=fQIZ](https://link.zhihu.com/?target=https%3A//api.gpt.ge/register%3Faff%3DfQIZ)，可以获得$0.3余额奖励试用。​​

## **4** 添加模型

在Copilot聊天窗口点击Manage Models

![](https://pic4.zhimg.com/v2-76fc0675c628bf0814cdc3755ad6c267_1440w.jpg)

选择【OAI Compatible】

![](https://pic4.zhimg.com/v2-6de6b37febf7a961487779fe5a5b1e85_1440w.jpg)

设置API key之后，就可以搜索设置模型了

![](https://pic1.zhimg.com/v2-7cf082ebbb4d4fae770d36eecd2f5178_1440w.jpg)

最后我设置了

‍**✦** claude sonnet 4.0

‍**✦** DeepSeek v3.1

‍**✦** Gemini 2.5 pro

‍**✦** GPT 5 High

‍**✦** kimi k2 0905

‍**✦** Qwen3 Coder

‍**✦** GLM 4.5

![](https://pic4.zhimg.com/v2-1db2207a3b4508fa2f1ee9ed2b423a7b_1440w.jpg)

‍

‍