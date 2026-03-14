---
comments: true
created: '1970-01-01T08:00:00'
draft: true
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/706310857
title: 【国行一加12刷机指南】由ColorOS转换至氧OxygenOS系统+安装Magisk获取Root权限
type: archive-web
---

本文适合在国外用国行ColorOS系统，或是想尝试原生谷歌系统的一加12用户。

一加12根据以下地区大致分为四种型号，各型号有相应的本地化功能。若不是喜欢折腾不建议换Rom系统，而且很可能**失去本地保修+部分App功能异常+操作不当刷成砖**
。最初我刷氧OS后开机出现Orange State警告，SafetyNet测试未通过，无法使用一些银行软件如Google
Pay的NFC支付和Netflix等DRM（数字版权类）应用,就是因为解锁了Bootloader。

地区| 型号| 操作系统| 本地化功能  
---|---|---|---  
印度| CPH2573| OxygenOS 14| \- 硬件无eSIM- 支持通话录音  
\- Google全家桶- 禁用6GHz Wi-Fi 6E/7 频段  
\- ORoaming全球漫游  
\- 无双击电源键功能  
全球/ 欧洲| CPH2581| OxygenOS 14| \- 支持eSIM- 默认无通话录音- Google全家桶  
北美| CPH2583| OxygenOS 14| \- 支持eSIM  
\- 默认无通话录音  
\- Google全家桶  
中国| PJD110| ColorOS 14| \- 硬件无eSIM  
\- 支持通话录音  
\- 默认无Google市场，后续可安装  
  
注意：国行版一加12若未在国内先用国内Sim卡激活，直接到国外如下地区使用会有区域锁：

印度、美国、加拿大、俄罗斯、阿拉伯联合酋长国、沙特阿拉伯、墨西哥、以色列、科威特、巴基斯坦、智利、哈萨克斯坦、巴西、孟加拉国、尼泊尔、缅甸、伊拉克、卡塔尔、埃及、阿尔及利亚、突尼斯、芬兰、丹麦、瑞典、挪威、英国、德国、意大利、法国、西班牙、荷兰、比利时、波兰、罗马尼亚、泰国、马来西亚、新加坡、菲律宾、越南、印度尼西亚。

用户对不同系统的使用偏好如下图，可见大部分用户偏向全球/欧版系统。但对于在国内使用国行版一加12要刷氧OS的用户，印度版系统最为适配，都无eSIM硬件，默认有录音功能，且海外印度版用户基数大，系统更新频次相较美版和全球版/欧版更快。

  

![](https://pic2.zhimg.com/v2-2d425f75e22e5cce31444ca69797c669_1440w.jpg)

  

不同系统的用户使用体验如下，请自行对比并选择适合自己的系统：

[https://xdaforums.com/t/oxygen-os-global-eu-cph2581-us-na-cph2583-in-
cph2573-coloros-cn-pjd110-roms-
differences.4673462/](https://link.zhihu.com/?target=https%3A//xdaforums.com/t/oxygen-
os-global-eu-cph2581-us-na-cph2583-in-cph2573-coloros-cn-pjd110-roms-
differences.4673462/)

做出选择后即可开始刷机教程。

## **一、准备工作​**

  1. 备份数据：请自行备份系统文件和手机数据，解锁Bootlocker和重锁Bootlocker会格式化和清空数据，安装Magisk的过程中也有刷成砖的案例。
  2. 下载以下工具和文件：
     1. OxygenOS固件：从**[一加官方网站](https://link.zhihu.com/?target=https%3A//bbs.oneplus.com/thread/1482297608171945990)** 下载最新的固件版本，建议下载全量包，**[或点击此教程](https://link.zhihu.com/?target=https%3A//tradingshenzhen.com/en/content/oneplus-12-how-to-switch-from-color-os-to-oxygen-os)** 。

安装USB**[最新驱动程序，](https://link.zhihu.com/?target=https%3A//www.gsmofficial.com/oppo-
qcom-mtk-driver/)** 保证手机与电脑连接与信号传输。

a) Qualcomm_USB_Driver_v*.*

b) Opp_Latest_MTK_QCOM_Driver_Setup_V*.*.*.*

