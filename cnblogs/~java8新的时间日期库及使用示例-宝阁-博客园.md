---
draft: true
aliases:
  - Java8 新的时间日期库及使用示例
  - ~java8 新的时间日期库及使用示例 - 宝阁 - 博客园
created: 2025-07-16T09:10:06
modified: 2025-08-30T22:47:28
source: https://www.cnblogs.com/comeboo/p/5378922.html
title: Java8 新的时间日期库及使用示例
type: archive-web
---
# Java8 新的时间日期库及使用示例

[![](https://img2024.cnblogs.com/blog/35695/202508/35695-20250830122018806-1574270965.jpg)](https://developer.huawei.com/consumer/cn/activity/digixActivity/digixcmsdetail/101750143863263087?ha_source=BKYQ3&ha_sourceId=89000408)

来自：Java 译站

链接：http://it.deepinmind.com/java/2015/03/17/20-examples-of-date-and-time-api-from-Java8.html

英文：http://javarevisited.blogspot.sg/2015/03/20-examples-of-date-and-time-api-from-Java8.html

本文根据上述资料进行整理修改说明

java8 引入了一套全新的时间日期 API，本篇随笔将说明学习 java8 的这套 API。

java。time 包中的是类是不可变且线程安全的。新的时间及日期 API 位于 java.time 中，下面是一些关键类

●Instant——它代表的是时间戳

●LocalDate——不包含具体时间的日期，比如 2014-01-14。它可以用来存储生日，周年纪念日，入职日期等。

●LocalTime——它代表的是不含日期的时间

●LocalDateTime——它包含了日期及时间，不过还是没有偏移信息或者说时区。

●ZonedDateTime——这是一个包含时区的完整的日期时间，偏移量是以 UTC/格林威治时间为基准的。

## Java8 是如何处理时间及日期的

1、如何在 java8 中获取当天的日期

java8 中有个叫 LocalDate 的类，能用来表示今天的日期。这个类与 java.util.Date 略有不同，因为它只包含日期，没有时间。

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160411142322957-99216045.png)

```shell
可以看到，他创建了今天的日期却不包含时间信息，并且格式化了日期。
```

2、如何在 java8 中获取当前的年月日

LocalDate 类中提供了一些很方便的方法可以用来提取年月日以及其他的日期属性,特别方便，只需要使用对应的 getter 方法就可以了，非常直观

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160411151946551-1409956695.png)

3、在 java8 中如何获取某个特定的日期

通过另一个方法，可以创建出任意一个日期，它接受年月日的参数，然后返回一个等价的 LocalDate 实例。在这个方法里，需要的日期你填写什么就是什么，不想之前的 API 中月份必须从 0 开始

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160411152621660-2048695910.png)

4、在 java8 中检查两个日期是否相等

LocalDate 重写了 equals 方法来进行日期的比较，如下所示：

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160413140207785-181310540.png)

5、在 java8 中如何检查重复事件，比如生日

在 java 中还有一个与时间日期相关的任务就是检查重复事件，比如每月的账单日

如何在 java 中判断是否是某个节日或者重复事件，使用 MonthDay 类。这个类由月日组合，不包含年信息，可以用来代表每年重复出现的一些日期或其他组合。他和新的日期库中的其他类一样也都是不可变且线程安全的，并且它还是一个值类（value class）。

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160413141204801-1283498547.png)

通过列子可以看到 MonthDay 只存储了月日，对比两个日期的月日即可知道是否重复

6、如何在 java8 中获取当前时间

这个与第一个例子获取当前日期非常相似，这里用的是 LocalTime 类，默认的格式是 hh:mm:ss:nnn

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160413141614566-1039173597.png)

可以看到，这个时间是不包含日期的

7、如何增加时间里面的小时数

很多时候需要对时间进行操作，比如加一个小时来计算之后的时间，java8 提供了更方便的方法 如 plusHours，这些方法返回的是一个新的 LocalTime 实例的引用，因为 LocalTime 是不可变的

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160413144311863-407474060.png)

8、如何获取 1 周后的日期

这个与前一个获取 2 小时后的时间的例子很相似，这里我们获取的是 1 周后的日期。LocalDate 是用来表示无时间的日期，他又一个 plus() 方法可以用来增加日，星期，月，ChronoUnit 则用来表示时间单位，LocalDate 也是不可变的，因此任何修改操作都会返回一个新的实例

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160413145554645-460234743.png)

可以看到一周后的日期是什么，也可以用这个方法来增加一个月，一年，一小时，一分等等

9、一年前后的日期

