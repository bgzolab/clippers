---
created: '2025-09-03T11:28:03.443'
modified: '2025-09-03T11:28:03.443'
source: https://www.cnblogs.com/koushenhai/p/18929660
title: Spring Cloud Gateway实现分布式限流和熔断降级 - k↑ - 博客园
type: archive-web
---

小伙伴们，你们好呀！我是老寇！一起学习学习gateway限流和熔断降级

# 一、限流
思考：为啥需要限流？

在一个流量特别大的业务场景中，如果不进行限流，会造成系统宕机，当大批量的请求到达后端服务时，会造成资源耗尽【CPU、内存、线程、网络带宽、数据库连接等是有限的】，进而拖垮系统。

## 1.常见限流算法
- 漏桶算法
- 令牌桶算法
### 1.1漏桶算法（不推荐）


#### 1.1.1.原理
将请求缓存到一个队列中，然后以固定的速度处理，从而达到限流的目的

#### 1.1.2.实现
将请求装到一个桶中，桶的容量为固定的一个值，当桶装满之后，就会将请求丢弃掉，桶底部有一个洞，以固定的速率流出。

#### 1.1.3.举例
桶的容量为1W，有10W并发请求，最多只能将1W请求放入桶中，其余请求全部丢弃，以固定的速度处理请求

#### 1.1.4.缺点
处理突发流量效率低（处理请求的速度不变，效率很低）

### 1.2.令牌桶算法（推荐）


##### 1.2.1.原理
将请求放在一个缓冲队列中，拿到令牌后才能进行处理

##### 1.2.2.实现
装令牌的桶大小固定，当令牌装满后，则不能将令牌放入其中；每次请求都会到桶中拿取一个令牌才能放行，没有令牌时即丢弃请求/继续放入缓存队列中等待

#### 1.2.3.举例
桶的容量为10w个，生产1w个/s，有10W的并发请求，以每秒10W个/s速度处理，随着桶中的令牌很快用完，速度又慢慢降下来啦，而生产令牌的速度趋于一致1w个/s

#### 1.2.4.缺点
处理突发流量提供了系统性能，但是对系统造成了一定的压力，桶的大小不合理，甚至会压垮系统（处理1亿的并发请求，将桶的大小设置为1,这个系统一下就凉凉啦）

## 2.网关限流（Spring Cloud Gateway + Redis实战）
### 2.1.pom.xml配置
### 2.2.yaml配置
### 2.3.创建bean
## 3.测试限流（编写java并发测试）
\n

说明这个网关限流配置是没有问题的

## 4.源码查看
Spring Cloud Gateway RequestRateLimiter GatewayFilter Factory文档地址

[Spring Cloud Gateway RequestRateLimiter GatewayFilter Factory文档地址](\"https://docs.spring.io/spring-cloud-gateway/reference/spring-cloud-gateway-server-webflux/gatewayfilter-factories/requestratelimiter-factory.html\")
工厂RequestRateLimiter GatewayFilter使用一个RateLimiter实现来判断当前请求是否被允许继续。如果不允许，HTTP 429 - Too Many Requests则返回默认状态。

### 4.1.查看 RequestRateLimiterGatewayFilterFactory
### 4.2.查看 RedisRateLimiter
思考：redis限流配置是如何加载？

其实就是监听动态路由的事件并把配置存起来



### 4.3.重点来了，令牌桶 /META-INF/scripts/request_rate_limiter.lua 脚本剖析
### 4.4.查看 GatewayRedisAutoConfiguration 脚本初始化
思考：请求限流过滤器是如何开启？

1.通过yaml配置开启

2.GatewayAutoConfiguration自动注入bean

重点来了，真正加载这个bean的是@ConditionalOnEnabledFilter注解进行判断

我们继续跟进代码，查看@Conditional(OnEnabledFilter.class)

众所周知，@Conditional可以用来加载满足条件的bean，所以，我们分析一下OnEnabledFilter

我分析它的父类，这里有你想要的答案！

## 5.优化限流响应[使用全限定类名直接覆盖类]
小伙伴们，有没有发现，这个这个响应体封装的不太好，因此，我们来自定义吧，我们直接覆盖类，代码修改如下

# 二、熔断降级
思考：为什么需要熔断降级？

当某个服务发生故障时（超时，响应慢，宕机），上游服务无法及时获取响应，进而也导致故障，出现服务雪崩【服务雪崩是指故障像滚雪球一样沿着调用链向上游扩展，进而导致整个系统瘫痪】

熔断降级的目标就是在故障发生时，快速隔离问题服务【快速失败，防止资源耗尽】，保护系统资源不被耗尽，防止故障扩散，保护核心业务可用性。

## 1.技术选型
### 1.1.熔断降级框架选型对比表
### 1.2选型决策指南
## 2.Resilience4j使用
Resilience4j官方文档

[Resilience4j官方文档](\"https://resilience4j.readme.io/docs/getting-started\")
Resilience4j可以看作是Hystrix的替代品，Resilience4j支持熔断器和单机限流

Resilience4j 是一个专为函数式编程设计的轻量级容错库。Resilience4j 提供高阶函数（装饰器），可通过断路器、速率限制器、重试或隔离功能增强任何函数式接口、lambda 表达式或方法引用。您可以在任何函数式接口、lambda 表达式或方法引用上堆叠多个装饰器。这样做的好处是，您可以只选择所需的装饰器，而无需考虑其他因素。

### 2.1.网关熔断降级（Spring Cloud Gateway + Resilience4j实战）
##### 2.1.1.pom依赖
#### 2.1.2.yaml配置
#### 2.1.3.CircuitBreakerConfig配置
我是老寇，我们下次再见啦！
