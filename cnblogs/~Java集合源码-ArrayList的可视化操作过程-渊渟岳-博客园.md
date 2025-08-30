---
aliases:
  - Java 集合源码 --ArrayList 的可视化操作过程 - 渊渟岳
created: 2025-07-16T10:00:20
modified: 2025-08-30T21:04:02
source: https://www.cnblogs.com/dennyLee2025/p/18919268
title: Java 集合源码 --ArrayList 的可视化操作过程 - 渊渟岳
type: archive-web
---

# Java 集合源码 --ArrayList 的可视化操作过程 - 渊渟岳

关于 ArrayList 的元素插入、检索、修改、删除、扩容等可视化操作过程

还有关于 ArrayList 的迭代器、线程安全和时间复杂度

## 📝1. 底层数据结构

基于动态数组实现，内部维护一个 Object[] 数组。本质是数组数据结构，底层通过拷贝扩容使得数组具备了动态增大的特性。

数组所具备的一些特性，ArrayList 也同样具备，比如、插入元素的有序性、访问元素的地址计算等。ArrayList 与普通数组的本质区别就在于它的动态扩容特性。

集合内可以保存什么类型元素？保存的是什么？这点必须明确知道集合必须保存引用类型的元素，对于基本类型是无法保存的，比如、int、long 类型，但可以保持对应的基本类型的封装类，比如，Integer、Long。集合内保存的是对象的引用，而非对象本身。

### 1.1. ArrayList 的特性

有底层数据结构所决定的特性

- \n 插入元素的有序性，而非排序，不会自动根据值排序；\n
- \n 元素访问：通过数组“首地址 + 下标”来计算元素的存储地址，再通过元素地址直接访问，时间复杂度都是 O(1)；\n
- \n 数组一但申请空间就确定不可变，所以 ArrayList 需要在添加元素操作时，实现自动扩容。\n
插入元素的有序性，而非排序，不会自动根据值排序；

元素访问：通过数组“首地址 + 下标”来计算元素的存储地址，再通过元素地址直接访问，时间复杂度都是 O(1)；

数组一但申请空间就确定不可变，所以 ArrayList 需要在添加元素操作时，实现自动扩容。

### 1.2. 如何设计的数据结构

以下是 ArrayList 类结构与字段

真正存储元素的成员变量 Object[] elementData 和保存数组大小的 size，其它字段多半服务于动态扩容。

MAX_ARRAY_SIZE = Integer.MAX_VALUE - 8 为什么减 8？因为数组头需要占用一些空间，8 位刚好一个字节，故最小减 8，使得 ArrayList 尽可能存储更多数据，但正常开发不可能保存这么大数据集合，Integer.MAX_VALUE 可以保持十亿级了，你减个 1024 都没问题。

modCount 用于记录扩容次数，在迭代器中若存在并发修改，则快速失效抛出异常。

我们从本质去学习技术：集合的作用是什么？

集合的作用是将数据以特定结构存储在内存中，并且方便开发者进行操作。

- \n 存储：开辟内存空间，写入数据；在 Java 语言中无需开发者手动申请内存空间，只需要关注数据写入即可；\n
- \n 操作：无非就是增删查改，只不过现在操作的是内存中的数据罢了。\n
存储：开辟内存空间，写入数据；在 Java 语言中无需开发者手动申请内存空间，只需要关注数据写入即可；

操作：无非就是增删查改，只不过现在操作的是内存中的数据罢了。

## 🚀2. 元素插入（增）

方法分类

ArrayList 的 add 方法有两个重载版本，对应不同的用法：

- \nadd(E e)——在数组末尾插入；\n
- \nadd(int index, E element)——在指定索引下标插入。\n
add(E e)——在数组末尾插入；

add(int index, E element)——在指定索引下标插入。

### 2.1. 在数组末尾插入

使用方法 add(E e)，以下是 jdk8 的源码

插入数据的过程

1. \n 调用 ensureCapacityInternal 确保数组足够大；\n
2. \n 将元素写入 elementData[size]；\n
3. \nsize++ 并返回。\n
调用 ensureCapacityInternal 确保数组足够大；

将元素写入 elementData[size]；

size++ 并返回。

可视化感受下：无参构造创建 ArrayList 集合，然后插入五个元素，首次 add 需要扩容数组为 10（详细的扩容流程看后面章节），效果如图

### 2.2. 指定索引下标插入

使用方法：add(int index, E element)

插入数据的过程

1. \n 检查是否越界；\n
2. \n 调用 ensureCapacityInternal 确保数组足够大；\n
3. \n 将坐标 index 后的元素都往后移动一位；\n
4. \n 将元素写入 elementData[size]；\n
5. \nsize++。\n
检查是否越界；