在上个例子中我们使用了 LocalDate 的 plus() 方法来给日期增加日周月，现在我们用 minus() 方法来找出一年前的那天

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160413153302113-1179570170.png)

10、在 java8 中使用时钟

java8 自带了 Clock 类，可以用来获取某个时区下（所以对时区是敏感的）当前的瞬时时间、日期。用来代替 System.currentTimelnMillis() 与 TimeZone.getDefault() 方法

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160413162111129-1177995394.png)

11、在 java 中如何判断某个日期在另一个日期的前面还是后面

如何判断某个日期在另一个日期的前面还是后面或者相等，在 java8 中，LocalDate 类中使用 isBefore()、isAfter()、equals() 方法来比较两个日期。如果调用方法的那个日期比给定的日期要早的话，isBefore() 方法会返回 true。equals() 方法在前面的例子中已经说明了，这里就不举例了

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160414103412020-80738682.png)

可以看到 java8 中比较日期非常简单，不再需要使用 Calendar 这样另外的类来完成类似的任务了

12、在 java8 中处理不同的时区

java8 中不仅将日期和时间进行了分离，同时还有时区。比如 ZonId 代表的是某个特定时区，ZonedDateTime 代表带时区的时间，等同于以前的 GregorianCalendar 类。使用该类，可以将本地时间转换成另一个时区中的对应时间。

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160414105003301-1722105867.png)

注意：对应时区的文本可以直接手动填写，也可以调用定义好了的，手动填写的时候注意不可填错了，否则你会遇到下面的异常

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160414105246910-698112874.png)

13、如何表示固定的日期，比如信用卡过期时间

正如 MonthDay 表示的是某个重复出现的日子，YearMonth 是另外一个组合，代表的是像信用卡还款日，定期存款到期日，options 到期日这类的日期。你可以用这个类找出这个月有多少天，LengthOfMonth() 这个方法返回的是这个 YearMonth 实例有多少天，这对于检查 2 月是否润 2 月很有用

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160414111055098-855202876.png)

14、如何在 java8 中检查闰年

LocalDate 类由一个 isLeapYear() 方法来返回当前 LocalDate 对应的那年是否是闰年

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160414111536207-461556981.png)

15、两个日期之间包含多少天，多少月

计算两个日期之间包含多少天、周、月、年。可以用 java.time.Period 类完成该功能。下面例子中将计算日期与将来的日期之间一共有几个月

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160414113748332-171008862.png)

16、带时区的日期与时间

在 java8 中，可以使用 ZoneOffset 来代表某个时区，可以使用它的静态方法 ZoneOffset.of() 方法来获取对应的时区，只要获得了这个偏移量，就可以用这个偏移量和 LocalDateTime 创建一个新的 OffsetDateTime

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160414140648754-1630601844.png)

可以看到现在时间日期和时区关联上了，注意 OffsetDateTime 主要是用来给机器理解的，平时使用就用前面结束的 ZoneDateTime 类就可以了

17、在 java8 中获取当前时间戳

java8 获取时间戳特别简单。Instant 类由一个静态的工厂方法 now() 可以返回当前时间戳

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160414140938973-1395309408.png)

可以看到，当前时间戳是包含日期和时间的，与 java.util.Date 很类似，事实上 Instant 就是 java8 以前的 Date，可以使用这个两个类中的方法在这两个类型之间进行转换，比如 Date.from(Instant) 就是用来把 Instant 转换成 java.util.date 的，而 Date。toInstant() 就是将 Date 转换成 Instant 的

18，如何在 java8 中使用预定义的格式器来对日期进行解析/格式化

在 java8 之前，时间日期的格式化非常麻烦，经常使用 SimpleDateFormat 来进行格式化，但是 SimpleDateFormat 并不是线程安全的。在 java8 中，引入了一个全新的线程安全的日期与时间格式器。并且预定义好了格式。比如，本例中使用的 BASICISODATE 格式会将 20160414 格式化成 2016-04-14

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160414142144738-703542743.png)

在 DateTimeFormatter 中还有很多定义好的格式，有兴趣的可以自己去看一下

19、如何在 java 中使用自定义的格式器来解析日期

在上例中，我们使用了预置的时间日期格式器来解析日期字符串了，但是有时预置的不能满足的时候就需要我们自定义日期格式器了，下面的例子中的日期格式是 "MM dd yyyy".你可以给 DateTimeFormatter 的 ofPattern 静态方法 () 传入任何的模式，它会返回一个实例，这个模式的字面量与前例中是相同的。比如 M 代表月，m 仍代表分，无效的模式会抛异常 DateTimeParseException。

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160414143730645-322666987.png)

