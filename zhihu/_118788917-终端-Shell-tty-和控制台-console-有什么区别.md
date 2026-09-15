---
comments: true
created: '2016-08-25T10:39:31'
draft: true
modified: '2018-03-08T13:52:38'
source: https://www.zhihu.com/question/21711307/answer/118788917
title: 终端、Shell、tty 和控制台（console）有什么区别？
type: archive-web
---

在早期的电脑上，往往具有带有大量开关和指示灯的面板，可以对电脑进行一些底层的操作，这个面板就叫做Console。其概念来自于管风琴的控制台。一台电脑通常只能有一个Console，很多时候是电脑主机的一部分，和CPU共享一个机柜。

![](https://picx.zhimg.com/50/fdf373133d7141012666d60af6bf24e8_720w.jpg?source=2c26e567)

  

一台大型主机往往需要支持许多用户同时使用，每个用户所使用操作的设备，就叫做Terminal——终端，终端使用通信电缆与电脑主机连接，甚至可以通过电信网络（电话、电报线路等等）连接另一个城市的电脑。
照片来自：[带你逛西雅图活电脑博物馆（五） - 古董电脑室 - 知乎专栏](https://zhuanlan.zhihu.com/p/21895357)

![](https://pica.zhimg.com/50/419d4cef5c7f9269dc7118ea2ac408b8_720w.jpg?source=2c26e567)

TTY是电传打字机Teletypewriter的缩写，在上图中的那种带显示屏的视频终端出现之前，TTY是最流行的终端设备。照片来自：[带你逛西雅图活电脑博物馆（一）
- 古董电脑室 - 知乎专栏](https://zhuanlan.zhihu.com/p/21767308)

![](https://pic1.zhimg.com/50/6bf3b0fedcdfc4a0d0add6b7f5627b3c_720w.jpg?source=2c26e567)

  

Shell不是硬件，而是软件，是操作系统的操作界面，Windows
3.x可以看做是DOS的Shell，[http://command.com](https://link.zhihu.com/?target=http%3A//command.com)
也是DOS的shell。

思考题：下面红框里的设备是Console还是Terminal？

![](https://picx.zhimg.com/50/dc135d31dfcb2b813c43c83eef86a46e_720w.jpg?source=2c26e567)

  

答案公布：是Console，上面有显示寄存器状态的指示灯和直接操作寄存器的开关，而且它与电脑主机紧密结合，无法远程操作。