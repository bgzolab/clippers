---
comments: true
created: '1970-01-01T08:00:00'
draft: true
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/141107518
title: Ubuntu下对deepin-wine的使用详解
type: archive-web
---

大概是18年那会儿吧，在github上看到了[星外之神（wszqkzqk）](https://link.zhihu.com/?target=https%3A//github.com/wszqkzqk)的[deepin-
wine-
ubuntu](https://link.zhihu.com/?target=https%3A//github.com/wszqkzqk/deepin-
wine-ubuntu)项目，第一次在非deepin的Linux系统上用上了可以稳定运行运行的QQ和微信，顿时就深感快乐。

但是眼看着deepin的wine软件仓库几年没有更新，恰逢之前Tim3.0的更新也确实吸引到了我，于是想尽一切办法试图在Linux下用上最新版的Tim。听说aur有最新版的deepin-
wine-tim以后，我头也不回的安装了arch
linux，也确实用上了一段时间。但是Ubuntu几年用下来的习惯不时地促使着我回到Ubuntu的怀抱，于是就有了今天的这篇文章。

**先展示一下我的系统环境，我用的是kubuntu 20.04 LTS，其他的Ubuntu版本同样通用，理论兼容Linux
Mint，所用的配置方法理论适用于所有Linux。**

![](https://pic3.zhimg.com/v2-657ffd437012e0e8969f84a65205b3ca_1440w.jpg)
CPU是辣鸡的6代i5，内存配那么大是为了跑Aosp

首先，肯定是安装deepin-
wine了，通过[星外之神（wszqkzqk）](https://link.zhihu.com/?target=https%3A//github.com/wszqkzqk)的[deepin-
wine-
ubuntu](https://link.zhihu.com/?target=https%3A//github.com/wszqkzqk/deepin-
wine-ubuntu)项目首先自行安装deepin-wine以及Tim和微信，然后我们开始更新他们。

安装的时候补充几个注意点

  * 直接双击deb安装会报依赖错误，我们可以通过dpkg安装

    
    
    sudo dpkg -i xxx.deb

  * 微信不能发图片要安装libjpeg62:i386

    
    
    sudo apt-get install libjpeg62:i386

  * 之前在贴吧看到kubuntu 20.04 lts使用deepin-wine所有软件闪退是**谣言** ，其实是**非gnome系** （比如我用的kde）桌面环境缺了一个**gnome-settings-daemon** 的组件，可以通过如下命令安装。

    
    
    sudo apt-get install gnome-settings-daemon

## 文中牵扯到的simsun.ttc和msyh都提取自Windows系统，有版权问题，因此不提供各位下载，各位可以去网上搜索或者自行提取。

## 我们先来更新Tim和微信

我这里以Tim为例，微信同理。

先下载最新版的Tim、微信，并且cd到对应的路径下。

    
    
    env WINEPREFIX=~/.deepinwine/Deepin-TIM deepin-wine TIM3.0.0.21315.exe

  * TIM3.0.0.21315.exe只是截止本文写作时间时的最新Tim安装包，可以指定别的版本。
  * `~/.deepinwine/Deepin-TIM`是deepin-wine下**Tim的路径** ，微信的路径为`~/.deepinwine/Deepin-WeChat`

然后会弹出安装界面，此时的安装界面可能会出现字体乱码、色块变色等问题，请根据自己的经验猜测各个按钮的所在位置（其实也不难）

安装完成后，我们退出Tim，处理字体的问题。

打开`~/.deepinwine/Deepin-TIM/drive_c/windows/Fonts/`
路径，这个路径相当于Windows下C盘的字体路径，我们需要在这里添加中文字体。

如果Tim无法接收图片，可以尝试禁用ipv6: [IPv6 普及尚早，如何在 Ubuntu 系统中禁用 IPv6
协议](https://link.zhihu.com/?target=https%3A//www.sysgeek.cn/ubuntu-disable-
ipv6/)

## QQ音乐

很早就在deepin论坛上看到
[gorquan](https://link.zhihu.com/?target=https%3A//github.com/gorquan)大佬打包了deepin-
wine的[QQ音乐的deb包](https://link.zhihu.com/?target=https%3A//github.com/gorquan/QQMusic/raw/master/deepin.com.qq.qqmusic_2.0.0deepin4_i386.deb)**（
<-点我下载）**，同样也可以通过安装deepin-wine以后通过dpkg安装。

    
    
    sudo dpkg -i deepin.com.qq.qqmusic_2.0.0deepin4_i386.deb

去官网下载最新的exe安装包，同样是

    
    
    env WINEPREFIX=~/.deepinwine/Deepin-QQMusic deepin-wine QQMusic_YQQFullStack.exe 

接着我们处理图标乱码和字体问题。

编辑`/opt/deepinwine/apps/Deepin-QQMusic/run.sh`

加入以下代码（如图）

    
    
    export LC_CTYPE='en_US.UTF-8'

![](https://pic2.zhimg.com/v2-49640ebab2fb0140f4dac0c834346e8b_1440w.jpg)kate编辑器还是舒服的呀

同时，到`/home/zhullyb/.deepinwine/Deepin-
QQMusic/drive_c/windows/Fonts/`路径下添加`simsun.ttc`

退出并重启软件即可

## 添加无人打包的第三方软件（以钉钉为例）

首先，你得确定你的容器所在的路径，一般就是`~/.deepinwine/Deepin-XXX`

我这里用的路径为`~/.deepinwine/Deepin-DingTalk/`

首先执行以下命令以配置deepin-wine

    
    
     WINEARCH=win32 WINEPEFIX=～/.deepinwine/Deepin-DingTalk deepin-wine winecfg

由于有大佬帮我踩过钉钉的坑，所以我这里知道需要添加三个dl——`msvcp60`、`riched20`、`riched32`

我用的deepin-wine是老版的，还是纯英文的配置界面。。。

![](https://picx.zhimg.com/v2-337a4d35558a30edde77249046b6ff17_1440w.jpg)

接着通过deepin-wine调出安装界面

    
    
    env WINEPREFIX=~/.deepinwine/Deepin-DingTalk deepin-wine DingTalk_v5.1.1.18.exe

安装完成后，参考上文对QQ音乐的配置方法修复字体和图标的乱码，打开钉钉后会发现钉钉默认语言是英文。我们去钉钉自带的设置中将默认语言调为简体中文并在设置中打开SVG支持。

![](https://pica.zhimg.com/v2-68deed420b823652daf7333d3d0556f0_1440w.jpg)

退出后，你会发现桌面上没有响应的图标。。。

没错，这又是一个大坑。。。

我们需要自己配置应用启动项。。。

一共是两处地方，`/opt/deepinwine/apps/Deepin-DingTalk`和`/usr/share`

具体的实现方法我们可以通过解包并修改一个[由deepin-
wine官方打包的QQ](https://link.zhihu.com/?target=https%3A//mirrors.aliyun.com/deepin/pool/non-
free/d/deepin.com.qq.im/)**（ <-点我下载）**来实现。具体的修改我在此不过多赘述，在文末奉上我自己修改的一份Deepin-
DingTalk供各位参考。修改过后，只要用sudo权限将对应的文件移入相应路径即可。

如果想要打包成deb包，可以参考[这篇博客](https://link.zhihu.com/?target=https%3A//pjep.cn/jiaocheng/186.html)

[DingTalk配置文件](https://link.zhihu.com/?target=https%3A//gitee.com/zhullyb/bin/raw/master/Deepin-
Dingtalk-config-files.tar.gz)**（ <-点我下载）**

  

**参考资料：**

[星外之神/deepin-wine-for-
ubuntu](https://link.zhihu.com/?target=https%3A//gitee.com/wszqkzqk/deepin-
wine-for-ubuntu)[deepin-wine创建32位容器 -
陌尘小筑](https://link.zhihu.com/?target=https%3A//pjep.cn/jiaocheng/183.html)[QQ音乐，deepinwine版乱码解决方法-
深度科技论坛|深度操作系统正在为全世界的电脑提供强劲动力！](https://link.zhihu.com/?target=https%3A//bbs.deepin.org/forum.php%3Fmod%3Dviewthread%26tid%3D190698)[Tim更新3.0了。-深度科技论坛|深度操作系统正在为全世界的电脑提供强劲动力！](https://link.zhihu.com/?target=https%3A//bbs.deepin.org/forum.php%3Fmod%3Dviewthread%26tid%3D190203)[使用Deepin-
wine安装QQ微信等并解决字体问题/ELEMENTARY
OS上手5](https://link.zhihu.com/?target=http%3A//www.mustenaka.cn/index.php/2019/07/16/elementaryos5/)[ArchWiki](https://link.zhihu.com/?target=https%3A//wiki.archlinux.org/index.php/Tencent_QQ_%28%25E7%25AE%2580%25E4%25BD%2593%25E4%25B8%25AD%25E6%2596%2587%29%23Deepin_QQ/TIM)