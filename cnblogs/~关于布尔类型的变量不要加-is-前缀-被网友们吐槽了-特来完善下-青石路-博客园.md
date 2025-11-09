---
draft: true
aliases:
  - 关于布尔类型的变量不要加 is 前缀，被网友们吐槽了，特来完善下 - 青石路
created: 2025-08-18T14:20:10
modified: 2025-08-30T21:04:03
source: https://www.cnblogs.com/youzhibing/p/19034101
title: 关于布尔类型的变量不要加 is 前缀，被网友们吐槽了，特来完善下 - 青石路
type: archive-web
---
# 关于布尔类型的变量不要加 is 前缀，被网友们吐槽了，特来完善下 - 青石路

## 开心一刻

一老农养猪，母的，怎么配也怀不上小猪，于是找兽医兽医来到他家看了猪一眼说：不行就人工授精吧老农绕着猪走了三圈，点燃一根烟，貌似下了很大决心，说到：行倒是行，就怕生下来像我

## 被网友吐槽

都说了布尔类型的变量不要加 is 前缀，非要加，这不是坑我了嘛一经发布，吐槽不断

[都说了布尔类型的变量不要加 is 前缀，非要加，这不是坑我了嘛](\"https://www.cnblogs.com/youzhibing/p/18958862\")

有吐槽框架的

有吐槽 IDE 的

有吐槽 Java 的

有吐槽楼主落后，不用 Lombok 的

也有吐槽水文的

说实话，前面的吐槽不会让我有任何波澜，但是这个水文让我内心泛起了涟漪

作为一个严谨的博主，怎能让水文出现在我的写作生涯中？特来补充、完善下

## JavaBeans 规范

关于 JavaBean 的属性该如何读写，sun 官方给出了规范：JavaBeans Spec，其中有这么一段

[JavaBeans Spec](\"https://download.oracle.com/otndocs/jcp/7224-javabeans-1.01-fr-spec-oth-JSpec/\")

与本文密切相关，我给你们翻译下

1. \n 简单属性\n 默认情况下，通过识别特定格式的方法（方法命名模式）来定位属性：\npublic <PropertyType> get<PropertyName>();\npublic void set<PropertyName>(<PropertyType> a);\n\n 如果我们发现一对方法：get<PropertyName>()、set<PropertyName>，set 方法的入参类型与 get 方法的返回类型相同，那么我们将这对方法视为<propertyName>的读写属性。我们将使用 get<PropertyName>方法获取属性值，并使用 set<PropertyName>方法设置属性值。这对方法可以位于同一个类中，也可以一个位于基类中，另一个位于派生类中。\n 如果我们只找到了这对方法中的某个方法，我们则认为只定义了<propertyName>的只读属性或只写属性\n 默认情况下，我们预设属性既非绑定属性，亦非约束属性\n\n 绑定属性与约束属性与本文无关，不展开\n\n 因此，一个简单的可读写属性 foo 通常会通过以下方法对表示：\npublic Wombat getFoo();\npublic void setFoo(Wombat w);\n\n
2. \n 布尔属性\n 此外，对于布尔属性，我们允许 getter 方法匹配以下模式：\npublic boolean is<PropertyName>();\n\n 我们可以用 is<PropertyName>方法来替换 get<PropertyName>方法，也可用 is<PropertyName>方法补充 get<PropertyName>方法。无论哪种情况，只要布尔属性存在 is<PropertyName>方法，则使用 is<PropertyName>方法获取属性值。\n 一个布尔属性示例可能如下：\npublic boolean isMarsupial();\npublic void setMarsupial(boolean m);\n\n
简单属性

默认情况下，通过识别特定格式的方法（方法命名模式）来定位属性：

如果我们发现一对方法：get<PropertyName>()、set<PropertyName>，set 方法的入参类型与 get 方法的返回类型相同，那么我们将这对方法视为<propertyName>的读写属性。我们将使用 get<PropertyName>方法获取属性值，并使用 set<PropertyName>方法设置属性值。这对方法可以位于同一个类中，也可以一个位于基类中，另一个位于派生类中。

如果我们只找到了这对方法中的某个方法，我们则认为只定义了<propertyName>的只读属性或只写属性

默认情况下，我们预设属性既非绑定属性，亦非约束属性

绑定属性与约束属性与本文无关，不展开

因此，一个简单的可读写属性 foo 通常会通过以下方法对表示：

布尔属性

此外，对于布尔属性，我们允许 getter 方法匹配以下模式：

我们可以用 is<PropertyName>方法来替换 get<PropertyName>方法，也可用 is<PropertyName>方法补充 get<PropertyName>方法。无论哪种情况，只要布尔属性存在 is<PropertyName>方法，则使用 is<PropertyName>方法获取属性值。

一个布尔属性示例可能如下：

至此，我相信大家对 JavaBean 的 setter、getter 规范有了个基本了解了，我再总结下

1. 简单属性（非布尔属性），通过 get<PropertyName>() 和 set<PropertyName>来获取、设置属性值
2. 布尔属性，通过 set<PropertyName>设置属性值，通过 get<PropertyName>或 is<PropertyName>来获取属性值，如果两个获取方法同时存在，使用 is<PropertyName>来获取属性值
规范，官方是制定了，但实现者是不是按规范实现的呢，我们以 IntelliJ IDEA 和 Lombok 为例，来看看它们是否遵循了规范

1. \nIDEA\n 版本：IntelliJ IDEA 2023.3.2\n\n 生成的 setter、getter 方法如下\n/**\n * @author 青石路\n */\npublic class JavaBeanEntity {\n private String id;\n private int age;\n private boolean enabled;\n\n public String getId() {\n return id;\n }\n\n public void setId(String id) {\n this.id = id;\n }\n\n public int getAge() {\n return age;\n }\n\n public void setAge(int age) {\n this.age = age;\n }\n\n public boolean isEnabled() {\n return enabled;\n }\n\n public void setEnabled(boolean enabled) {\n this.enabled = enabled;\n }\n}\n\n 属性 id、age 的类型不是布尔类型，其 setter、getter 方法符合简单属性的规范；属性 enabled 的类型是布尔类型，其 getter 方法是 isEnabled，setter 方法是 setEnabled，符合布尔属性的规范\n\n 也就是说 IDEA 遵循了 JavaBeans 属性规范\n\n
2. \nLombak\n 我们再来看看 Lombok，版本：1.18.30\n\n 属性 id、age 的类型不是布尔类型，其 setter、getter 方法符合简单属性的规范；属性 enabled 的类型是布尔类型，其 getter 方法是 isEnabled，setter 方法是 setEnabled，符合布尔属性的规范\n\n 也就是说 Lombok 也遵循了 JavaBeans 属性规范\n\n
IDEA

版本：IntelliJ IDEA 2023.3.2

生成的 setter、getter 方法如下

属性 id、age 的类型不是布尔类型，其 setter、getter 方法符合简单属性的规范；属性 enabled 的类型是布尔类型，其 getter 方法是 isEnabled，setter 方法是 setEnabled，符合布尔属性的规范

也就是说 IDEA 遵循了 JavaBeans 属性规范

Lombak

我们再来看看 Lombok，版本：1.18.30

属性 id、age 的类型不是布尔类型，其 setter、getter 方法符合简单属性的规范；属性 enabled 的类型是布尔类型，其 getter 方法是 isEnabled，setter 方法是 setEnabled，符合布尔属性的规范

也就是说 Lombok 也遵循了 JavaBeans 属性规范

## JSON 序列化与反序列化

因为我们平时是基于 Spring Web 提供 HTTP 接口，Spring Web 默认又是使用 Jackson 完成 JavaBean 实例与 JSON 之间的转换，所以我们基于 Jackson 来验证下 JavaBean 实例与 JSON 之间的转换是否正常；验证之前，我先调整下 JavaBeanEntity 的 isEnabled 方法

增加了一行输出：isEnabled 方法被调用，方便验证 isEnabled 被调用了；我们先来看 Bean 实例转 JSON

可以看到转换是没问题的；我们接着看下 JSON 转 Bean 实例

JSON 转实例也是没问题的；如果 enabled 的 getter 方法不是以 is 开头，而是以 get 开头，会不会有问题呢，我们来看下

同样没问题；如果 enabled 的 getter 方法同时存在 is 和 get，是否如规范规定的那样：is 方法生效，我们来看看

生效的竟然是 getEnabled 方法，不符合 JavaBeans 规范吖！！！这是为什么？

我们跟下 Jackson 的源码，版本 2.13.5，看看其实现；问题又来了：怎么跟 Jackson 的源码？切入点其实很好找，getEnabled 不是被调用了吗，直接在其方法体内打个断点

然后 debug 运行，从调用栈中切入

从上往下看，invoke 相关的就不用看了，这是反射调用，所以我们从 serializeAsField 开始寻找答案，直接鼠标左击调用栈中的 serializeAsField

此时，已经采用 getEnabled 了，说明选择 isEnabled 还是 getEnabled 的逻辑已经完成了，我们应该继续往下看调用栈中的 serializeFields

我们看下 _props 内容

此时，属性 enabled 的 getter 方法已经确定是 genEnabled，这个时候我们不能继续跟调用栈了，而是要跟 _props 的赋值过程了，跟的过程不是那么简单，我省略一部分，直接带你们看重点

两个 getter 方法目前都存在，Jackson 还未进行抉择，说明离真相很近了，我们继续跟进 removeIgnorableTypes，一路跟进去，会来到 POJOPropertyBuilder#getGetter 方法

代码就不分析了，相信你们都能看懂，我们来看下其中的注释

结合 _getterPriority

答案已然揭晓

三个优先级，从高到底分别是

1. 常规 getters（get<PropertyName>()）
2. is getters（is<PropertyName>()）
3. 隐式的，可能的 getters（propertyName()）
所以，生效的是 getEnabled，也就是说

Jackson 2.13.5 对 JavaBean 属性的 getter 实现，遵循了 JavaBeans 规范，但又没完全遵循

此刻，我觉得你们应该联想到其他问题

1. 隐式的，可能的 getters（propertyName()）什么时候会生效
2. Jackson 的其他版本也是这样实现的吗
3. Hutool 的实现又是怎样的
知识面是不是一下就打开了？

## 布尔包装类

我们仔细看 JavaBeans 规范对布尔类型的规定

是不是只对布尔基础类型进行了规范，并未对其包装类型进行说明？既然官方都未说明，那各个实现者就可以按自己的规则来实现了

1. \nIDEA\n/**\n * @author 青石路\n */\npublic class JavaBeanEntity {\n private String id;\n private Integer age;\n private Boolean enabled;\n\n public String getId() {\n return id;\n }\n\n public void setId(String id) {\n this.id = id;\n }\n\n public Integer getAge() {\n return age;\n }\n\n public void setAge(Integer age) {\n this.age = age;\n }\n\n public Boolean getEnabled() {\n return enabled;\n }\n\n public void setEnabled(Boolean enabled) {\n this.enabled = enabled;\n }\n}\n\n\n 属性 enabled 的类型是 Boolean，其 getter 方法是 getEnabled\n\n
2. \nLombok\n\n\n 属性 enabled 的类型是 Boolean，其 getter 方法是 getEnabled\n\n
IDEA

属性 enabled 的类型是 Boolean，其 getter 方法是 getEnabled

Lombok

属性 enabled 的类型是 Boolean，其 getter 方法是 getEnabled

所以 Boolean 属性与 boolean 属性的 getter 实现有所不同，各个实现者可以按自己的规则来实现 Boolean 类型属性的 getter

再带你们回顾下 Java 开发手册 中的一项规约

结合这项规约来看的话，JavaBeans 规范对布尔类型属性 getter 的规定，是不是就没什么约束力了？

## Is 前缀的布尔属性

JavaBeans 规范并未明确规定 is 开头的布尔属性的 getter 该如何实现，那么套用规范中 boolean 属性的规则的话，getter 就会以两个 is 开头，例如 isIsEnabled，看着是不是有点反人类？所以实现者就会按自己的规则进行实现，同样以 IDEA 和 Lombok 为例，我们来看看它们是怎么实现这种情况的，先看基本数据类型 boolean

1. \nIDEA\n/**\n * @author 青石路\n */\npublic class JavaBeanEntity {\n private String id;\n private Integer age;\n private boolean isEnabled;\n\n public String getId() {\n return id;\n }\n\n public void setId(String id) {\n this.id = id;\n }\n\n public Integer getAge() {\n return age;\n }\n\n public void setAge(Integer age) {\n this.age = age;\n }\n\n public boolean isEnabled() {\n return isEnabled;\n }\n\n public void setEnabled(boolean enabled) {\n isEnabled = enabled;\n }\n}\n\n\ngetter 是 isEnabled，setter 是 setEnabled，并未遵循 JavaBean 规范\n\n 此时 JSON 序列化，得到的字符串是\n\n 看仔细了，key 值是 enabled，而非 isEnabled；那么 JSON 串\n{\n \"id\": \"44\",\n \"age\": 16,\n \"isEnabled\": true\n}\n\n 反序列化得到的 JavaBeanEntity 实例，其 isEnabled 值是什么？\n
2. \nLombok\n\n\ngetter 是 isEnabled，setter 是 setEnabled，并未遵循 JavaBean 规范\n\n 与 IDEA 实现一致\n
IDEA

getter 是 isEnabled，setter 是 setEnabled，并未遵循 JavaBean 规范

此时 JSON 序列化，得到的字符串是

看仔细了，key 值是 enabled，而非 isEnabled；那么 JSON 串

反序列化得到的 JavaBeanEntity 实例，其 isEnabled 值是什么？

Lombok

getter 是 isEnabled，setter 是 setEnabled，并未遵循 JavaBean 规范

与 IDEA 实现一致

再看看包装数据类型 Boolean

1. \nIDEA\n/**\n * @author 青石路\n */\npublic class JavaBeanEntity {\n private String id;\n private Integer age;\n private Boolean isEnabled;\n\n public String getId() {\n return id;\n }\n\n public void setId(String id) {\n this.id = id;\n }\n\n public Integer getAge() {\n return age;\n }\n\n public void setAge(Integer age) {\n this.age = age;\n }\n\n public Boolean getEnabled() {\n return isEnabled;\n }\n\n public void setEnabled(Boolean enabled) {\n isEnabled = enabled;\n }\n}\n\n\ngetter 是 getEnabled，setter 是 setEnabled\n\nJSON 序列化与反序列化的结果是什么？我相信你们能立马答出来\n
2. \nLombok\n\n\ngetter 是 getIsEnabled，setter 是 setIsEnabled\n\n 此时 JSON 序列化的结果\n{\n \"id\": \"1\",\n \"age\": 18,\n \"isEnabled\": true\n}\n\nkey 值与 JavaBeanEntity 的属性名完全对应上了；那么 JSON 串\n{\n \"id\": \"44\",\n \"age\": 16,\n \"isEnabled\": true\n}\n\n 反序列化得到的 JavaBeanEntity 实例，其 isEnabled 值是什么？\n
IDEA

getter 是 getEnabled，setter 是 setEnabled

JSON 序列化与反序列化的结果是什么？我相信你们能立马答出来

Lombok

getter 是 getIsEnabled，setter 是 setIsEnabled

此时 JSON 序列化的结果

key 值与 JavaBeanEntity 的属性名完全对应上了；那么 JSON 串

反序列化得到的 JavaBeanEntity 实例，其 isEnabled 值是什么？

## 要不要加 is 前缀

关于布尔类型的属性，并且是 Boolean 类型的属性，能不能加 is 前缀，答案肯定是能的，但是不推荐，我们来看看 deepseek 是怎么说的

在你们心中，Boolean 类型的属性名，is 前缀是不是有了替代方案？

## 总结

1. \nJavaBeans 规范，只对 boolean 属性进行了规定，并未对 Boolean 属性进行规定，不同的实现者对 Boolean 属性的 getter 的实现可能各不相同，大家不要觉得不可理解\n
2. \n 老老实实遵循 Java 开发手册，可以规避很多前人踩过的坑\n 与本文相关的就是\n\nPOJO 类中的任何布尔类型的变量，都不要加 is 前缀\n 所有的 POJO 类属性必须使用包装数据类型，RPC 方法的返回值和参数必须使用包装数据类型，所有的局部变量推荐使用基本数据类型\n\n
3. POJO 类中的任何布尔类型的变量，都不要加 is 前缀
4. 所有的 POJO 类属性必须使用包装数据类型，RPC 方法的返回值和参数必须使用包装数据类型，所有的局部变量推荐使用基本数据类型
5. \n 说都说了布尔类型的变量不要加 is 前缀，非要加，这不是坑我了嘛是水文，鄙人实难苟同\n\n
JavaBeans 规范，只对 boolean 属性进行了规定，并未对 Boolean 属性进行规定，不同的实现者对 Boolean 属性的 getter 的实现可能各不相同，大家不要觉得不可理解

老老实实遵循 Java 开发手册，可以规避很多前人踩过的坑

[Java开发手册](\"https://developer.aliyun.com/topic/java20\")

与本文相关的就是

1. POJO 类中的任何布尔类型的变量，都不要加 is 前缀
2. 所有的 POJO 类属性必须使用包装数据类型，RPC 方法的返回值和参数必须使用包装数据类型，所有的局部变量推荐使用基本数据类型
说都说了布尔类型的变量不要加 is 前缀，非要加，这不是坑我了嘛是水文，鄙人实难苟同

[都说了布尔类型的变量不要加 is 前缀，非要加，这不是坑我了嘛](\"https://www.cnblogs.com/youzhibing/p/18958862\")