20、如何在 java8 中对日期进行格式化，转换成字符串

前面的两个例子中，我们主要是对日期字符串来进行解析转换成日期，在这个例子我们相反，是把日期转换成字符。这里我们有个 LocalDateTime 类的实例，我们要把他转换成一个格式化好的日期串，与前例相同的是，我们仍需要制定模式串去创建一个 DateTimeFormatter 类的实例，但调用的是 LocalDate.format()。这个方法会返回一个代表当前日期的字符串，对应的模式就是传入的 DateTimeFormatter 实例中定义好的。

![](http://images2015.cnblogs.com/blog/426886/201604/426886-20160414144815332-1977784025.png)

## Java8 中日期与时间 API 的几个关键点

经过上面的例子，我们已经对 java8 的时间日期有了一定的了解，现在回顾一下

●它提供了 javax.time.ZoneId 用来处理时区。

●它提供了 LocalDate 与 LocalTime 类

●Java 8 中新的时间与日期 API 中的所有类都是不可变且线程安全的，这与之前的 Date 与 Calendar API 中的恰好相反，那里面像 java.util.Date 以及 SimpleDateFormat 这些关键的类都不是线程安全的。

●新的时间与日期 API 中很重要的一点是它定义清楚了基本的时间与日期的概念，比方说，瞬时时间，持续时间，日期，时间，时区以及时间段。它们都是基于 ISO 日历体系的。

**每个 Java 开发人员都应该至少了解这套新的 API 中的这五个类：**

●Instant 它代表的是时间戳，比如 2016-04-14T14:20:13.592Z，这可以从 java.time.Clock 类中获取，像这样： Instant current = Clock.system(ZoneId.of("Asia/Tokyo")).instant();

●LocalDate 它表示的是不带时间的日期，比如 2016-04-14。它可以用来存储生日，周年纪念日，入职日期等。

●LocalTime - 它表示的是不带日期的时间

●LocalDateTime - 它包含了时间与日期，不过没有带时区的偏移量

●ZonedDateTime - 这是一个带时区的完整时间，它根据 UTC/格林威治时间来进行时区调整

●这个库的主包是 java.time，里面包含了代表日期，时间，瞬时以及持续时间的类。它有两个子 package，一个是 java.time.foramt，这个是什么用途就很明显了，还有一个是 java.time.temporal，它能从更低层面对各个字段进行访问。

●时区指的是地球上共享同一标准时间的地区。每个时区都有一个唯一标识符，同时还有一个地区/城市 (Asia/Tokyo) 的格式以及从格林威治时间开始的一个偏移时间。比如说，东京的偏移时间就是 +09:00。

●OffsetDateTime 类实际上包含了 LocalDateTime 与 ZoneOffset。它用来表示一个包含格林威治时间偏移量（+/- 小时：分，比如 +06:00 或者 -08：00）的完整的日期（年月日）及时间（时分秒，纳秒）。

●DateTimeFormatter 类用于在 Java 中进行日期的格式化与解析。与 SimpleDateFormat 不同，它是不可变且线程安全的，如果需要的话，可以赋值给一个静态变量。DateTimeFormatter 类提供了许多预定义的格式器，你也可以自定义自己想要的格式。当然了，根据约定，它还有一个 parse() 方法是用于将字符串转换成日期的，如果转换期间出现任何错误，它会抛出 DateTimeParseException 异常。类似的，DateFormatter 类也有一个用于格式化日期的 format() 方法，它出错的话则会抛出 DateTimeException 异常。

●再说一句，“MMM d yyyy”与“MMm dd yyyy”这两个日期格式也略有不同，前者能识别出 "Jan 2 2014" 与 "Jan 14 2014" 这两个串，而后者如果传进来的是 "Jan 2 2014" 则会报错，因为它期望月份处传进来的是两个字符。为了解决这个问题，在天为个位数的情况下，你得在前面补 0，比如 "Jan 2 2014" 应该改为 "Jan 02 2014"。

关于 Java 8 这个新的时间日期 API 就讲到这了。这几个简短的示例 对于理解这套新的 API 中的一些新增类已经足够了。我们学习了如何创建与修改日期实例。我们还了解了纯日期，日期加时间，日期加时区的区别，知道如何比较两个日期，如何找到某天到指定日期比如说下一个生日，周年纪念日或者保险日还有多少天。我们还学习了如何在 Java 8 中用线程安全的方式对日期进行解析及格式化，而无需再使用线程本地变量或者第三方库这种取巧的方式。新的 API 能胜任任何与时间日期相关的任务。
