---
comments: true
created: '1970-01-01T08:00:00'
draft: true
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/703749038
title: youtube data api v3 接口开通教程
type: archive-web
---

大家好，今天分享一篇开通YouTube的API教程，分享给大家！

## 一、背景调查

### 1.1 youtube介绍

![](https://pic4.zhimg.com/v2-4b09e0780ff454be0ece946101433c63_1440w.jpg)

众所周知，youtube是目前全球最大的视频社交平台，该平台每天产生大量的视频内容，涵盖各种主题和类型，从音乐视频到教育内容，再到娱乐节目和新闻报道等。YouTube的用户群体也非常广泛，包括了各个年龄段、地区和兴趣爱好的人群。由于其庞大的用户基数和丰富的内容，YouTube已成为全球最受欢迎的视频分享平台之一，对于用户和内容创作者来说具有巨大的影响力。

### 1.2 分析价值与意义

通过对youtube平台的视频内容（视频标题、视频描述、发布时间、视频标签等）和用户行为（如创作发布、视频点赞、视频评论、互动时间等）进行分析，可以帮助研究人员更加了解目标受众的喜好和兴趣，利用自然语言处理、文本挖掘、数据统计等技术方案，从中挖掘出不同国家地区用户的兴趣点、情感倾向、对某一热门事件的看法态度，对分析网络舆情事件的传播有重大意义。

### 1.3 API接口介绍

采集youtube数据，大体分为两种方案：一种是基于爬虫，一种是基于API接口。

![](https://pica.zhimg.com/v2-39f5ad38ff13862d105173c7d6313024_1440w.gif)

说人话就是：爬虫相当于走后门、爬窗户（利用技术手段窃取，人家没说给，但我硬拿），API接口相当于走正门（人家同意给了，咱也正大光明的拿，但是要按照人家的要求拿，也就是接口规范）

基于爬虫的案例，我之前分享过几个：

>
> [马哥python说：【GUI开发】用python爬YouTube博主信息，并开发成exe软件！](https://zhuanlan.zhihu.com/p/578982257)
> [马哥python说：【爬虫GUI】YouTube评论采集软件，突破反爬，可无限爬取！](https://zhuanlan.zhihu.com/p/652488167)
> [马哥python说：【爬虫数据分享】李子柒YouTube频道TOP10热门视频的TOP2000热门评论，共计2W条](https://zhuanlan.zhihu.com/p/554069123)

下面介绍的是基于API接口的采集方案。

YouTube Data API
v3是YouTube提供的一种API接口，允许开发人员访问和与YouTube的数据进行交互，包括视频、频道、播放列表和评论等内容。通过该API，开发人员可以检索和管理YouTube的内容，进行搜索操作以及访问用户数据。API
v3使用RESTful
HTTP请求与YouTube的服务器进行通信，并返回JSON格式的响应。它是构建与YouTube平台集成并利用其大量数据的应用程序的强大工具。

> youtube于2006年被Google公司高价收购，以下教程是Google开发者链接就顺理成章了。

废话不多说了，进入正题！！

![](https://pic2.zhimg.com/v2-66c5ae81a710aa8edd84160bce832ddf_1440w.jpg)

## 二、申请接口权限

> 帮助文档：[https://developers.google.com/youtube/v3/getting-started?hl=zh-
> cn](https://link.zhihu.com/?target=https%3A//developers.google.com/youtube/v3/getting-
> started%3Fhl%3Dzh-cn)

### **2.1、注册Google账号**

首先，要注册一个自己的Google账号，这一步有手就行，就不多说了哈。

### 2.2、创建项目

打开Google开发者控制台：[https://console.cloud.google.com/projectselector2/apis/dashboard?hl=zh-
cn&supportedpurview=project](https://link.zhihu.com/?target=https%3A//console.cloud.google.com/projectselector2/apis/dashboard%3Fhl%3Dzh-
cn%26supportedpurview%3Dproject)，如下：

![](https://pic1.zhimg.com/v2-a150b4f8df9c37536ea3f0d4ff1fdb1e_1440w.jpg)创建项目按钮

进入创建项目界面，开始创建：

![](https://pic4.zhimg.com/v2-e26803a7bbbb553fcc27887293f74d33_1440w.jpg)创建项目界面

### 2.3、启用youtube data api v3服务

点击创建按钮之后，启用YouTube的api服务，如下：

![](https://pic3.zhimg.com/v2-6952910e5cd1bbf79fe76b3d68b1ebb4_1440w.jpg)找到启用API页面

在弹出的界面中，输入搜索框，选择youtube的api，如下：

![](https://pic1.zhimg.com/v2-7f4656ae5b088e06c7a262a8cf113068_1440w.jpg)搜索youtube
api

搜到的结果，点击跳转：

![](https://pic2.zhimg.com/v2-390a46c07ce04cc53c76c06bfb2c8eff_1440w.jpg)进入
YouTube Data API v3

启用API服务：

![](https://picx.zhimg.com/v2-0ca2b97c2d3d952cc60456719f7f98c3_1440w.jpg)启用API

### 2.4、创建凭据

创建凭据（也就是API的key）：

![](https://pic3.zhimg.com/v2-9584d510a19cd54bda6d7ddc0d9e41ac_1440w.jpg)开始创建凭据

完成创建：

![](https://pic2.zhimg.com/v2-51661b68e43988730efb864489710477_1440w.jpg)创建凭据界面

创建成功界面：

![](https://pic4.zhimg.com/v2-77cfb39be650b44edf02a5e727b29d4b_1440w.jpg)创建凭据成功

查看密钥：

![](https://pic2.zhimg.com/v2-6019fea132fbb51a639b8ecf7f8b59cf_1440w.jpg)查看密钥的值

这样，就可以把key粘贴到代码里使用了！

至此，结束！

![](https://pic2.zhimg.com/v2-533ddac3a0ab0120f83675e425563de7_1440w.jpg)

## 三、后续发布

基于此API密钥，并结合API帮助文档，通过Python代码，可以开发一系列的YouTube数据采集工具，我已经有思路了，你呢？

后续会逐一发布，敬请期待！