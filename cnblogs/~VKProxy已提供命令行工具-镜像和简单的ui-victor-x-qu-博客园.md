---
comments: true
created: '2025-09-03T11:23:42.977'
draft: true
modified: '2025-09-03T11:23:42.977'
source: https://www.cnblogs.com/fs7744/p/18928323
title: VKProxy已提供命令行工具，镜像和简单的ui - victor.x.qu - 博客园
type: archive-web
---

VKProxy是使用c#开发的基于Kestrel实现 L4/L7的代理

[VKProxy](\"https://github.com/fs7744/VKProxy\")
[Kestrel](\"https://github.com/dotnet/aspnetcore/tree/main/src/Servers/Kestrel\")
经过6个月业余时间偶尔缝缝补补，已经达到能跑的地步了  （感兴趣的同学烦请点个github小赞赞呢）

[github](\"https://github.com/fs7744/VKProxy\")
相关使用写了一些简单的文档说明

- 安装
- 通过UI站点配置
- 不同监听场景如何配置
- 如何为HTTP配置路由复杂匹配
- 如何为HTTP配置请求和响应转换
[安装](\"https://fs7744.github.io/VKProxy.Doc/docs/install.md\")
[通过UI站点配置](\"https://fs7744.github.io/VKProxy.Doc/docs/extensibility/socks5\")
[不同监听场景如何配置](\"https://fs7744.github.io/VKProxy.Doc/docs/howtolisten\")
[如何为HTTP配置路由复杂匹配](\"https://fs7744.github.io/VKProxy.Doc/docs/statement\")
[如何为HTTP配置请求和响应转换](\"https://fs7744.github.io/VKProxy.Doc/docs/transforms\")
这里列举一下新增的安装使用方式

## dotnet tool
提供简单的命令行工具，可以在本地进行相关测试

不过目前只支持 net9.0 (net10 正式发布后会切换制net10)

安装后可以使用如下命令

#### 如果使用json文件配置
配置项很多，可参考后续具体配置项说明

[具体配置项说明](\"https://fs7744.github.io/VKProxy.Doc/docs/file-config\")
这里举个例子

创建json文件

然后启动

#### 使用 etcd 配置
在多实例的情况，同一份配置分发就比较麻烦， 这里提供 ui 可以配置etcd + agent 从etcd读取配置 方便大家使用

ui使用可以参考UI配置站点

[UI配置站点](\"https://fs7744.github.io/VKProxy.Doc/docs/ui-config\")
用tool 启动 agent 可以这样使用

## Docker
当大家基本代理功能足够时，简化大家使用成本/快速构建的默认已构建镜像

所有的镜像可以在docker hub vkproxy agent找到

[docker hub vkproxy agent](\"https://hub.docker.com/r/vkproxy/agent\")
提供如下环境变量

- \nVKPROXY_CONFIG\njson file config, like /xx/app.json\nexampleVKPROXY_CONFIG=/xx/app.json\n
- \nVKPROXY_SOCKS5\nuse simple socks5 support\nexampleVKPROXY_SOCKS5=true\n
- \nETCD_CONNECTION_STRING\netcd address, likehttp://127.0.0.1:2379\nexampleETCD_CONNECTION_STRING=http://127.0.0.1:2379\n
- \nETCD_PREFIX\ndefault is /ReverseProxy/\nexampleETCD_PREFIX=/ReverseProxy/\n
- \nETCD_DELAY\ndelay change config when etcd change, default is 00:00:01\nexampleETCD_DELAY=00:00:01\n
VKPROXY_CONFIG

json file config, like /xx/app.json

exampleVKPROXY_CONFIG=/xx/app.json

VKPROXY_SOCKS5

use simple socks5 support

exampleVKPROXY_SOCKS5=true

ETCD_CONNECTION_STRING

etcd address, likehttp://127.0.0.1:2379

[http://127.0.0.1:2379](\"http://127.0.0.1:2379\")
exampleETCD_CONNECTION_STRING=http://127.0.0.1:2379

ETCD_PREFIX

default is /ReverseProxy/

exampleETCD_PREFIX=/ReverseProxy/

ETCD_DELAY

delay change config when etcd change, default is 00:00:01

exampleETCD_DELAY=00:00:01

#### 如果使用json文件配置
配置项很多，可参考后续具体配置项说明

[具体配置项说明](\"https://fs7744.github.io/VKProxy.Doc/docs/file-config\")
这里举个例子

创建json文件

然后启动

#### 使用 etcd 配置
在多实例的情况，同一份配置分发就比较麻烦， 这里提供 ui 可以配置etcd + agent 从etcd读取配置 方便大家使用

ui使用可以参考UI配置站点

[UI配置站点](\"https://fs7744.github.io/VKProxy.Doc/docs/ui-config\")
用 docker 启动 agent 可以这样使用

## 通过UI站点配置
由于文件配置存在一定使用难度，所以也有提供简单的 ui配置站点VKProxy.Web

[VKProxy.Web](\"https://github.com/fs7744/VKProxy.Web\")
[!WARNING]\n由于文件分发会导致大家部署多实例的难度，所以 ui 站点目前只支持 etcd 作为配置源， 同时服务器参数相关无法通过ui站点配置, 请使用文件会程序配置 参见服务器参数

[服务器参数](\"https://fs7744.github.io/VKProxy.Doc/docs/file-config/options\")
首先启动一个 etcd （可参考Run etcd clusters inside containers)

[Run etcd clusters inside containers](\"https://etcd.io/docs/v3.4/op-guide/container/\")
VKProxy agent 启动参考安装

[安装](\"https://fs7744.github.io/VKProxy.Doc/docs/install\")
UI 所有的镜像可以在docker hub vkproxy ui找到

[docker hub vkproxy ui](\"https://hub.docker.com/r/vkproxy/ui\")
UI docker 部署

参数可以使用如下

- \nETCD_CONNECTION_STRING\netcd address, likehttp://127.0.0.1:2379\nexampleETCD_CONNECTION_STRING=http://127.0.0.1:2379\n
- \nETCD_PREFIX\ndefault is /ReverseProxy/\nexampleETCD_PREFIX=/ReverseProxy/\n
- \nASPNETCORE_URLS\nexampleASPNETCORE_URLS=http://*:80\n
ETCD_CONNECTION_STRING

etcd address, likehttp://127.0.0.1:2379

[http://127.0.0.1:2379](\"http://127.0.0.1:2379\")
exampleETCD_CONNECTION_STRING=http://127.0.0.1:2379

ETCD_PREFIX

default is /ReverseProxy/

exampleETCD_PREFIX=/ReverseProxy/

ASPNETCORE_URLS

exampleASPNETCORE_URLS=http://*:80

举例：

然后你就可以在浏览器 访问http://127.0.0.1:8770使用 UI 了

[http://127.0.0.1:8770](\"http://127.0.0.1:8770\")


## 定制化扩展
为了方便大家使用 KVProxy 在一些场景，默认功能无法满足时，可以通过自定义扩展实现自己的需求。

同时也是遵照 asp.net core 设计理念，提供了两种扩展方式

### 中间件管道
中间件是一种装配到应用管道以处理请求和响应的软件。 每个组件：

- 选择是否将请求传递到管道中的下一个组件。
- 可在管道中的下一个组件前后执行工作。
请求委托用于生成请求管道。 请求委托处理每个 HTTP/tcp/udp 请求。

具体概念可参考ASP.NET Core 中间件

[ASP.NET Core 中间件](\"https://learn.microsoft.com/zh-cn/aspnet/core/fundamentals/middleware/?view=aspnetcore-9.0\")


KVProxy 添加了 udp 和 tcp 的特殊中间件

具体参见如何通过中间件定制化功能

[如何通过中间件定制化功能](\"https://fs7744.github.io/VKProxy.Doc/docs/extensibility/middleware\")
还有一个socks5的示例以供大家参考如何利用中间件扩展实现socks5

[如何利用中间件扩展实现socks5](\"https://fs7744.github.io/VKProxy.Doc/docs/extensibility/socks5\")
### 特定功能策略增加
有些特定功能策略比较难以直接使用中间件扩展，这里列举主要部分

（其实由于基于依赖注入，天生解耦，所以内部实现基本都可以覆盖或者添加新实现）

- 如何扩展服务发现
- 如何扩展负载均衡策略
- 如何扩展主动健康检查策略
- 如何扩展HTTP转换器
[如何扩展服务发现](\"https://fs7744.github.io/VKProxy.Doc/docs/extensibility/destinationresolver\")
[如何扩展负载均衡策略](\"https://fs7744.github.io/VKProxy.Doc/docs/extensibility/loadbalancingpolicy\")
[如何扩展主动健康检查策略](\"https://fs7744.github.io/VKProxy.Doc/docs/extensibility/activehealthchecker\")
[如何扩展HTTP转换器](\"https://fs7744.github.io/VKProxy.Doc/docs/extensibility/transform\")
### ReverseProxyFeature
除了两大扩展方式之外，还有一个接口数据在运行时有表明当前路由匹配情况

运行时可通过 feature 获取， 比如

不建议大家直接修改IReverseProxyFeature的值，可能会破坏路由

## 可扩展套接字应用程序框架
除了代理功能外，由于通过反射释放了Kestrel的能力，你也可以把 VKProxy 当成可扩展套接字应用程序框架使用

使用它轻松构建始终连接的套接字应用程序，而无需考虑如何使用套接字，如何维护套接字连接以及套接字如何工作。

(在Kestrel基础上开发，理论可以帮大家节省一些比如直接socket要自己管理 socket之类的事情)

具体可以参考可扩展套接字应用程序框架

[可扩展套接字应用程序框架](\"https://fs7744.github.io/VKProxy.Doc/docs/extensibility/socket\")
2025年后续大概就继续添加限流 追踪啊之类功能吧