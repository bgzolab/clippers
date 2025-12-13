---
comments: true
created: '2025-10-09T09:54:24.047'
draft: true
modified: '2025-10-09T09:54:24.047'
source: https://www.cnblogs.com/deali/p/19123387
title: 在Linux系统上一键配置DoH，解决DNS解析被污染 - 程序设计实验室 - 博客园
type: archive-web
---

## 前言
最近我的 swag 服务突然证书 renew 失败

诊断了一下发现原来是无法解析acme-v02.api.letsencrypt.org域名

换了几个 DNS 都不行，应该是 DNS 被污染或者劫持了

这时我才意识到不上 DoH/DoT 怕是没办法了🤣

本文记录一下用一种简单的方法在服务器上实现 DoH/DoT

## DoH/DoT
简单科普一下，DNS 是用来把网站解析到IP地址的协议

正常的 DNS 是明文传输，很容易被污染或者劫持

DoH 是 DNS over HTTPS，走加密的 HTTPS 流量（443 端口），看起来就像访问网页一样，不容易被污染或者劫持

除此之外还有 DoT（DNS over TLS）、ODoH（Oblivious DoH，隐私更强），都是更加安全的域名解析方式

## cloudflared
https://github.com/cloudflare/cloudflared

[https://github.com/cloudflare/cloudflared](\"https://github.com/cloudflare/cloudflared\")
这是 Cloudflare 官方开源的一个 Cloudflare Tunnel 客户端，用 go 语言开发的，非常容易安装部署。

### 简介
这个客户端不仅可以接入 Tunnel 实现内网穿透，还可以实现 DoH 代理

本文使用这个工具来实现 DoH 配置

### 安装
Ubuntu Server 的官方软件源没有这个工具

需要添加 Cloudflare 官方 APT 源

也可以直接下载 DEB 包安装

### 测试
安装好以后，运行：

测试一下：

如果能返回解析结果，就说明成功了

这里默认使用的是 Cloudflare 官方的 DoH

如果不行的话，可以换成国内的 DoH 服务

比如阿里：

- https://223.5.5.5/dns-query
- https://223.6.6.6/dns-query
[https://223.5.5.5/dns-query](\"https://223.5.5.5/dns-query\")
[https://223.6.6.6/dns-query](\"https://223.6.6.6/dns-query\")
比如腾讯：

- https://doh.pub/dns-query
- https://dns.pub/dns-query
[https://doh.pub/dns-query](\"https://doh.pub/dns-query\")
[https://dns.pub/dns-query](\"https://dns.pub/dns-query\")
示例

用 dig 或者 nslookup 之类的工具测试没问题的话，可以进入下一步。

## 添加服务
创建 systemd service，让 cloudflared 常驻运行

内容：

应用 & 启动

## 配置DNS
使用 drop-in 配置的方式来设置 DNS

不要直接改/etc/systemd/resolved.conf

内容：

重启服务

检查生效情况

可以看到以下输出

这时候就搞定了，docker容器也会默认使用系统的这个 DNS

此时再去 swag renew 证书，就成功了✌️

## 一键脚本
老规矩，我让大模型爷爷帮忙写了一个一键配置DoH的脚本

默认使用从官方 GitHub 仓库下载 deb 包安装的方式

可以直接执行

## 脚本源码
将以上代码保存为install-doh.sh

运行

脚本会自动：

1. 下载并安装cloudflared
2. 写入systemd服务文件并启动
3. 配置systemd-resolved
4. 自动重启相关服务并检查生效