调用 ensureCapacityInternal 确保数组足够大；

将坐标 index 后的元素都往后移动一位；

将元素写入 elementData[size]；

size++。

演示在索引下标插入元素，效果如图：

### 2.3. ensureCapacityInternal 与 grow 扩容流程

为了好查阅源码，简单调整了下，jdk 源码基本如下

- \n 延迟初始化：无参构造后 elementData 引用一个长度为 0 的共享常量数组。\n
- \nmodCount：每次结构修改（如扩容、增删）都会自增，配合迭代器检查并发修改。\n
- \n 扩容策略：oldCapacity + (oldCapacity >> 1)，右移一位等于除于 2，所以 newCapacity 为原来的 1.5 倍，以权衡空间和拷贝成本。\n
延迟初始化：无参构造后 elementData 引用一个长度为 0 的共享常量数组。

modCount：每次结构修改（如扩容、增删）都会自增，配合迭代器检查并发修改。

扩容策略：oldCapacity + (oldCapacity >> 1)，右移一位等于除于 2，所以 newCapacity 为原来的 1.5 倍，以权衡空间和拷贝成本。

ArrayList 如果不指定大小初始大小为 0，首次 add 才进行首次扩容，扩容大小为 10，这个默认的初始容量 DEFAULT_CAPACITY 在首层插入数据才会使用到。故此，在创建 ArrayList 时最好指定大小，最佳情况是创建时就知道集合的大小。

详细可见构造方法源码

扩容可视化过程：插入第 11 个元素的扩容过程

### 2.4. 扩容时才对 modCount 自增合理吗？

不合理。因为你插入新的数据没有扩容的情况下，集合申请的内存空间不变，但是集合保存元素的大小发生了变化，这和移除元素一样，集合也是发生了变化的，所以在后续的 jdk 版本中，add 操作加入了 modCount++;。

以下是 jdk11 的 add 源码：首行就对 modCount 做了自增

### 2.5. 允许 null 和可重复插入？

ArrayList 集合内保存的是对象的引用，在 Java 语言中，引用是可以指向 null 的，故 ArrayList 集合可以保存 null。在元素插入时并没有对元素进行重复检查，故可以保存重复数据，包括重复的 null。

List 接口在 javadoc 里就明确说了：

允许所有元素（包括 null），允许重复插入；\n 如果你需要“元素唯一”或“禁止空值”，Java 提供了其他集合类型（如实现了 Set 接口的 HashSet/LinkedHashSet/TreeSet，或者在 Java 9+ 可以用 List.of(...) 构造的不可空、不可变的列表）

实现简单高效\nArrayList 底层用一块连续的 Object[] 数组存储元素：

- \n 插入 null 只不过是往数组里赋一个 null，跟存任何其他对象没区别；\n
- \n 重复插入只是把同一个引用赋给不同索引，也没有额外开销；\n 如果强行在 add() 里做“非空检查”或“去重”，不仅会增加每次插入的开销，还会破坏它作为通用、轻量列表的设计初衷。\n
插入 null 只不过是往数组里赋一个 null，跟存任何其他对象没区别；

重复插入只是把同一个引用赋给不同索引，也没有额外开销；\n 如果强行在 add() 里做“非空检查”或“去重”，不仅会增加每次插入的开销，还会破坏它作为通用、轻量列表的设计初衷。

## 📌3. 修改元素（改）

根据指定索引进行覆盖 E set(int index, E element)

这个很简单，检查是否越界，暂存旧值，覆盖数组对应下标的值，返回旧值。

修改索引元素可视化过程：

## 📍4. 移除元素（删）

方法分类

ArrayList 的 remove 方法有两个重载版本，对应不同的用法：

1. \nremove(int index)——按索引删除；\n
2. \nremove(Object o)——按对象值删除。\n
remove(int index)——按索引删除；

remove(Object o)——按对象值删除。

### 4.1. 指定索引删除

使用到的方法：remove(int index)

分析：

- \n 使用 System.arraycopy() 将后面所有元素向前移动一位；\n
- \n 最坏情况是删除索引 0，移动 n-1 个元素；\n
- \n 修改 size，清除最后一个元素引用。\n
使用 System.arraycopy() 将后面所有元素向前移动一位；

最坏情况是删除索引 0，移动 n-1 个元素；

修改 size，清除最后一个元素引用。

删除索引元素的可视化过程：

### 4.2. 按照对象值删除

使用到的方法：remove(Object o)

配套的 fastRemove(int index) 实现如下：

分析：

