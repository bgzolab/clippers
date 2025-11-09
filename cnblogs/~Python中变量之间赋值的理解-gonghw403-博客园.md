---
draft: true
aliases:
  - Python 中变量之间赋值的理解 - gonghw403
created: 2025-08-08T17:19:45
modified: 2025-08-30T21:04:03
source: https://www.cnblogs.com/xxghw/p/19027382
title: Python 中变量之间赋值的理解 - gonghw403
type: archive-web
---
# Python 中变量之间赋值的理解 - gonghw403

## 1.问题描述

在 Python 项目中，有一个这样的需求：\n 一个文件 a 需要负责提供一个函数，返回该文件中一个全局变量 value,类似与 get_value() 接口\n 在另一个文件 b 中，创建一个变量 temp=get_value()，去取 a 文件中的 value，而且希望后续 a 文件中对 value 的修改，会直接影响到 b 文件中的 temp\n 例如：在 a 文件中,有个函数叫 set_value()，里面执行 value = Myclass(),希望 temp 也受到修改影响，变为指向新的 MyClass

但上面这样操作，显然不会满足需求。

## 2.Python 中变量的赋值逻辑

对于等号右方为非变量名时，如:value = \"string\" 或者 value = 10 或者 value = MyClass()\n 均可以理解成:value 指向了一块空间 a，里面存放着右侧这些数据.（value 为该指针名字）\n

当等号右方为变量名时，如 b = value，\n 可以理解成: 一个新的指针 b，指向了 value 所指向的那块空间\n

所以，理解了上述赋值的区别后，1 中的情况就很好解释了:\ntemp = get_value() 时，temp 指针指向了 value 所指向的那块空间\n

此时调用 set_value，value 又重新指向了另一块新的 MyClass 空间，但 temp 依旧指向原来的 MyClass\n

所以 value 的修改并不会影响 temp，故无法满足需求。

## 3.解决方案

很明显，上述实现的阻碍在于，value 更新时，会指向新的空间，导致外界的 temp 无法及时同步更新。\n 因此我们考虑让 value 降低一层，包裹在更高一层的容器中

有一个 list 数据 a, a = [value, value1, value2, value3]\n\n 我们 get 这个 list a，get_a(), temp = get_a()\n\n 按照上述的理解，所有的 value 实际上都是一个指针，指向了赋值给自己的空间\n\n 如果此时 set_value,实际上是修改 a[0]=MyClass()，由于 value 被 a 容器所管理，即使它指向了新的地方，也可以通过 a 直接访问，又 temp 指向的本身是容器 a，故 temp 也可以直接访问到新的 value\n

故我们目的达到，当 value 被修改时，我们可以通过 temp 取到更新后的 value 值

Ps: 最主要的是和 C++ 中的赋值区分开，不能单纯用 C++ 的引用去理解
