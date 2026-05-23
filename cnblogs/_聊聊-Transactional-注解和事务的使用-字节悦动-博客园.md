---
aliases:
  - 聊聊@Transactional 注解和事务的使用
  - ~聊聊 -Transactional- 注解和事务的使用 - 字节悦动 - 博客园
created: 2025-07-14T15:39:36
modified: 2025-08-30T22:47:29
source: https://www.cnblogs.com/better-farther-world2099/articles/14982412.html
title: 聊聊@Transactional 注解和事务的使用
type: archive-web
---
# 聊聊@Transactional 注解和事务的使用

\>

　　`　　@Transactional` 注解相信大家并不陌生，平时开发中很常用的一个注解，它能保证方法内多个数据库操作要么同时成功、要么同时失败。使用 `@Transactional` 注解时需要注意许多的细节，不然你会发现 `@Transactional` 总是莫名其妙的就失效了。

## 一、事务

事务管理在系统开发中是不可缺少的一部分， `Spring` 提供了很好事务管理机制，主要分为 **`编程式事务`** 和 **`声明式事务`** 两种。

### 1、编程式事务

是指在代码中手动的管理事务的提交、回滚等操作，代码侵入性比较强。

**编程式事务方式需要开发者在代码中手动的管理事务的开启、提交、回滚等操作。**

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

```shell
public void test() {

      TransactionDefinition def = new DefaultTransactionDefinition();

      TransactionStatus status = transactionManager.getTransaction(def);

       try {

         // 事务操作

         // 事务提交

         transactionManager.commit(status);

      } catch (DataAccessException e) {

         // 事务提交

         transactionManager.rollback(status);

         throw e;

      }

}
```

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

如以上代码，开发者可以通过 API 自己控制事务。

接下来我们重点看一下声明式事务

### 2、声明式事务

　　基于 `AOP` 面向切面的，它将具体业务与事务处理部分解耦，代码侵入性很低，所以在实际开发中声明式事务用的比较多。声明式事务也有两种实现方式，一是基于 `TX` 和 `AOP` 的 xml 配置文件方式，二种就是基于@Transactional 注解了。

**声明式事务管理方法允许开发者配置的帮助下来管理事务，而不需要依赖底层 API 进行硬编码。开发者可以只使用注解或基于配置的 XML 来管理事务。**

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

```shell
@Transactional
2    @GetMapping("/test")
3    public String test() {
4
5        int insert = cityInfoDictMapper.insert(cityInfoDict);
6    }
```

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

　　声明式事务对代码没有侵入性，方法内只需要写业务逻辑就可以了，帮助我们节省了很多代码，他会自动帮我们进行事务的开启、提交以及回滚等操作，把程序员从事务管理中解放出来。可以说优点很明显，但是这种方式的缺点也很明显。

**问题一：声明式事务的粒度问题**

首先， ****声明式事务有一个局限，那就是他的最小粒度要作用在方法上。****一部分代码块增加事务的话，那就需要把这个部分代码块单独独立出来作为一个方法。

在大事务耗时过长需要高并发优化的情况下不建议使用声明式事务，建议采用上面提到的编程式事务方式。

**声明式事务有一个局限，那就是他的最小粒度要作用在方法上。**

而事务一旦被忽略就容易造成很多故障

**问题二：声明式事务容易被开发者忽略**

我们知道，这些操作如果被包在事务中，有两个问题：

1、这些操作自身是无法回滚的，这就会导致数据的不一致。可能 RPC 调用成功了，但是本地事务回滚了，可是 PRC 调用无法回滚了 (这里不讨论分布式事务)。

2、在事务中有远程调用，就会拉长整个事务。那么久会导致本事务的数据库连接一直被占用，那么如果类似操作过多，就会导致数据库连接池耗尽。

有些时候，即使没有在事务中进行远程操作，但是有些人还是可能会不经意的进行一些内存操作，如运算。或者如果遇到分库分表的情况，有可能不经意间进行跨库操作。

**首先，如果开发者没有注意到一个方法是被事务嵌套的，那么就可能会再方法中加入一些如 RPC 远程调用、消息发送、缓存更新、文件写入等操作。**

　　这个问题后面我们着重讲述一下失效的几种场景。

下面我们就讲讲声明式事务使用的@Transactional 注解。

## 二、@Transactional 介绍