- \n 先线性查找目标元素，最多比较 n 次；\n
- \n 然后移除元素，最多移动 n-1 个；\n
- \n 所以总操作是一次“线性查找 + 线性移动”。\n
先线性查找目标元素，最多比较 n 次；

然后移除元素，最多移动 n-1 个；

所以总操作是一次“线性查找 + 线性移动”。

避免在大列表中频繁删除中间元素（尤其在循环中删除），否则容易退化为 O(n²)。

对比按照索引删除，多了一步元素查找对比，其它基本一致。

按照对象值删除元素的可视化过程：

## 🎯5. 获取和检索元素（查）

### 5.1. 获取元素

根据索引获取元素：get(int index)

检查是否越界，然后根据下标索引获取元素。

### 5.2. 检索元素

在 ArrayList 中，检索某个元素（不是通过索引，而是查找某个值是否存在，或其位置）主要通过以下两个方法完成：

#### 1) 判断是否包含某个元素

根据对象值判断集合中是否存在：contains(Object o)

这个方法内部调用了 indexOf 方法。它返回一个布尔值，表示某个元素是否存在于列表中。

#### 2) 返回元素首次出现的索引

根据对象值检索首次出现的位置：indexOf(Object o)

跟按照对象值删除的检索过程一致，可查看上面的可视化过程动图。

如果查找的是 null，就用==比较；如果是非 null 对象，则用 equals() 方法逐个比较。从头遍历，找到第一个匹配项的索引。

#### 3) 返回元素最后一次出现的索引

根据对象值检索最后出现的位置：lastIndexOf(Object o)

与 indexOf 类似，但从尾部开始向前查找。

## 6. ArrayList 的迭代器（Iterator）

### 6.1. 什么是迭代器？

迭代器（Iterator）是 Java 集合框架中用于遍历集合元素的工具。\nArrayList 提供了两种主要的迭代方式：

- \nIterator<E>：基础的迭代器接口（只支持单向遍历）\n
- \nListIterator<E>：是 Iterator 的子接口，支持双向遍历、修改元素、获取索引等高级功能\n
Iterator<E>：基础的迭代器接口（只支持单向遍历）

ListIterator<E>：是 Iterator 的子接口，支持双向遍历、修改元素、获取索引等高级功能

### 6.2. Iterator 迭代器

源码（位于 ArrayList.java）：

这会返回一个内部类 Itr 的实例。

#### 1) Itr 内部类的核心源码（简化版）：

#### 2)modCount 与并发修改检查（fail-fast）

- \nmodCount 是 ArrayList 中用于记录结构性修改（如添加、删除元素）次数的字段。\n
- \n 迭代器创建时保存了当前的 modCount 到 expectedModCount。\n
- \n 如果在迭代期间集合发生结构性修改，modCount != expectedModCount，就会抛出 ConcurrentModificationException。\n
modCount 是 ArrayList 中用于记录结构性修改（如添加、删除元素）次数的字段。

迭代器创建时保存了当前的 modCount 到 expectedModCount。

如果在迭代期间集合发生结构性修改，modCount != expectedModCount，就会抛出 ConcurrentModificationException。

这就是所谓的 fail-fast 机制。

#### 3) 示例代码

### 6.3. ListIterator 更强大的双向迭代器

#### 1) 增强版迭代器简述

通过 list.listIterator() 或者 listIterator(int index) 来获取，本质都是返回 new ListItr(index) 对象。ListItr 是 Itr 的子类）private class ListItr extends Itr implements ListIterator<E>，是增强版迭代器。

额外支持：

- \nhasPrevious(),previous()\n
- \nadd(E e),remove(),set(E e)\n
- \nnextIndex(),previousIndex()\n
hasPrevious(),previous()

add(E e),remove(),set(E e)

nextIndex(),previousIndex()

#### 2) 示例代码

反序遍历案例

### 6.4. 时间复杂度

- \n 每个迭代器的 next()、hasNext() 操作时间复杂度都是 O(1)。\n
- \n 但是若在 remove() 中触发 ArrayList 的 remove(index)，那是 O(n)，因为后面的元素要移动。\n
每个迭代器的 next()、hasNext() 操作时间复杂度都是 O(1)。

但是若在 remove() 中触发 ArrayList 的 remove(index)，那是 O(n)，因为后面的元素要移动。

### 6.5. 注意事项

- \n 在使用 for-each 或 iterator 遍历时，不要直接修改原始集合（如调用 add()、remove()），否则会抛出 ConcurrentModificationException。\n
- \n 如果需要在遍历中安全地修改集合，可以使用 ListIterator 的 remove() 或 add() 方法，它是支持修改的。\n
在使用 for-each 或 iterator 遍历时，不要直接修改原始集合（如调用 add()、remove()），否则会抛出 ConcurrentModificationException。

