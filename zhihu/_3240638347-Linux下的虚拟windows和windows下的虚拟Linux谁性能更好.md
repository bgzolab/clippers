---
comments: true
created: '2023-10-08T00:37:01'
draft: true
modified: '2023-10-08T00:37:01'
source: https://www.zhihu.com/question/624925911/answer/3240638347
title: Linux下的虚拟windows和windows下的虚拟Linux谁性能更好？
type: archive-web
---

CPU: KVM和Hyper-V几乎没有区别. 但是Linux可以绑核, 可以调调度器, Windows的调度器比较麻烦(玄学),
不像Linux一样允许随便调节. 而且客户端版Windows和服务器版Windows的调度器还不一样. VMWare和Vbox不如KVM和Hyper-V,
无论是在Windows上还是在Linux上.

GPU: Linux/KVM组合里virtio-gpu最近有一个Windows驱动, 体验很灵车. Hyper-V也没有支持3D的Linux
drm虚拟显卡驱动. 如果WSL不能满足需求(虽然有3D GPU设备, 但是没有原生2D屏幕, 只能RDP转发),
VMWare的Windows和Linux的Guest GPU驱动表现是最好的. 如果可以PCIE穿透一个核显或者独显, 吊打所有软件GPU.
Vbox的3D驱动是灵车.

磁盘: Windows的virtio-scsi驱动性能远高于Hyper-V的Linux虚拟磁盘, 估计是因为NTFS太烂了.
但是如果可以PCIE穿透一个nvme磁盘, 吊打所有软件磁盘. 个人感觉zfs on linux的zvol + virtio-
scsi的体验比其他任何方案都好.

网络: 体验无感, 都能轻松跑上10G的速度. 更快的速度可以使用数据中心的智能网卡(DPU).

总的来说Linux KVM因为在各家云服务上广泛使用, 因此优化很好, 性能损失最小.
但各家云服务的hypervisor都是自己开发的(比如最近Rust生态下的firecracker、cloud hypervisor、StratoVirt),
qemu并不一定是性能最好的虚拟机软件. 微软在Azure上使用的并不是Hyper-V, 而是MSHV, 尤其是客户端版Windows上的Hyper-
V并没有对通用负载进行优化.