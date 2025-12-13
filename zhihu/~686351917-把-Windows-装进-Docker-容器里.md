---
comments: true
created: '1970-01-01T08:00:00'
draft: true
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/686351917
title: 把 Windows 装进 Docker 容器里
type: archive-web
---

本篇文章聊聊如何在 Docker 里运行 Windows 操作系统， Windows in Docker Container（WinD）。

## **写在前面**

我日常使用 macOS 和 Ubuntu 来学习和工作，但是时不时会有 Windows
使用的场景，不论是运行某个指定的软件，还是要做一些跨平台软件的功能验证。

在去年开源 **[soulteary/docker-
chatgpt[1]](https://link.zhihu.com/?target=https%3A//github.com/soulteary/docker-
chatgpt)** 之前，还折腾过将 Chrome 容器化，提供有界面服务能力容器的事情，如果当时有这个方案，或许折腾过程能更简单一些。

## **环境准备**

我们依旧是先从环境准备开始。想要使用这个方案，我们需要准备的东西有三个：安装了 Docker 的操作系统（我使用 Ubuntu）、Windows
操作系统的安装光盘（从 WinXP ～ Win11 都行）、开源项目
**[dockur/windows[2]](https://link.zhihu.com/?target=https%3A//github.com/dockur/windows)**
的 Docker 镜像。

### **安装 Ubuntu 操作系统和 Docker**

这套方案中采用了 KVM 加速，所以体验最好的方案是使用或者安装一个 Linux 环境，如果你本身就在使用 Ubuntu 之类的支持 KVM
非常方便的操作系统的话，那么只需要安装 Docker 就好啦。

如果你确实需要在容器中运行 Windows，想从零开始，可以参考之前的文章《**[在笔记本上搭建高性价比的 Linux
学习环境：基础篇[3]](https://link.zhihu.com/?target=https%3A//soulteary.com/2022/06/21/building-
a-cost-effective-linux-learning-environment-on-a-laptop-the-basics.html)**
》的方法来进行实践。安装 Ubuntu 的流程和以往并没有太大不同，依旧是老生常谈的三步曲：下载镜像、制作启动盘、安装系统。

如果你已经有了可以使用的 Linux 环境，可以参考上面文章中的 “更简单的 Docker 安装” 章节，完成基础环境的准备。

完成操作系统和 Docker 的准备后，我们还需要检查操作系统是否支持 KVM，需要先安装 `cpu-checker`。

    
    
    sudo apt install cpu-checker -y

然后，执行 `kvm-ok`，顺利的话，将能够看到类似下面的日志输出：

    
    
    # sudo kvm-ok
    INFO: /dev/kvm exists
    KVM acceleration can be used

### **获取 WIndows 操作系统光盘**

虽然开源项目
**[dockur/windows[4]](https://link.zhihu.com/?target=https%3A//github.com/dockur/windows)**
会根据用户指令，从 `dl.bobpony.com`
、`archive.org`，以及微软官网自动下载合适的英文版系统镜像，但如果你想更快的完成系统的安装，或者想快速的启动多个 Windows Docker
容器，那么手动下载 Windows 光盘还是非常有必要的。

开源项目包含了一些自动安装的预设配置，不过，这需要使用英文版的操作系统，你可以从**[这里下载[5]](https://link.zhihu.com/?target=https%3A//www.microsoft.com/en-
us/software-download/windows11)** 。

当然，如果你需要使用中文版的操作系统，同样可以从**[官方下载[6]](https://link.zhihu.com/?target=https%3A//www.microsoft.com/zh-
cn/software-download/windows11)** ，在初始化操作系统的时候，相比英文操作系统你需要额外点一些“下一步”。

### **获取 Windows in Docker 容器镜像**

获取在 Docker 中运行 Windows 的容器镜像很简单：

    
    
    docker pull dockurr/windows

当然，如果不能够直接下载，也可以选择本地构建：

    
    
    git clone https://github.com/dockur/windows.git
    cd windows
    docker build -t dockurr/windows .

这个镜像主要依赖了几项技术：

  * **[qemus/qemu-docker[7]](https://link.zhihu.com/?target=https%3A//github.com/qemus/qemu-docker)** ，在容器中使用 QEMU，能够提供接近本机速度的虚拟机的网络、IO 速度等。
  * **[christgau/wsdd[8]](https://link.zhihu.com/?target=https%3A//github.com/christgau/wsdd)** ，让容器中的 Windows 能够出现在局域网中的其他设备的共享设备中。（Windows 10 的 1511 版本后，默认开始禁用 SMBv1，NetBIOS 设备发现功能失效，导致其他设备不能对其进行服务发现）。
  * **[qemus/virtiso[9]](https://link.zhihu.com/?target=https%3A//github.com/qemus/virtiso)** ，精简到 27MB 的 KVM/QEMU Virtio 驱动程序，能够让 Windows 在 Docker 环境中正常使用。
  * **[krallin/tini[10]](https://link.zhihu.com/?target=https%3A//github.com/krallin/tini)** ，正确启动 Docker 中 QEMU，以及确保进程异常能够被正确处理，或正确的终止容器进程。

好了，准备工作就绪后，我们就可以开始使用这个有趣的技术方案啦。

## **基础使用**

我们先聊聊最简单的使用方案，启动一个“无状态”的临时的 Windows 操作系统，容器会自动下载我们所需要的镜像：

    
    
    version: "3"
    services:
      windows:
        image: dockurr/windows
        container_name: windows
        devices:
          - /dev/kvm
        cap_add:
          - NET_ADMIN
        ports:
          - 8006:8006
          - 3389:3389/tcp
          - 3389:3389/udp
        stop_grace_period: 2m
        restart: on-failure

将上面的配置保存为 `docker-compose.yml`，然后使用 `docker compose up` 或 `docker compose -d`
启动服务。

因为我们没有指定本地的镜像，所以如果你的网络环境访问微软 CDN 不够快的话，启动过程需要等待一些时间。

    
    
    # docker compose up     
    [+] Running 2/1
     ✔ Network win_default  Created                                                                                                                                                     0.1s 
     ✔ Container windows    Created                                                                                                                                                     0.1s 
    Attaching to windows
    windows  | ❯ Starting Windows for Docker v2.04...
    windows  | ❯ For support visit https://github.com/dockur/windows
    windows  | 
    windows  | 
    windows  | ❯ Downloading Windows 11...
    windows  | [i] Downloading Windows media from official Microsoft servers...
    windows  | [i] Downloading Windows 11...
    windows  | [+] Got latest ISO download link (valid for 24 hours): https://software.download.prss.microsoft.com/dbazure/Win11_23H2_English_x64v2.iso?t=c603adeb-c6d7-4bb9-b084-875f3beabfc2&P1=1710146067&P2=601&P3=2&P4=ynPQkgNxZoZxQkmfORJRE5yaf94m7ONuLVngMtHmDfsYTooFKSXiAdWXTKJ8dpoF2WuDkUZ4fkP1u%2bhwAh%2brAdghU%2f1ssngioKg2aLDe2UXOG3ESUAGTyRk1q515ONoXIvyJby2xPoKBVoj%2bsNp6ECqosBjx9HllmF3saRvQFPQox6v8kuhtMxyuNiXT%2fYgKppSZOifx34t6YQb0Hpo6gTkLjxlxiFBF42jLt%2blVhf1HW7ELEtvVUW7eAn9UGfs9HF6yC3p1ep7ouKYNrY0Ek0fo%2bn2v%2by3bTGbqg8lHfXjxb6bPHGE6HWP3sSZDZw4JmPt53hr1uQl%2fmjT50p504Q%3
    windows  | #=#=#                                                                          
                                                                               windows  | #=#=#                                                                          
                                                                               0.0%
                                                                               0.1%
                                                                               0.2%
                                                                               0.3%
    ...
    #######################################################################   99.7%
    #######################################################################   99.8%
    #######################################################################  100.0%
    ######################################################################## 100.0%
    
    windows  | 
    windows  | [+] Successfully downloaded Windows image!
    windows  | 
    windows  | ❯ Extracting Windows 11 image...
    windows  | ❯ Adding XML file for automatic installation...
    windows  | ❯ Building Windows 11 image...
    windows  | ❯ Creating a 64G growable disk image in raw format...
    windows  | ❯ Booting Windows using QEMU emulator version 8.2.1 ...
    windows  | 
    ...

当一切就绪后，我们可以使用两个方式来访问这个运行在 Docker 中的 Windows。

第一种方法，是使用浏览器访问容器所在主机的 `IP地址:8006`。

![](https://pic1.zhimg.com/v2-35abfa98c98ed48fe4342dd23e920646_1440w.jpg)在容器中自动部署的
Windows

容器启动后，会自动下载、部署 Windows，稍等片刻，就能够在浏览器中正常使用它啦：

![](https://pic4.zhimg.com/v2-c974ed5cd28781576ef9d0f70ec2787f_1440w.jpg)在浏览器中访问
Windows

第二种方法，是使用支持 RDP 远程访问功能的软件，在软件服务器地址和端口内容中分别填写 `IP地址` 和 `3389`，在用户名栏填写
`docker`，密码保持空白即可。

![](https://pic1.zhimg.com/v2-8fb663c4f64b77df60e0142152f0c870_1440w.jpg)在 RDP
客户端中访问 Windows

## **加速使用 Windows 容器**

![](https://picx.zhimg.com/v2-fd0ac9ea8293e73f1602164d05186831_1440w.jpg)
默认情况，每次启动都需要见到它

当然，如果你的网络环境不是那么好，或者你不想每次启动容器都要等待很久，可以使用下面的方法。

让部署使用加速，主要和两个细节有关：是否进行了容器内容的持久化，是否提供了高性能的安装镜像下载方式。

比如，我们在上面的准备工作中，我们预先下载好 Windows 的安装镜像，然后将文件重命名为 `win11x64.iso`，接着将文件放置在目录的
`./iso` 子目录中。那么，借助 Nginx，可以让整个安装部署过程变的飞快。

    
    
    version: "3"
    services:
      windows:
        image: dockurr/windows
        container_name: windows
        devices:
          - /dev/kvm
        cap_add:
          - NET_ADMIN
        ports:
          - 8006:8006
          - 3389:3389/tcp
          - 3389:3389/udp
        stop_grace_period: 2m
        restart: on-failure
        environment:
          VERSION: "http://winiso/win11x64.iso"
          MANUAL: "N"
        volumes:
          - ./win:/storage
        depends_on:
          - winiso
    
    
      winiso:
        image: nginx:alpine
        container_name: winiso
        restart: on-failure
        volumes:
         - ./iso:/usr/share/nginx/html

在上面的配置中，我们增加了一个用来将本地的 Windows 安装文件转换为 `dockurr/windows` 快速可安装的在线地址的容器。

将配置文件保存为 `docker-compose.yml`，然后使用 `docker compose up` 或者 `docker compose up
-d` 启动配置，我们将看到类似下面的日志：

    
    
    windows  | .
    windows  | .
    winiso   | 172.20.2.3 - - [11/Mar/2024:03:54:47 +0000] "GET /win11x64.iso HTTP/1.1" 200 6813366272 "-" "Wget/1.21.4" "-"
    windows  | . 99% 1.59G 0s
    windows  | 
    windows  | 6651904K .
    windows  |                           
    windows  |         100% 1.95G
    windows  | =3.7s
    windows  | 
    windows  | 
    windows  | ❯ Extracting downloaded ISO image...
    windows  | ❯ Detecting Windows version from ISO image...
    windows  | ❯ Detected: Windows 11
    windows  | ❯ Adding XML file for automatic installation...
    windows  | ❯ Building Windows 11 image...
    windows  | ❯ Creating a 64G growable disk image in raw format...
    windows  | ❯ Booting Windows using QEMU emulator version 8.2.1 ...

下载镜像的速度马上从几MB、几十MB增加到了接近每秒 2GB，不到 4s 就能完成镜像的下载和处理。

因为在配置中增加了 `volumes` 卷的持久化（`-
./win:/storage`），所以我们可以放心的停止或者重新启动容器，而不必担心每次都要重新初始化“一台”新的 Windows Docker 容器。

## **使用技巧**

聊聊其他的使用技巧。

### **更换 Windows 版本（不提前准备镜像）**

如果你的网络环境非常棒，不需要提前下载安装镜像，或者直接使用云主机进行项目部署，那么可以考虑直接调整配置文件中的内容为合适的数值：

    
    
    environment:
      VERSION: "win11"

支持我们调整使用的值包含：`win11`、`win10`、`ltsc10`、`win81`、`win7`、`vista`、`winxp`、`2022`、`2019`、`2016`、`2012`、`2008`。

### **调整 Windows 容器资源配置**

默认情况下，这个 Windows 容器会使用 vCPU x2、4GB 内存、64G 的磁盘空间，来满足 Win11
的最低安装需求。我们可以根据自己的实际需求，来动态的调整容器的硬件资源限制。

    
    
    environment:
      RAM_SIZE: "8G"
      CPU_CORES: "4"
      DISK_SIZE: "256G"

比如，在上面的配置中，我们调整 CPU 核心数到 4，内存到 8GB，磁盘到 256GB。

### **为容器分配独立的 IP 地址**

默认情况下，Docker 会共享宿主机的 IP，如果我们想要让容器拥有独立的 IP 地址，需要先创建一个 `macvlan` 网络：

    
    
    docker network create -d macvlan \
        --subnet=192.168.0.0/24 \
        --gateway=192.168.0.1 \
        --ip-range=192.168.0.100/28 \
        -o parent=eth0 vlan

创建完网卡后，调整上面使用的容器配置，根据自己的需求指定容器 IP 即可：

    
    
    services:
      windows:
        container_name: windows
        ..<snip>..
        networks:
          vlan:
            ipv4_address: 192.168.0.100
    
    networks:
      vlan:
        external: true

### **使用一整块磁盘**

如果你的主机上有多块磁盘，或者想将某一块磁盘完整的分配给 Windows，可以采用下面的方法，其中 `DEVICE` 将作为你的主磁盘：

    
    
    environment:
      DEVICE: "/dev/sda"
      DEVICE2: "/dev/sdb"
    devices:
      - /dev/sda
      - /dev/sdb

### **在 Docker 中的 Windows 使用 USB 设备**

我们首先需要使用 `lsusb` 来获取 USB 设备的 `VendorID` 和 `ProductID` ，然后将这些信息添加到配置中：

    
    
    environment:
      ARGUMENTS: "-device usb-host,vendorid=0x1234,productid=0x1234"
    devices:
      - /dev/bus/usb

## **最后**

本篇文章先聊到这里，下一篇文章见。

\--EOF

* * *

我们有一个小小的折腾群，里面聚集了一些喜欢折腾、彼此坦诚相待的小伙伴。

我们在里面会一起聊聊软硬件、HomeLab、编程上、生活里以及职场中的一些问题，偶尔也在群里不定期的分享一些技术资料。

关于交友的标准，请参考下面的文章：

[苏洋：致新朋友：为生活投票，不断寻找更好的朋友](https://zhuanlan.zhihu.com/p/557928933)

当然，通过下面这篇文章添加好友时，请备注实名和公司或学校、注明来源和目的，珍惜彼此的时间 :D

[苏洋：关于折腾群入群的那些事](https://zhuanlan.zhihu.com/p/56159997)

* * *

### **引用链接**

`[1]` soulteary/docker-chatgpt: _[https:// github.com/soulteary/docker-
chatgpt](https://link.zhihu.com/?target=https%3A//github.com/soulteary/docker-
chatgpt)_  
`[2]` dockur/windows: _[https://
github.com/dockur/windows](https://link.zhihu.com/?target=https%3A//github.com/dockur/windows)_  
`[3]` 在笔记本上搭建高性价比的 Linux 学习环境：基础篇: _[https://
soulteary.com/2022/06/21/building-a-cost-effective-linux-learning-environment-
on-a-laptop-the-
basics.html](https://link.zhihu.com/?target=https%3A//soulteary.com/2022/06/21/building-
a-cost-effective-linux-learning-environment-on-a-laptop-the-basics.html)_  
`[4]` dockur/windows: _[https://
github.com/dockur/windows](https://link.zhihu.com/?target=https%3A//github.com/dockur/windows)_  
`[5]` 这里下载: _[https://www. microsoft.com/en-us/software-
download/windows11](https://link.zhihu.com/?target=https%3A//www.microsoft.com/en-
us/software-download/windows11)_  
`[6]` 官方下载: _[https://www. microsoft.com/zh-cn/software-
download/windows11](https://link.zhihu.com/?target=https%3A//www.microsoft.com/zh-
cn/software-download/windows11)_  
`[7]` qemus/qemu-docker: _[https:// github.com/qemus/qemu-
docker](https://link.zhihu.com/?target=https%3A//github.com/qemus/qemu-
docker)_  
`[8]` christgau/wsdd: _[https://
github.com/christgau/wsdd](https://link.zhihu.com/?target=https%3A//github.com/christgau/wsdd)_  
`[9]` qemus/virtiso: _[https://
github.com/qemus/virtiso](https://link.zhihu.com/?target=https%3A//github.com/qemus/virtiso)_  
`[10]` krallin/tini: _[https://
github.com/krallin/tini](https://link.zhihu.com/?target=https%3A//github.com/krallin/tini)_

* * *

如果你觉得内容还算实用，欢迎点赞分享给你的朋友，在此谢过。

如果你想更快的看到后续内容的更新，请戳 **“点赞”、“分享”、“喜欢”** ，这些免费的鼓励将会影响后续有关内容的更新速度。

* * *

本文使用「署名 4.0 国际 (CC BY 4.0)」许可协议，欢迎转载、或重新修改使用，但需要注明来源。 署名 4.0 国际 (CC BY 4.0)

本文作者: 苏洋

创建时间: 2024年03月11日 统计字数: 7281字 阅读时间: 15分钟阅读 本文链接:
[https://soulteary.com/2024/03/11/install-windows-into-a-docker-
container.html](https://link.zhihu.com/?target=https%3A//soulteary.com/2024/03/11/install-
windows-into-a-docker-container.html)