---
comments: true
created: '1970-01-01T08:00:00'
draft: true
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/84614845
title: 海明码、汉明码(Hamming Code)  汇总
type: archive-web
---

> In telecommunication, Hamming codes are a family of linear error-correcting
> codes that generalize the Hamming(7,4)-code, and were invented by Richard
> Hamming in 1950. Hamming codes can **detect up to two-bit errors** or
> **correct one-bit errors** without detection of uncorrected errors. By
> contrast, the simple parity code cannot correct errors, and can detect only
> an odd number of bits in error.  
>  
> 汉明码（Hamming
> Code），是在电信领域的一种线性调试码，以发明者理查德·卫斯里·汉明的名字命名。汉明码在传输的消息流中插入验证码，当计算机存储或移动数据时，可能会产生数据位错误，以**侦测并更正单一比特错误**
> 。由于汉明编码简单，它们被广泛应用于内存（RAM）。

海明码（Hamming
Code）是一个可以有多个校验位，具有检测并纠正一位错误代码的纠错码，所以也仅用于信道特性比较好的环境中，如以太局域网。它的检错、纠错基本思想如下：

（1）将有效信息按某种规律分成若干组，每组安排一个校验位通过异或运算进行校验，得出具体的校验码

（2）在接收端同样通过异或运算看各组校验结果是否正确，并观察出错的校校组，或者多个出错的校验组的共同校验位，得出具体的出错比特位

（3）对错误位取反来将其纠正

  

在接收端通过纠错译码自动纠正传输中的差错来实现码纠错功能，称为前向纠错FEC。在数据链路中存在大量噪音时，FEC可以增加数据吞吐量。通过在传输码列中加入冗余位(也称纠错位)可以实现前向纠错。但这种方法比简单重传协议的成本要高。汉明码利用奇偶块机制降低了前向纠错的成本。

> The Hamming code is a FEC, which stands for: **Forward Error Correction**. A
> FEC is a system in which the data gets coded in a way that enables the
> detection and correction of errors in the data flow. That way the receiver’s
> errors can be solved. This makes the transmittance of quite reliable
> information in a simplex system possible.

  

在写编码步骤之前，先来熟悉几个表示符号：

![](https://pica.zhimg.com/v2-d46d3e1f8caf16f2377d61cab0502a0a_1440w.jpg)

海明码及数据位校验位对应表：

![](https://pic1.zhimg.com/v2-b0e55611e8fb01c246837114e5f5dc54_1440w.png)

如上图，校验码是所在位置在第 ![2^{n-1}](https://www.zhihu.com/equation?tex=2%5E%7Bn-1%7D)
的位置，当我们在表中填好校验位之后，剩下的数据位只要一次填写就行了。

  

在信息理论中，**Hamming Distance** 表示两个等长字符串在对应位置上不同字符的数目，我们以d(x,
y)表示字符串x和y之间的汉明距离。从另外一个方面看，**汉明距离** 度量了通过替换字符的方式将字符串x变成y所需要的最小的替换次数。

>  _# 举例说明以下字符串间的汉明距离为：_  
>  _" karolin" and "kathrin" is 3._  
> _" karolin" and "kerstin" is 3._  
> _1011101 and 1001001 is 2._  
> _2173896 and 2233796 is 3._

对于二进制串ａ和ｂ来说，汉明距离等于ａXORｂ中１的数目，我们又称其为**汉明权重** ，也叫做population
count或popcount。长度为ｎ的二进制字符串通过汉明距离构成了一个度量空间(metric space)，我们称其为汉明立方(Hamming
Cube)。

下图表示在hypercube中 0100→1001 (红色)的汉明距离是 3; 0110→1110 (蓝色)的汉明距离是 1

![](https://pic4.zhimg.com/v2-975b70723949664c95534daf5d74dcc1_1440w.jpg)

相关链接：

[我吃印度飞饼：软考-海明码-单位错-
冗余位数](https://zhuanlan.zhihu.com/p/84679719)[https://blog.csdn.net/lycb_gz/article/details/35976723](https://link.zhihu.com/?target=https%3A//blog.csdn.net/lycb_gz/article/details/35976723)[汉明码_百度百科](https://link.zhihu.com/?target=https%3A//baike.baidu.com/item/%25E6%25B1%2589%25E6%2598%258E%25E7%25A0%2581/3226749%3Ffr%3Daladdin)[想飞的鱼：计算机考研中的三种数据检错编码方式小结](https://zhuanlan.zhihu.com/p/21544800)[https://www.computing.dcu.ie/~humphrys/Notes/Networks/data.hamming.html](https://link.zhihu.com/?target=https%3A//www.computing.dcu.ie/~humphrys/Notes/Networks/data.hamming.html)