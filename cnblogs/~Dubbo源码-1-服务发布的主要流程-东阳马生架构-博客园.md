---
draft: true
aliases:
  - Dubbo 源码—1.服务发布的主要流程 - 东阳马生架构
created: 2025-08-18T14:03:52
modified: 2025-08-30T21:04:02
source: https://www.cnblogs.com/mjunz/p/19033131
title: Dubbo 源码—1.服务发布的主要流程 - 东阳马生架构
type: archive-web
---
# Dubbo 源码—1.服务发布的主要流程 - 东阳马生架构

大纲

1.Dubbo 2.7 和 3.x 版本的区别

2.Dubbo 服务的基本流程和启动入口

3.Dubbo 服务发布的主流程

4.服务发布时执行相关组件的初始化

5.服务发布时执行的服务实例刷新操作

6.服务发布时执行的服务实例初始化操作

7.服务发布时执行的服务实例发布操作

8.执行服务实例发布操作时的主流程

9.服务发布过程中 ProxyFactory 生成 Invoker

10.服务发布过程中 Protocol 组件发布 Invoker

11.服务发布过程中 NettyServer 的构造流程

12.服务发布过程中 RegistryProtocol 的服务注册

13.Dubbo 服务发布的完整流程总结

1.Dubbo 2.7 和 3.x 版本的区别

区别一：后者引入了 ModuleDeployer 组件专门做服务启动时的初始化工作。将原来的注册中心拆分为三大中心：注册中心、配置中心、元数据中心。

区别二：后者很多地方使用了 Double Check 来代替前者对方法加 Synchronized 锁，大量采用了 Double Check + Volatile + Static 来实现单例模式。

区别三：后者引入了 MigrationRuleListener、MigrationRuleHandler、MigrationInvoker，引入 DynamicDirectory 代替 RegistryDirectory。

2.Dubbo 服务的基本流程和启动入口

(1)Dubbo 服务的基本流程

(2)Provider 启动入口

(3)Consumer 启动入口

(1)Dubbo 服务的基本流程

(2)Provider 启动入口

(3)Consumer 启动入口

3.Dubbo 服务发布的主流程

ServiceConfig 的 export() 方法在进行服务发布时，首先会初始化相关组件，然后刷新服务实例，接着初始化服务实例，最后发布服务实例。

4.服务发布时执行相关组件的初始化

5.服务发布时执行的服务实例刷新操作

完成相关组件的初始化后，便会调用 ServiceConfig 的 refresh() 方法执行服务实例的刷新操作。

6.服务发布时执行的服务实例初始化操作

7.服务发布时执行的服务实例发布操作

首先调用 ServiceConfig 的 doExportUrls() 方法发布服务，然后再调用其 exported() 方法进行服务发布后的处理，比如打印日志和回调监听器。

8.执行服务实例发布操作时的主流程

首先通过 ScopeModel 组件体系获取服务数据存储组件，然后将要发布的服务注册到服务数据存储组件里，接着把相关信息封装成一个服务提供者，并将该服务提供者也注册到服务数据存储组件中，然后生成注册的 URL，最后根据协议和生成的注册的 URL 来发布服务。

9.服务发布过程中 ProxyFactory 生成 Invoker

10.服务发布过程中 Protocol 组件发布 Invoker

(1)Protocol 协议接口

(2)Protocol 组件发布 Invoker

(1)Protocol 协议接口

(2)Protocol 组件发布 Invoker

本地发布时使用 InjvmProtocol + InjvmExporter，远程发布时使用 RegistryProtocol + DestroyableExporter。

RegistryProtocol 的 export() 方法被远程发布调用的时候，会调用到 DubboProtocol 的 export() 方法，并最终调用到 HeaderExchanger 的 bind() 方法执行 NettyTransporter 的 bind() 方法构建 Netty 服务器。

11.服务发布过程中 NettyServer 的构造流程

12.服务发布过程中 RegistryProtocol 的服务注册

(1) 首先注册 service-discovery-registry 的 URL

(2) 然后注册 registry 的 URL

服务发布过程中需要进行注册的 URL 有两个：

(1) 首先注册 service-discovery-registry 的 URL

此时，在 RegistryProtocol.export() 方法中，进行服务注册时使用的 Registry 其实是一个 ListenerRegistryWrapper 装饰器，装饰着使用了 ZookeeperServiceDiscovery 的 ServiceDiscoveryRegistry。

ZookeeperServiceDiscovery.doRegister() 处理的 URL 注册其实就是在本地进行注册。

(2) 然后注册 registry 的 URL

此时，在 RegistryProtocol.export() 方法中，进行服务注册时使用的 Registry 其实是一个 ListenerRegistryWrapper 装饰器，装饰着一个 ZooKeeperRegistry。

ZooKeeperRegistry.doRegister() 处理的 URL 注册其实就是往注册中心注册。

13.Dubbo 服务发布的完整流程总结
