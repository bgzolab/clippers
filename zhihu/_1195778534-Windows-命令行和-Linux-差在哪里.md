---
comments: true
created: '2020-05-02T22:13:48'
draft: true
modified: '2020-05-03T03:47:22'
source: https://www.zhihu.com/question/388789219/answer/1195778534
title: Windows 命令行和 Linux 差在哪里？
type: archive-web
---

Windows 在很长一段时间内，自带的终端模拟器都一言难尽：难以配置，默认情况下很丑陋，复制粘贴的逻辑很别扭等等，直到 Windows Terminal
出来才缓解了这个状况，但 Windows Terminal 到目前还不是默认的终端模拟器，单纯这个原因就让 Windows 的终端体验下降很多。

另一个问题是补全问题。虽然现在 PowerShell 支持的补全功能并不弱，但糟糕的是，没有几个第三方工具适配了 ps
补全功能，对于没有适配的工具，补全工具基本只能用来补全路径，而 bash 上补全适配状态要好的多。而且，Linux 上命令补全通常是渐进式的，每次按下
TAB 都会补全到最长的公共前缀上，并展示可能的命令，而到了 Windows 上 TAB
补全就变成了在输入处遍历可能的补全列表，按过头了还需要再循环一圈，想回退到按 TAB 前的状态还只能手动退格……也许是我习惯问题，但我觉得 Linux
上默认的的补全逻辑远远比 Windows 上更加易用。

至于 Shell 方面，cmd 更是一言难尽，我也不多说了。PowerShell 设计上很不错，但我并不认为它适合作为 Shell
来使用，而是更适合用来写脚本，冗长的命令与选项加上 Windows 的补全逻辑作为 shell 用起来简直是灾难，哪怕 wsl 里运行 pwsh 都比
Windows 上直接运行的 PowerShell 要易用的多的多。另外 PowerShell 启动速度也要慢于 cmd 慢于
bash，这个问题近期倒是改善了不少，但是用起来还是和 bash 挥之即来招之即去的流畅感有所差距。

再就是 Windows 上命令行生态和 Linux 的差距，这是 Windows 重 GUI 轻 CUI 的风格造成的。Windows 上相当一部分 CUI
应用还是移植自 *nix，由此引来的风格差异也是降低 PowerShell 易用性的重要因素之一。

顺带一提，PowerShell 用来写脚本不错，不过我更喜欢
[Ammonite](https://link.zhihu.com/?target=http%3A//ammonite.io/) 一些：

[Ammonite](https://link.zhihu.com/?target=http%3A//ammonite.io/)

作为一门语言来说，Ammonite 的功能远强于 PowerShell，因为它支持的是 Scala 的一个超集。与 PowerShell 能利用 .Net
生态类似，Ammonite 也能够利用整个 JVM 生态，它甚至支持从远程 Maven 仓库自由导入 package，譬如想使用阿里云的 OSS
SDK，只需要这样：

    
    
    import $ivy.`com.aliyun.oss:aliyun-sdk-oss:3.9.1`

然后就能导入 SDK 中的类型了：

    
    
    import com.aliyun.oss.OSSClient
    import com.aliyun.oss.model._

更多的功能请参见官网文档。