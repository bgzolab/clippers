---
aliases:
  - 最强 ORM 让你开发效率提升百倍 - 薛家明
created: 2025-08-08T08:48:18
modified: 2025-08-30T21:04:04
source: https://www.cnblogs.com/xuejiaming/p/19027570
title: 最强 ORM 让你开发效率提升百倍 - 薛家明
type: archive-web
---

# 最强 ORM 让你开发效率提升百倍 - 薛家明

# 最强 ORM 让你开发效率提升百倍

easy-query 在经过 2 年的迭代目前已经在查询领域可以说是无敌的存在,任何 orm 都不是对手，这几年的功能点简单罗列一下

[x] 动态 join: 查询涉及到对应的关系表就会自动添加 join 反之则不会讲 join 加入到 sql 中 (2025 年了感觉也不是什么新鲜特性了)\n[x] 结构化 DTO，自动根据 DTO 和表关系的路径自动筛选出需要的结构化属性 (开发效率杀手)\n[x] 结构化 DTO 额外配置,支持结构化 DTO 的返回下还能额外添加查询条件和筛选条件\n[x] 隐式 PARTITION BY\n[X] 隐式子查询\n[x] 子查询转 GroupJoin 全世界应该是独一份的功能,解决多对多深层关系在 ORM 中的子查询过多导致的性能问题真正解决了 ORM 在复杂查询下开发效率和性能的兼顾

框架地址 https://github.com/dromara/easy-query\n 文档地址 https://www.easy-query.com/easy-query-doc/\n 该文章 demo 地址 https://github.com/xuejmnet/eq-doc

