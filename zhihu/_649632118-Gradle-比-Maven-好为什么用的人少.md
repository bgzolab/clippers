---
comments: true
created: '2019-04-13T09:03:18'
draft: true
modified: '2020-06-19T15:36:33'
source: https://www.zhihu.com/question/276078446/answer/649632118
title: Gradle 比 Maven 好为什么用的人少？
type: archive-web
---

利益相关：Gradle developer，在core team工作了大概一年半。

首先Gradle在中国地区已经开启了CDN，下载从此不再是问题。

这是一张我们内部报告中，2019年11月GitHub上的公开仓库中构建工具的对比。必须指出，这并不意味着Gradle超过了Maven，因为还有相当一部分仓库是Android项目，这部分仓库只能使用Gradle。所以在Java后端领域，Maven还是占优的。

![](https://pica.zhimg.com/50/v2-b8463b0298caa3625236ef0cbb1a6291_720w.jpg?source=2c26e567)

  

我自己的观点是：

  * Gradle不比Maven好。
  * Maven也不比Gradle好。

我们有Gradle和Maven的企业业务，因此二者都用的很多，也很深，包括我在内，我们都给Maven提了很多PR。之前给人上课的时候总结过二者的一些抛开情绪化的优缺点：

Maven的优点：

稳定可靠，通过统一（甚至略显死板）的流程来完成工作，在绝大多数项目上工作良好。社区很大（几乎所有的Java开发者），插件很多很丰富。这其实是构建最大的意义所在，不要什么魔法，老老实实干活就好。

Maven的缺点：

XML的冗长和啰嗦不算是一个特别大的问题，因为现代IDE，哪怕是Notepad++都支持的很好，更别提还有XSD了。Maven真正的缺点在于它太死板了，以至于哪怕要偏离主线一点点，都要付出巨大的代价（比如稍微tweak一下某个流程，或者根据环境做一点点小变动）。因此，很多著名的开源仓库食用Maven的方式是搭配一个脚本，然后用exec插件去完成更灵活的工作。行不行？没问题。但是如果你要用更Maven的方式解决问题，就只能写插件了。

Maven团队是一个非常松散的、社区驱动的团队，对新功能的兴趣不大。这其实——不算是一个缺点，毕竟，写代码就会出bug，不出bug的唯一方式就是不写新功能，只修bug，肯定越来越稳定。当然，Maven几乎把所有工作都放在了插件里也是一个重要原因。

Maven的一个很容易被人忽视的问题说：对于大项目，Maven太慢了。我说的大项目指的是那种要跑上几个小时的项目，Maven原生的up-to-
date检查只看时间戳，实践中大家都习惯clean
package，所以每次构建基本上都是全量构建。之前帮南方某银行看过一个Maven构建，5000个单元测试要跑一个多小时，我非常诧异，怎么会这么慢？对方说：我们全用powermock……我们的企业版就是帮助这些Maven项目优化——所以如果Maven这个缺点没了，我们就没业务了。

Gradle的优点：

其实是脚本语言的优点，足够灵活，但是这个灵活是不是优点呢……不同的人看法相差很大，自由不是免费的，你接受了自由，就要付出代价。

Gradle的缺点：

  * 庞大臃肿，冷启动一下太慢；概念繁多复杂，学习曲线陡峭。这个不用多说，用过的人都知道，我们定期去twitter上搜一下对Gradle的吐槽，就知道，哦，Gradle现在还没过时，毕竟这个世界上只有两种XX，一种是没人用的，一种是被人骂的不是。
  * 变化太快，社区跟不上。其实Gradle的新功能都不是空穴来风，我们有些重要客户在内部广泛使用Gradle，会定期和我们反馈问题和需求。脚步太快造成社区措手不及，新功能只有那么几家会使用。

技术选型从来不是“谁比谁好”的问题，而是综合团队现状进行的综合决策。我的团队里绝大多数人都是老年人，用Maven溜的一逼，那就Maven；我的团队里多数都是有技术热情的新人，学啥不是学，那就可以尝试Gradle；诸如此类。现阶段，我想不到哪个需求一定要Gradle或者一定要Maven才能完成。

  

* * *

2020年6月，Spring Boot团队宣布将他们的build迁移到了Gradle：

[https://spring.io/blog/2020/06/08/migrating-spring-boot-s-build-to-
gradle](https://link.zhihu.com/?target=https%3A//spring.io/blog/2020/06/08/migrating-
spring-boot-s-build-to-gradle)