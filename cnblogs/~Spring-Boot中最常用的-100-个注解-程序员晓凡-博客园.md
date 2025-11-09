---
draft: true
aliases:
  - Spring Boot 中最常用的 100 个注解 - 程序员晓凡
created: 2025-07-25T13:45:37
modified: 2025-08-30T21:04:03
source: https://www.cnblogs.com/xiezhr/p/18953178
title: Spring Boot 中最常用的 100 个注解 - 程序员晓凡
type: archive-web
---
# Spring Boot 中最常用的 100 个注解 - 程序员晓凡

大家好，我是晓凡。

以下是 Spring Boot 中最常用的 100 个注解（按功能分类整理），适用于配置、控制层、数据访问、安全、测试等常见场景：

## 🧱 一、核心注解（Core Annotations）

1. @SpringBootApplication：标记主类，启用自动配置和组件扫描。
2. @Component：通用组件，自动扫描注入 Spring 容器。
3. @Service：业务逻辑层组件。
4. @Repository：数据访问层组件，自动处理异常。
5. @Configuration：声明配置类，替代 XML 配置。
6. @Bean：在配置类中定义一个 Bean。
7. @ComponentScan：指定 Spring 要扫描的包路径。
8. @PropertySource：加载外部属性文件。
9. @Value：注入属性值。
10. @Autowired：自动装配 Bean。
11. @Qualifier：配合@Autowired 解决多个同类型 Bean 冲突。
12. @Primary：标记首选 Bean。
13. @Scope：定义 Bean 的作用域（如 prototype、singleton）。
14. @Lazy：延迟初始化 Bean。
15. @Profile：根据环境激活配置。

## 🌐 二、Web 相关（Web & REST）

1. @RestController：组合@Controller+@ResponseBody。
2. @Controller：定义控制器类，返回视图名称。
3. @RequestMapping：映射请求 URL 到类或方法。
4. @GetMapping：映射 GET 请求。
5. @PostMapping：映射 POST 请求。
6. @PutMapping：映射 PUT 请求。
7. @DeleteMapping：映射 DELETE 请求。
8. @PatchMapping：映射 PATCH 请求。
9. @PathVariable：获取 URL 中的变量。
10. @RequestParam：绑定请求参数。
11. @RequestBody：将请求体转为对象。
12. @ResponseBody：将返回值直接写入 HTTP 响应体。
13. @RequestHeader：获取请求头信息。
14. @CookieValue：获取 Cookie 值。
15. @SessionAttribute：从会话中获取属性。
16. @CrossOrigin：允许跨域请求。
17. @ResponseStatus：设置响应状态码。
18. @ExceptionHandler：处理控制器内异常。
19. @ControllerAdvice：全局异常处理器。
20. @RestControllerAdvice：结合@ControllerAdvice 和@ResponseBody。
21. @Valid：触发对 Bean 的校验。
22. @InitBinder：用于自定义数据绑定与验证规则。

## 💾 三、数据访问（Data Access / JPA / MyBatis）

1. @Entity：JPA 实体类。
2. @Table：指定实体对应的数据库表名。
3. @Id：标识主键字段。
4. @GeneratedValue：主键自动生成策略。
5. @Column：映射字段到数据库列。
6. @Transient：忽略该字段持久化。
7. @OneToOne：一对一关联。
8. @OneToMany：一对多关联。
9. @ManyToOne：多对一关联。
10. @ManyToMany：多对多关联。
11. @JoinColumn：指定外键字段。
12. @JoinTable：多对多关系中的连接表。
13. @Query：自定义 JPQL 或原生 SQL 查询。
14. @Modifying：执行更新操作。
15. @Transactional：声明事务边界。
16. @EnableJpaRepositories：启用 JPA Repository 扫描。
17. @RepositoryRestResource：暴露 Repository 为 REST 接口。
18. @Select：MyBatis 查询注解。
19. @Insert：MyBatis 插入注解。
20. @Update：MyBatis 更新注解。
21. @Delete：MyBatis 删除注解。
22. @Options：MyBatis 操作选项，如生成主键。
23. @Results：结果映射。
24. @ResultMap：引用已有的结果映射。
25. @Param：命名参数传递给 SQL。
26. @Mapper：标记接口为 MyBatis Mapper。
27. @MapperScan：启用 MyBatis Mapper 扫描。
28. @EnableTransactionManagement：启用事务管理支持。

## 🔐 四、安全相关（Security）

1. @EnableWebSecurity：启用 Spring Security。
2. @EnableGlobalMethodSecurity：启用方法级安全控制。
3. @PreAuthorize：前置权限判断。
4. @PostAuthorize：后置权限判断。
5. @Secured：基于角色的访问控制。
6. @RolesAllowed：Java EE 标准权限注解。
7. @AuthenticationPrincipal：获取认证用户信息。
8. @EnableOAuth2Sso：启用 OAuth2 单点登录。
9. @EnableResourceServer：启用资源服务器。
10. @EnableAuthorizationServer：启用授权服务器。

## 🧪 五、测试相关（Testing）

1. @RunWith(SpringRunner.class)：JUnit 测试集成 Spring 上下文。
2. @SpringBootTest：启动完整 Spring Boot 应用上下文。
3. @DataJpaTest：仅加载 JPA 相关配置。
4. @WebMvcTest：仅测试 Web 层（控制器）。
5. @MockBean：模拟 Bean。
6. @InjectMocks：注入被测试的类。
7. @Before：JUnit 测试前准备。
8. @After：JUnit 测试后清理。
9. @Test：JUnit 测试方法。
10. @DataMongoTest：仅加载 MongoDB 相关配置。
11. @RestClientTest：测试 REST 客户端。
12. @SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)：启动随机端口 Web 环境。
13. @DirtiesContext：测试后重置应用上下文。
14. @Sql：执行 SQL 脚本。
15. @DataRedisTest：仅加载 Redis 配置。

## ⚙️ 六、其他常用注解

1. @ConditionalOnClass：当类路径存在某个类时生效。
2. @ConditionalOnMissingBean：当容器中没有该 Bean 时生效。
3. @ConditionalOnProperty：根据配置属性是否设置决定是否加载。
4. @ConditionalOnExpression：根据 SpEL 表达式决定是否加载。
5. @RefreshScope：配合 Spring Cloud Config 支持动态刷新配置。
6. @EnableAsync：启用异步方法调用。
7. @Async：标记异步方法。
8. @Scheduled：定时任务注解。
9. @EnableSwagger2：启用 Swagger 文档。
10. @OpenAPIDefinition：OpenAPI 文档定义（Swagger 3+）。
✅提示：

- 实际开发中并不需要掌握全部，根据项目需求选择使用。
- 大部分注解来源于 Spring Framework、Spring Boot、Spring Data、Spring Security 等模块。
- 如果你需要具体某个注解的详细说明或示例，可以告诉我。
