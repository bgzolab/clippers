---
doc_type: weread-highlights-reviews
bookId: CB_ECmFGqFIv9AU6ZS6YQ
reviewCount: 0
noteCount: 29
author:
  - 【美】 贾斯廷 • 里彻 【瑞士】 安东尼奥 • 桑索
  - 人民邮电出版社
cover: https://res.weread.qq.com/wrepub/CB_7ksD5CD4sDyP6Vx6UR_parsecover
progress: 14%
readingTime: 0小时45分钟
readingDate: 1970-01-01
title: OAuth 2实战
published:
isbn:
tags:
  - weread/
type: weread-notes
weread: https://weread.qq.com/web/reader/ce4429e2a43425f45436d464771464976394155365a533659512f0

---


## 版权声明

## 序

## 前言

> [!NOTE] 
> 分布式身份认证技术——OpenID
> 
> 2022-06-19 17:02:13 ^CB-ECmFGqFIv9AU6ZS6YQ-3-1908-1925

> [!NOTE] 
> Google的AuthSub以及Yahoo!的BBAuth。在这些实现中
> 
> 2022-06-19 17:02:38 ^CB-ECmFGqFIv9AU6ZS6YQ-3-2013-2049

> [!NOTE] 
> Web开放标准
> 
> 2022-06-19 17:03:10 ^CB-ECmFGqFIv9AU6ZS6YQ-3-2183-2190

> [!NOTE] 
> IETF批准了OAuth 2.0核心规范
> 
> 2022-06-19 17:03:54 ^CB-ECmFGqFIv9AU6ZS6YQ-3-2864-2884

> [!NOTE] 
> 规范被模块化地分成互补的两个部分：RFC 6749详细说明了如何获取令牌，RFC 6750则详细说明了如何在受保护的资源上使用一种特定类型的令牌（bearer令牌）
> 
> 2022-06-19 17:04:08 ^CB-ECmFGqFIv9AU6ZS6YQ-3-2900-2982

> [!NOTE] 
> 。OAuth 2.0定义了4种许可类型，分别适用于不同的应用类型，而不是单单定义一种复杂的方法来适应不同的部署模型
> 
> 2022-06-19 17:04:19 ^CB-ECmFGqFIv9AU6ZS6YQ-3-3025-3082

## 致谢

## 关于本书

> [!NOTE] 
> 1~2章构成，概述了OAuth 2.0协议，可以说是核心阅读材料。
> 
> 2022-06-19 17:07:24 ^CB-ECmFGqFIv9AU6ZS6YQ-5-980-1013

> [!NOTE] 
> 7~10章
> 
> 2022-06-19 17:07:49 ^CB-ECmFGqFIv9AU6ZS6YQ-5-1058-1063

> [!NOTE] 
> 漏洞，以及如何规避
> 
> 2022-06-19 17:07:54 ^CB-ECmFGqFIv9AU6ZS6YQ-5-1092-1101

> [!NOTE] 
> 第11~16章
> 
> 2022-06-19 17:08:02 ^CB-ECmFGqFIv9AU6ZS6YQ-5-1108-1115

> [!NOTE] 
> 外围生态系统中的标准和规范
> 
> 2022-06-19 17:08:15 ^CB-ECmFGqFIv9AU6ZS6YQ-5-1144-1157

## 关于封面图片

## 第一部分　起步

## 第 1 章　OAuth 2.0是什么，为什么要关心它

## 第 2 章　OAuth之舞

> [!NOTE] 
> 颁发令牌和使用令牌
> 
> 2022-06-19 17:54:52 ^CB-ECmFGqFIv9AU6ZS6YQ-9-788-797

> [!NOTE] 
> OAuth没有规定客户端如何知悉与受保护资源交互的方式，或者客户端如何发现受保护资源对应的授权服务器。这些问题一般都由建立在OAuth之上的其他协议以标准方式解决，例如OpenID Connect和User Managed Access（UMA）
> 
> 2022-06-19 17:59:36 ^CB-ECmFGqFIv9AU6ZS6YQ-9-2092-2215

> [!NOTE] 
> 采用HTTP重定向的方式将用户代理重定向至授权服务器的授权端点
> 
> 2022-06-19 18:00:55 ^CB-ECmFGqFIv9AU6ZS6YQ-9-2710-2741

> [!NOTE] 
> 前端信道通信
> 
> 2022-06-19 18:32:29 ^CB-ECmFGqFIv9AU6ZS6YQ-9-3930-3936

> [!NOTE] 
> 后端信道通信则可以使用代理系统或者网络数据包抓取工具（如Wireshark或者Fiddler）来监控
> 
> 2022-06-19 18:34:22 ^CB-ECmFGqFIv9AU6ZS6YQ-9-3937-3987

> [!NOTE] 
> 用户身份认证直接在用户（和用户的浏览器）与授权服务器之间进行，这个过程对客户端应用不可见。这一重要特性避免了用户将自己的凭据透露给客户端应用，对抗这种反模式正是发明OAuth的原因（前一章已讨论）
> 
> 2022-06-19 18:36:03 ^CB-ECmFGqFIv9AU6ZS6YQ-9-4342-4440

