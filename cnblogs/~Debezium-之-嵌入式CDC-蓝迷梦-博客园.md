---
comments: true
created: '2025-12-05T17:10:23.27'
draft: true
modified: '2025-12-05T17:10:23.27'
source: https://www.cnblogs.com/hewei-blogs/articles/19188887
title: Debezium 之 嵌入式CDC - 蓝迷梦 - 博客园
type: archive-web
---

## Debezium 嵌入式 CDC 详解及使用示例
#### 一、技术定位与核心价值
Debezium 嵌入式 CDC 是 Debezium 提供的轻量级数据变更捕获方案，通过将 CDC 引擎直接嵌入应用程序，无需依赖 Kafka 集群即可实现数据库变更事件的实时捕获与处理。其核心价值体现在：

- 低延迟：毫秒级捕获数据库变更，满足实时性要求高的场景。
- 资源高效：避免 Kafka 集群部署成本，适合资源受限环境。
- 灵活集成：直接嵌入应用程序，简化数据同步链路。
#### 二、架构设计解析
嵌入式引擎采用模块化设计，核心组件包括：

1. \n连接器层\n支持 MySQL、PostgreSQL、SQL Server 等数据库，通过解析数据库日志（如 MySQL binlog）捕获变更。例如：\n\nMySQL 连接器：依赖mysql-binlog-connector-java库读取 binlog。\nPostgreSQL 连接器：通过逻辑解码插件（如wal2json）获取变更。\n\n
2. MySQL 连接器：依赖mysql-binlog-connector-java库读取 binlog。
3. PostgreSQL 连接器：通过逻辑解码插件（如wal2json）获取变更。
4. \n事件处理流水线\n数据变更事件依次经过以下处理：\n\n偏移量管理：记录处理位置，确保故障恢复后从断点继续。\n消息转换（SMT）：支持字段过滤、路由、格式转换等操作。\n用户处理器：自定义逻辑处理变更事件（如写入缓存、触发业务逻辑）。\n\n
5. 偏移量管理：记录处理位置，确保故障恢复后从断点继续。
6. 消息转换（SMT）：支持字段过滤、路由、格式转换等操作。
7. 用户处理器：自定义逻辑处理变更事件（如写入缓存、触发业务逻辑）。
8. \n线程模型\n采用两级线程池：\n\n任务线程池：负责数据库轮询与事件拉取。\n处理线程池：并行处理事件转换与用户回调，提升吞吐量。\n\n
9. 任务线程池：负责数据库轮询与事件拉取。
10. 处理线程池：并行处理事件转换与用户回调，提升吞吐量。
连接器层\n支持 MySQL、PostgreSQL、SQL Server 等数据库，通过解析数据库日志（如 MySQL binlog）捕获变更。例如：

- MySQL 连接器：依赖mysql-binlog-connector-java库读取 binlog。
- PostgreSQL 连接器：通过逻辑解码插件（如wal2json）获取变更。
事件处理流水线\n数据变更事件依次经过以下处理：

- 偏移量管理：记录处理位置，确保故障恢复后从断点继续。
- 消息转换（SMT）：支持字段过滤、路由、格式转换等操作。
- 用户处理器：自定义逻辑处理变更事件（如写入缓存、触发业务逻辑）。
线程模型\n采用两级线程池：

- 任务线程池：负责数据库轮询与事件拉取。
- 处理线程池：并行处理事件转换与用户回调，提升吞吐量。
#### 三、使用示例：MySQL 数据同步至 Redis
以下示例展示如何通过嵌入式 Debezium 将 MySQL 订单表的变更同步至 Redis 缓存：

##### 1. 环境准备
- 依赖引入（Maven）：<dependency>\n    <groupId>io.debezium</groupId>\n    <artifactId>debezium-embedded</artifactId>\n    <version>1.9.7.Final</version>\n</dependency>\n<dependency>\n    <groupId>io.debezium</groupId>\n    <artifactId>debezium-connector-mysql</artifactId>\n    <version>1.9.7.Final</version>\n</dependency>\n<dependency>\n    <groupId>mysql</groupId>\n    <artifactId>mysql-connector-java</artifactId>\n    <version>8.0.28</version>\n</dependency>\n<dependency>\n    <groupId>redis.clients</groupId>\n    <artifactId>jedis</artifactId>\n    <version>4.3.1</version>\n</dependency>\n\n
##### 2. 配置嵌入式引擎
##### 3. MySQL 配置
确保 MySQL 启用 binlog 并设置为 ROW 模式：

