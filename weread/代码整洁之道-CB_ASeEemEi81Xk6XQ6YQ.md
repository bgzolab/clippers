---
doc_type: weread-highlights-reviews
bookId: CB_ASeEemEi81Xk6XQ6YQ
reviewCount: 0
noteCount: 14
author:
  - 马丁(Robert C. Martin)
  - 人民邮电出版社
cover: https://res.weread.qq.com/wrepub/CB_4Gu2sC2tZ4PG6TG6U5_parsecover
progress: 0%
readingTime: 0小时18分钟
readingDate: 1970-01-01
title: 代码整洁之道
published:
isbn:
tags:
  - weread/
type: weread-notes
weread: https://weread.qq.com/web/reader/e0342ae2a43425f41536545656d45693831586b365851365951c48

---


## 目录

## 扉页

## 版权

## 内容提要

## 序

## 关于封面

## 代码猴子与童子军军规

## 前言

## 第1章 整洁代码

## 第2章 有意义的命名

> [!NOTE] 
> 只要这些add方法的参数列表和返回值在语义上等价，就一切顺利。
> 
> 2022-05-26 21:54:12 ^CB-ASeEemEi81Xk6XQ6YQ-10-14975-15006

> [!NOTE] 
> 这样做貌似和其他 add 方法保持了一致，但实际上语义却不同，应该用 insert或append之类词来命名才对。把该方法命名为add，就是双关语了。
> 
> 2022-05-26 21:55:38 ^CB-ASeEemEi81Xk6XQ6YQ-10-15167-15242

## 第3章 函数

## 第4章 注释

## 第5章 格式

## 第6章 对象和数据结构

> [!NOTE] 
> 最为精练的数据结构，是一个只有公共变量、没有函数的类。这种数据结构有时被称为数据传送对象，或DTO（Data Transfer Objects）。DTO是非常有用的结构，尤其是在与数据库通信、或解析套接字传递的消息之类场景中。在应用程序代码里一系列将原始数据转换为数据库的翻译过程中，它们往往是排头兵
> 
> 2022-07-31 09:44:13 ^CB-ASeEemEi81Xk6XQ6YQ-14-10269-10419

> [!NOTE] 
> Active RecordActive Record是一种特殊的DTO形式。它们是拥有公共（或可豆式访问的）变量的数据结构，但通常也会拥有类似save和find这样的可浏览方法。Active Record一般是对数据库表或其他数据源的直接翻译
> 
> 2022-07-31 09:38:44 ^CB-ASeEemEi81Xk6XQ6YQ-14-12010-12156

> [!NOTE] 
> 当然，解决方案就是把Active Record当做数据结构，并创建包含业务规则、隐藏内部数据（可能就是Active Record的实体）的独立对象
> 
> 2022-07-31 09:39:03 ^CB-ASeEemEi81Xk6XQ6YQ-14-12275-12348

## 第7章 错误处理

> [!NOTE] 
> 使用异常而非返回码
> 
> 2022-07-31 09:29:07 ^CB-ASeEemEi81Xk6XQ6YQ-15-994-1003

> [!NOTE] 
> 这类手段的问题在于，它们搞乱了调用者代码。调用者必须在调用之后即刻检查错误。不幸的是，这个步骤很容易被遗忘。所以，遇到错误时，最好抛出一个异常。
> 
> 2022-07-31 09:30:13 ^CB-ASeEemEi81Xk6XQ6YQ-15-2350-2422

> [!NOTE] 
> 因为之前纠结的两个元素设备关闭算法和错误处理现在被隔离了。你可以查看其中任一元素，分别理解它
> 
> 2022-07-31 09:31:07 ^CB-ASeEemEi81Xk6XQ6YQ-15-3754-3800

> [!NOTE] 
> 执行try-catch-finally语句中try部分的代码时，你是在表明可随时取消执行，并在catch语句中接续
> 
> 2022-07-31 09:31:24 ^CB-ASeEemEi81Xk6XQ6YQ-15-3952-4009

> [!NOTE] 
> 此时，我们可以重构了。我们可以缩小异常类型的范围，使之符合FileInputStream构造器真正抛出的异常，即FileNotFoundException
> 
> 2022-07-31 09:40:35 ^CB-ASeEemEi81Xk6XQ6YQ-15-5468-5545

> [!NOTE] 
> 如此一来，我们就用try-catch结构定义了一个范围，可以继续用测试驱动（TDD）方法构建剩余的代码逻辑。这些代码逻辑将在FileInputStream和close之间添加，装作一切正常的样子
> 
> 2022-07-31 09:40:45 ^CB-ASeEemEi81Xk6XQ6YQ-15-6108-6205

> [!NOTE] 
> Java程序员们一直在争论可控异常（checked exception）的利与弊。Java的第一个版本中引入可控异常时，看似一个极好的点子。每个方法的签名都列出它可能传递给调用者的异常。而且，这些异常就是方法类型的一部分。如果签名与代码实际所做之事不符，代码在字面上就无法编译
> 
> 2022-07-31 09:41:15 ^CB-ASeEemEi81Xk6XQ6YQ-15-6430-6568

> [!NOTE] 
> 代价是什么？可控异常的代价就是违反开放/闭合原则[1]。如果你在方法中抛出可控异常，而catch语句在三个层级之上，你就得在catch语句和抛出异常处之间的每个方法签名中声明该异常。这意味着对软件中较低层级的修改，都将波及较高层级的签名。修改好的模块必须重新构建、发布，即便它们自身所关注的任何东西都没改动过。
> 
> 2022-07-31 09:43:20 ^CB-ASeEemEi81Xk6XQ6YQ-15-6769-6985

## 第8章 边界

## 第9章 单元测试

## 第10章 类

## 第11章 系统

> [!NOTE] 
> 最终，连面向对象编程本身也被侵蚀。bean不能继承自另一个bean。留意添加新账号的逻辑。在EJB2 bean中，定义一种本质上是无行为struct的“数据传输对象”（DTO）很常见。这往往会导致拥有同样数据的冗余类型出现，而且也需要在对象之间复制数据的八股式代码
> 
> 2022-07-31 09:45:04 ^CB-ASeEemEi81Xk6XQ6YQ-19-10658-10790

## 第12章 迭进

## 第13章 并发编程

## 第14章 逐步改进

## 第15章 JUnit内幕

## 第16章 重构SerialDate

## 第17章 味道与启发

## 附录A 并发编程II

## 附录B org.jfree.date.SerialDate

## 结束语

