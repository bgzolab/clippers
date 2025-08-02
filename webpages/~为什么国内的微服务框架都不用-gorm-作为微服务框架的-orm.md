---
aliases:
  - 为什么国内的微服务框架都不用 gorm 作为微服务框架的 orm？
created: 2025-07-29T20:40:13
modified: 2025-07-29T20:40:17
source: "https://v2ex.com/t/1095255"
tags: []
title: 为什么国内的微服务框架都不用 gorm 作为微服务框架的 orm？
type: "archive-web"
---

# 为什么国内的微服务框架都不用 gorm 作为微服务框架的 orm？

Go 编程语言 - @higanbana - 如题，同问，观察了一下，go-zero 用的是自己封装的 sqlx ，还可以理解是最简化，但是完全没好到哪儿去，复杂 sql 很麻烦，kratos 直接用了国外的 Ent ，其他的几个没接触过，想知道

## Comment

> 这个要问原作者的自己的考量了。

gorm 提供了大量的抽象层和自动化功能，内部使用了不少的反射操作，在处理复杂 SQL 或高并发场景时，性能不够好，在简单查询和标准 CRUD 操作上，grom 通常能够提供足够的性能了。

这个微服务框架默认使用的是 gorm ，也可以使用自己熟悉的 orm 替代 gorm 。

[https://github.com/zhufuyi/sponge](https://github.com/zhufuyi/sponge)
