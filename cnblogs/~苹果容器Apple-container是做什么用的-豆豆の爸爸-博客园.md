---
aliases:
  - 苹果容器 Apple container 是做什么用的？ - 豆豆の爸爸
created: 2025-08-18T13:31:42
modified: 2025-08-30T21:04:05
source: https://www.cnblogs.com/georgewing/p/19033038
title: 苹果容器 Apple container 是做什么用的？ - 豆豆の爸爸
type: archive-web
---

# 苹果容器 Apple container 是做什么用的？ - 豆豆の爸爸

# 一、Apple Container 是什么

container 是苹果公司出的一款容器工具。以轻量级虚拟机方式创建、运行 Linux 容器。那么，Linux 容器又是什么呢？

## Linux 容器是一种特殊的进程

进程是运行中的程序，而 Linux 容器是进程中的一种，那 Linux 容器的特殊是这个进程由命名空间和 cgroups 来创造出来了一个“边界”。

### 程序、进程又是什么

程序是指令和数据的集合。进程是运行中的程序，而程序在不运行时都是安安静静地存放在磁盘中的。

### 容器与虚拟机的对比图

相信大家可能在介绍容器的文章中已经见过下面这个图：\n

这个图，让我们对容器的理解停留在软件层面上，容器比虚拟机要轻量。然后就止步，不能深入理解了。

#### 虚拟机与容器到底有什么区别

以运行在 Ubuntu 20.04 的 Linux 为例来深入理解虚拟机与容器的区别。

先看看在虚拟机上启动 Ubuntu 20.04 都做了什么：

1. \n 用宿主机的虚拟化软件启动虚拟机。之后所有处理都在虚拟机上进行的。\n
2. \n 启动 GRUB 等引导程序。\n
3. \n 引导程序启动内核。\n
4. \n 内核启动 init 程序。\n
5. \ninit 进程 (一般就是 systemd）启动各种服务。\n\n
用宿主机的虚拟化软件启动虚拟机。之后所有处理都在虚拟机上进行的。

启动 GRUB 等引导程序。

引导程序启动内核。

内核启动 init 程序。

init 进程 (一般就是 systemd）启动各种服务。\n

再来看在容器上启动 Ubuntu 20.04。是怎样启动的，也就两步：

1. \n 有一个叫容器运行时的进程，要它创建容器\n
2. \n 启动第 1 号进程\n
有一个叫容器运行时的进程，要它创建容器

启动第 1 号进程

没了。启动速度上，容器没有虚拟机步骤 1 到 3；访问硬件速度上，也不需要像虚拟机需要把控制权交给物理机那样操作。

虚拟机启动时间要十几秒，容器启动时间在 1 秒内。差距太大了！这就是两者的真正区别。

## 命名空间

内核的命名空间（namespace）机制是用于实现容器。也就是说，容器是通过利用命名空间机制来实现的。

实际上，容器利用独立的命名空间，将一个个进程从其他进程的运行环境中分离出来，就创建了一个独立的运行环境。每个容器就有自己的 PID（进程 ID）、NET（网络）、IPC（进程内通信）、user（用户）、MNT（文件系统/挂载）、UTS。这些命名空间组成了我们所说的容器。\n

## Cgroups（控制组）

看容器启动 Ubuntu 20.04 的步骤 2 中，容器内的第 1 号进程只不过是 PID namespace 让我们见到的情形，可以说是个干扰我们的“障眼法”。实际上宿主机它作为第 100 号进程与其他进程之间也都是平等竞争关系的。也就是说，第 100 号进程可能被其他进程占用 CPU、内存资源，也可能它把所有资源都吃光。这系统资源被进程抢来抢去的情况。一个命名空间机制是没法限制的，命名空间机制是“隔离”，而 cgroups 就是“限制”。

cgroup 用于限制进程的系统资源（如 CPU、内存）分配使用的上限。cgroup（全称：Linux control group）以进程的分组（group）为单位对各种资源进行控制 (control)，这样限制的。

### Docker 实例

对于 Docker 容器，在执行 docker run 命令的参数指定分配给容器的资源：

docker run -it --cpu-period=100000 --cpu-quota=20000 ubuntu /bin/bash

然后，查看 cgroups 文件系统下的 CPU 子系统中“docker”这个控制组里面的资源限制文件内容：

这意味着 Docker 容器分配给 CPU 只能使用 20% 的带宽。

因此，实际上在 Docker 的底层利用了内核的 cgroup。

# 二、container 的安装和启动

从 github 发布页面下载 container-0.3.0-installer-signed.pkg

[container-0.3.0-installer-signed.pkg](\"https://github.com/apple/container/releases/download/0.3.0/container-0.3.0-installer-signed.pkg\")

安装完成后，在 iTerm 终端用命令启动服务：

container system start

## 下载 Linux 镜像并运行

我下载的是 Ubuntu 20.04 镜像：

container pull ubuntu:20.04

这是从 Docker hub 上拉取的官方镜像。

后台运行容器：

container run -d --name my-ubuntu ubuntu:20.04 tail -f /dev/null

进入容器终端：

container exec -it my-ubuntu /bin/bash

这样，就可以在容器内进行操作了。

## 拉取 Linux 镜像后，通过 Dockerfile 安装必要的软件

编写 Dockerfile（无后缀），内容如下：

构建 Linux 镜像：

container build -t my-ubuntu:1.0 .

运行容器：

container run -d --name ubuntu-container my-ubuntu:1.0

进入容器终端：

container exec -it ubuntu-container /bin/bash

这样，可以在 Ubuntu 20.04 镜像中预装所必需的软件工具，并通过 exec 进入交互的环境来操作终端。\n 然后继续安装 Linux 软件工具了：

apt install strace

还有 pstree：

apt install psmisc

## 挂载宿主机目录到容器内

在运行容器时，可以用 -v 或 --volume 参数指定要挂载卷的路径映射：

container -d --name my-ubuntu -v ~/Projects:/app/code ubuntu:20.04 tail -f /dev/null

宿主机的~/Projects 以读写模式挂载到容器中/app/code，也就是说容器可修改宿主机的文件。这样就解耦了。

## 下次怎样再进容器镜像

如果 Mac 电脑重启了，或者是退出了 Linux 终端，想再进 Linux 容器镜像，怎样再进呢？

用 container ls -a 命令来查看所有容器，主要是查看容器的状态。

如果是 stopeed 的状态，执行启动的命令：container start ubuntu-container，然后再进容器镜像里面去：

container exec -it ubuntu-container /bin/bash

这样之前预装的软件包工具以及进行的用户设置都存在了，直接在终端操作就可以了。

# 三、了解就这么多，足够了

苹果的 container 与现有的 Docker 容器方案不一样，可以在每个容器运行自己轻量级虚拟机。这款容器工具只能在 Mac 芯片上运行，使用场景有些小众了。虽然足够安全，性能上也很强。但毕竟是 6 月 10 号才出来的，现在才 0.3 版。

大家有 Mac 芯片电脑的可以用来跑个 Linux。而不用花个大几万去云上虚拟机跑 Linux 了。

感谢大家的阅读我豆爸写的文章，我们下一篇文章再见。
