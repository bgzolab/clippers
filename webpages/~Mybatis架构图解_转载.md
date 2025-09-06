---
aliases:
  - Mybatis 架构图解转载
created: 2025-09-06T12:02:07
description: "前言 今天我们来从一个全局的角度看看Mybatis。 Mybatis工作流程 Mybatis工作流程可以大致分为四个步骤： 下面我们就来说说这四个步骤： 加载配置并初始化 触发条件：加载配置文件，比如：全局配置文件、XxxMapper.xml配置文件等。 配置来源于两个地方，一处是配置文件，一处是J"
modified: 2025-09-06T12:02:26
source: "https://www.cnblogs.com/grassLittle/p/17245071.html"
tags: []
title: Mybatis 架构图解转载
type: "archive-web"
---

# Mybatis 架构图解转载

## 前言

今天我们来从一个全局的角度看看 Mybatis。

## Mybatis 工作流程

Mybatis 工作流程可以大致分为四个步骤：

![](https://img2023.cnblogs.com/blog/3137968/202303/3137968-20230322183459090-706186708.png)

下面我们就来说说这四个步骤：

### 加载配置并初始化

触发条件：加载配置文件，比如：全局配置文件、XxxMapper.xml 配置文件等。

配置来源于两个地方，一处是配置文件，一处是 Java 代码的注解，将 SQL 的配置信息加载成为一个个 MappedStatement 对象（包括了传入参数映射配置、执行的 SQL 语句、结果映射配置），存储在内存中。

### 接收调用请求

触发条件：调用 Mybatis 提供的 API

传入参数：为 SQL 的 ID 和传入参数对象

处理过程：将请求传递给下层的请求处理层进行处理。

### 处理操作请求

触发条件：API 接口层传递请求过来

传入参数：为 SQL 的 ID 和传入参数对象

具体处理过程：

(A) 根据 SQL 的 ID 查找对应的 MappedStatement 对象。

(B) 根据传入参数对象解析 MappedStatement 对象，得到最终要执行的 SQL 和执行传入参数。

(C) 获取数据库连接，根据得到的最终 SQL 语句和执行传入参数到数据库执行，并得到执行结果。

(D) 根据 MappedStatement 对象中的结果映射配置对得到的执行结果进行转换处理，并得到最终的处理结果。

(E) 释放连接资源。

### 返回处理结果

将最终的处理结果返回。

Mybatis 大致流程：

![](https://img2023.cnblogs.com/blog/3137968/202303/3137968-20230322183742155-2132716324.png)

## Mybatis 实现原理

Mybatis 底层还是采用原生 jdbc 来对数据库进行操作的，只是通过 SqlSessionFactory，SqlSession，Executor，StatementHandler，ParameterHandler，ResultHandler 和 TypeHandler 等几个处理器封装了这些过程。

> 执行器：Executor (update, query, flushStatements, commit, rollback, getTransaction, close, isClosed)
>
> 参数处理器：ParameterHandler (getParameterObject, setParameters)
>
> 结构处理器：ResultSetHandler (handleResultSets, handleOutputParameters)
>
> sql 查询处理器：StatementHandler (prepare, parameterize, batch, update, query)

其中 StatementHandler 通过 ParameterHandler 与 ResultHandler 分别进行参数预编译与结果处理。而 ParameterHandler 与 ResultHandler 都使用 TypeHandler 进行映射。如下图：

![](https://img2023.cnblogs.com/blog/3137968/202303/3137968-20230322183915779-68367108.png)

## MyBatis 整体架构

`Mybatis` 的功能架构分为三层：

![](https://img2023.cnblogs.com/blog/3137968/202303/3137968-20230322184027844-389012814.png)

每一层对应详细内容：

![](https://img2023.cnblogs.com/blog/3137968/202303/3137968-20230322184108604-2026893959.png)

### API 接口层

首先接口层是我们打交道最多的层，核心对象就是 SqlSession，它是上层应用和 Mybatis 打交道的桥梁，也有的人称之为大门，SqlSession 中定义了非常多的对数据库操作的方法，接口层在接受到调用请求时，会调用核心处理层的相应模块来完成具体的数据库操作。

### 数据处理层

这一层主要就是跟数据库操作相关的动作都是在这数据处理层完成的。

核心处理层主要做了这 4 件事：

- 把接口中传入的参数解析并映射成 JDBC 类型；
- 解析 xml 文件中的 SQL 语句，包括插入参数和动态 SQL 的生成；
- 执行 SQL 语句；
- 处理结果集，并映射成 Java 对象。

插件也属于核心层，这是由它的工作方式和拦截的对象决定的。

### 基础支撑层

负责最基础的功能支撑，包括连接管理、事务管理、配置加载和缓存处理，这些都是共用的东西，将他们抽取出来作为最基础的组件。为上层的数据处理层提供最基础的支撑。

![](https://img2023.cnblogs.com/blog/3137968/202303/3137968-20230322184232106-1321967984.png)

## MyBatis 的主要成员

### Configuration

MyBatis 所有的配置信息都保存在 Configuration 对象之中，配置文件中的大部分配置都会存储到该类中。

### SqlSession

作为 MyBatis 工作的主要顶层 API，表示和数据库交互时的会话，完成必要数据库增删改查功能。

### Executor

MyBatis 执行器，是 MyBatis 调度的核心，负责 SQL 语句的生成和查询缓存的维护。

### StatementHandler

封装了 JDBC Statement 操作，负责对 JDBC statement 的操作，如设置参数等。

### ParameterHandler

负责对用户传递的参数转换成 JDBC Statement 所对应的数据类型。

### ResultSetHandler

负责将 JDBC 返回的 ResultSet 结果集对象转换成 List 类型的集合。

### TypeHandler

负责 java 数据类型和 jdbc 数据类型 (也可以说是数据表列类型) 之间的映射和转换。

### MappedStatement

MappedStatement 维护一条 `<select|update|delete|insert>` 节点的封装。

### SqlSource

负责根据用户传递的 parameterObject，动态地生成 SQL 语句，将信息封装到 BoundSql 对象中，并返回。

### BoundSql

表示动态生成的 SQL 语句以及相应的参数信息。

## Mybatis 层次结构

![](https://img2023.cnblogs.com/blog/3137968/202303/3137968-20230322190419402-184858346.png)

转载于： [图解MyBatis](https://mp.weixin.qq.com/s?__biz=MzU4MDM3MDgyMA==&mid=2247495015&idx=1&sn=3df7bc203d3153c4a571eb21c3c53d7c&chksm=fd55458cca22cc9a13048dc96804ba87640e0813550bb0b482931efa58e257b599c5e271d6ef&cur_album_id=1644304171870814209&scene=189#wechat_redirect)

分类:

标签:

[![](https://pic.cnblogs.com/face/sample_face.gif)](https://home.cnblogs.com/u/grassLittle/)

[小草丶](https://home.cnblogs.com/u/grassLittle/)

[粉丝 - 1](https://home.cnblogs.com/u/grassLittle/followers/) [关注 - 0](https://home.cnblogs.com/u/grassLittle/followees/)

[+加关注](https://www.cnblogs.com/grassLittle/p/)

0

0

[«](https://www.cnblogs.com/grassLittle/p/17244232.html) 上一篇： [Mybatis动态映射详解（转载）](https://www.cnblogs.com/grassLittle/p/17244232.html "发布于 2023-03-22 16:12")

[»](https://www.cnblogs.com/grassLittle/p/17246227.html) 下一篇： [Mybatis源码阅读套路（转载）](https://www.cnblogs.com/grassLittle/p/17246227.html "发布于 2023-03-23 19:24")

posted @ 2023-03-22 19:05 [小草丶](https://www.cnblogs.com/grassLittle) 阅读 (647)  评论 (0) [收藏](https://www.cnblogs.com/grassLittle/p/) [举报](https://www.cnblogs.com/grassLittle/p/)

编辑 预览

[退出](https://www.cnblogs.com/grassLittle/p/) [订阅评论](https://www.cnblogs.com/grassLittle/p/ "订阅后有新评论时会邮件通知您") [我的博客](https://www.cnblogs.com/bgzo/)

\[Ctrl+Enter 快捷键提交\]

[![](https://img2024.cnblogs.com/blog/35695/202508/35695-20250830121216742-1062949948.jpg)](https://developer.huawei.com/consumer/cn/activity/digixActivity/digixcmsdetail/101750143863263087?ha_source=BKYQ3&ha_sourceId=89000408)

**相关博文：**

· [Mybatis学习总结（转载）](https://www.cnblogs.com/grassLittle/p/17326519.html "Mybatis学习总结（转载）")

· [Mybatis SqlSession详解（转载）](https://www.cnblogs.com/grassLittle/p/17325400.html "Mybatis SqlSession详解（转载）")

· [mybatis学习第九部分：Mybatis架构原理](https://www.cnblogs.com/eagle888/p/16916480.html "mybatis学习第九部分：Mybatis架构原理")

· [深入剖析MyBatis的架构原理](https://www.cnblogs.com/tangyouwei/p/18610022/in-depth-analysis-of-the-architectural-principle-of-mybatis "深入剖析MyBatis的架构原理")

· [深入详解Mybatis的架构原理与6大核心流程](https://www.cnblogs.com/mikechenshare/p/16578715.html "深入详解Mybatis的架构原理与6大核心流程")

**阅读排行：**
· [园子的不务正业：向创业开发者推荐「楼盘」](https://www.cnblogs.com/cmt/p/19072812)
· [职场焦虑，你的副业卡在了哪里？](https://www.cnblogs.com/royzshare/p/19074667)
· [关于.net9发布单体exe程序无法打开问题详解](https://www.cnblogs.com/sc-Free-Die/p/19075260)
· [国产操作系统调研报告：产业现状与未来方向](https://www.cnblogs.com/Ziyoung/p/19074504)
· [【独游开发必备】游戏开发资源宝藏网站（美术篇）](https://www.cnblogs.com/Mr147/p/19074904)
