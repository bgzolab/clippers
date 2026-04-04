---
aliases:
  - ActiveRecord 与 Castle ActiveRecord
  - ~ActiveRecord 与 Castle-ActiveRecord-Payne- 博客园
created: 2025-07-23T10:38:23
modified: 2025-08-30T22:47:27
source: https://www.cnblogs.com/payne/archive/2007/05/22/755751.html
title: ActiveRecord 与 Castle ActiveRecord
type: archive-web
---
# ActiveRecord 与 Castle ActiveRecord

[![](https://img2024.cnblogs.com/blog/35695/202508/35695-20250830122018806-1574270965.jpg)](https://developer.huawei.com/consumer/cn/activity/digixActivity/digixcmsdetail/101750143863263087?ha_source=BKYQ3&ha_sourceId=89000408)

**一、ActiveRecord 与 Castle ActiveRecord

**ActiveRecord 是《Patterns of Enterprise Application Architecture》中描述的著名模式。基本上，当实例每一行的时候，所有的静态方法会作用于全部纪录。
Castle ActiveRecord 是 ActiveRecord 模式的一个实现，Castle ActiveRecord 依赖 Nhibernate 来完成实际的映像。与单纯的 ActiveRecord 相比，Castle ActiveRecord 具有以下特点：

敏捷开发 (它尽可能多地处理了映射和推断，因此，对你的方案而言，当一些东西发生变化的时候，你不必去钻研文档或者处理大量的 xml 文档)
预定了像 Create, Update, Save, Delete 这样的公共方法。
容易实现像 Find, FindAll, FindByName 等此类的方法。
绘画和事务范围（Session and transaction scopes that abstracts the ISession and translates them to a more natural idiom ）
使用 Nhibernate，你繁琐的配置工作多于复杂的映射，而使用 ActiveRecord 却是推进你的生产力的一个保证，你不必再为编写繁冗复杂的映射文件而头疼，ActiveRecord 封装了 NHibernate 的操作，使用特性来代替映射文件，无论何时你需要，ActiveRecord 都能给你一个 Isession 实例，它提供的简洁的 O/R 映射会让你为实现持久化数据层是那么简单而惊叹！

Castle 的官网是 [http://www.castleproject.org/](http://www.castleproject.org/) ，这里的文章都参考于此。
