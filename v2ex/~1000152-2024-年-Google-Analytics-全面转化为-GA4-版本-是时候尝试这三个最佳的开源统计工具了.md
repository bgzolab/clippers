---
created: '2023-12-13T21:29:09'
modified: '2023-12-13T21:29:09'
source: https://www.v2ex.com/t/1000152
title: 2024 年 Google Analytics 全面转化为 GA4 版本，是时候尝试这三个最佳的开源统计工具了
type: archive-web
---

## 一、简介：

Google Analytics 是谷歌家推出的网站统计工具，一直以来都以免费，以及功能齐全深受国内外站长的喜爱。但是由于今年正式遗弃老版本，拥抱第四代(GA4)，老代码以及不能用了，新版本的功能及界面我个人不是特别习惯。所以我就查找了一下替代品。

国内统计：国内的统计老实来说我不是特别喜欢，无论是百度统计还是曾经的 CNZZ 亦或者是 51.la 这种。除了数据不够准确之外，部分统计工具还会深夜给你加料防不胜防。

## 二、三大开源统计工具

目前主流的开源统计工具有三个，分别是：[Plausible Analytics]( https://github.com/plausible/analytics)、[matomo]( https://github.com/matomo-org/matomo)、[umami]( https://github.com/umami-software/umami)。三者各有优缺点。本次对比只单纯对比三个工具的优缺点以及特异性，搭建教程请另行前往各个项目的搭建教程或者是官网。

### 2.1  Plausible Analytics

官网地址：[plausible.io]( https://plausible.io/)
Github:https://github.com/plausible/analytics

Demo：[Plausible Demo]( https://plausible.io/plausible.io) 

项目简介：Plausible 是直观、轻量且开源的网络分析工具。无需使用 cookies 。

用户界面：
![]( https://image.xuehaiwu.com/2023/12/13/chrome_poPIMUEX4b.png)

![]( https://image.xuehaiwu.com/2023/12/13/chrome_QtXtId4PFo.png)

**优点：**

1 、网络分析数据的所有权

可以通过自托管 plausible ，掌握自己的数据所有权。

不会分享给广告公司等第三方。

2 、网站访问者的隐私

Plausible 只跟踪网站用户的 IP 地址，不采集任何 cookie 。对用户隐私友好。

3 、遵守 [GDPR]( https://gdpr-info.eu/)、[CCPA]( https://www.oag.ca.gov/privacy/ccpa) 和 [PECR]( https://ico.org.uk/for-organisations/guide-to-pecr/) 等隐私法规

这个在欧美地区比较讲究，Google Analytics 自从 22 年开始就被多个欧洲机构针对隐私方面裁定侵权了。

4 、无损网站访问者的用户体验

目前很多公司的网站当你首次进入时会弹出一个条幅让你接受 cookie 、GDPR 、CCPA 这种隐私法规。使用 Plausible 就无需这一操作。

5 、更小的文件更快的加载

相较于 Google Analytics ，Plausible 的脚本文件大小为其 17 分之一。可以让你的网站让你的网站能够更快的加载，不受拖累。

6 、避免广告拦截器

uBlock Origin 这类广告拦截器里有包含 Google Analytics 的拦截规则。会让你丢失这部分用户的数据。而 Plausible 则不会受影响。你可以通过自建服务来规避拦截或者使用官方的服务自己再进行反向代理。

7 、可以导入 Google Analytics 的历史数据

项目有完整的[导入]( https://plausible.io/docs/google-analytics-import)设置，只需要后台简单操作一下即可。
8 、可以分享数据

**缺点：**

正如其宣传的那样，轻量直观。所以他的功能相对于 Google Analytics 来说只具有基础的功能：
1 、独立访客、PV 、跳出率、访问时间

2 、来源，访问页面（落地页、退出页）

3 、地理位置

4 、设备、浏览器

5 、可以设定目标转化

远不如 Google Analytics 功能齐全。
第二就是需要付费服务，虽然可以通过自建服务来避免收费。但是自建服务也会劝退一部分用户。

官网收费是根据月 PV 来的，就我个人而言这个收费是相当贵的。

10K 以下 9$，100k 19$, 1M 69$。基本上只适用于高净值的网站。比如电商网站、教程网站。内容向的网站不太推荐使用官方业务可以考虑自建服务。

自建服务只需要一个 4GB RAM 的建议需求。其他的只要不是太差就行。另外就是要考虑网络问题。如果你要兼顾海内外的用户，那么最好上一些好一点的线路，或者上 CDN 。
**教程：**

> 教程：[Plausible 官方教程]( https://plausible.io/docs/self-hosting)

### 2.2  Umami

官网：[Umami]( https://umami.is/)

Github： https://github.com/umami-software/umami

Demo：[Umami Demo]( https://analytics.umami.is/share/LGazGOecbDtaIwDr/umami.is)

项目简介：

Umami 使收集、分析和理解您的网络数据变得简单 — 同时保持访问者隐私和数据所有权。

从我个人角度而言，Umami 和 Plausible 是高度相似的。不过二者之间仍旧有一些独特的区别。
用户界面：
![]( https://image.xuehaiwu.com/2023/12/13/chrome_7xLy0kcxHh.png)

**优点：**

1 、无 cookie 收集

2 、GDPR&CCPA 适应

3 、数据所有权

4 、多语言支持

5 、优秀的实时数据

6 、高度可客制化事件以及数据

可以自由定制事件追踪，比如注册、点赞、下单

7 、URM 追踪

通过分析自动收集的 UTM 查询参数来衡量您的营销活动的有效性。

8 、漏斗报告

9 、API 友好方便二开或者调用数据
10 、自部署难度低

**缺点：**

曾经被爆出过严重的安全漏洞，用户可以通过分享链接重置网站数据。影响 2.3.0 及之前的版本，2.3.1 版本修复。当前版本为 2.8.0

![]( https://image.xuehaiwu.com/2023/12/13/chrome_ew5u9GLSPU.png)

相较于 Plausible 和 Google Analytics ，Umami 的数据收集分析能力在中等级别。默认的数据展示形式为柱状图，个人而言不是很喜欢这个设计。当然不能说它不好，只是不习惯。可能也是因此它没有什么直观展示同比和环比的方式。

**教程：**

Umami 也提供官方统计服务，价格和 Plausible 有来有回，但是对于小型网站（月 events 10K 以下）免费。

> 教程：[Umami 官方教程]( https://umami.is/docs/install)

### 2.3  Matomo

官网：[Matomo.org]( https://matomo.org/)

Github：[Matomo]( https://github.com/matomo-org/matomo)

项目简介：这一款是真正的为了替代 Google Analytics 而出来的开源产品。功能齐备且强大。如果你有复杂多变的追踪需求我想 Matomo 必定能够满足你。

**优点：**

1 、转化优化

包含但不限于：热力图、会话记录、漏斗、A/B 测试、表单分析等

2 、增强的搜索引擎优化

能与 Google 、Bing 、Yahoo 的搜索控制台集成，消除未定义关键词，抓取统计数据与关键词排名位置

3 、一体化

可以与多种 CMS 技术框架集成。包含但不限于：wordpress 、Joomla 、WooCommerce 等等

4 、完善的营销归因

通过各项集成一级成本售价利润数据的设置可以轻松聊天投资回报率 ROI 的影响因素于渠道。也可以通过 Row Evolution 追踪每个触点的渠道绩效变化，以便实时掌控风向。

5 、数据所有权

**缺点：**

自部署难度高，想要发挥功能需要网站拥有者有一定的耐心和基础的知识的了解。主要还是因为功能太全面和 Google Analytics 一样，直接用没必要用它设置复杂，追踪代码文件体积大浪费，不直接用，而是各种设置那么就需要拥有一定的专业知识以及耐心了。要想效果好无论用什么都免不了的。

**教程：**

腾讯云的轻量服务器有官方镜像，我们可以用现成的即可。
进入服务器控制台后直接更换镜像然后选择使用应用模板——网站——Matomo 即可。

![]( https://image.xuehaiwu.com/2023/12/13/chrome_T7VMFFtZOu.png)

然后获取一下数据库密码,点一下登陆然后复制一下命令即可

![]( https://image.xuehaiwu.com/2023/12/13/chrome_43SJ7Pe53z.png)

![]( https://image.xuehaiwu.com/2023/12/13/chrome_8Y6WfXTpxO.png)

完事我们进入 IP 地址进行安装即可

![]( https://image.xuehaiwu.com/2023/12/13/chrome_ZnWub2DnjW.png)

后面直接一步一步来即可。

完成之后需要改变为默认为域名访问而非 ip 。

先将域名解析到服务器 IP 上。然后编辑配置文件，也可以直接通过 orcaterm 的编辑器直接编辑

```
nano /usr/local/lighthouse/softwares/matomo/config/config.ini.php
```

将 `trusted_hosts[]="实例 IP 地址"` 中的 IP 地址替换为已解析的域名。如下图所示：

![]( https://image.xuehaiwu.com/2023/12/13/chrome_HZBBYwvDCN.png)

可以顺便把 cors 配置一下，如果想开放给其他人使用 cors 后面的域名可以直接用`*`代替

https 配置也简单。可以直接问一下 OrcaTerm AI(每天 20 条免费额度)

![]( https://image.xuehaiwu.com/2023/12/13/chrome_KehebjXIxK.png)

然后参考 AI 来做配置也可以。

## 三、总结

针对不同的用户，我推荐分为两大类，一种是只要有基础功能的，那么根据自己的需求选择 Plausible 或者 Umami 都可以，这两个项目都比较轻量。基础功能齐全，想稍微二开一下的话可以优先考虑 Umami 。注重网站转化率、偏向于电商或者是网站本身有订阅/付费服务的可以考虑 Matomo ，毕竟付费用户转化率是相当重视的，更何况还有 A/B 测试，可以帮助你更好的对商品的对针对性调整，比如说原价、降价促销或者是不同的海报图之类的还有 seo 增强。

如果是偏向于内容网站的，注重搜索引擎流量来源的也可以考虑 Matomo ，或者要投放关键词的，通过 Matomo 放大自己的 ROI 那是最好的。自身有稳定流量以及用户的，不靠搜索引擎或者不需要过度关注搜索引擎的例如论坛之类的就可以采用 Plausible 或者 Umami 。两者的功能足够一般网站使用了。
