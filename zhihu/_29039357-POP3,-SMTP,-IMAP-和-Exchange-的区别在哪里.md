---
comments: true
created: '2014-08-11T01:25:08'
draft: true
modified: '2014-08-11T01:25:08'
source: https://www.zhihu.com/question/24605584/answer/29039357
title: POP3, SMTP, IMAP 和 Exchange 的区别在哪里？
type: archive-web
---

SMTP, POP3, IMAP 都是mail server上的service

![](https://picx.zhimg.com/50/5704e975b2da8859778e59bb1fb6a307_720w.jpg?source=2c26e567)  

简单地说，SMTP管‘发’， POP3/IMAP管‘收’。

举个例子，你坐在电脑边用mail client写完邮件，点击‘发送’。这时你的mail client会发消息给邮件服务器上的SMTP
service。这时有两种情况：

  1. 如果邮件的收信人也是处于同一个domain，比如从[http://163.com](https://link.zhihu.com/?target=http%3A//163.com)发送给163的邮箱，SMTP service只需要转给local的POP3 Service即可  

  2. 如果邮件收信人是另外的domain，比如[http://163.com](https://link.zhihu.com/?target=http%3A//163.com)发送给[http://sina.com](https://link.zhihu.com/?target=http%3A//sina.com)， SMTP service需要通过询问DNS, 找到属于sina的SMTP service的host

SMTP service收到邮件后转给负责接收邮件的POP3 service

POP3 service和IMAP的区别主要是：

  * POP3是比较老的protocol，主要为了解决本地机器和远程邮件服务器链接的问题，每次邮件会download到本地机器，然后从远程邮件服务器上删掉（当然特殊config除外），然后进行本地编辑。这样的问题是如果从多个终端链接服务器，只有第一个下载的能看到，现在pop4正在讨论中  

  * IMAP是比较新的（好吧，好像也是80年代的产物）protocol，可以将邮件分文件夹整理，然后这些信息也存在远程的邮件服务器上，读取邮件后，服务器上不删除。原理上IMAP应该是相当于oneline编辑，但现在的mail client基本都有在本地存copy的功能

Exchange主要是MS自己的一套东东