3\.
Magisk(Root的工具，可以隐藏已解锁的bootloader和Root的状态，若不使用接触支付，或重锁了Bootloader，或不想root可以无需安装)：从Magisk的**[GitHub发布页面](https://link.zhihu.com/?target=https%3A//github.com/topjohnwu/Magisk/releases)**
下载最新版本的Magisk APK。

4\.
ADB和Fastboot（刷写固件和启动镜像的必备工具）：从**[Android开发者官网](https://link.zhihu.com/?target=https%3A//developer.android.com/studio/releases/platform-
tools)** 下载并安装。

检查ADB或Fastboot安装：打开cmd命令提示符（不建议使用Shift+右键使用PowerShell的方式，在后续步骤我曾用PowerShell刷Boot.img失败了），定位至文件夹位置（方法：使用‘D:’命令+回车键把cmd目标由C盘转至D盘（或是你下载文件所在盘符）再使用‘cd’命令+空格+文件夹位置定位需执行操作的文件夹位置，例子如下：

    
    
    D:
    cd \Oneplus12_ColorOS_to_OxygenOS

使用adb version命令+回车检查adb安装是否成功，若安装成功会显示其版本，如下图：

![](https://pic2.zhimg.com/v2-a6a31a2ad17055dc2aa47413d05aab09_1440w.jpg)

    
    
    adb version

同理进入fastboot模式后检查fastboot命令，使用fastboot version命令+回车检查fastboot安装。

5\. Payload Dumper:可以从固件的payload.bin文件中提取出单个镜像。从 [payload-dumper-
go的GitHub发布页面](https://link.zhihu.com/?target=https%3A//github.com/ssut/payload-
dumper-go/releases) 下载最新版本。

## **二、转换系统：从ColorOS到OxygenOS**

  1. 在手机上启用开发者选项和USB调试：

前往 **设置 > 关于手机**，连续点击**Version版本号** 七次以上启用开发者选项。

前往 **设置 > 系统 > 开发者选项** 启用 **USB调试** 和 **OEM解锁** 。

2\. 进入Fastboot模式：

  * 关闭手机电源。
  * 同时按住音量下键和电源键（有些手机是音量上键+电源键），直到进入Fastboot模式。

3\. 解锁Bootloader（解锁会清除设备上的所有数据，请确保已备份）：

  * 连接手机到电脑。
  * 打开命令提示符，保证定位在adb目录下执行命令（同上文），输入以下命令将手机重启到fastboot模式：

    
    
    adb reboot bootloader

  * 进入fastboot模式后，使用以下命令解锁bootloader

    
    
    fastboot oem unlock

7\. 刷入OxygenOS固件：

  * 将下载的OxygenOS固件解压，找到`payload.bin`文件。
  * 使用[payload-dumper-go](https://link.zhihu.com/?target=https%3A//github.com/ssut/payload-dumper-go)工具将`payload.bin`解压到单独的镜像文件。
  * 在Fastboot模式下，逐一刷入以下镜像文件：

    
    
    fastboot flash boot boot.img
    fastboot flash system system.img
    fastboot flash vendor vendor.img
    fastboot flash recovery recovery.img

  * 输入如下命令重启手机，检查系统运行情况并完成OxygenOS的初始设置

    
    
    fastboot reboot

  

到此应顺利由ColorOS刷到OxygenOS了，开机会有Orange State警告已解锁的Bootloader（orange state is not
being verified or custom os.dismiss after 5
seconds），不影响设备使用，可通过重新上锁（不推荐）或获取Root权限安装Magisk后消除警告的文字，可自行搜索消除Orange State的方法。

## **三、安装Magisk并获取Root权限**

解锁Bootloader后SafetyNet测试将不通过，无法使用银行软件和NFC接触支付，这时可以重新上锁（此操作有风险）或安装Magisk，Root并安装相应Magisk模块通过SafetyNet测试。

  1. 从官网下载并安装Magisk Manager APK（见上文一.2.）

2\.
补丁Boot镜像：可以使用方法A或方法B(二选一)刷入镜像文件。本人曾使用方法A没刷成功，重新刷回原始boot.img文件后使用方法B刷入inti_boot.img文件才成功安装了Magisk（**使用fastboot
flash boot命令刷版本不对应的boot.img可能有刷成砖的风险** ）。

* * *

**方法A**

     1. 从OxygenOS固件中提取原始boot.img（见上文二.4.）
     2. 将boot.img传输到手机储存空间，并在Magisk Manager中的Magisk模块中选择“Install”安装 > “Select and Patch a File”，找到boot.img。
     3. Magisk会生成一个修补后的magisk_patched.img文件，一般保存在Download文件夹中,将此文件复制/剪切到上文adb所在文件夹中
     4. 刷入修补后的Boot镜像(**此操作有风险，应确保boot.img文件的版本与手机版本对应，建议从官方渠道下载固件和提取boot.img**)：
     5. 将修补后的magisk_patched.img传输回电脑。
     6. 重新进入Fastboot模式，并使用以下命令刷入修补后的magisk_patched.img:

    
    
    fastboot flash boot

⬆️ （此命令后可直接拖动修补后的magisk_patched.img文件至cmd）+ 回车键

7.使用以下命令重启手机：

    
    
    fastboot reboot

* * *

**方法B**

        1. 从OxygenOS固件中提取原始 init_boot.img（见上文二.4.）
        2. 将init_boot.img传输到手机储存空间，并在Magisk Manager中的Magisk模块中选择“Install”安装 > “Select and Patch a File”，找到init_boot.img，点击Let's go。
        3. Magisk会生成一个修补后的magisk_patched.img文件，一般保存在Download文件夹中,将此文件复制/剪切到上文adb所在文件夹中
        4. 刷入修补后的Boot镜像(**此操作有风险，应确保init_boot.img文件的版本与手机版本对应，建议从官方渠道下载固件和提取init_boot.img**)：
        5. 将修补后的magisk_patched.img传输回电脑到安装adb所在的文件夹。
        6. 重新进入Fastboot模式，并使用以下命令刷入修补后的magisk_patched.img:

    
    
    fastboot flash init_boot 

⬆️ （此命令后可直接拖动修补后的magisk_patched.img文件至cmd）+ 回车键

7.使用以下命令重启手机：

    
    
    fastboot reboot

* * *

3\. 确认Magisk安装：

重启后，打开Magisk Manager，确认Magisk已安装并显示当前版本（Magisk模块显示Installed XXX版本）。

  

## **四、启用Zygisk并安装必要的模块**

  1. 启用Zygisk：
     1. 打开Magisk Manager，点击右上角的设置图标。
     2. 启用“Zygisk ”选项，不开启“Enforce DenyList”。
  2. 安装绕过SafetyNet测试的Magisk模块：
     1. **[下载PlayIntegrityFix](https://link.zhihu.com/?target=https%3A//github.com/chiteroman/PlayIntegrityFix/releases)** （绕过Google的SafetyNet和Play Integrity API检查，确保Google Pay等应用程序的正常运行），在Magisk Manager的Module，选择“从存储中安装”，找到并安装PlayIntegrityFix ZIP文件。
     2. **[下载playcurl](https://link.zhihu.com/?target=https%3A//github.com/daboynb/PlayIntegrityNEXT/releases)** （解决Google Play服务在root设备上的兼容性问题），在Magisk Manager的模块选项中，选择“从存储中安装”，找到并安装Playcurl ZIP文件。
     3. **[下载Shamiko](https://link.zhihu.com/?target=https%3A//github.com/LSPosed/LSPosed.github.io/releases)** （用于隐藏root状态，使Google Pay和Netflix等应用程序不检测到设备已root），在Magisk Manager的模块选项中，选择“从存储中安装”，找到并安装Shamiko ZIP文件。
     4. **[下载Zygisk LSPosed](https://link.zhihu.com/?target=https%3A//github.com/LSPosed/LSPosed/releases)** （用于支持Xposed模块，定制系统和应用行为），在Magisk Manager的模块选项中，选择“从存储中安装”，找到并安装LSPosed ZIP文件。
  3. 配置DenyList：
     1. 在Magisk Manager设置中，点击“Configure DenyList”。
     2. 将需要隐藏的应用加入列表。
  4. 检查SafetyNet状态：
     1. 重启设备后，打开Magisk Manager，保证Zygisk已开启。
     2. 下载YASNAC，应显示通过SafetyNet检查。

参考网站：

[https://xdaforums.com/t/shortguide-02-04-2024-bootloader-root-
safetynet.4654608/](https://link.zhihu.com/?target=https%3A//xdaforums.com/t/shortguide-02-04-2024-bootloader-
root-safetynet.4654608/)

[https://tradingshenzhen.com/en/content/oneplus-12-how-to-switch-from-color-
os-to-oxygen-
os](https://link.zhihu.com/?target=https%3A//tradingshenzhen.com/en/content/oneplus-12-how-
to-switch-from-color-os-to-oxygen-os)