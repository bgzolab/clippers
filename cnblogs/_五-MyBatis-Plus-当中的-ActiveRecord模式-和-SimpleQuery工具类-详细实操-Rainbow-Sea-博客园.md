---
aliases:
  - 五，MyBatis-Plus 当中的 “ActiveRecord 模式”和“SimpleQuery 工具类”（详细实操）
created: 2025-07-23T10:34:56
modified: 2025-08-30T21:04:03
source: https://www.cnblogs.com/TheMagicalRainbowSea/p/18441707
title: 五，MyBatis-Plus 当中的 “ActiveRecord 模式”和“SimpleQuery 工具类”（详细实操）
  博客园
type: archive-web
---
# 五，MyBatis-Plus 当中的 “ActiveRecord 模式”和“SimpleQuery 工具类”（详细实操）

@

- 五，MyBatis-Plus 当中的 “ActiveRecord 模式”和“SimpleQuery 工具类”（详细实操）
- 1. ActiveRecord 模式
- 2. ActiveRecord 介绍 2.1 ActiveRecord 实现
- 2.1 ActiveRecord 实现
- 3. SimpleQuery 工具类 3.1 SimpleQuery 介绍 3.2 list3.3 map3.4 Group
- 3.1 SimpleQuery 介绍
- 3.2 list
- 3.3 map
- 3.4 Group
- 4. 最后：
[五，MyBatis-Plus 当中的 “ActiveRecord模式”和“SimpleQuery工具类”（详细实操）](\"#五mybatis-plus-当中的-activerecord模式和simplequery工具类详细实操\")
[1. ActiveRecord 模式](\"#1-activerecord-模式\")
[2. ActiveRecord介绍](\"#2-activerecord介绍\")
- 2.1 ActiveRecord 实现
[2.1 ActiveRecord实现](\"#21-activerecord实现\")
[3. SimpleQuery 工具类](\"#3-simplequery-工具类\")
- 3.1 SimpleQuery 介绍
- 3.2 list
- 3.3 map
- 3.4 Group
[3.1 SimpleQuery介绍](\"#31-simplequery介绍\")
[3.2 list](\"#32-list\")
[3.3 map](\"#33-map\")
[3.4 Group](\"#34-group\")
[4. 最后：](\"#4-最后\")

# 1. ActiveRecord 模式

# 2. ActiveRecord 介绍

ActiveRecord(活动记录，简称 AR)，是一种领域模型模式，特点是一个模型类对应关系型数据库中的一个表，而模型类的一个实例对应表中的一行记录。ActiveRecord，一直广受解释型动态语言（PHP，Ruby 等）的喜爱，通过围绕一个数据对象进行 CRUD 操作。而 Java 作为准静态 (编译型语言)，对于 ActiveRecord 往往只能感叹其优雅，所以 MP 也在 AR 道路上进行了一定的探索，仅仅需要让实体类继承 Model 类且实现主键指定方法，即可开启 AR 之旅。

## 2.1 ActiveRecord 实现

接下来我们来看一下 ActiveRecord 的实现步骤

想要使用 ActiveRecord 模式，就需要让对应的实体类 (Java Bean)extends(继承)Model 类。

我们可以看到，Model 类中提供了一些增删改查方法，这样的话我们就可以直接使用实体类对象调用这些增删改查方法了，简化了操作的语法，但是他的底层依然是需要 UserMapper 的，所以持久层接口不能省略。

测试 ActiveRecord 模式的增删改查。

添加数据

删除数据

修改数据

查询数据

# 3. SimpleQuery 工具类

## 3.1 SimpleQuery 介绍

SimpleQuery 可以对 selectList 查询后的结果用 Stream 流进行了一些封装，使其可以返回一些指定结果，简洁了 api 的调用。

## 3.2 List

对于封装后的字段进行 lambda 操作。

## 3.3 Map

将所有的对象以 id,实体的方式封装为 Map 集合

、

将单个对象以 id,实体的方式封装为 Map 集合

只想要 id 和 name 组成的 map

## 3.4 Group

Group 就是简单的分组效果。

# 4. 最后：

“在这个最后的篇章中，我要表达我对每一位读者的感激之情。你们的关注和回复是我创作的动力源泉，我从你们身上吸取了无尽的灵感与勇气。我会将你们的鼓励留在心底，继续在其他的领域奋斗。感谢你们，我们总会在某个时刻再次相遇。”