> [!NOTE] 
> 。OAuth没有规定应该使用哪种身份认证技术，授权服务器可以自由选择，例如用户名/密码、加密证书、安全令牌、联合单点登录或者其他方式
> 
> 2022-06-19 18:37:01 ^CB-ECmFGqFIv9AU6ZS6YQ-9-4514-4580

> [!NOTE] 
> 如基于风险的启发式认证（risk-based heuristic authentication）技术
> 
> 2022-06-19 18:38:20 ^CB-ECmFGqFIv9AU6ZS6YQ-9-4748-4798

> [!NOTE] 
> 这一步采用HTTP重定向的方式，回到客户端的redirect_uri 。
> 
> 2022-06-19 18:43:10 ^CB-ECmFGqFIv9AU6ZS6YQ-9-5748-5799

> [!NOTE] 
> 为授权码 ，它是一次性的凭据，表示用户授权决策的结果。客户端会在接收到请求之后解析该参数以获取授权码，并在下一步使用该授权码。客户端还会检查state 参数值是否与它在前一个步骤中发送的值匹配
> 
> 2022-06-19 19:01:30 ^CB-ECmFGqFIv9AU6ZS6YQ-9-6750-6880

> [!NOTE] 
> 在HTTP主体中以表单格式传递参数，并在HTTP基本认证头部中设置client_id 和client_secret
> 
> 2022-06-19 19:02:29 ^CB-ECmFGqFIv9AU6ZS6YQ-9-7226-7314

> [!NOTE] 
> 这种将不同的HTTP连接分开的做法保证了客户端能够直接进行身份认证，让其他组件无法查看或者操作令牌请求
> 
> 2022-06-19 19:02:56 ^CB-ECmFGqFIv9AU6ZS6YQ-9-7691-7742

> [!NOTE] 
> 如果授权码有效且尚未使用过，而且发起该请求的客户端与最初发起授权请求的客户端相同，则授权服务器会生成一个新的访问令牌并返回给客户端。
> 
> 2022-06-19 19:05:44 ^CB-ECmFGqFIv9AU6ZS6YQ-9-7960-8026

> [!NOTE] 
> 客户端出示令牌的方式有多种，本例中将使用备受推荐的方式：使用Authorization 头部
> 
> 2022-06-19 19:06:44 ^CB-ECmFGqFIv9AU6ZS6YQ-9-9259-9320

> [!NOTE] 
> 受保护资源检查令牌的方式有多种，这将在第11章深入讨论
> 
> 2022-06-19 19:06:59 ^CB-ECmFGqFIv9AU6ZS6YQ-9-9567-9594

> [!NOTE] 
> 已经有标准草案提出了如何在通用安全服务应用程序接口（GSS-API）1 和受限应用程序协议（CoAP）2 上使用OAuth令牌。在这些草案中，仍然可以使用HTTP来启动OAuth流程，但它们是想将基于HTTP的OAuth组件直接搬到其他协议上去。
> 
> 2022-06-19 19:07:54 ^CB-ECmFGqFIv9AU6ZS6YQ-9-14162-14341

> [!NOTE] 
> 由于这些请求通常都发生在资源拥有者和用户代理的可见范围之外，因此它们统称为后端信道通信（如图2-11所示）
> 
> 2022-06-19 19:08:20 ^CB-ECmFGqFIv9AU6ZS6YQ-9-14775-14828

> [!NOTE] 
> 当客户端连接受保护资源的时候，它也是在后端信道上直接发出HTTP请求。这种连接的细节完全依赖于受保护资源，因为OAuth能保护的API和系统种类繁多、风格各异。对于任何类型的受保护资源，都需要客户端出示令牌，并且受保护资源必须能理解令牌及其代表的权限。
> 
> 2022-06-19 19:08:53 ^CB-ECmFGqFIv9AU6ZS6YQ-9-15333-15459

## 第二部分　构建OAuth环境

## 第 3 章　构建简单的OAuth客户端

## 第 4 章　构建简单的OAuth受保护资源

## 第 5 章　构建简单的OAuth授权服务器

## 第 6 章　现实世界中的OAuth 2.0

## 第三部分Part 3　OAuth 2.0的实现与漏洞

## 第 7 章　常见的客户端漏洞

## 第 8 章　常见的受保护资源漏洞

## 第 9 章　常见的授权服务器漏洞

## 第 10 章　常见的OAuth令牌漏洞

## 第四部分Part 4　更进一步

## 第 11 章　OAuth令牌

## 第 12 章　动态客户端注册

## 第 13 章　将OAuth 2.0用于用户身份认证

## 第 14 章　使用OAuth 2.0的协议和配置规范

## 第 15 章　bearer令牌以外的选择

## 第 16 章　归纳总结

## 附录 A　代码框架介绍

## 附录 B　补充代码清单