[https://github.com/dromara/easy-query](\"https://github.com/dromara/easy-query\")

[https://www.easy-query.com/easy-query-doc/](\"https://www.easy-query.com/easy-query-doc/\")

[https://github.com/xuejmnet/eq-doc](\"https://github.com/xuejmnet/eq-doc\")

刚好前几天我看到公众号有篇关于 efcore 的性能文章,我看了其实我一眼就知道了他的问题就是 eq 的子查询转 GroupJoin 但是正如强大的 efcore 也是没有实现该功能，话不多说本章节我们将入门通过公众号的 demo 实现大部分帖子相关的查询和功能

## 建模

实体关系如下：

- 用户 User：每个用户有多篇帖子和多条评论和多个点赞
- 分类 Category：帖子所属分类类目支持多个分类一个帖子或者多个帖子公用同一个分类
- 帖子 Post：每篇帖子有多个分类并可获得多个赞
- 评论 Comment：每条评论属于一个用户并关联一篇帖子 且评论支持楼中楼
- 点赞 Like：每个赞关联一篇帖子，多个点赞可以关联同一篇帖子
- 分类帖子关联 CategoryPost：帖子和分类的关联关系表

# 帖子相关查询

## 帖子分页

对 Post 表进行分页按 publishAt 倒序进行排序按 title 进行搜索

首先我们定一个公用类

定义请求参数

### 分页动态条件

这边提供了两种方式实现动态查询,当 title 不为空的时候加入表达式筛选,执行我们来看看实际情况

- 使用 if 函数包裹表达式断言,支持任意 java 表达式
- 使用断言函数第一个参数重载，默认第一个参数为 true 才会执行断言操作
- 使用 where 重载第一个参数为 true 执行当前 where
请求参数

container 还是 like!!!\n> 细心地朋友会发现我们使用了 contains 函数而不是 like 函数,因为当传入的查询条件本身带有% 时那么 like 会让% 变成通配符，而 contains 会将% 视为被查询的一部分,这是需要用户注意的,具体使用 contains 还是 like 应该有用户自行决断

推荐写法🔥: 可能由用户会问如果我添加的条件有很多怎么办难道每一个都要这么写一遍吗?eq 贴心的提供了多种方式来实现动态查询比如 filterConfigure

通过添加 filterConfigure 支持让参数为 null 不参与业务,如果是字符串则必须保证 isNotBlank，当然用户也可以通过自己的自定义来实现

更多的动态条件设置请参考文档

[更多的动态条件设置请参考文档](\"https://www.easy-query.com/easy-query-doc/ability/adv/where\")

> 正常我们推荐使用 filterConfigure 或者使用 if 函数包裹条件而不是使用方法参数的第一个 boolean 类型来控制，因为参数 boolean 类型重载相对会让表达式不够直观且难以阅读所以我们极力推荐另外几种方式

我们学会了如何在单表查询分页下使用动态参数控制 sql,那么接下来我们将学习如何使用参数外部控制动态排序

### 分页动态排序

首先我们对请求的条件进行修改

请求参数

执行请求后生成的 sql 为

支持我们已经支持了分页的动态排序,当然动态排序功能远不止此,更多动态排序请点击链接

[更多动态排序请点击链接](\"/easy-query-doc/ability/adv/order\")

### 分页 join 筛选

当然对于大部分业务而言实体对象不是一个孤单对象,当前的 Post 对象也是如此，我们经常会有连表或者子查询等操作，那么 eq 是如何快速便捷的实现 join 的呢

下面这种通过关联关系实现 join 的操作我们称之为隐式 join

- 查询帖子要求查询条件是某个用户的
首先因为涉及到 join 那么 eq 提供了关联关系将原先的 Post 单表和用户表进行多对一的关联

#### 通过插件生成关联关系

- 第一步呼出 ui 界面
- 第二步设置关联关系

选择好对应的关联键后点击确认插件会帮你自动生成强类型属性|lombok 属性或字符串

当然你也可以手写关联关系

修改完实体对象后我们做了一个 post.userId=user.id 的关系接下来我们创建查询对象

- ①是我们新添加的查询属性 userName
接下来我们发送请求

- ①我们使用了用户名称作为筛选条件
- ②我们使用了用户下的创建时间作为排序时间,user.createAt 中 user 是关联导航属性就是我们之前定义的多对一,createAt 是这个导航属性的字段名
当我们传递 userName 那么看下 sql 会是怎么样的

我们惊讶的发现 eq 非常智能的将分页中的 total 查询的所有 join 都去掉了,并且返回集合的那个 sql 任然保留,如果我们将 orderBy 也去掉会发现 eq 居然整个 sql 都不会添加 join 选项

你没有看错动态 join 就是这么简单，这就是真正的只能 orm 框架

### 回顾一下

- 首先我们添加了动态查询筛选器配置 filterConfigure(NotNullOrEmptyValueFilter.DEFAULT_PROPAGATION_SUPPORTS) 让所有条件参数非 null 非空的值支持加入条件，这样就做到了动态查询的特性
- 第二点因为我们传递 userName 参数，所以表达式的 t_post.user().name().contains(request.getUserName()); 会生效并且会自动根据对应的关系使用 leftJoin 将 post 和 user 关联起来并且查询 post 下的 user 下的姓名
- 第三点因为我们没有传递 userName 参数，所以表达式的 t_post.user().name().contains(request.getUserName()); 不会生效,但是 orderBy 的 user.createAt 还是会生效,所以 page 的时候 total 的哪一次查询因为没有使用 user 表所以不会 join，但是 toList 的那一次因为 orderBy 用到了所以任然会进行 leftJoin

## 扩展篇

### 为什么使用 leftJoin

因为任何两张表的关系在没有明确指定一定存在的情况下那么 leftJoin 的操作是不会影响主表的结果集,假如每个 Post 并不是都会有一个 user 的情况下我如果使用 user.createAt 进行排序那么 inner join 会让主表的结果集变少,但这是完全不被允许的这种做法会大大增加用户使用的心智负担

那么如果我希望使用 innerJoin 而不是 leftJoin 呢，我们可以再配置@Navigate 的时候通过属性 required=true 来告知框架 Post 必定有 user

添加①属性 required = true 这样查询我们就能够发现框架会智能的使用 innerJoin 而不是 leftJoin

### 隐式 join 怎么添加 on 条件

很多细心的盆友可能希望我们在关联用户的时候添加额外的查询条件那么应该如何实现呢

请求 json 为如下不查询 userName,不进行 user 的属性排序

- ①会将条件添加到 join 的 on 上面实现关联关系的定义筛选
奇怪的事情发生了为什么这次我们没有传递 user 相关的数据依然给我们把 inner join 加上了,其实本质是 inner join 的 on 条件是会影响主表数量，本质和写到 where 里面是一样的,所以虽然你没有 where 的条件但是 inner join 的 on 条件依然会让整个表达式的 join 无法动态优化,

filter!!!\n> 关联关系的 filter 会以 join on 的形式出现在 sql 中,相当于是额外对关联关系的筛选，缩小关系表,又因为 post 和 user 的关系为 post 必定有 user:required=true 所以会使用 inner join 代替 left join

## 帖子内容返回用户名

我们之前使用关联让帖子筛选支持用户姓名,那么如果我们需要返回帖子和对应的发帖人姓名应该怎么处理呢

### 创建响应 dto

- ①在 dto 上标记当前表来自于哪张表,插件可以提示相关错误
- ②自定义 dto 对象代理实现表达式内赋值
- ③因为①的存在所以④会有插件提示不存在这个字段的警告，通过添加③来让插件不进行提示
- ④额外增加一个字段接受用户姓名
- ①通过@EntityProxy 注解 eq 框架会生成代理对象，改对象支持 dsl 表达式赋值
- ②通过使用隐式 join 的方式赋值到 dto 中
我们可以看到生成的 sql 将 join 的 user 表的 name 赋值给了 dto 的 userName 属性

那么如果属性很多又一样我们是否可以有建议方便的做法呢

- ①将原先的属性赋值使用 selectAll 进行复制如果存在不需要的字段则可通过 selectIgnores 进行排除如下
那么是否有不使用@EntityProxy 的方式来返回呢

### Include 查询

有时候我们希望返回的数据内容包含用户相关信息那么我们应该如何操作才能将返回的 post 信息里面包含 user 信息呢

这次我们选择返回 post 本体对象,并且不定义 dto 结构返回

框架通过多次分批返回将整个数据返回 (注意数据二次查询没有 N+1 问题完全放心使用)，且返回的数据是以结构化对象的形式来返回到前端的

返回的响应数据

那么如果我们希望返回的时候只返回 user 的 id 和 name 应该如何实现

- 第一种返回数据库对象但是只查询 id 和 name
- 第二种定义 dto 使用 selectAutoInclude

### Include 部分列

返回的响应数据

include 函数存在多个重载其中第二参数用于描述前一个 include 和对应的额外操作这边设置为只返回 id 和 name

我们看到查询的时候仅查询 id 和 name

这种查询返回的任然是数据库对象所以无法再返回的形状上移除 phone 和 createAt,那么是否有一种办法可以做到形状确定呢

答案是有的时候 dto 来代替数据库对象在使用 selectAutoIncludeapi

### 结构化 dto

结构化 dto 用来返回 dto 且形状确定适合生成文档和下游数据交互那么可以通过安装插件后进行如下操作

第一步我们使用插件创建结构化 dto

在 dto 的 package 处右键选择 CreateStructDTO

第二步选择要返回的对象

第三步勾选要返回的字段

确定 dto 名称后框架会帮我们直接生成 dto 对象

框架依然通过 in 来解决 n+1 的问题实现结构化的对象返回,框架支持任意结构化对象返回包括结构化对象扁平化

- ①selectAutoInclude 是 selectapi 和 include 的结合，会自动安装 dto 的要求将数据结构进行组装返回
说明!!!\n> 注意千万不要再 selectAutoInclude 中传入数据库对象,因为数据库对象的传入会导致 selectAutoInclude 将整个关系树连根拔起都查询出来\n> 注意千万不要再 selectAutoInclude 中传入数据库对象,因为数据库对象的传入会导致 selectAutoInclude 将整个关系树连根拔起都查询出来\n> 注意千万不要再 selectAutoInclude 中传入数据库对象,因为数据库对象的传入会导致 selectAutoInclude 将整个关系树连根拔起都查询出来

selectAutoInclude!!!\n>selectAutoInclude 这个 api 是 eq 的核心数据查询 api 之一用户必须完全掌握可以提高 1000% 的效率,并且没有 n+1 问题支持后续一对一 一对多的任意数据穿透查询

### NavigateFlat 🔥

返回数据的时候我们如果不希望以结构化对象的形式返回,希望将 user 对象平铺到整个 post 中，又不希望使用 set 手动复制那么可以通过@NavigateFlat 来实现额外属性的获取

注意我们必须要将①的 link 表示添加上，这样我们在写②的 pathAlias 时插件会自动给出相应的提示,查询是我们将使用 selectAutoInclude 来实现万能查询

> 注意千万不要再 selectAutoInclude 中传入数据库对象,因为数据库对象的传入会导致 selectAutoInclude 将整个关系树连根拔起都查询出来\n> 注意千万不要再 selectAutoInclude 中传入数据库对象,因为数据库对象的传入会导致 selectAutoInclude 将整个关系树连根拔起都查询出来\n> 注意千万不要再 selectAutoInclude 中传入数据库对象,因为数据库对象的传入会导致 selectAutoInclude 将整个关系树连根拔起都查询出来

@NavigateFlat 支持任意级别对象关系获取,如果对象关系获取中间存在 toMany 无论是 OneToMany 还是 ManyToMany 那么最终都会变成 List<?>集合

## 帖子内容带评论

简单的额外对象获取后我们希望实现返回给前端帖子内容并且携带上前三条相关评论，那么 eq 有几种方式呢

- NaviagteFlat+limit+union
- NaviagteFlat+limit+partition by
- subquery+limit+joining

### 评论关系添加

因为帖子和评论的关系是一对多所以我们在帖子里面通过插件或者手动添加关联关系

### limit+union

首先我们定义好需要返回的对象

这样我们就设置好了要返回的数据并且支持额外返回 3 条评论

我们看到真的和编写的 dto 如出一辙的返回了查询结果

一个生成了三条 sql，中 limit+union 是第二条 sql,但是 union 相对 sql 会变得复杂并且冗余所以我们尝试 eq 提供的第二种方式

### limit+partition By

springboot 的 application.yml 增加配置项

- include-limit-mode: partition 这句话让原先的 union all 变成 partition(后续 partition 可能会变成默认)
接下来我们继续请求

我们看到通过简单的配置我们将一对多返回前 n 条变动轻松简单并且可以快速实现支持分页,但是细心的朋友肯定发现了一个问题,我们需要的评论并不是平铺到整个 post 贴子的，帖子和评论虽然是一对多但是评论自己也是自关联，评论设计也是楼中楼为支持的那么我们应该如何设置让我们返回的评论支持返回第一层级呢

### EXTRA_AUTO_INCLUDE_CONFIGURE

使用 eq 的 EXTRA_AUTO_INCLUDE_CONFIGURE 可以对 selectAutoInclude 的查询添加额外字段或额外搜索排序等处理

关于 EXTRA_AUTO_INCLUDE_CONFIGURE 的更多信息请查看文档

[查看文档](\"/easy-query-doc/ability/return-result/extra\")

第一步对原始的 dto 对象进行插件快速提示插入 EXTRA_AUTO_INCLUDE_CONFIGURE

我们移除 select 操作因为我们不需要

最终我们的返回 dto 如下

我们看中间 sql 如下

- ①是我们通过额外配置添加上去的
返回的 json 如下

我们返回的 post 节点完美的符合我们内容

但是有时候我们可能需要返回的是 post 信息和前三条内容并且将前三条内容合并到一个字段上去那么应该怎么做

### Joining 逗号分割

一如既往我们还是定义对应的 dto

我们来看下表达式 t_post.commentList().where(c->c.parentId().eq(\"0\")).joining(c->c.content()) 这个表达式是将 post 下方的评论集合 commentList 通过 where 筛选取前三个的 content 内容合并

通过结果我们可以清晰地看到 commentContent 被 joining 函数通过逗号分割组合在一起了\n 我们再来看对应的 sql

框架通过 select 子查询将结果清晰的将结果集通过 group_concat 函数组装到了 comment_content 列上

::: warning 性能!!!

如果由用户嫌弃 select 子查询性能低下 eq 贴心的提供了子查询转 groupJoin 助力用户实现更高效的 sql\n:::

当然这边为了演示使用了内容逗号分割，其实本质而言应该是将类目逗号分割更加合适

接下来我们创建帖子的类目关系表

帖子和类目关系是多对多通过 CategoryPost 表进行关联

- 其中我们看到①subQueryToGroupJoin = true 该配置项让原本的多对多子查询可以直接在使用的时候使用 groupJoin 来代替可以让生成的 sql 性能更加高效
返回帖子内容 + 用户 + 评论前三个 + 所属类目逗号分割

设置返回 dto

我们通过对主表进行额外字段的添加让其直接支持额外字段返回

- @SuppressWarnings(\"EasyQueryFieldMissMatch\") 这个注解主要是用来抑制插件警告，您如果觉得警告无所谓那么可以不加该注解对结果没有影响
完全完美符合我们需要的结果

- 第一条 sql 我们看到用来查询返回 post 信息和对应的 categoryNames 字段使用 groupJoin 来代替多对多自查
- 第二条 sql 我们看到框架使用 patrtition by 让用户可以轻松的返回评论信息前 n 条
- 第三条 sql 我们使用 NaviagteFlat 二次查询杜绝 n+1 来返回用户信息
到此为止我们的帖子相关的查询已经结束 主要我们实现了框架对一对多 多对一和多对多下如何快速查询并且支持众多开窗函数的隐式使用

## 最后的最后我非常感谢您能看到这边我相信 eq 绝对是你不二的 orm 选择

框架地址 https://github.com/dromara/easy-query\n 文档地址 https://www.easy-query.com/easy-query-doc/\n 该文章 demo 地址 https://github.com/xuejmnet/eq-doc

[https://github.com/dromara/easy-query](\"https://github.com/dromara/easy-query\")

[https://www.easy-query.com/easy-query-doc/](\"https://www.easy-query.com/easy-query-doc/\")

[https://github.com/xuejmnet/eq-doc](\"https://github.com/xuejmnet/eq-doc\")
