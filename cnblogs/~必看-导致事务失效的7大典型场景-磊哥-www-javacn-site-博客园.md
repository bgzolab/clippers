---
draft: true
aliases:
  - 必看！导致事务失效的 7 大典型场景！ - 磊哥
created: 2025-08-06T12:51:00
modified: 2025-09-12T06:53:21
source: https://www.cnblogs.com/vipstone/p/19023587
title: 必看！导致事务失效的 7 大典型场景！ - 磊哥
type: archive-web
---
# 必看！导致事务失效的 7 大典型场景！ - 磊哥

@Transactional 声明式事务失效的场景是 Java 面试中经常被问到的问题，所以今天咱们就来系统的盘点一下导致 @Transactional 失效的场景有哪些？以及导致的原因和解决方案详解。

## 1.方法访问修饰符不是 Public

以下代码会导致 @Transactional 失效：

### 原因分析

Spring AOP 代理在生成代理类时，只对 public 方法生成事务代理，这是 Java 源码层面设计原因，设计源码如下：

### 解决方案

将方法改为 public。

## 2.自调用问题

以下代码会导致 @Transactional 失效：

### 原因分析

当一个类中的非事务方法调用本类的事务方法时，调用是通过 this 直接调用，而不是通过 Spring 代理对象调用，因此事务不能生效。

### 解决方案

- 将事务方法移到另一个 Service 类中
- 使用 ApplicationContext 获取当前 Bean 的代理对象，如下代码所示：

## 3.异常被捕获且未重新抛出

以下代码会导致 @Transactional 失效：

### 原因分析

Spring 事务默认只在抛出未被捕获的 RuntimeException 或 Error 时回滚。如果异常被捕获且未抛出，代理认为方法执行成功，会提交事务。

### 解决方案

- 手动设置回滚：TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
- 或重新抛出异常：

## 4.事务传播机制配置错误

例如：使用了 Propagation.NOT_SUPPORTED 或 Propagation.NEVER，会导致事务被挂起或拒绝。

特别注意 Propagation.REQUIRES_NEW：会挂起当前事务，开启新事务，需谨慎使用，避免嵌套事务导致性能问题或死锁。

## 5.数据库引擎不支持事务

例如：MySQL 的 MyISAM 引擎不支持事务，必须使用 InnoDB。

即使代码配置了@Transactional，底层数据库不支持也无法实现事务。

## 6.方法被 Final 或 static 修饰

CGLIB 无法代理 final 方法（不能被重写），JDK 代理也无法处理 static 方法，都会导致事务无法生效。因为 Spring/Spring Boot 是使用 CGLIB 或 JDK 代理实现的。

## 7.多线程中调用事务方法

以下代码会导致 @Transactional 失效：

### 原因分析

事务是基于线程绑定的（通过 ThreadLocal 存储事务上下文），子线程中调用事务方法时，无法继承父线程的事务上下文。

### 解决方案

使用事务同步或手动管理事务。

## 小结

@Transactional 声明式事务底层是通过 CGLIB 或 JDK 代理实现的，所以事务失效的场景多半与二者相关，本文总共介绍了 7 种导致事务失效的场景，您至少要记住其中 4 种以上事务失效场景，这样才能在面试中崭露头角。

本文已收录到我的面试小站 www.javacn.site，其中包含的内容有：场景题、SpringAI、SpringAIAlibaba、并发编程、MySQL、Redis、Spring、Spring MVC、Spring Boot、Spring Cloud、MyBatis、JVM、设计模式、消息队列、Dify、Coze、AI 常见面试题等。

[www.javacn.site](\"https://www.javacn.site\")
