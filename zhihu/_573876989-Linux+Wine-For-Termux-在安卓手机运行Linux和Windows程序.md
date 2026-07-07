---
comments: true
created: '1970-01-01T08:00:00'
draft: true
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/573876989
title: Linux+Wine For Termux:在安卓手机运行Linux和Windows程序
type: archive-web
---

下载链接：

123 网盘：[https://www.123pan.com/s/XjkKVv-
aR9Uv](https://link.zhihu.com/?target=https%3A//www.123pan.com/s/XjkKVv-aR9Uv)

百度:
[https://pan.baidu.com/s/10ZUOk5M5-1JSRzUpzPMyRw](https://link.zhihu.com/?target=https%3A//pan.baidu.com/s/10ZUOk5M5-1JSRzUpzPMyRw)
提取码: bn16

![](https://pic2.zhimg.com/v2-fe03b14615a28e345536ceb4a8361f75_1440w.jpg)![](https://pic4.zhimg.com/v2-347f06c1586051f0ad031b66b5d0d653_1440w.jpg)![](https://pic2.zhimg.com/v2-208260c4f3cd166f70067a53d6ce51d7_1440w.jpg)![](https://pica.zhimg.com/v2-77afe52748197f17a14ad974533b054e_1440w.jpg)![](https://pica.zhimg.com/v2-ca763b91aa9acd5588c9842b417a929a_1440w.jpg)

安装方法：

安装我提供的termux并受与访问存储权限，把wineandlinuxfortermux.tar.xz放在内部存储的根目录。

打开termux，输入指令

    
    
    cd .. ; tar xvpf /sdcard/wineandlinuxfortermux.tar.xz

回车等待指令执行完成。之后重启termux，vnc登入127.0.0.1即可看到图形界面

  

食用方法：

使用Linux程序：

打开terminal，执行指令linux。

之后就可以通过apt安装Linux软件，通过指令启动Linux软件。

  

使用Windows程序：

我一共提供了4个版本的Wine，注意不同版本的wine需要指定不同的wineprefix，使用它们同样需要在Terminal执行指令。使用它们的指令分别是：

    
    
    wine-arm64 start /unix exe路径
    wine-x86 start /unix exe路径
    wine-x86-box86 start /unix exe路径
    wine-x64 start /unix exe路径

exe文件的路径可以通过从文件管理拖动文件到terminal得到。exe文件需要放在主目录。

其中，

wine-arm64专门运行为Windows on ARM专门开发的软件。

wine-x86 wine-x86-box86 wine-x64都用来运行普通电脑上运行的Winodws软件。

wine-x64兼容性最好，且兼容32和64位的Win软件，但是速度最慢。

wine-x86 只兼容32位软件，对32位软件的兼容性较好，速度一般。

wine-x86-box86 只兼容32位软件，兼容性较差，但是速度很快。