如果需要在遍历中安全地修改集合，可以使用 ListIterator 的 remove() 或 add() 方法，它是支持修改的。

## 7. 线程安全问题

ArrayList 是线程不安全的。

举个例子

不过只有 ArrayList 作为共享变量时，才需要考虑线程安全问题，当 ArrayList 集合作为方法内的局部变量时，无需考虑线程安全的问题。

### 解决安全问题的一些方法

类注释中推荐我们使用 Collections#synchronizedList 来保证线程安全，SynchronizedList 是通过在每个方法上面加上锁来实现，虽然实现了线程安全，但是性能大大降低。

使用方式

也可以使用这个集合：CopyOnWriteArrayList（推荐用于读多写少）

特性：

- \n 所有写操作（add/remove/set）都会复制一份数组再修改；\n
- \n 不会抛出 ConcurrentModificationException；\n
- \n 非常适合读多写少的场景。\n
所有写操作（add/remove/set）都会复制一份数组再修改；

不会抛出 ConcurrentModificationException；

非常适合读多写少的场景。

缺点：

- 写操作开销大，性能比 ArrayList 差很多。

## 8. 时间复杂度汇总

## 9. 总结

在使用 ArrayList 集合时，需要关注以下特性：随机获取/修改快、插入/删除慢、扩容性能问题、并发线程安全问题。

关于元素插入、检索、修改、删除、扩容过程等操作过程，完整的视频链接：https://www.bilibili.com/video/BV1KET2zGEm4/

[https://www.bilibili.com/video/BV1KET2zGEm4/](\"https://www.bilibili.com/video/BV1KET2zGEm4/\")

掌握设计模式的两个秘籍

[掌握设计模式的两个秘籍](\"https://mp.weixin.qq.com/s?__biz=MzI5NDM5NDM1NA==&mid=2247486720&idx=1&sn=739bdfc99dc52128f9d9eb31a70a4c03&scene=21#wechat_redirect\")

查看往期设计模式文章的：设计模式

[设计模式](\"https://mp.weixin.qq.com/mp/appmsgalbum?__biz=MzI5NDM5NDM1NA==&action=getalbum&album_id=3572346739375538182#wechat_redirect\")

超实用的 SpringAOP 实战之日志记录

[超实用的SpringAOP实战之日志记录](\"https://mp.weixin.qq.com/s?__biz=MzI5NDM5NDM1NA==&mid=2247486066&idx=1&sn=e8c7423105ddd0562f50892010941efc&scene=21#wechat_redirect\")

2023 年下半年软考考试重磅消息

[2023年下半年软考考试重磅消息](\"https://mp.weixin.qq.com/s?__biz=MzI5NDM5NDM1NA==&mid=2247485873&idx=1&sn=08b58de61c716e5c57ff2fddb947f0d8&scene=21#wechat_redirect\")

通过软考后却领取不到实体证书？

[通过软考后却领取不到实体证书？](\"https://mp.weixin.qq.com/s?__biz=MzI5NDM5NDM1NA==&mid=2247485909&idx=1&sn=e20f3b7b413310ca78f90c13305972ab&scene=21#wechat_redirect\")

计算机算法设计与分析（第 5 版）

[计算机算法设计与分析（第5版）](\"https://mp.weixin.qq.com/s?__biz=MzI5NDM5NDM1NA==&mid=2247485802&idx=1&sn=863cf239124b98d39ec551b6cb67845c&scene=21#wechat_redirect\")

Java 全栈学习路线、学习资源和面试题一条龙

[Java全栈学习路线、学习资源和面试题一条龙](\"https://mp.weixin.qq.com/s?__biz=MzI5NDM5NDM1NA==&mid=2247485015&idx=1&sn=862bc2b379726b89cdb396ec0d325cc0&scene=21#wechat_redirect\")

软考证书=职称证书？

[软考证书=职称证书？](\"http://mp.weixin.qq.com/s?__biz=MzI5NDM5NDM1NA==&mid=2247485956&idx=1&sn=57407d9f7921254ba19ed70fa3bd6a2d&chksm=ec62ca99db15438f13f2cf96d17a3e282028fa7960af56126caec68fb6eafd46d6e04a10ad0c&scene=21#wechat_redirect\")

软考中级 -- 软件设计师毫无保留的备考分享

[软考中级--软件设计师毫无保留的备考分享](\"https://mp.weixin.qq.com/s?__biz=MzI5NDM5NDM1NA==&mid=2247485837&idx=1&sn=b9b17dfd252882468b8eea31012df6fc&scene=21#wechat_redirect\")

觉得还不错的，三连支持：点赞、分享、推荐↓
