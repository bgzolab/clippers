---
aliases:
  - 手撸一个 Vue(看不懂可以举报) - 彩虹刀法
created: 2025-08-08T14:39:58
modified: 2025-08-30T21:04:04
source: https://www.cnblogs.com/listen80/p/19026582
title: 手撸一个 Vue(看不懂可以举报) - 彩虹刀法
type: archive-web
---

# 手撸一个 Vue(看不懂可以举报) - 彩虹刀法

# 手撸一个 Vue

## 背景

vue 是啥，有哪些基本功能，模板，script, style, 双向绑定一大堆，太多东西了，太难了，直接开始动手吧

## 仓库

https://github.com/listen80/two-way-binding

[https://github.com/listen80/two-way-binding](\"https://github.com/listen80/two-way-binding\")

## 体验一下（pc 上使用）

https://listen80.github.io/two-way-binding/public/

[https://listen80.github.io/two-way-binding/public/](\"https://listen80.github.io/two-way-binding/public/\")

## 单文件

通过 ajax 获取类似.vue .html .tpl 文件

## 构建 vue 实例

1. 把 script 文本变成 script 运行
2. 把原始 data 变成 reactive 的形式，增加依赖收集
3. 解析 template,扣出来指令，属性，方法，子组件等为了区分指令前缀使用@而不是 v-
4. 挂载 style 样式增加
5. 替换当前实例挂载的元素，目前为止所有的元素（html, script, style）都已经使用上来了

## 总结

就这么结束了，是不是很简单，当然其中的细节很多，上文主要是描述核心思想点\n 本 demo 是没有使用虚拟 dom,是 dom 跟数据直接绑定的，跟进 vue3.6 vapor\n 水平有限，本文只是为了学习分享简单的示例，目的是为了了解运作机制，如果有纰漏请联系我
