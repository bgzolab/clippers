---
comments: true
created: '2026-05-07T22:54:44'
draft: true
modified: '2026-05-07T22:54:44'
source: https://www.v2ex.com/t/1211005
title: 分享一个自用文件管理工具 iFile：把 WebDAV、S3、R2、Google Drive 等挂到系统文件管理器
type: archive-web
---

# iFile：把网盘、NAS 、对象存储接入 Finder / 文件 App 的通用文件工具

官网：[https://ifile.saltpi.cn/?lang=zh-Hans]( https://ifile.saltpi.cn/?lang=zh-Hans)

![iFile 界面]( https://ifile.saltpi.cn/img/screenshot01.png)

大家好，分享一个我最近在做的文件管理工具：**iFile**。

它的目标很简单：把各种远程存储接入苹果系统原生文件管理器，让它们像本地磁盘一样出现在 **macOS Finder** 和 **iOS / iPadOS 文件 App** 里。

如果你平时经常在 NAS 、服务器、对象存储、云盘、手机设备之间来回切文件，应该会懂这种痛点：  
不同服务各装一个客户端太重；有些协议工具体验不够系统化；对象存储、WebDAV 、SFTP 、SMB 又经常散落在不同工具里。iFile 想做的就是把这些入口统一起来。

## 主要特性

### 1. 原生系统挂载

iFile 基于 Apple 的 File Provider 框架开发，可以直接在 Finder 和文件 App 中管理远程文件。  
不需要一直在独立客户端里来回切换，复制、浏览、预览、上传、下载都尽量走系统原生体验。

![原生文件 App / Finder 集成]( https://ifile.saltpi.cn/img/screenshot03.png)

### 2. 丰富协议支持

目前支持：

- WebDAV
- SMB
- FTP
- SFTP
- Amazon S3
- Cloudflare R2
- Google Drive
- OneDrive
- Dropbox
- 百度网盘
- ADB 安卓设备文件管理

适合连接 NAS 、VPS 、家庭服务器、对象存储、云盘，以及 Android 设备文件系统。

![协议选择]( https://ifile.saltpi.cn/img/screenshot02.png)

### 3. 云盘聚合

Google Drive 、OneDrive 、Dropbox 、百度网盘等云盘可以统一管理，不需要为每个云盘安装一个独立客户端。

![云盘管理]( https://ifile.saltpi.cn/img/screenshot05.png)

### 4. 支持对象存储

如果你平时用 S3 或 Cloudflare R2 存文件，也可以把 bucket 挂到系统文件管理器里使用。  
这对备份、归档、电子书、视频素材、静态资源管理都挺方便。

### 5. ADB 安卓设备文件管理

iFile 也支持通过本地 ADB 服务访问 Android 设备文件，适合需要在 Mac 和 Android 设备之间管理文件的人。

## 隐私与安全

iFile 是本地优先设计。  
服务器地址、账号、密码、Token 等配置保存在本机，协议通信直接发生在你的设备和目标服务器之间，不走额外的中间服务器。

## 适合谁用？

如果你有下面这些需求，可能会觉得它有用：

- 想在 Finder / 文件 App 里直接访问 NAS
- 想统一管理 WebDAV 、SFTP 、SMB 、FTP
- 想把 Cloudflare R2 / S3 当文件夹用
- 想少装几个云盘客户端
- 想在 Mac 上方便访问 Android 设备文件
- 想要一个更贴近系统体验的远程文件入口

## 下载 / 了解更多

官网：  
[https://ifile.saltpi.cn/?lang=zh-Hans]( https://ifile.saltpi.cn/?lang=zh-Hans)

App Store：  
[https://apps.apple.com/us/app/ifile/id6766778465?l=zh-Hans-CN]( https://apps.apple.com/us/app/ifile/id6766778465?l=zh-Hans-CN) (当前正在审核中，支持 iOS 和 macOS)

![更多文件管理体验]( https://ifile.saltpi.cn/img/screenshot04.png)

项目还在持续打磨中，尤其是各种协议兼容性、对象存储、中文文件名、File Provider 行为这些边角问题。  
如果你刚好也有类似使用场景，欢迎试用和反馈。真实用户的奇怪场景，往往最能帮工具变得可靠。