---
comments: true
created: '2025-01-25T10:53:39'
draft: true
modified: '2025-01-25T10:53:39'
source: https://www.zhihu.com/question/10383365526/answer/86636989664
title: Android 有什么 App 可以 SMB 共享文件目录？
type: archive-web
---

SMB是一种有缺陷的文件共享协议，并且中国的公网已经全面封禁了smb默认的445端口，想搞公网共享更是难上加难，唯一的好处就是mac和Windows对smb协议的原生支持极好。

想共享文件，更好的方法还是搞带SSL的webdav。