### 1、@Transactional 可以作用在接口、类、类方法

- **问题三：声明式事务用不对在某些场景下容易失效** ：当把@Transactional 注解放在类上时，表示所有该类的 `public` 方法都配置相同的事务属性信息。
- **作用于类** ：当类配置了@Transactional，方法也配置了@Transactional，方法的事务会覆盖类的事务配置信息。
- **作用于方法** ：不推荐这种使用方法，因为一旦标注在 Interface 上并且配置了 Spring AOP 使用 CGLib 动态代理，将会导致@Transactional 注解失效。

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

```shell
1@Transactional
 2@RestController
 3@RequestMapping
 4public class MybatisPlusController {
 5    @Autowired
 6    private CityInfoDictMapper cityInfoDictMapper;
 7
 8    @Transactional(rollbackFor = Exception.class)
 9    @GetMapping("/test")
10    public String test() throws Exception {
11        CityInfoDict cityInfoDict = new CityInfoDict();
12        cityInfoDict.setParentCityId(2);
13        cityInfoDict.setCityName("2");
14        cityInfoDict.setCityLevel("2");
15        cityInfoDict.setCityCode("2");
16        int insert = cityInfoDictMapper.insert(cityInfoDict);
17        return insert + "";
18    }
19}
```

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

### 2、@Transactional 注有哪些属性？

*@Transactional 属性*

| 属性 | 类型 | 描述 |
| --- | --- | --- |
| value | String | 可选的限定描述符，指定使用的事务管理器 |
| propagation | enum: Propagation | 可选的事务传播行为设置 |
| isolation | enum: Isolation | 可选的事务隔离级别设置 |
| readOnly | boolean | 读写或只读事务，默认读写 |
| timeout | int (in seconds granularity) | 事务超时时间设置 |
| rollbackFor | Class 对象数组，必须继承自 Throwable | 导致事务回滚的异常类数组 |
| rollbackForClassName | 类名数组，必须继承自 Throwable | 导致事务回滚的异常类名字数组 |
| noRollbackFor | Class 对象数组，必须继承自 Throwable | 不会导致事务回滚的异常类数组 |
| noRollbackForClassName | 类名数组，必须继承自 Throwable | 不会导致事务回滚的异常类名字数组 |

**作用于接口**

`propagation`  代表事务的传播行为，默认值为  `Propagation.REQUIRED` ，其他的属性信息如下：

