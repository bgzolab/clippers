---
comments: true
created: '1970-01-01T08:00:00'
draft: true
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/52846071
title: 一键建站系列教程（宝塔面板+wordpress）
type: archive-web
---

## 前言：

>
> 手中有几台闲置VPS，闲来无事出个建站系列教程。主要受众群体是小白，希望让小白可以快速实现建站。本教程会介绍主流的LAMP建站，LNMP建站以及主流的面板（宝塔面板、WDCP面板、AMH面板、cpanel面板等）CMS（wordpress、dedecms、EmpireCMS、discuz等）以及一些小众建站系统（小说类、视频采集类），大家有什么想让我出个教程的CMS，都可以给我留言，我会抽时间给大家写出来。

## 准备工作：

建站少不了的就是**服务器** 和**域名** 这两个基本的东西，服务器用来放我们的网站和数据库，域名用来让别人能够正常访问我们的网站。

## 服务器

我这里的服务器用的是Vultr（[点击注册送25美元](https://link.zhihu.com/?target=https%3A//www.vultr.com/%3Fref%3D7584311)）的服务器，vultr支持支付宝和微信直接充值，简单方便。个人博客之类的网站建议选新加坡3.5美元套餐，或者日本5美元套餐，套餐足够用了，而且距离近速度很快。也可以用阿里云（[点击注册](https://link.zhihu.com/?target=https%3A//promotion.aliyun.com/ntms/yunparter/invite.html%3FuserCode%3Dd8k5l484)[一折购买服务器](https://link.zhihu.com/?target=https%3A//promotion.aliyun.com/ntms/act/jianzhanquan.html%3FuserCode%3Dd8k5l484)）的服务器，这个服务器可以直接绑定支付宝实名认证，简单方便。

## 域名

如果服务器选择的阿里云的服务器，建议域名直接在阿里云购买（[点击直达](https://link.zhihu.com/?target=https%3A//wanwang.aliyun.com/%3Fspm%3D5176.11425913.selected.4.68f4222a8MhwQ5)），买完之后按指引前往备案就行了。如果服务器是买的Vultr服务器，建议前往Godaddy（[点击直达](https://link.zhihu.com/?target=https%3A//sg.godaddy.com/zh/)）购买域名，godaddy的域名免备案，而且支持支付宝付款。

## 开始建站：

## 服务器系统准备

登陆vultr账户（[点击直达](https://link.zhihu.com/?target=https%3A//www.vultr.com/%3Fref%3D7324987)）。

选择最右侧加号（Deploy New Server）>

  1. **server location** （选择Tokyo【5美元套餐】或者Singapore【3.5美元套餐】，请勿选择任意2.5美元套餐，因为2.5美元套餐已经没有免费的IPV4地址分配了）
  2. **server type** （我这里选的是centos 7 64位【宝塔面板是基于centos7开发的，务必使用centos7.x 系统】）
  3. **server size** （我这里选的5美元套餐）
  4. **additional features** （不用选）
  5. **start script** （不用管）
  6. **SSH Keys** （不用管）
  7. **Server hostname & label** （这个是设置主机名字，不懂的不用管）>

点击【Deploy Now】 创建服务器。

## SSH登陆服务器

下载xshell（[点击下载](https://link.zhihu.com/?target=https%3A//www.netsarang.com/download/down_form.html%3Fcode%3D622)）或者putty（[点击下载](https://link.zhihu.com/?target=https%3A//www.putty.org/)）软件，通过SSH登陆服务器，服务器的IP和账号密码都在vultr的服务器详情里面，自行查看。

## 安装宝塔面板

SSH连接上我们的服务器之后，在命令行执行如下命令：

> yum install -y wget && wget -O install.sh
> [http://download.bt.cn/install/install_6.0.sh](https://link.zhihu.com/?target=http%3A//download.bt.cn/install/install_6.0.sh)
> && bash install.sh

其中需要选择的地方直接回车即可，实测vultr的服务器安装几分钟时间就安装完成了，还是很快的。

安装完成之后安装界面会显示出宝塔面板的链接地址、账号密码信息，如图：

  

![](https://pic2.zhimg.com/v2-a786b1bb63ed13c3fec13cde259128b3_1440w.jpg)

宝塔面板安装成功信息

宝塔面板安装完成后的一些默认位置：

> Nginx配置文件位置：/www/server/panel/vhost/nginx  
> apache配置文件位置：/www/server/panel/vhost/apache  
> 各组件安装位置：/www/server/  
> 站点默认位置：/www/wwwroot  
> 数据库备份文件位置：/www/backup/database  
> 站点备份文件位置：/www/backup/site  
> 站点日志位置：/www/wwwlogs

## 安装网站环境：

通过上面的面板地址、账号密码登陆面板。本次我们应用LNMP（LINUX、Nginx、Mysql、PHP）环境来配置网站，所以我们需要安装nginx、mysql、php，选择面板左侧的软件管理，依次安装nginx
1.14、mysql 5.7、php 7.2

  

![](https://pic1.zhimg.com/v2-4935fb610bba61cb009173660b086922_1440w.jpg)

宝塔面板主界面

都是一键点击安装，等待一段时间安装完成即可。

## 新建站点：

点击左侧【网站】，选择【添加站点】

  

![](https://pic4.zhimg.com/v2-15539ae913dab670bb7444dfde7e0f5b_1440w.jpg)

宝塔面板-添加站点

  

![](https://picx.zhimg.com/v2-2e198af6d9e1b0407f92e20b6c4b9a53_1440w.jpg)

站点配置界面

## 站点配置说明：

**域名**
：已购买的域名，例如哔哔小子网站设置：[www.bbxiaozi.com](https://link.zhihu.com/?target=http%3A//www.bbxiaozi.com/)

**备注** ：空着

**根目录** ：默认

**FTP** ：安全原因，不创建。

**数据库** ：mysql utf-8（账号密码生成）

**PHP版本** ：php 7.2

点击【提交】完成站点添加。

## 域名解析：

登陆你的域名控制台，在域名解析的地方，添加一条A记录到你的服务器IP地址。

下面我以阿里云解析为例做一个演示：

在管理控制台找到自己的域名，右侧选择解析，选择上面的添加解析，如图：

  

![](https://pica.zhimg.com/v2-677c6422923c9ef2990238b0758f247c_1440w.jpg)

阿里云域名添加解析

我们需要添加两个**A记录** ，如图：

  

![](https://pic3.zhimg.com/v2-1b3e8730fd1ce03d993261fb53941516_1440w.jpg)

阿里云-www记录解析详情

对照这个添加即可，把记录值改为你自己的IP地址，这条记录的意思是将访问[http://www.xxx.com](https://link.zhihu.com/?target=http%3A//www.xxx.com)的记录指向记录值所在的IP地址。例如：**哔哔小子**
网站设置 **[http://www.
bbxiaozi.com](https://link.zhihu.com/?target=http%3A//www.bbxiaozi.com)** 指向
**45.78.20.141**

  

![](https://pic3.zhimg.com/v2-50380f34540dc0cdc95e94dd8ccedff2_1440w.jpg)

阿里云-@记录解析详情

这条也将记录值修改为自己的IP地址，其他的不用变，这条记录是将[http://xxx.com](https://link.zhihu.com/?target=http%3A//xxx.com)的记录指向记录所在的IP地址，例如：**哔哔小子**
网站设置 **[http://
bbxiaozi.com](https://link.zhihu.com/?target=http%3A//bbxiaozi.com) **指向
**45.78.20.141**

添加解析后等待5分钟，访问你的域名，提示**站点创建成功** 即可。

## 安装wordpress：

访问wordpress官网【[点击直达](https://link.zhihu.com/?target=https%3A//cn.wordpress.org/)】

点击【获取wordpress】

  

![](https://pic4.zhimg.com/v2-8ab81e8a6ec3f567f4a6bb754842a0db_1440w.jpg)

下载wordpress

右键【下载.tar.gz】复制链接地址

回到宝塔面板

点击【网站】点击【网站目录】

  

![](https://pic4.zhimg.com/v2-c4a1632c78f711162e96d97d6dd554a3_1440w.jpg)

宝塔面板-添加站点

点击远程下载在【URL地址】处填入我们复制的wordpress安装包下载地址

  

![](https://pic4.zhimg.com/v2-c8c1db1e016c4bbb20f2820da4882aaf_1440w.jpg)

宝塔面板-远程下载wordpress

等待几分钟，wordpress安装包下载完成之后解压缩，解压缩之前**核对安装包** 是否已经**完全下载** ， _下载一半的安装包会提示解压失败_
，请重新完全下载。

## 配置站点：

点击左侧【网站】

点击右侧【设置】打开站点设置面板，如下图：

  

![](https://pic4.zhimg.com/v2-cf38ac95ca004aef269ab5a880ec3fdb_1440w.jpg)

宝塔面板-配置站点

点击【网站目录】然后点击后面的【文件夹图标】

  

![](https://pic3.zhimg.com/v2-9c44ec2f6df7f104130d0583299a4936_1440w.jpg)

宝塔面板-网站路径

选择刚刚解压的wordpress目录

  

![](https://pic3.zhimg.com/v2-871c38776399c2e249585e10d2246ee6_1440w.jpg)

宝塔面板-站点路径配置

选择，保存即可

## 创建站点：

访问你的域名，我这里用的是哔哔小子演示站[http://qydemo1.bbxiaozi.com](https://link.zhihu.com/?target=http%3A//qydemo1.bbxiaozi.com)，在浏览器中输入url访问，出现如图界面：

  

![](https://pic3.zhimg.com/v2-a4e620ef55137f0ccae875e1ef432516_1440w.jpg)

创建wordpress站点

点击【现在就开始！】

填写数据库信息：

  

![](https://pic4.zhimg.com/v2-9baaf671503bd3639db74323143a01af_1440w.jpg)

wordpress-数据库配置

数据库信息位置：

宝塔面板>数据库

**数据库名** ：填写你的数据库名

**用户名** ：填写你的用户名

**密码** ：填写你的密码

**数据库主机** ：默认即可

**表前缀** ：默认即可

填写完成之后点击**确定** ，**现在安装** 。

  

![](https://pica.zhimg.com/v2-b227b44401f15f924fe78abce06a1f14_1440w.jpg)

wordpress-站点配置

**站点标题** ：你的网站名字

**用户名** ：你的网站管理员账号（登录名）

**密码** ：设置成你的密码，或者就用这个生成的密码，要用生成的密码请记得将该密码复制到其他地方，防止后面无法登陆网站

**您的电子邮件** ：填写你的邮箱即可

点击**安装wordpress** 就安装好了！

> 教程就到这里啦，如果做网站过程中遇到什么困难，可以随时关注公众号【哔哔姬】或者留言，我会在第一时间给各位回复。