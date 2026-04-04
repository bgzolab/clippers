---
aliases:
  - 免费的个人网站托管 -PinMe 篇 - ！win ！
created: 2025-08-21T09:27:21
modified: 2025-08-30T21:04:03
source: https://www.cnblogs.com/xwwin/p/19048409
title: 免费的个人网站托管 -PinMe 篇 - ！win ！
type: archive-web
---
# 免费的个人网站托管 -PinMe 篇 - ！win ！

## 前情

对于前端开发来说，拥有一个自己的个人网站是一种执着也是一种排面，但是大部分前端也都对服务端这一块的东西都停留在了解阶段，但是如果正儿八经的上线一个网站或多或少需要懂一些服务端知识，需要购买服务器，注册域名，申请证书等等，那对于前端 er 有没有什么方式可以免费托管自己的个人网站了？

## PinMe？

一款简单实用的去中心化部署工具，能降低个人网站和作品展示的技术门槛。用户用一行命令就能发布网站或文件，不用复杂配置服务器，还能得到不可篡改的唯一访问地址，支持绑定 ENS 域名

- 极速上传：支持单文件 20MB/目录 500MB 快速上传
- 多终端兼容：Windows/macOS/Linux 全平台覆盖
- 智能管理：内置历史记录查看与批量删除功能
- 安全保障：双重哈希验证 +IPFS 网关加速
它还贴心的提供了网页 GUI 的方式和命令行工具的方式二种使用方式

## 网页使用

注：此处是在 window11 系统上使用测试

### STEP1：打开 Pinme 官网

进入网址：PinMe - Free IPFS Hosting for Static Websites | Decentralized Frontend Deployment,选择右则 Deploy from Browser

[PinMe - Free IPFS Hosting for Static Websites | Decentralized Frontend Deployment](\"https://pinme.eth.limo/#/\")

### STEP2：上传文件或者目录

点击 click to upload folder,选择个人网站静态资源目录，此处我要上传的 test 目录，它下面有 2 个静态 html

根据你上传的静态文件的大小等待时间可能不一样，我用于测试的静态资料文件比较小，我等待十几秒就上传成功了

### STEP3：链接测试

文件上传成功后，看到成功页面，顶部你的静态网站地址，底下是文件内容预览，我的地址是：https://k2di5kfe.pinit.eth.limo/

[https://k2di5kfe.pinit.eth.limo/](\"https://k2di5kfe.pinit.eth.limo/\")

如果你上传的是静态文件，你想访问非 index.html 页面内容的话你需要带上完整文件名：https://k2di5kfe.pinit.eth.limo/index0.html

[https://k2di5kfe.pinit.eth.limo/index0.html](\"https://k2di5kfe.pinit.eth.limo/\")

## 命令行使用

注：此处是在 window11 系统上使用测试

### STEP1：安装命令行

通过 npm 全局安装 PinMe

### STEP2： 上传文件 or 目录

通过 pinme upload 上传文件或者目录

下面是我用于测试的待上传的静态目录，其中有二个 html 文件

### STEP3： 链接测试

复制或者点击上图框住的链接打开看到的如下界面：

上面是你的个人站点的静态链接：https://oxql3up4.pinit.eth.limo，下面的是文件预览内容，如果想访问 index0.html 可认通过 https://oxql3up4.pinit.eth.limo/index0.html

[https://oxql3up4.pinit.eth.limo](\"https://oxql3up4.pinit.eth.limo/\")

[https://oxql3up4.pinit.eth.limo/index0.html](\"https://oxql3up4.pinit.eth.limo/\")

### 小结

能发现这个上工具是因为我的一篇发在掘金的博文介绍 InfinityFree 的时候，下面有大佬留言，说这个工具能免注册快速部署，感谢大佬，让我又发现新大陆了

当时第一时间去尝试了是有遇到问题的，于是有去 github 的 issue 里留言，没想到没多久就收到已经修复的回复，测试是 OK 的

此工具虽然好用，但是有一个缺点，你没法做修改替换，你只能重新上传，每次都是生成一个新的唯一的网址，不像我前面推荐的几种方法，它的域名是固定的，同时支持修改替换，我感觉这个工具对于你临时分享一些静态文件给远程用户查看真的是不错的选择

个人的知识和能力是有限的，天外有天山外有山，如果你有更好的免费服务器或者别的可以部署静态网站的方法非常期待你的分享，一起学习一起进步