- `Propagation.REQUIRED` ：如果当前存在事务，则加入该事务，如果当前不存在事务，则创建一个新的事务。( 也就是说如果 A 方法和 B 方法都添加了注解，在默认传播模式下，A 方法内部调用 B 方法，会把两个方法的事务合并为一个事务 ）
- `Propagation.SUPPORTS` ：如果当前存在事务，则加入该事务；如果当前不存在事务，则以非事务的方式继续运行。
- `Propagation.MANDATORY` ：如果当前存在事务，则加入该事务；如果当前不存在事务，则抛出异常。
- `Propagation.REQUIRES_NEW` ：重新创建一个新的事务，如果当前存在事务，暂停当前的事务。( 当类 A 中的 a 方法用默认 `Propagation.REQUIRED` 模式，类 B 中的 b 方法加上采用  `Propagation.REQUIRES_NEW` 模式，然后在 a 方法中调用 b 方法操作数据库，然而 a 方法抛出异常后，b 方法并没有进行回滚，因为 `Propagation.REQUIRES_NEW` 会暂停 a 方法的事务 )
- `Propagation.NOT_SUPPORTED` ：以非事务的方式运行，如果当前存在事务，暂停当前的事务。
- `Propagation.NEVER` ：以非事务的方式运行，如果当前存在事务，则抛出异常。
- `Propagation.NESTED` ：和 Propagation.REQUIRED 效果一样。

**propagation 属性**

`isolation`  ：事务的隔离级别，默认值为  `Isolation.DEFAULT` 。

- Isolation.DEFAULT：使用底层数据库默认的隔离级别。
- Isolation.READ\_UNCOMMITTED
- Isolation.READ\_COMMITTED
- Isolation.REPEATABLE\_READ
- Isolation.SERIALIZABLE

**isolation 属性**

`timeout` ：事务的超时时间，默认值为 -1。如果超过该时间限制但事务还没有完成，则自动回滚事务。

示例：

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

```shell
@Service
public class UserServiceImpl implements UserService{
    
    // 加载mapper
    @Autowired
    private UserMapper usermapper;
 
    @Transactional(propagation=Propagation.REQUIRED,timeout=5) // 启用事务管理
    public void myTransaction(User addUser, User updateuser) {
        System.out.println("---- UserServiceImpl  myTransaction方法开始 ");
        usermapper.add(addUser);
        try {
            Thread.sleep(7000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        usermapper.update(updateuser);
        System.out.println("---- UserServiceImpl  myTransaction方法结束 ");
    }
}
```

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

运行结果：

![](https://img2020.cnblogs.com/blog/1401949/202107/1401949-20210707170255299-618838523.png)

最终，由于事务超时，事务回滚。

运行的时候，由于事务超时，就会报错 TransactionTimedOutException:....

**timeout 属性**

`readOnly` ：指定事务是否为只读事务，默认值为 false；为了忽略那些不需要事务的方法，比如读取数据，可以设置 read-only 为 true。

**readOnly 属性**

`rollbackFor` ：用于指定能够触发事务回滚的异常类型，可以指定多个异常类型。

**rollbackFor 属性**

`noRollbackFor` ：抛出指定的异常类型，不回滚事务，也可以指定多个异常类型。

## 三、@Transactional 失效场景

接下来我们结合具体的代码分析一下哪些场景下，@Transactional 注解会失效。

### 1、@Transactional 应用在非 public 修饰的方法上

如果 `Transactional` 注解应用在非 `public` 修饰的方法上，Transactional 将会失效。

![](https://img2020.cnblogs.com/blog/1401949/202107/1401949-20210707205404829-1519450791.png)

在这里插入图片描述

之所以会失效是因为在 Spring AOP 代理时，如上图所示 `TransactionInterceptor`  （事务拦截器）在目标方法执行前后进行拦截， `DynamicAdvisedInterceptor` （CglibAopProxy 的内部类）的 intercept 方法或  `JdkDynamicAopProxy`  的 invoke 方法会间接调用  `AbstractFallbackTransactionAttributeSource` 的  `computeTransactionAttribute` 方法，获取 Transactional 注解的事务配置信息。

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

```shell
1protected TransactionAttribute computeTransactionAttribute(Method method,
2    Class<?> targetClass) {
3        // Don't allow no-public methods as required.
4        if (allowPublicMethodsOnly() && !Modifier.isPublic(method.getModifiers())) {
5        return null;
6}
```

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

此方法会检查目标方法的修饰符是否为 public，不是 public 则不会获取@Transactional 的属性配置信息。

**noRollbackFor 属性\*\***

### 2、@Transactional 注解属性 propagation 设置错误

这种失效是由于配置错误，若是错误的配置以下三种 propagation，事务将不会发生回滚。

`protected` ：如果当前存在事务，则加入该事务；如果当前没有事务，则以非事务的方式继续运行。
`private` ：以非事务方式运行，如果当前存在事务，则把当前事务挂起。
`@Transactional` ：以非事务方式运行，如果当前存在事务，则抛出异常。

### 3、@Transactional 注解属性 rollbackFor 设置错误

`TransactionDefinition.PROPAGATION_SUPPORTS`  可以指定能够触发事务回滚的异常类型。Spring 默认抛出了未检查 `TransactionDefinition.PROPAGATION_NOT_SUPPORTED` 异常（继承自  `TransactionDefinition.PROPAGATION_NEVER` 的异常）或者  `　　rollbackFor` 才回滚事务；其他异常不会触发回滚事务。如果在事务中抛出其他类型的异常，但却期望 Spring 能够回滚事务，就需要指定 rollbackFor 属性。

![](https://img2020.cnblogs.com/blog/1401949/202107/1401949-20210707211753371-597096491.png)

![](https://img2020.cnblogs.com/blog/1401949/202107/1401949-20210707211822928-2048347039.png)

```shell
// 希望自定义的异常可以进行回滚
@Transactional(propagation= Propagation.REQUIRED,rollbackFor= MyException.class
```

若在目标方法中抛出的异常是 `unchecked` 指定的异常的子类，事务同样会回滚。Spring 源码如下：

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

```shell
private int getDepth(Class<?> exceptionClass, int depth) {
       if (exceptionClass.getName().contains(this.exceptionName)) {
           // Found it!
            return depth;
       }
       // If we've gone as far as we can go and haven't found it...
       if (exceptionClass == Throwable.class) {
            return -1;
       }
       return getDepth(exceptionClass.getSuperclass(), depth + 1);
}
```

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

### 4、同一个类中方法调用，导致@Transactional 失效、

　　开发中避免不了会对同一个类里面的方法调用，比如有一个类 Test，它的一个方法 A，A 再调用本类的方法 B（不论方法 B 是用 public 还是 private 修饰），但方法 A 没有声明注解事务，而 B 方法有。则外部调用方法 A 之后，方法 B 的事务是不会起作用的。这也是经常犯错误的一个地方。

　　那为啥会出现这种情况？其实这还是由于使用 `RuntimeException` 代理造成的，因为只有当事务方法被当前类以外的代码调用时，才会由 `Error` 生成的代理对象来管理。

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

```shell
1//@Transactional
 2    @GetMapping("/test")
 3    private Integer A() throws Exception {
 4        CityInfoDict cityInfoDict = new CityInfoDict();
 5        cityInfoDict.setCityName("2");
 6        /**
 7         * B 插入字段为 3的数据
 8         */
 9        this.insertB();
10        /**
11         * A 插入字段为 2的数据
12         */
13        int insert = cityInfoDictMapper.insert(cityInfoDict);
14
15        return insert;
16    }
17
18    @Transactional()
19    public Integer insertB() throws Exception {
20        CityInfoDict cityInfoDict = new CityInfoDict();
21        cityInfoDict.setCityName("3");
22        cityInfoDict.setParentCityId(3);
23
24        return cityInfoDictMapper.insert(cityInfoDict);
25    }
```

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

### 5、异常被你的 catch“吃了”导致@Transactional 失效

这种情况是最常见的一种@Transactional 注解失效场景

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

```shell
1    @Transactional
 2    private Integer A() throws Exception {
 3        int insert = 0;
 4        try {
 5            CityInfoDict cityInfoDict = new CityInfoDict();
 6            cityInfoDict.setCityName("2");
 7            cityInfoDict.setParentCityId(2);
 8            /**
 9             * A 插入字段为 2的数据
10             */
11            insert = cityInfoDictMapper.insert(cityInfoDict);
12            /**
13             * B 插入字段为 3的数据
14             */
15            b.insertB();
16        } catch (Exception e) {
17            e.printStackTrace();
18        }
19    }
```

![复制代码](https://assets.cnblogs.com/images/copycode.gif)

如果 B 方法内部抛了异常，而 A 方法此时 try catch 了 B 方法的异常，那这个事务还能正常回滚吗？

答案：不能！

会抛出异常：

```shell
1org.springframework.transaction.UnexpectedRollbackException: Transaction rolled back because it has been marked as rollback-only
```

　　因为当 `rollbackFor` 中抛出了一个异常以后， `Spring AOP` 标识当前事务需要 `Spring` 。但是 `ServiceB` 中由于你手动的捕获这个异常并进行处理， `ServiceB` 认为当前事务应该正常 `rollback` 。此时就出现了前后不一致，也就是因为这样，抛出了前面的 `ServiceA` 异常。

`ServiceA` 的事务是在调用业务方法之前开始的，业务方法执行完毕之后才执行 `commit`  or  `UnexpectedRollbackException` ，事务是否执行取决于是否抛出 `　　spring` 。如果抛出 `commit` 并在你的业务方法中没有 catch 到的话，事务会回滚。

　　在业务方法中一般不需要 catch 异常，如果非要 catch 一定要手动抛出 `rollback` ，否则会导致事务失效，数据 commit 造成数据不一致，所以有些时候 try catch 反倒会画蛇添足。

### 6、数据库引擎不支持事务

这种情况出现的概率并不高，事务能否生效数据库引擎是否支持事务是关键。常用的 MySQL 数据库默认使用支持事务的 `runtime异常` 引擎。一旦数据库引擎切换成不支持事务的 `runtime exception` ，那事务就从根本上失效了。

总结

@Transactional 注解的看似简单易用，但如果对它的用法一知半解，还是会踩到很多坑的。

参考文章：

https://blog.csdn.net/weixin\_43167418/article/details/105355323

https://blog.csdn.net/weixin\_42214548/article/details/102916519
