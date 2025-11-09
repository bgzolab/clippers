---
draft: true
aliases:
  - Python 之日期与时间处理模块（date 和 datetime）
  - ~Python 之日期与时间处理模块 -date 和 datetime- 云游道士 - 博客园
created: 2025-07-16T09:52:53
modified: 2025-08-30T22:47:28
source: https://www.cnblogs.com/yyds/p/6369211.html
title: Python 之日期与时间处理模块（date 和 datetime）
type: archive-web
---
# Python 之日期与时间处理模块（date 和 datetime）

[![](https://img2024.cnblogs.com/blog/35695/202508/35695-20250830122018806-1574270965.jpg)](https://developer.huawei.com/consumer/cn/activity/digixActivity/digixcmsdetail/101750143863263087?ha_source=BKYQ3&ha_sourceId=89000408)

## 本节内容

---

1. 前言
2. 相关术语的解释
3. 时间的表现形式
4. time 模块
5. datetime 模块
6. 时间格式码
7. 总结

## 前言

---

在开发工作中，我们经常需要用到日期与时间，如：

- 作为日志信息的内容输出
- 计算某个功能的执行时间
- 用日期命名一个日志文件的名称
- 记录或展示某文章的发布或修改时间
- 其他

Python 中提供了多个用于对日期和时间进行操作的内置模块：time 模块、datetime 模块和 calendar 模块。其中 time 模块是通过调用 C 库实现的，所以有些方法在某些平台上可能无法调用，但是其提供的大部分接口与 C 标准库 time.h 基本一致。time 模块相比，datetime 模块提供的接口更直观、易用，功能也更加强大。

## 一、相关术语的解释

---

- ***UTC time*** Coordinated Universal Time，世界协调时，又称 格林尼治天文时间、世界标准时间。与 UTC time 对应的是各个时区的 local time，东 N 区的时间比 UTC 时间早 N 个小时，因此 UTC time + N 小时 即为东 N 区的本地时间；而西 N 区时间比 UTC 时间晚 N 个小时，即 UTC time - N 小时 即为西 N 区的本地时间； 中国在东 8 区，因此比 UTC 时间早 8 小时，可以以 UTC+8 进行表示。
- ***epoch time*** 表示时间开始的起点；它是一个特定的时间，不同平台上这个时间点的值不太相同，对于 Unix 而言，epoch time 为 1970-01-01 00:00:00 UTC。
- ***timestamp（时间戳）*** 也称为 Unix 时间 或 POSIX 时间；它是一种时间表示方式，表示从格林尼治时间 1970 年 1 月 1 日 0 时 0 分 0 秒开始到现在所经过的毫秒数，其值为 float 类型。 但是有些编程语言的相关方法返回的是秒数（Python 就是这样），这个需要看方法的文档说明。需要说明的是时间戳是个差值，其值与时区无关。

## 二、时间的表现形式

---

常见的时间表示形式为：

- 时间戳
- 格式化的时间字符串

Python 中还有其它的时间表示形式：

- time 模块的 ***time.struct\_time***
- datetime 模块的 ***datetime 类***

关于 datetime 模块的 datetime 类会在下面做详细讲解，这里简单说下 time.struct\_time。

time.struct\_time 包含如下属性：

下标/索引 | 属性名称 | 描述

- | - | -
	0 | tm\_year | 年份，如 2017
	1 | tm\_mon | 月份，取值范围为\[1, 12\]
	2 | tm\_mday | 一个月中的第几天，取值范围为\[1-31\]
	3 | tm\_hour | 小时， 取值范围为\[0-23\]
	4 | tm\_min | 分钟，取值范围为\[0, 59\]
	5 | tm\_sec | 秒，取值范围为\[0, 61\]
	6 | tm\_wday | 一个星期中的第几天，取值范围为\[0-6\]，0 表示星期一
	7 | tm\_yday | 一年中的第几天，取值范围为\[1, 366\]
	8 | tm\_isdst | 是否为夏令时，可取值为：0, 1 或 -1

属性值的获取方式有两种：

- 可以把它当做一种特殊的有序不可变序列通过 ***下标/索引*** 获取各个元素的值，如 t\[0\]
- 也可以通过 ***.属性名*** 的方式来获取各个元素的值，如 t.tm\_year。

需要说明的是 struct\_time 实例的各个属性都是只读的，不可修改。

## 三、 Time 模块

---

time 模块主要用于时间访问和转换，这个模块提供了各种与时间相关的函数。

### 1\. 函数列表

| 方法/属性 | 描述 |
| --- | --- |
| time.altzone | 返回与 utc 时间的时间差，以秒为单位（西区该值为正，东区该值为负）。其表示的是本地 DST 时区的偏移量，只有 daylight 非 0 时才使用。 |
| time.clock() | 返回当前进程所消耗的处理器运行时间秒数（不包括 sleep 时间），值为小数；该方法 Python3.3 改成了 time.process\_time() |
| time.asctime(\[t\]) | 将一个 tuple 或 struct\_time 形式的时间（可以通过 gmtime() 和 localtime() 方法获取）转换为一个 24 个字符的时间字符串，格式为: "Fri Aug 19 11:14:16 2016"。如果参数 t 未提供，则取 localtime() 的返回值作为参数。 |
| time.ctime(\[secs\]) | 功能同上，将一个秒数时间戳表示的时间转换为一个表示当前本地时间的字符串。如果参数 secs 没有提供或值为 None，则取 time() 方法的返回值作为默认值。ctime(secs) 等价于 asctime(localtime(secs)) |
| time.time() | 返回时间戳（自 1970-1-1 0:00:00 至今所经历的秒数） |
| time.localtime(\[secs\]) | 返回以指定时间戳对应的本地时间的 struct\_time 对象（可以通过下标，也可以通过.属性名 的方式来引用内部属性）格式 |
| time.localtime(time.time() + n\*3600) | 返回 n 个小时后本地时间的 struct\_time 对象格式（可以用来实现类似 crontab 的功能） |
| time.gmtime(\[secs\]) | 返回指定时间戳对应的 utc 时间的 struct\_time 对象格式（与当前本地时间差 8 个小时） |
| time.gmtime(time.time() + n\*3600) | 返回 n 个小时后 utc 时间的 struct\_time 对象（可以通过.属性名 的方式来引用内部属性）格式 |
| time.strptime(time\_str, time\_format\_str) | 将时间字符串转换为 struct\_time 时间对象，如：time.strptime('2017-01-13 17:07', '%Y-%m-%d %H:%M') |
| time.mktime(struct\_time\_instance) | 将 struct\_time 对象实例转换成时间戳 |
| time.strftime(time\_format\_str\[, struct\_time\_instance\]) | 将 struct\_time 对象实例转换成字符串，如果 struct\_time\_instance 不指定则取当前本地时间对应的 time\_struct 对象 |

### 2\. 练习

#### 获取时间戳格式的时间

```lua
>>> time.time()
1486188022.862
```

#### 获取 struct\_time 格式的时间

```lua
>>> time.localtime()
time.struct_time(tm_year=2017, tm_mon=2, tm_mday=4, tm_hour=14, tm_min=2, tm_sec=34, tm_wday=5, tm_yday=35, tm_isdst=0)
>>> time.gmtime()
time.struct_time(tm_year=2017, tm_mon=2, tm_mday=4, tm_hour=6, tm_min=2, tm_sec=56, tm_wday=5, tm_yday=35, tm_isdst=0)
```

#### 获取字符串格式的时间

```lua
>>> time.ctime()
'Sat Feb 04 14:06:42 2017'
>>> time.asctime()
'Sat Feb 04 14:06:47 2017'
>>> time.strftime('%Y-%m-%d')
'2017-02-04'
```

#### 时间戳格式转 struct\_time 格式时间

```lua
>>> t1 = time.time()
>>> print(t1)
1486188476.9
>>> t2 = time.localtime(t1)
>>> print(t2)
time.struct_time(tm_year=2017, tm_mon=2, tm_mday=4, tm_hour=14, tm_min=7, tm_sec=56, tm_wday=5, tm_yday=35, tm_isdst=0)
>>> t3 = time.gmtime(t1)
>>> print(t3)
time.struct_time(tm_year=2017, tm_mon=2, tm_mday=4, tm_hour=6, tm_min=7, tm_sec=56, tm_wday=5, tm_yday=35, tm_isdst=0)
>>>
```

#### 字符串格式转 struct\_time 格式时间

```lua
>>> time.strptime('Sat Feb 04 14:06:42 2017')
time.struct_time(tm_year=2017, tm_mon=2, tm_mday=4, tm_hour=14, tm_min=6, tm_sec=42, tm_wday=5, tm_yday=35, tm_isdst=-1)
>>> time.strptime('Sat Feb 04 14:06:42 2017', '%a %b %d %H:%M:%S %Y')
time.struct_time(tm_year=2017, tm_mon=2, tm_mday=4, tm_hour=14, tm_min=6, tm_sec=42, tm_wday=5, tm_yday=35, tm_isdst=-1)
>>> time.strptime('2017-02-04 14:12', '%Y-%m-%d %H:%M')
time.struct_time(tm_year=2017, tm_mon=2, tm_mday=4, tm_hour=14, tm_min=12, tm_sec=0, tm_wday=5, tm_yday=35, tm_isdst=-1)
>>> time.strptime('2017/02/04 14:12', '%Y/%m/%d %H:%M')
time.struct_time(tm_year=2017, tm_mon=2, tm_mday=4, tm_hour=14, tm_min=12, tm_sec=0, tm_wday=5, tm_yday=35, tm_isdst=-1)
>>> time.strptime('201702041412', '%Y%m%d%H%M')
time.struct_time(tm_year=2017, tm_mon=2, tm_mday=4, tm_hour=14, tm_min=12, tm_sec=0, tm_wday=5, tm_yday=35, tm_isdst=-1)
```

### struct\_time 格式转字符串格式时间

```lua
>>> time.strftime('%Y-%m-%d %H:%M', time.localtime())
'2017-02-04 14:19'
```

### struct\_time 格式转时间戳格式时间

```lua
>>> time.mktime(time.localtime())
1486189282.0
```

### 3\. 时间格式转换

时间戳格式的时间 与 字符串格式的时间 虽然可以通过 ctime(\[secs\]) 方法进行转换，但是字符串格式不太适应中国国情。因此，整体而言，它们 不能直接进行转换，需要通过 struct\_time 作为中介，转换关系如下：

![](http://images2015.cnblogs.com/blog/1063221/201703/1063221-20170320110359861-1880368659.png)

说明：上面的 '%H:%M:%S' 可以直接用 '%X' 代替。

## 四、 Datetime 模块

---

datetime 模块提供了处理日期和时间的类，既有简单的方式，又有复杂的方式。它虽然支持日期和时间算法，但其实现的重点是为输出格式化和操作提供高效的属性提取功能。

### 1\. Datetime 模块中定义的类

datetime 模块定义了以下几个类：

类名称 | 描述

- | -
	datetime.date | 表示日期，常用的属性有：year, month 和 day
	datetime.time | 表示时间，常用属性有：hour, minute, second, microsecond
	datetime.datetime | 表示日期时间
	datetime.timedelta | 表示两个 date、time、datetime 实例之间的时间间隔，分辨率（最小单位）可达到微秒
	datetime.tzinfo | 时区相关信息对象的抽象基类。它们由 datetime 和 time 类使用，以提供自定义时间的而调整。
	datetime.timezone | Python 3.2 中新增的功能，实现 tzinfo 抽象基类的类，表示与 UTC 的固定偏移量

***需要说明的是：这些类的对象都是不可变的。***

#### 类之间的关系：

```lua
object
    date
        datetime
    time
    timedelta
    tzinfo
        timezone
```

### 2\. Datetime 模块中定义的常量

常量名称 | 描述

- | -
	datetime.MINYEAR | datetime.date 或 datetime.datetime 对象所允许的年份的最小值，值为 1
	datetime.MAXYEAR | datetime.date 或 datetime.datetime 对象所允许的年份的最大值，只为 9999

### 3\. datetime.date 类

#### datetime.date 类的定义

```sql
class datetime.date(year, month, day)
```

year, month 和 day 都是是必须参数，各参数的取值范围为：

参数名称 | 取值范围

- | -
	year | \[MINYEAR, MAXYEAR\]
	month | \[1, 12\]
	day | \[1, 指定年份的月份中的天数\]

#### 类方法和属性

类方法/属性名称 | 描述

- | -
	date.max | date 对象所能表示的最大日期：9999-12-31
	date.min | date 对象所能表示的最小日志：00001-01-01
	date.resoluation | date 对象表示的日期的最小单位：天
	date.today() | 返回一个表示当前本地日期的 date 对象
	date.fromtimestamp(timestamp) | 根据跟定的时间戳，返回一个 date 对象

#### 对象方法和属性

对象方法/属性名称 | 描述

- | -
	d.year | 年
	d.month | 月
	d.day | 日
	d.replace(year\[, month\[, day\]\]) | 生成并返回一个新的日期对象，原日期对象不变
	d.timetuple() | 返回日期对应的 time.struct\_time 对象
	d.toordinal() | 返回日期是是自 0001-01-01 开始的第多少天
	d.weekday() | 返回日期是星期几，\[0, 6\]，0 表示星期一
	d.isoweekday() | 返回日期是星期几，\[1, 7\], 1 表示星期一
	d.isocalendar() | 返回一个元组，格式为：(year, weekday, isoweekday)
	d.isoformat() | 返回‘YYYY-MM-DD’格式的日期字符串
	d.strftime(format) | 返回指定格式的日期字符串，与 time 模块的 strftime(format, struct\_time) 功能相同

#### 实例

```lua
>>> import time
>>> from datetime import date
>>>
>>> date.max
datetime.date(9999, 12, 31)
>>> date.min
datetime.date(1, 1, 1)
>>> date.resolution
datetime.timedelta(1)
>>> date.today()
datetime.date(2017, 2, 4)
>>> date.fromtimestamp(time.time())
datetime.date(2017, 2, 4)
>>>
>>> d = date.today()
>>> d.year
2017
>>> d.month
2
>>> d.day
4
>>> d.replace(2016)
datetime.date(2016, 2, 4)
>>> d.replace(2016, 3)
>>> d.replace(2016, 3, 2)
datetime.date(2016, 3, 2)
>>> d.timetuple()
time.struct_time(tm_year=2017, tm_mon=2, tm_mday=4, tm_hour=0, tm_min=0, tm_sec=0, tm_wday=5, tm_yday=35, tm_isdst=-1)
>>> d.toordinal()
736364
>>> d.weekday()
5
>>> d.isoweekday()
6
>>> d.isocalendar()
(2017, 5, 6)
>>> d.isoformat()
'2017-02-04'
>>> d.ctime()
'Sat Feb  4 00:00:00 2017'
>>> d.strftime('%Y/%m/%d')
'2017/02/04'
```

### 4\. datetime.time 类

#### Time 类的定义

```sql
class datetime.time(hour, [minute[, second, [microsecond[, tzinfo]]]])
```

hour 为必须参数，其他为可选参数。各参数的取值范围为：：

参数名称 | 取值范围

- | -
	hour | \[0, 23\]
	minute | \[0, 59\]
	second | \[0, 59\]
	microsecond | \[0, 1000000\]
	tzinfo | tzinfo 的子类对象，如 timezone 类的实例

#### 类方法和属性

类方法/属性名称 | 描述

- | -
	time.max | time 类所能表示的最大时间：time(23, 59, 59, 999999)
	time.min | time 类所能表示的最小时间：time(0, 0, 0, 0)
	time.resolution | 时间的最小单位，即两个不同时间的最小差值：1 微秒

#### 对象方法和属性

对象方法/属性名称 | 描述

- | -
	t.hour | 时
	t.minute | 分
	t.second | 秒
	t.microsecond | 微秒
	t.tzinfo | 返回传递给 time 构造方法的 tzinfo 对象，如果该参数未给出，则返回 None
	t.replace(hour\[, minute\[, second\[, microsecond\[, tzinfo\]\]\]\]) | 生成并返回一个新的时间对象，原时间对象不变
	t.isoformat() | 返回一个‘HH:MM:SS.%f’格式的时间字符串
	t.strftime() | 返回指定格式的时间字符串，与 time 模块的 strftime(format, struct\_time) 功能相同

#### 实例

```lua
>>> from datetime import time
>>>
>>> time.max
datetime.time(23, 59, 59, 999999)
>>> time.min
datetime.time(0, 0)
>>> time.resolution
datetime.timedelta(0, 0, 1)
>>>
>>> t = time(20, 5, 40, 8888)
>>> t.hour
20
>>> t.minute
5
>>> t.second
40
>>> t.microsecond
8888
>>> t.tzinfo
>>>
>>> t.replace(21)
datetime.time(21, 5, 40, 8888)
>>> t.isoformat()
'20:05:40.008888'
>>> t.strftime('%H%M%S')
'200540'
>>> t.strftime('%H%M%S.%f')
'200540.008888'
```

### 5\. datetime.datetime 类

#### Datetime 类的定义

```sql
class datetime.datetime(year, month, day, hour=0, minute=0, second=0, microsecond=0, tzinfo=None)
```

year, month 和 day 是必须要传递的参数， tzinfo 可以是 None 或 tzinfo 子类的实例。

各参数的取值范围为：

参数名称 | 取值范围

- | -
	year | \[MINYEAR, MAXYEAR\]
	month | \[1, 12\]
	day | \[1, 指定年份的月份中的天数\]
	hour | \[0, 23\]
	minute | \[0, 59\]
	second | \[0, 59\]
	microsecond | \[0, 1000000\]
	tzinfo | tzinfo 的子类对象，如 timezone 类的实例

如果一个参数超出了这些范围，会引起 ValueError 异常。

#### 类方法和属性

类方法/属性名称 | 描述

- | -
	datetime.today() | 返回一个表示当前本期日期时间的 datetime 对象
	datetime.now(\[tz\]) | 返回指定时区日期时间的 datetime 对象，如果不指定 tz 参数则结果同上
	datetime.utcnow() | 返回当前 utc 日期时间的 datetime 对象
	datetime.fromtimestamp(timestamp\[, tz\]) | 根据指定的时间戳创建一个 datetime 对象
	datetime.utcfromtimestamp(timestamp) | 根据指定的时间戳创建一个 datetime 对象
	datetime.combine(date, time) | 把指定的 date 和 time 对象整合成一个 datetime 对象
	datetime.strptime(date\_str, format) | 将时间字符串转换为 datetime 对象

#### 对象方法和属性

对象方法/属性名称 | 描述

- | -
	dt.year, dt.month, dt.day | 年、月、日
	dt.hour, dt.minute, dt.second | 时、分、秒
	dt.microsecond, dt.tzinfo | 微秒、时区信息
	dt.date() | 获取 datetime 对象对应的 date 对象
	dt.time() | 获取 datetime 对象对应的 time 对象， tzinfo 为 None
	dt.timetz() | 获取 datetime 对象对应的 time 对象，tzinfo 与 datetime 对象的 tzinfo 相同
	dt.replace(\[year\[, month\[, day\[, hour\[, minute\[, second\[, microsecond\[, tzinfo\]\]\]\]\]\]\]\]) | 生成并返回一个新的 datetime 对象，如果所有参数都没有指定，则返回一个与原 datetime 对象相同的对象
	dt.timetuple() | 返回 datetime 对象对应的 tuple（不包括 tzinfo）
	dt.utctimetuple() | 返回 datetime 对象对应的 utc 时间的 tuple（不包括 tzinfo）
	dt.timestamp() | 返回 datetime 对象对应的时间戳，返回值是一个类似 time.time() 返回的浮点型值。需要注释的是，该方法是 Python 3.3 才新增的
	dt.toordinal() | 同 date 对象
	dt.weekday() | 同 date 对象
	dt.isocalendar() | 同 date 对象
	dt.isoformat(\[sep\]) | 返回一个‘%Y-%m-%d %H:%M:%S.%f’格式的字符串
	dt.ctime() | 等价于 time 模块的 time.ctime(time.mktime(d.timetuple()))
	dt.strftime(format) | 返回指定格式的时间字符串

#### 实例

```lua
>>> from datetime import datetime, timezone
>>>
>>> datetime.today()
datetime.datetime(2017, 2, 4, 20, 44, 40, 556318)
>>> datetime.now()
datetime.datetime(2017, 2, 4, 20, 44, 56, 572615)
>>> datetime.now(timezone.utc)
datetime.datetime(2017, 2, 4, 12, 45, 22, 881694, tzinfo=datetime.timezone.utc)
>>> datetime.utcnow()
datetime.datetime(2017, 2, 4, 12, 45, 52, 812508)
>>> import time
>>> datetime.fromtimestamp(time.time())
datetime.datetime(2017, 2, 4, 20, 46, 41, 97578)
>>> datetime.utcfromtimestamp(time.time())
datetime.datetime(2017, 2, 4, 12, 46, 56, 989413)
>>> datetime.combine(date(2017, 2, 4), t)
datetime.datetime(2017, 2, 4, 20, 5, 40, 8888)
>>> datetime.strptime('2017/02/04 20:49', '%Y/%m/%d %H:%M')
datetime.datetime(2017, 2, 4, 20, 49)
>>> dt = datetime.now()
>>> dt
datetime.datetime(2017, 2, 4, 20, 57, 0, 621378)
>>> dt.year
2017
>>> dt.month
2
>>> dt.day
4
>>> dt.hour
20
>>> dt.minute
57
>>> dt.second
0
>>> dt.microsecond
621378
>>> dt.tzinfo
>>> dt.timestamp()
1486213020.621378
>>> dt.date()
datetime.date(2017, 2, 4)
>>> dt.time()
datetime.time(20, 57, 0, 621378)
>>> dt.timetz()
datetime.time(20, 57, 0, 621378)
>>> dt.replace()
datetime.datetime(2017, 2, 4, 20, 57, 0, 621378)
>>> dt.replace(2016)
datetime.datetime(2016, 2, 4, 20, 57, 0, 621378)
>>> dt.timetuple()
time.struct_time(tm_year=2017, tm_mon=2, tm_mday=4, tm_hour=20, tm_min=57, tm_sec=0, tm_wday=5, tm_yday=35, tm_isdst=-1)
>>> dt.utctimetuple()
time.struct_time(tm_year=2017, tm_mon=2, tm_mday=4, tm_hour=20, tm_min=57, tm_sec=0, tm_wday=5, tm_yday=35, tm_isdst=0)
>>> dt.toordinal()
736364
>>> dt.weekday()
5
>>> dt.isocalendar()
(2017, 5, 6)
>>> dt.isoformat()
'2017-02-04T20:57:00.621378'
>>> dt.isoformat(sep='/')
'2017-02-04/20:57:00.621378'
>>> dt.isoformat(sep=' ')
'2017-02-04 20:57:00.621378'
>>> dt.ctime()
'Sat Feb  4 20:57:00 2017'
>>> dt.strftime('%Y%m%d %H:%M:%S.%f')
'20170204 20:57:00.621378'
```

### 6\. 使用 datetime.datetime 类对时间戳与时间字符串进行转换

![](http://images2015.cnblogs.com/blog/1063221/201702/1063221-20170205083810667-126583354.png)

### 7\. datetime.timedelta 类

timedelta 对象表示连个不同时间之间的差值。如果使用 time 模块对时间进行算术运行，只能将字符串格式的时间 和 struct\_time 格式的时间对象 先转换为时间戳格式，然后对该时间戳加上或减去 n 秒，最后再转换回 struct\_time 格式或字符串格式，这显然很不方便。而 datetime 模块提供的 timedelta 类可以让我们很方面的对 datetime.date, datetime.time 和 datetime.datetime 对象做算术运算，且两个时间之间的差值单位也更加容易控制。
这个差值的单位可以是：天、秒、微秒、毫秒、分钟、小时、周。

#### datetime.timedelta 类的定义

```haskell
class datetime.timedelta(days=0, seconds=0, microseconds=0, milliseconds=0, hours=0, weeks=0)
```

所有参数都是默认参数，因此都是可选参数。参数的值可以是整数或浮点数，也可以是正数或负数。内部值存储 days、seconds 和 microseconds，其他所有参数都将被转换成这 3 个单位：

- 1 毫秒转换为 1000 微秒
- 1 分钟转换为 60 秒
- 1 小时转换为 3600 秒
- 1 周转换为 7 天

然后对这 3 个值进行标准化，使得它们的表示是唯一的：

- microseconds: \[0, 999999\]
- seconds: \[0, 86399\]
- days: \[-999999999, 999999999\]

#### 类属性

类属性名称 | 描述

- | -
	timedelta.min | timedelta(-999999999)
	timedelta.max | timedelta(days=999999999, hours=23, minutes=59, seconds=59, microseconds=999999)
	timedelta.resolution | timedelta(microseconds=1)

#### 实例方法和属性

实例方法/属性名称 | 描述

- | -
	td.days | 天 \[-999999999, 999999999\]
	td.seconds | 秒 \[0, 86399\]
	td.microseconds | 微秒 \[0, 999999\]
	td.total\_seconds() | 时间差中包含的总秒数，等价于: td / timedelta(seconds=1)

#### 实例

```lua
>>> import datetime
>>>
>>> datetime.timedelta(365).total_seconds()  # 一年包含的总秒数
31536000.0
>>> dt = datetime.datetime.now()
>>> dt + datetime.timedelta(3)  # 3天后
datetime.datetime(2017, 2, 8, 9, 39, 40, 102821)
>>> dt + datetime.timedelta(-3)  # 3天前
datetime.datetime(2017, 2, 2, 9, 39, 40, 102821)
>>> dt + datetime.timedelta(hours=3)  # 3小时后
datetime.datetime(2017, 2, 5, 12, 39, 40, 102821)
>>> dt + datetime.timedelta(hours=-3)  # 3小时前
datetime.datetime(2017, 2, 5, 6, 39, 40, 102821)
>>> dt + datetime.timedelta(hours=3, seconds=30)  # 3小时30秒后  
datetime.datetime(2017, 2, 5, 12, 40, 10, 102821)
```

## 五、时间格式码

---

time 模块的 struct\_time 以及 datetime 模块的 datetime、date、time 类都提供了 strftime() 方法，该方法可 以输出一个指定格式的时间字符串。具体格式由一系列的格式码（格式字符）组成，Python 最终调用的是各个平台 C 库的 strftme() 函数，因此各平台对全套格式码的支持会有所不同，具体情况需要参考该平台上的 strftime(3) 文档。下面列出了 C 标准（1989 版）要求的所有格式码，它们在所有标准 C 实现的平台上都可以工作：

![](http://images2015.cnblogs.com/blog/1063221/201702/1063221-20170205104434573-1343126060.png)

## 六、总结

---

那么 Python 中处理时间时，使用 time 模块好，还是用 datetime 模块好呢？我觉得还是看个人习惯吧，没有什么绝对的好坏之分。就我个人而言，datetime 模块基本上可以满足需要，且用起来确实比较方便。对于 time 模块，在以下几种情况下比较实用：

- 取当前时间的时间戳时会用到 time.time() 方法，当然也可以通过 datetime.datetime.now().timestamp() 来获取，只是显得复杂一点；
- 同样，如果想获取当前本地时间的字符串格式（如生成一个备份文件或日志文件的名称）直接使用 time.strtime(format) 会更简洁一点，当然也可以通过 datetime.datetime.now().strftime(format) 来实现；
- 但是，如果需要把一个时间字符串转换为一个时间戳，且使用的是 Python 2 时，应该使用 time 模块，因为 datetime.timestamp() 方法是在 Python 3.3 才新增的方法。
