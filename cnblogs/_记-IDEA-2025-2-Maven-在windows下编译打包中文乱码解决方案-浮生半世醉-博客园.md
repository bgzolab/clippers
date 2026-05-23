---
created: '2025-12-17T10:24:18.883'
modified: '2025-12-17T10:24:18.883'
source: https://www.cnblogs.com/mr-tomato/p/19028153
title: 记 IDEA 2025.2 Maven 在windows下编译打包中文乱码解决方案 - 浮生半世醉 - 博客园
type: archive-web
---

升级到 IntelliJ IDEA 2025.2 后，发现：Maven 构建日志中的中文变成了乱码。





## 问题原因
[](\"https://linux.do/t/topic/846190#p-7728847-h-2\")
从 2025.2 开始，Maven 的执行方式发生了变化：

即使你在项目中设置了：

- File Encoding 为 UTF-8
- Properties 中指定-Dfile.encoding=UTF-8
也可能无效，已经把网上的帖子试了个遍，因为 Maven 是通过cmd启动的，JVM 仍未强制使用 UTF-8。

## 解决方案：通过环境变量强制 UTF-8
[](\"https://linux.do/t/topic/846190#p-7728847-utf-8-3\")
