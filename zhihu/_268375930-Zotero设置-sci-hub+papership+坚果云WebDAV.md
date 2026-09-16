---
comments: true
created: '1970-01-01T08:00:00'
draft: true
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/268375930
title: Zotero设置（sci-hub+papership+坚果云WebDAV）
type: archive-web
---

**Zotero是开源的文献管理工具（免费），可以方便的收集（自动下载文献），组织，引用，和共享文献的工具。**

**目录**

**一、让Zotero直接获取文献（英文文献）**

**二、坚果云同步（目的是获得更大储存以及后续同步手机、平板端数据）**

**三、Papership同步**

**四、ZotFile插件**

文章所需软件下载地址

  1. Zotero软件：官方下载地址[1]

[Zotero | Downloads](https://link.zhihu.com/?target=https%3A//www.zotero.org/download/)

2\. 坚果云：官方下载地址[2]

[坚果云网盘下载|云盘下载|免费网盘云盘试用](https://link.zhihu.com/?target=https%3A//www.jianguoyun.com/s/downloads)

3\. Papership软件：适用于**iOS & iPadOS**，可在应用商店下载[3]

4\. Zoo for Zotero：适用于**Android** ，可在此下载[4]

[mickstar/Zoo-For-
Zotero](https://link.zhihu.com/?target=https%3A//github.com/mickstar/Zoo-For-
Zotero)

5\.
Zotfile[插件](https://link.zhihu.com/?target=http%3A//zotfile.com/)，用来保证pdf能同步成功的插件

[Advanced PDF management for
Zotero](https://link.zhihu.com/?target=http%3A//zotfile.com/)

6\. 另附Zotero在word中插入文献方法：感谢
[@johnmy](https://www.zhihu.com/people/268c1f41a479e6ee24a9c0969a06e188)
的文章，需要指出的是，插入引用索引后，后面的参考文献需要另起一行才能插入。就是该作者的第6、7部中，需要另起一行。

[johnmy：[Zotero]如何在Word中插入参考文献](https://zhuanlan.zhihu.com/p/62931860)

* * *

**一、让Zotero直接获取文献（英文文献）**

需要用到以下代码（复制代码记得包含大括号）

> {  
>  "name":"Sci-Hub",  
>  "method":"GET",  
>  "url":"[http://sci-hub.tw/](https://link.zhihu.com/?target=http%3A//sci-
> hub.st/){doi}",  
>  "mode":"html",  
>  "selector":"#pdf",  
>  "attribute":"src",  
>  "automatic":true  
> }

  1. Zotero首选项-高级-设置编辑器
  2. 找到extensions.zotero.findPDFs.resolvers，双击
  3. 在出现的对话框中，将上述代码粘贴于此，OK。（示例见下图）
  4. **特别注意** 可用的Sci-Hub域名有“[http://sci-hub.st](https://link.zhihu.com/?target=http%3A//sci-hub.st/)”，“[http://sci-hub.do](https://link.zhihu.com/?target=http%3A//sci-hub.do/)”（检测时间2020-11-04 20:33:23）。如果没有使用任何代理，由于网络环境问题，可能会有少部分从Sci-Hub下载的PDF出现损害的情况，这时你可以考虑将上述代码中的`https`改为`http`，或者更换其他可用的域名，情况可能会好转。

![](https://pic4.zhimg.com/v2-bcbdbbce51b54ff3dd26c83f11eed7d7_1440w.jpg)首选项-
高级-
设置编辑器![](https://pic4.zhimg.com/v2-97e07829af485f13fa5c9e445976b3bb_1440w.jpg)找到extensions.zotero.findPDFs.resolvers，双击![](https://pic4.zhimg.com/v2-4b74d2cbd7240fb2d93a08d3834f19b9_1440w.jpg)将代码粘贴于此

这样，在Zotero中通过文章doi号可以自动获得pdf格式的原文，很方便。实测英文文献基本都能找到。

**二、坚果云同步（目的是获得更大储存以及后续同步手机、平板端数据）**

Zotero自带300m云储存空间，需要zotero账号，那么我们可以通过webDAV获得更大的同步空间，那么就需要用到坚果云同步软件。

提示：Zotero最好吧同步文件放在c盘以外的盘中储存。以免电脑系统故障数据丢失。

![](https://pic3.zhimg.com/v2-c6b97952f708e57a3b9417bbbf47b68c_1440w.jpg)数据储存修改

接下来就是坚果云WebDAV设置[5]

[坚果云第三方应用授权WebDAV开启方法 | 坚果云帮助中心](https://link.zhihu.com/?target=https%3A//help.jianguoyun.com/%3Fp%3D2064)

设置好以后

![](https://pic1.zhimg.com/v2-8abd67c075c27d15e761767aed1ef4ae_1440w.jpg)首选项-
同步-文件同步-选webdav-填写相应的信息

这样我们就可以实时同步Zotero数据

**三、Papership同步**

  1. 下载papership - 设置 - zotero file hosting
  2. 填写坚果云WebDAV相关信息（示意图见下）

![](https://pic1.zhimg.com/v2-5329b173a1df3e35f7dcecdb1b338046_1440w.jpg)papership-
设置-zotero file
hosting![](https://pic3.zhimg.com/v2-0a75375a96d652b58f7ed53a88699188_1440w.jpg)填写坚果云WebDAV相关信息

**特别注意，** 在papership验证会出现验证**不成功**
，解决方法：打开坚果云官网，登录坚果云账号，在`zotero`文件夹新建空白的`lastsync.txt`文件，务必注意的是，必须使用坚果云**自带的新建文件工具**
来新建`lastsync.txt`文件，不能通过手动上传的方式。如下图所示[6]：

![](https://pic3.zhimg.com/v2-0f5276e44141348bbb2f34056add67de_1440w.jpg)来源青柠学术

**四、ZotFile插件**

Zotero插件管理您的附件：自动重命名，移动和附加PDF（或其他文件）到 Zotero项目，将您的 Zotero 中的 PDF
同步到您的（移动）PDF阅读器（例如 iPad，Android 平板电脑等），以及 提取 PDF 注释。

最后这一步很重要，因为上述**同步之后，可能会发现移动端只有条目，没有pdf文件。** 所以需要安装此插件

  1. 安装ZotFile插件
  2. Zotero顶部 - 工具 - ZotFile Reference下面设置

![](https://pic3.zhimg.com/v2-cea74297119040669be8cc0c19103fb0_1440w.jpg)选择插件![](https://pica.zhimg.com/v2-cfa1a8b04b908b45591fab93692bc01a_1440w.jpg)添加插件![](https://picx.zhimg.com/v2-4c494ab9b5ac8fccee6db92e8028ac35_1440w.jpg)设置插件![](https://pic2.zhimg.com/v2-ce5420e1bc37ca6ab02f4f9a24173ddd_1440w.jpg)设置路径

设置完毕。这样在移动端可以直接同步观看同步文件

![](https://pic1.zhimg.com/v2-d6a31d38514ca1e3bdb82c4bf9fea252_1440w.jpg)