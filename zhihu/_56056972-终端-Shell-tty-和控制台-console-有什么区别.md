---
comments: true
created: '2015-07-22T23:06:42'
draft: true
modified: '2015-07-22T23:10:07'
source: https://www.zhihu.com/question/21711307/answer/56056972
title: 终端、Shell、tty 和控制台（console）有什么区别？
type: archive-web
---

今天有个知友纠正了我这个概念，并推荐了一个StackChange上的回答（最高票那个）。这个问题很有意思，于是翻译了这个国外网友的解答，希望有所帮助。

原文地址：

[What is the exact difference between a 'terminal', a 'shell', a 'tty' and a
'console'?](https://link.zhihu.com/?target=http%3A//unix.stackexchange.com/questions/4126/what-
is-the-exact-difference-between-a-terminal-a-shell-a-tty-and-a-con)

翻译

[@蔡诚毅](https://www.zhihu.com/people/11e0d008950d505c20d4983d8024a384)

转载时请保留原文地址和此行。

——————————————————————————————————————

terminal（终端）——指电线的末端，shell——指乌龟的壳，而tty——是一个奇怪的缩写。然后是console——一种机柜。

嗯，这只是词源上的意思。

在UNIX的术语中，最简单的回答是：

终端（terminal）=tty=文本的输入输出环境

控制台（console）=物理终端

shell=命令行解释器

控制台，终端和tty是密切相关的。原本它们都表示一台可以和计算机交互的设备：在UNIX的早期阶段，此类设备大多指电传机器（像一台打字机一样），这种设备有时也叫做电传打字机，缩写为TTY。“终端”（terminal）这个名字是从电子的观点来看的，而“控制台”是从设备的角度来看的。在UNIX历史的极早期阶段，电子键盘和显示器就已经是一种规范的终端。

在UNIX术语中，tty是一种特殊的设备文件，它在read和write之外还实现了一些特殊的命令（ioctls）。通常意义上terminal是tty的代名词。有的tty由（软件）内核来代替硬件设备，比如从键盘发送过来的input，以及发送到文本模式的屏幕上的output，或者在串行线上传输的input/output流。还有一种tty——有时候叫做伪tty（pseudo-
ttys）的，它是由叫做”终端模拟器“的程序提供的（通过一个中间层），这种tty例如Xterm（运行在X
window系统上），Screen（在一个程序和另一个终端之间提供了中间层），SSH（在另一台电脑上，通过程序连接另一台点奥上的终端），Expect（用脚本和终端交互）之类。

"terminal"这个词通常也有一个更加传统的意思，表示一台能够用来和电脑交互的设备——通常有显示器和键盘。比如一个X
terminal（一种瘦客户机——一种特殊用途的计算机），它唯一的作用就是驱动键盘，显示器，鼠标，（偶尔还有）别的外围交互设备；而实际上程序是泡在另外一台更加强大的计算机上的。

Console通常的物理意义上是通过一些手段直接连到机器上的主终端（primary
teminal），在一些操作系统（比如Linux和FreeBSD）上console一般有好几个tty（用特定的组合键能够在这些tty之间切换）。有时候这些命名让人混乱，比如操作系统可能把那些tty叫做”console“
”virtual console“ ”virtual terminal“之类的。

那么，既然说一个虚拟终端是”虚拟（virtual）”的，什么又是“真的”终端？

shell，作为用户登录系统时看到的主界面，它主要的用处就是启动别的程序。（我不确定原来的比喻义是指shell是用户的home环境，还是说shell是其他程序在里面跑的环境）

在UNIX圈里，shell 特指命令行shell（并且围绕这这样的描述：
“输入你想要运行的应用的额名字，后面跟着文件或者其他的、应用程序应该据此作出调整的东西（翻译：就是参数啦） ，并按回车键。”）
其他类型的环境并不使用“shell”这个词，比如说窗口系统涉及了”窗口管理器“(window managers) 和”桌面环境“(desktop
environments)，但并不使用”shell“这个词。

UNIX shell有很多，比较流行的交互式shell包括bash（大多数Linux发行版的默认选择） zsh（重视功能和可定制性）
还有fish（以简单为主旨）。

命令行shell包括了用来组合命令的流程控制结构。除了在交互式提示符下输入命令外，用户还可以编写脚本。大多数shell都有一套共同的语法（基于Bourne
shell）。当我们讨论”shell编程”时，shell几乎都指Bourne风格的shell。有的shell经常用来运行脚本，但缺少足够的交互功能（比如说Korn
shell——ksh，以及ash的许多变种）。 几乎所有的UNIX-like操作系统都有一个Bourne风格的shell（路径一般是/bin/sh）——而且
不是ash ksh 就是bash。

在UNIX系统管理中，一个用户的shell是那个在登录的时候被调用的程序。普通用户账户也拥有命令行shell，受限的用户（比如仅用于传输文件的账户）可能拥有一个受限的shell，或者只能运行特定命令的shell。

终端和shell之间的分工并不是很明显，下面是它们的主要工作：

输入：终端把键盘操作转换成控制序列（比如Left 转换为 \e[D）。shell再转换控制序列成为命令（比如\e[D 转换为后退字符）。在行编辑（line
editon）中，输入历史和输入补全功能是shell提供的。

终端有时候会在它自己的行编辑功能中提供输入历史和输入补全功能，并且在命令要执行时通过line发送到shell中。唯一这样做的主流terminal就是Emacs里的M-x。

输出：shell发出指令，比如说“display 某某” “切换前景色位绿色” “把光标移动到下一行”之类。而终端就响应这些指令。

命令提示符是纯粹的shell概念。

shell永远开不到它所运行的命令的输出（除非重定向），输出历史（回滚）仅仅是个终端上的概念。

应用程序之间的复制粘贴是由终端提供的（通常用鼠标，或者组合键，比如Ctrl+SHift+V 或Shift+Insert）。
Shell可能有它自己的内部复制粘贴机制（比如Meta+Y，Ctrl+Y）。

作业控制（在后台启动程序，并且管理这些程序）主要是由shell执行。不过，是由终端来处理组合键的（比如Ctrl+C
杀死前台程序，或者Ctrl+Z终止任务运行）。

（完）