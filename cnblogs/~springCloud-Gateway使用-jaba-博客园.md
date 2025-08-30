---
aliases:
  - springCloud-Gateway 使用
  - springCloud-Gateway 使用 - jaba
created: 2025-08-21T09:40:12
modified: 2025-08-30T22:47:28
source: https://www.cnblogs.com/rslStudy/p/19042142
title: springCloud-Gateway 使用
type: archive-web
---

# springCloud-Gateway 使用

[![](https://img2024.cnblogs.com/blog/35695/202508/35695-20250830122018806-1574270965.jpg)](https://developer.huawei.com/consumer/cn/activity/digixActivity/digixcmsdetail/101750143863263087?ha_source=BKYQ3&ha_sourceId=89000408)

1.介绍
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250816145053366-1999575496.png)
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250816145113531-480454448.png)
特性 starter-gateway starter-gateway-mvc
底层框架 基于 Reactive 编程模型（如 Spring Cloud Gateway） 基于 Servlet 阻塞式模型（如 Spring MVC）
协议支持 支持 HTTP/WebSocket/RSocket 等 主要支持 HTTP/HTTPS（Servlet 规范）
并发模型 非阻塞 I/O（Netty 或 Reactor Netty） 阻塞式线程池（Tomcat/Jetty）
性能特点 高并发、低延迟（适合大量长连接） 适合传统同步请求
2.模块创建
新建模块引入下图依赖
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250816151558805-599015506.png)
配置文件
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250816152144946-209082855.png)
主启动类添加服务注册注解
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250816151753661-625274219.png)
启动应用查看是否注册成功
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250816152021592-1034879919.png)
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250816152122850-1139418237.png)
**3.简单使用**
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250816152319581-1539154474.png)
引入负载均衡依赖
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250816165549877-1837881491.png)
配置 gateway 配置
!\[image\]([https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250816165712816-1889804381.png](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250816165712816-1889804381.png)

配置 controller 层根路径

openfeign 远程调用接口也要进行调整

4.请求路由优先级设置

5.断言设置

6.自定义断言
**7.过滤器**

路径重写过滤器

响应头过滤器

默认过滤器：会对所有服务生效
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250820090624018-1100009012.png)
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250819185356397-1898964381.png)
全局过滤波器
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250820090305094-141442572.png)
自定义过滤器
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250820111003355-1264346656.png)
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250820113557138-186812505.png)
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250820113707719-2099357340.png)
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250820113726421-1330971837.png)
全局跨域设置
![image](https://www.cnblogs.com/rslStudy/p/uploading...)
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250820114722155-1691725477.png)
![image](https://img2024.cnblogs.com/blog/3673634/202508/3673634-20250820114739315-159037724.png)