##### 4. 运行效果
- 插入订单：MySQL 执行INSERT INTO orders (id, status) VALUES (1, 'CREATED')，Redis 中生成键order:1，值为{\"id\":1,\"status\":\"CREATED\"}。
- 更新订单：MySQL 执行UPDATE orders SET status='SHIPPED' WHERE id=1，Redis 中对应值更新为{\"id\":1,\"status\":\"SHIPPED\"}。
#### 四、关键配置选项
#### 五、适用场景与注意事项
- 适用场景：\n\n实时缓存更新（如 MySQL → Redis）。\n微服务间数据同步（如订单变更触发通知）。\n审计日志记录（捕获所有数据变更）。\n\n
- 实时缓存更新（如 MySQL → Redis）。
- 微服务间数据同步（如订单变更触发通知）。
- 审计日志记录（捕获所有数据变更）。
- 注意事项：\n\n事务完整性：嵌入式引擎不保证跨表事务的原子性，需业务层处理。\n性能调优：高并发场景需调整线程池大小与批处理参数（如max.batch.size）。\n错误处理：实现ErrorHandler接口处理连接中断等异常。\n\n
- 事务完整性：嵌入式引擎不保证跨表事务的原子性，需业务层处理。
- 性能调优：高并发场景需调整线程池大小与批处理参数（如max.batch.size）。
- 错误处理：实现ErrorHandler接口处理连接中断等异常。
- 实时缓存更新（如 MySQL → Redis）。
- 微服务间数据同步（如订单变更触发通知）。
- 审计日志记录（捕获所有数据变更）。
- 事务完整性：嵌入式引擎不保证跨表事务的原子性，需业务层处理。
- 性能调优：高并发场景需调整线程池大小与批处理参数（如max.batch.size）。
- 错误处理：实现ErrorHandler接口处理连接中断等异常。
## 动态监听表方案
Debezium嵌入式CDC本身不直接支持运行时动态修改监听的表列表，但可通过重启引擎或结合外部工具实现动态监听。以下是具体分析：

### 一、直接配置限制
Debezium嵌入式引擎的表监听范围由启动时的配置参数决定，核心参数为：

- table.include.list：指定要监听的表（格式为schema.table）。
- database.include.list：指定要监听的数据库。
这些参数在引擎启动时通过Properties或Configuration对象传入，引擎运行期间无法直接修改。若需调整监听范围，必须重启引擎并重新加载配置。

### 二、动态监听的实现方案
#### 方案1：重启引擎并重新配置
1. 修改配置：更新Properties对象中的table.include.list参数，添加或移除表名。
2. 关闭旧引擎：调用engine.close()释放资源。
3. 启动新引擎：使用新配置重新构建并启动引擎。
示例代码片段：

#### 方案2：结合外部工具或脚本
- 监控数据库元数据：通过查询数据库的系统表（如MySQL的information_schema.tables）或设置触发器，检测新表的创建。
- 动态更新配置：当检测到新表时，自动更新Debezium的配置文件（如offsets.dat或外部配置中心），并触发引擎重启。
#### 方案3：使用正则表达式匹配表名
在配置中通过正则表达式匹配表名，实现一定程度的灵活性：

注意：此方式可能捕获到不需要的表，需结合业务逻辑过滤。

### 三、注意事项
1. 重启开销：频繁重启引擎会影响性能，需权衡动态性与稳定性。
2. 偏移量管理：重启引擎后，需确保偏移量（offset.storage）正确恢复，避免数据丢失或重复消费。
3. 事务一致性：动态修改监听表时，需确保新表的变更不会被遗漏或重复处理。
### 四、适用场景建议
- 低频调整：若监听表的变化频率较低（如每日或每周调整），重启引擎方案可行。
- 高频调整：需结合外部工具或自定义逻辑，实现自动化配置更新与引擎重启。
- 复杂场景：考虑使用Debezium的Kafka Connect模式，通过Kafka Connect REST API动态管理连接器配置。