---
draft: true
title: "「入土级」 三星 One UI 优化完全指南"
created: 2025-04-04T09:25:42
modified: 2025-04-04T09:25:42
description: "一份指南，带你从入门到入土。"
source: "https://radishzz.cc/posts/384776b2/"
tags:
type: "archive-web"
---
本文亦提供以下语言版本: [English](https://radishzz.cc/posts/d88c9984/)

移动端开启桌面版网站即可查看目录

本文是一篇针对三星 One UI 的超大型免 root 优化指南，旨在帮助大家提升设备的续航与流畅度，解决耗电过快、卡顿掉帧等问题。指南详细介绍了各种优化方法和原理。跟着这些方法，你的三星设备将会获得超强的续航和丝滑的体验，仿佛重获新生！

本指南以港版 One UI 6.1 为背景，结合大量前辈经验和个人玩机心得重制而成。篇幅超长，全部看完需要 30 分钟左右。你可以先通过右侧的目录了解大致内容。如果你准备好了，那么我们就开始吧！

更新记录

1. 增加英文版本
2. 更换 DNS 推荐
3. 更新系统设置篇
4. 更新部分失效链接
5. 更新 Lycan 禁用列表
6. 优化目录层级与中英文空格
7. 增加部分 One UI 6.1 不再支持安装 Lycan 和 Adhell 3 的提示。
8. 补充 Lycan 和 Adhell 3 的第二种 [安装方式](https://image.radishzz.cc/image/01-oneui/30.webp)

## 双清刷机篇

本篇章主要介绍双清和刷机的效果与方法。这并不是必需步骤，只推荐有条件的朋友尝试。

![刷机](https://image.radishzz.cc/image/01-oneui/02.webp)

想要对房子进行精装修，最好是从干净的毛坯房开始。同样地，想要对设备进行优化，最好是从干净的系统开始。一个干净的系统能为设备奠定良好的软件基础，避免受到应用卸载残留、系统升级冲突、设备缓存积累等问题的影响。那么怎样才能实现干净的系统呢？有以下三种方式：

> - **恢复出厂设置**：删除所有用户数据、应用程序、个性化设置等，将设备恢复到出厂状态。
> - **双清**：执行两个清除操作，包括恢复出厂设置 `Wipe data/factory reset` 和清除系统缓存分区 `Wipe Cache Partition`。
> - **刷机**：刷入系统固件（全量包），彻底重装设备的操作系统。

**清理效果排名：刷机 > 双清 > 恢复出厂设置**。对于大多数人来说，恢复出厂设置就足够了。但对于能看到这篇文章的朋友，你们应该不会只局限于此。接下来我会介绍双清和刷机的具体步骤。新手可以尝试简单的双清，高手直接刷机就行了。操作前请记得备份数据，避免重要数据丢失。

### 双清

![Recovery 模式](https://image.radishzz.cc/image/01-oneui/03.webp)

> 1. 退出三星账号与 Google 账号。
> 2. 关机后按住电源键和音量 + 键，同时用数据线连接电脑，进入如上界面。
> 3. 选择 `Wipe data/factory reset` 清除数据/恢复出厂设置，再选择 `恢复出厂设置` 确定。
> 4. 选择 `Wipe cache partition` 清除缓存分区 ，再选择 `Yes` 确定。
> 5. 选择 `Reboot system now` 重启系统即可。

### 刷机

![三星线刷工具 Odin3](https://image.radishzz.cc/image/01-oneui/04.webp)

#### 工具准备

- [三星 USB 驱动](https://developer.samsung.com/android-usb-driver)
- [三星线刷工具 Odin3](https://odindownloader.com/)
- 系统固件下载工具 [SamFirm](https://samfirmtool.com/) 、[Frijia](https://github.com/SlackingVeteran/frija) 、[Bifrost](https://github.com/zacharee/SamloaderKotlin) 、[SamFw](https://samfw.com/) 等
- [视频教程推荐](https://www.bilibili.com/video/BV1WT411U7QL/)

#### 完整步骤

> 1. 退出三星账号与 Google 账号。
> 2. 安装上述驱动与线刷工具。
> 3. 下载固件后解压，获得 `BL`、`AP`、`CP`、`CSC`、`USERDATA` 五件套。
> 4. 打开 Odin3，依次选择 `BL`、`AP`、`CP`、`CSC` 并导入对应名称的文件。导入 `AP` 大概需要三分钟，耐心等待即可。
> 5. 设备关机状态下，同时按住音量 + 键和音量 - 键，并用数据线连接电脑，亮屏后松开。出现下载图标后再按一下音量 + 键，即可进入刷机模式。
> 6. 查看左上角 `ID:COM` 方块，显示 `0:COM+数字` 则代表设备连接成功，点击 `Start` 开始刷机。
> 7. 左上角显示 `PASS`，代表刷机完成，设备会自动重启。

## 应用安装篇

本篇章主要介绍为了防止系统被国产应用拖垮，应当避免安装最新版本。

![国产应用](https://image.radishzz.cc/image/01-oneui/05.webp)

新机刚到手，或者刚刷完系统后，不建议直接在应用商店安装应用，或者用换机助手恢复应用。因为这样安装的都是最新版本。

最新版本不好吗？不好。大部分国产应用都是越更新越臃肿，每次更新不是加一堆广告，就是塞各种没用的功能。所以现在，你甚至可以在支付宝里刷短视频，也可以在美团里玩原神。

另外，三星作为国内的 Others，没有任何一款国产应用会主动针对 One UI 进行适配优化。即使是最新的旗舰机 S24 Ultra，在运行某些应用时依然会卡顿掉帧，例如微博、B站等。

### 版本选择

因此，想要设备变得流畅省电，第二步就是选择其它版本进行安装，并且不轻易更新。这能有效避免最新版应用过度占用 CPU 资源，从而导致系统卡顿的问题。

版本选择的优先级：  
**Play 版 > 定制版 > 第三方 > 破解版**

我在这里分享一些寻找安装包的网站，大多数应用都能在这里找到。全部找一遍可能需要花费一定时间，但当你建立起自己的应用集后，以后换机就会轻松多了。

### 下载途径

> - [Apkmirror](https://www.apkmirror.com/) （Play 版下载站）
> - [百分之千](https://gitee.com/ww3w/dzb/blob/master/dzb.md) （定制版合集）
> - [LiteApks](https://liteapks.com/) （破解版下载站）
> - [好软分享](https://github.com/yoyodadada/haoruanfenxiang/blob/master/List.md) （各种版本合集）
> - [奇妙应用](https://www.123684.com/s/2xiAjv-5HqPh) （应用商店）
> - [个人应用集](https://www.123pan.com/s/2xiAjv-fBzPh.html) （仅供参考）

## 系统设置篇

本篇章主要介绍系统设置中非必要的功能选项，并给出关闭或开启的建议。

![系统设置](https://image.radishzz.cc/image/01-oneui/06.webp)

你可以跟着指示逐步找到对应功能，也可以在设置中使用搜索来直接跳转。如果你认为某些功能对你有用，可以保持默认选项。由于系统版本差异，有些功能的名称和位置会不太一样，请注意识别。

1. **三星账户**

> - 安全与隐私-个性化服务-停止自定义所有设备（停止所有个性化）
> - 安全与隐私-获取新闻和特惠/改进个性化广告（关闭）
> - 三星云-所有选项（按需开启）
> - 盖乐世 AI-仅在设备上处理数据（按需开启）
> - 查找我的手机（按需开启）
2. **连接**

> - Wi-Fi-右上角三个点-智能 Wi-Fi-显示网络质量信息（开启）-其它功能（全部关闭）
> - 超宽带 UWB（关闭）
> - 流量监控-流量节省（关闭）
> - 更多连接设置-附近设备扫描（关闭）

关于 Wi-Fi 省电模式，虽然写着可以减少电池使用量，但也会降低数据吞吐量。设备只会在定期唤醒时进行数据收发，这可能会影响微信 QQ 等应用消息的实时接收，因此选择关闭。

3. **已连接的设备**

> - 所有功能（按需开启）
4. **通知**

> - 应用程序通知（按需开启）
> - 高级设置-管理每个应用程序的通知类别（开启）
5. **显示**

> - 黑暗模式（按需开启）
> - 自动调节亮度（按需开启）
> - 屏幕分辨率（推荐 QHD+）
> - 自动息屏-查看时保持屏幕开启（关闭）
> - 导航条-即圈即搜/圈定即搜（按需开启）
> - 意外触摸保护（关闭）
> - 触摸灵敏度（关闭）
6. **电池**

> - 电池保护（按需开启）
> - 充电设置-所有选项（全部开启）  
> ***省电模式 ↓***
> - 将CPU速度限制为70%（开启）
> - 其它选项（全部关闭）
> - 右上角三个点-自适应省电（关闭）  
> ***后台使用限制 ↓***
> - 右上角三个点-自适应电池（关闭）
> - 让未使用的应用程序进入休眠（开启）
> - 先在“深度休眠”里添加所有应用，再到“休眠”里添加常用应用，“从不自动休眠”留空
> - 本地电池政策（开启，插拔 SIM 卡后会重置，需要重新分配休眠/深度休眠）

在电池设置中，我关闭了自适应省电/电池，并通过分配应用至休眠或深度休眠，来主动管理后台。如果你觉得麻烦，可以保持默认选项。

7. **主屏幕**

> - 将媒体页面添加至主屏幕（关闭）
> - 锁定主屏幕布局（开启）
> - 向下滑动打开通知面板（开启）
> - 在主屏幕中搜索（关闭）
> - 旋转至横屏模式（关闭）
8. **锁定屏幕与熄屏提醒**

> - 延长解锁-贴身检测（关闭）
> - 息屏提醒（按需开启）
> - 长按即可编辑（关闭）  
> ***安全锁定设置 ↓***
> - 在屏幕关闭时自动锁定（5秒）
> - 用侧键立即锁定（开启）
> - 自动出厂重置、锁定网络与安全、显示锁定选项（关闭）
9. **安全与隐私**

> - 自动拦截程序（全部关闭）
> - 更多安全设置-安装未知应用程序（全部拒绝，再按需开启）
> - 更多安全设置-盖乐世系统应用程序更新（关闭）
> - 许可证管理器（逐个检查，关闭多余权限）
> - 其它隐私控制-访问剪贴板时提醒（开启）
> - 更多隐私设置-发送诊断数据、Android个性化服务、使用情况和诊断信息（关闭）  
> ***应用程序安全性 ↓***
> - 应用程序保护-右上角三个点-应用程序保护设置-每天自动扫描、安装应用程序时自动扫描、支付安全（全部关闭）-信任的应用程序（添加所有应用）
> - Google Play Protect-右上角设置-使用 Play 保护机制扫描应用、改进有害应用检测（关闭）  
> ***生物识别 ↓***
> - 显示解锁过渡效果（按需开启）
> - 指纹-删除所有已添加的指纹，把所有手指交替录入到同一枚指纹当中，录入时确保每次按压都覆盖完整，并且保持按压状态，直到屏幕提示抬起手指。
> - 指纹-指纹始终开启（按需开启）
10. **定位服务**

> - 定位服务-所有选项（全部关闭）
11. **安全与紧急状况**

> - 所有选项（全部关闭）
12. **账户与备份**

> - 管理账号-自动同步数据（关闭）
13. **Google**

> - 查找我的设备（关闭）
> - 所有服务-广告-删除广告 ID-广告隐私权-所有选项（关闭）
14. **高级功能**

> - 智能建议（关闭）
> - S Pen-更多 S Pen 设置-S Pen解锁、允许使用多个S Pen、保持S Pen连接（关闭）
> - 单手模式（按需开启）  
> ***动作与手势 ↓***
> - 双击可打开屏幕、双击可关闭屏幕（开启）
> - 手掌滑动截屏（关闭）
> - 其它选项（按需开启）
15. **智能管理器/设备维护**

> - 内存-已排除的应用程序-右上角加号（添加需要实时接收消息的的应用）
> - 内存-RAM Plus（8G开启，12G关闭）
> - 性能配置（轻度）
> - 自动优化-自动重启（关闭）

关于 RAM Plus，其原理是把部分存储空间作为额外的运行内存来使用，这对低内存设备或高负载场景（例如运行游戏时）有较大帮助。但如果设备本身的运行内存足够，再开启 RAM Plus 就没什么帮助，相反还会因为频繁的数据读写，从而略微降低设备性能。因此推荐 8G 开启，12G 关闭。

16. **应用程序**

> - 点击右侧居中位置的图标 排序-显示系统应用程序（打开）
> - 搜索 One UI 主屏幕并打开-电池（不受限制）
> - 搜索系统 UI 并打开-电池（不受限制）
17. **辅助功能**

> - 视觉增强-减少透明度和模糊效果（按需开启）
18. **软件更新**

> - 连至WALN自动下载（关闭）
19. **开发者选项**

> - ***开启方式：关于手机-软件信息-连续点击编译编号***
> - 日志记录器缓冲区大小（关闭）
> - 系统跟踪-跟踪可调试的应用（关闭）
> - WLAN扫描限制/调节（开启）
> - 暂停执行缓存的应用程序（保持设备默认，这等于开启）
> - 预见式返回动画（开启）

### 其它设置

20. **关闭应用自动更新**

> - ***打开 Play 商店-右上角头像-设置-网络偏好设置***
> - 自动更新应用（关闭）
> - 自动播放视频（关闭）  
> ***打开自带应用商店-左上角图标-右上角设置***
> - 自动下载并更新应用程序（从不）
> - 获取新闻与特惠（关闭）
> - 个性化推荐（关闭）
21. **限制应用后台运行**

> - ***仅适用于不常用的应用，例如抖音、微博等***
> - 回到系统桌面-长按应用-点击右上角 ⊙
> - 移动数据-允许后台流量使用（关闭）
> - 电池（受限制）
> - 按需分配至休眠或深度休眠
22. **保持应用后台运行**

> - ***仅适用于需要实时接收消息的应用，例如微信 QQ等***
> - 回到系统桌面-长按应用-点击右上角 ⊙
> - 移动数据-允许后台流量使用（开启）
> - 电池（不受限制）
> - 打开设置-搜索已排除的应用程序-右上角加号（添加应用）
23. **应用通知最小化**

> - ***可在保留应用通知的同时，隐藏其显示在通知栏中的图标***
> - 打开设置-搜索管理每个应用程序的通知类别（开启）
> - 打开通知面板-长按应用通知-设置-通知类别-点击高亮选项-最小化通知（开启）

### Good Guardians 设置

以下应用来自三星官方插件 Good Guardians。这款插件可以在系统自带的应用商店中下载。注意，这些应用需要在后台保持运行才能生效，请参考上述步骤 22 来设置。

24. **Thermal Guardian（管理设备温度）**

> - 过热阈值（调到最低）
> - 更多设置（仅勾选过热时限制 CPU 提升）
> - 关于过热阈值，从左到右的档位分别是 37、38、39、40、41 度。有说调高好的，也有说调低好的。我这里建议调低，可以减少设备发热情况。
25. **Memory Guardian（管理设备内存）**

> - 已排除的应用-添加需要实时接收消息的应用
> - 底部选项-定制（快速切换模式）
26. **Battery Guardian（管理设备续航）**

> - 应用程序省电（开启）-点进去-右上角三个点-设置中找不到休眠/深度休眠功能
> - 就寝时省电（开启）
> - 设置睡眠时间（00:00-23:59）
> - 幕布功能可以关注一下
27. **App Booster（提高设备流畅度）**

> - 应用/系统更新后执行优化
> - 建议每个月执行一次

## Shizuku 篇

本篇章主要介绍 Shizuku 与相关的工具类应用，并提供一些技巧，来帮助提升设备的使用体验。

![Shizuku](https://image.radishzz.cc/image/01-oneui/07.webp)

作为本篇章的核心，首先要介绍的就是 Shizuku。它是一款 Android 应用，允许其他应用直接使用系统 API ，而无需 root 权限。以禁用 Google 框架为例，传统做法需要 root 设备来获取完整控制权，而 Shizuku 可以通过用户授权来接管系统 API，然后其它应用就可以通过 Shizuku 来使用系统 API ，从而实现禁用系统应用等高级功能。

> - [官方介绍文档](https://shizuku.rikka.app/zh-hans/)
> - [App 下载地址](https://shizuku.rikka.app/zh-hans/download/)
> - [用户使用手册](https://shizuku.rikka.app/zh-hans/guide/setup/)

Shizuku 下载安装后，需要通过用户授权才能正式接管系统 API。根据用户使用手册，一共有三种启动 Shizuku 的方式，通常我们选择“通过无线调试启动”，具体步骤如下。

### 启动方式

> 1. 确保设备已连接 Wi-Fi，开发者选项已开启
> 2. 打开 Shizuku，点击配对
> 3. 点击开发者选项
> 4. 下滑找到 USB 调试并开启
> 5. 找到无线调试，点击进入二级页面
> 6. 打开无线调试开关，点击使用配对码配对设备
> 7. 找到通知栏中的 Shizuku，输入配对码并发送
> 8. 配对成功，返回 Shizuku 主页，点击启动
> 9. 等待片刻，自动回到主页，显示 Shizuku 正在运行，代表启动成功
> 10. 打开已授权 0 个应用，给予授权即可

### 工具类应用

成功启动 Shizuku 以后，就可以愉快地使用各种支持 Shizuku 的应用了。以下几款是我比较推荐的。

#### [Sam Helper](https://sam-helper.en.uptodown.com/android/download)

三星助手， 一款专门针对三星设备开发的工具箱。它提供气密性测试、终端工具、修改系统设置等许多功能。它还整合了 Good Lock 和 Galaxy Labs 里的所有应用，帮助用户更方便地自定义系统。除此以外，我们还可以通过 Sam Helper 实现以下几个功能：

##### **查询电池健康**

![如何查询电池健康](https://image.radishzz.cc/image/01-oneui/08.webp)

> 1. 点击主页右上角的第二个图标，进入 Shizuku 终端
> 2. 输入并执行以下代码 `dumpsys battery | grep -i msave`
> 3. 查看输出结果
> 4. 第二行：电池健康度 98%
> 5. 第五行：电池循环次数 248.48次

##### **省电模式 120Hz**

One UI 在省电模式下，默认无法开启 120Hz。如果你想同时拥有省电模式的省电效果和 120Hz 的高刷体验，就需要用到以下方法（俗称卡省电）：

![如何卡省电](https://image.radishzz.cc/image/01-oneui/09.webp)

> 1. 开启省电模式
> 2. Sam Helper-系统设置-屏幕刷新率（自适应）
> 3. 打开电话，点击任意数字，例如 `0`
> 4. 点击左侧按键，开启视频通话
> 5. 3 秒后挂断即可

##### **禁用系统更新**

如果不想升级系统，或者想要关闭更新手机的系统提示，可以通过禁用系统更新来实现。

![如何禁用系统更新](https://image.radishzz.cc/image/01-oneui/10.webp)

> 1. 点击主页右上角的第二个图标，进入 Shizuku 终端
> 2. 输入禁用指令并执行即可（两条指令要分开执行）  
> `pm disable-user com.wssyncmldm`  
> `pm disable-user com.sec.android.soagent`
> 3. 如果想恢复系统更新，执行以下解禁指令即可。  
> `pm enable com.wssyncmldm`  
> `pm enable com.sec.android.soagent`

#### [Battery Guru](https://liteapks.com/battery-guru.html)

![Battery Guru](https://image.radishzz.cc/image/01-oneui/11.webp)

电池专家，一款电池健康管理工具。它提供了多种功能，例如实时电流检测、电池容量估算、应用耗电情况等，来帮助用户监控和管理电池的使用情况，从而延长电池寿命。

我们可以通过实时电流以及耗电统计图，来判断设备是否存在耗电异常的情况，还可以修改设备的 `Doze` 瞌睡模式，来帮助设备在息屏后快速进入深度 `Doze` 模式，从而降低待机功耗。

##### Doze 模式

![开启 Doze 模式](https://image.radishzz.cc/image/01-oneui/12.webp)

> 1. 应用主页-右上角设置-权限管理器-允许通知、修改系统设置（开启）
> 2. 打开 Sam Helper 的终端工具，逐条输入以下代码并执行  
> `pm grant com.paget96.batteryguru android.permission.BATTERY_STATS`  
> `pm grant com.paget96.batteryguru android.permission.PACKAGE_USAGE_STATS`  
> `pm grant com.paget96.batteryguru android.permission.WRITE_SECURE_SETTINGS`  
> `pm grant com.paget96.batteryguru android.permission.DUMP`
> 3. 应用主页-最底下的工具栏-系统省电模式-配置
> 4. Doze 优化、重新应用 Doze 参数、等待解锁（开启）

![省电模式配置](https://image.radishzz.cc/image/01-oneui/13.webp)

> 5. 如图进行设置
> 6. 应用需要保持在后台运行，请参考系统设置篇的步骤22

#### [App Ops](https://appops.rikka.app/)

![App Ops](https://image.radishzz.cc/image/01-oneui/14.webp)

一款管理应用行为的工具。它通过修改系统 appops 设置，以实现对应用的权限管理，并监控敏感权限的使用情况。相比于 Android 系统自带的权限管理，App Ops 提供了更多的权限管理选项。

例如，我们可以通过 App Ops 关闭某些毒瘤应用的运动传感器、读取剪贴板、读取日历、读取设备识别码等权限，从而防止摇一摇广告的跳转和个人隐私的泄漏。这在系统自带的权限管理中是做不到的。

#### [Scene](http://vtools.omarea.com/)

![Scene](https://image.radishzz.cc/image/01-oneui/15.webp)

一款集合性能监测、充放电统计、应用管理、屏幕测试等许多功能的玩机工具箱，界面简洁易用。Scene 提供了三种工作模式，分别是基础模式、ADB 模式、ROOT 模式。在 Shizuku 授予权限后，即可激活 ADB 模式并免费使用上述功能（ ROOT 模式需付费)。

##### dex2oat 编译

Scene 中值得一提的是强制 dex2oat 编译功能。该功能与上述提到的 App Booster 的工作原理相同，但是 Scene 提供了更多编译模式。使用 `everything` 模式编译以后，可以最大程度提升设备的流畅度。

#### [InstallerX](https://github.com/iamr0s/InstallerX)

![Installer X](https://image.radishzz.cc/image/01-oneui/16.webp)

安装器 X，一款干净的 Android 应用安装器。它采用 Material Design 与 Monet 取色，界面简约美观，并且支持应用降级安装、应用自动安装、更改安装样式等功能。我们可以把 InstallerX 设为默认安装器，从而取代系统自带的软件包安装程序，彻底解决烦人广告和应用检测的问题。

#### [SD Maid](https://liteapks.com/sd-maid-2-se-system-cleaner.html)

![SD Maid](https://image.radishzz.cc/image/01-oneui/17.webp)

SD 女仆，一款系统清理工具。它可以帮助用户清理不必要的文件、缓存、日志等来释放存储空间。授予无障碍权限后，SD Maid 还能自动清理所有应用的缓存。这相当于你手动点进系统设置里，在每个应用的存储页面进行缓存清理。如果不是 Android 14 限制应用访问 data 文件夹，不然清浊也是一个非常棒的选择。

#### [RootlessJamesDSP](https://play.google.com/store/apps/details?id=me.timschneeberger.rootlessjamesdsp&hl=zh&gl=US)

![RootlessJamesDSP](https://image.radishzz.cc/image/01-oneui/18.webp)

一款不需要 root 的音频处理工具。它提供了丰富的音频处理功能，如动态范围压扩器、动态低音提升、多模态均衡器、声场宽度等。Sound Assistant 跟它相比简直是小巫见大巫，就算跟需要 root 的 ViPER4Android 相比，jamesDSP 也显得更加灵活和模块化，并且支持导入配置来调整参数。

我们可以借助它来对设备的音频进行个性化调节，从而优化外放或耳机的音频效果。它的缺点是需要常驻后台，且不支持 Spotify。

### [Shizuku 应用合集](https://github.com/ThePBone/awesome-shizuku)

该合集几乎收录了所有支持 Shizuku 的工具类应用，各位可以尽情下载体验。

## Lycan 禁用篇

本篇章为进阶篇，主要介绍 Lycan 这款应用的功能、效果以及安装方法，并科普相关知识。不推荐小白尝试。

![Lycan](https://image.radishzz.cc/image/01-oneui/19.webp)

Lycan 是一款专属于三星设备的应用，中文翻译为狼人，搭配狼头图标，~~我们不难看出作者是个狼人~~。它其实是 CCSWE App Manager 6.2.0 版本的汉化套娃版，目前有且仅有一个应用版本，即 5.0.0 汉化版。这两款应用几乎完全一致（如上图其实是 CCSWE ），我找到了 [CCSWE App Manager 破解版](https://apkmb.com/ccswe-app-manager-samsung/) （正版需付费）的安装包，实测可以用 Lycan 的激活方式进行安装激活，并且两者可以互相覆盖安装。

![Lycan 覆盖安装 CCSWE App Manager ](https://image.radishzz.cc/image/01-oneui/20.webp)

因此这两款应用的功能完全一致。CCSWE App Manager 在 Google Play 上的应用介绍是一款终极的软件包禁用程序和膨胀软件杀手。软件包禁用程序，是指它可以禁用应用，比如 Google 框架、Google 服务等系统应用，当你用不上又无法卸载的时候，就可以用 Lycan 来禁用它。

膨胀软件杀手呢？简单来说，就是指通过禁用应用的“四大基本组件”来强制管理那些臃肿的流氓应用。这能极大的优化你的设备，尤其是面对一些国产应用的时候。很多人只把 Lycan 当作冰箱/小黑屋来使用（冻结系统自带应用），却忽视了这个功能，这可能是一种对 Lycan 的浪费。

### Android 四大基本组件

![Android 四大基本组件](https://image.radishzz.cc/image/01-oneui/21.webp)

由于安卓系统极大的开放性，有不少流氓应用会在系统内注册一堆 `Service` 服务和 `Receiver` 广播接收器常驻后台。有时候你虽然只是打开了一个 App，但是在后台已经有多个 App 服务被其链式唤醒，并且在后台猛猛运行消耗着 CPU 性能与电量，此时我们可以通过 Lycan 来解决这个问题。Lycan 可以管理以下四大基本组件：

- **Activity 活动**  
`Activity` 是用户和应用程序交互的窗口。每一个 `Activity` 都相当于一个屏幕，用户可以在屏幕中进行某些操作。当打开一个屏幕时，之前的那个屏幕会被置为暂停状态，并压入历史堆栈中，用户可以通过回退操作返回到以前打开过的屏幕。
- **Service 服务**  
`Service` 能在后台完成长时间运行的操作，而且不提供用户界面。比如播放音乐的时候，即使用户切换到其它 `Activity`，音乐还是在后台播放。
- **Broadcast Receiver 广播接收器**  
`Broadcast Receiver` 用来接收和响应系统或应用程序发送的广播消息。App 可以使用它对外部事件（如有电话呼入，或者网络连接发生变化）进行接收并做出响应，例如启动 `Activity` 或 `Service` 等。
- **Content Provider 内容提供商**  
`Content Provider` 用来保存和获取数据，允许应用程序之间进行数据共享，并且不需要申请存储权限。

\**参考来源 [《MyAndroidTools 介绍 + Android 四大组件简析》](https://bbs.letitfly.me/d/256)*

##### 禁用组件的意义

- 禁用 `Activity`：禁用 `Activity` 会导致对应的应用页面无法正常显示或工作。只有与核心功能无关或者不需要交互的 `Activity` 可以考虑禁用，例如广告、应用更新等页面。
- 禁用 `Service` ：`Service` 是程序能在后台活动的前提。因此禁用服务能让应用运行时少占 RAM，在后台时少唤醒 CPU。
- 禁用 `Broadcast Receiver` ：禁用不必要的 `Broadcast Receiver`，可以避免在一些系统事件触发时，无关的应用被唤醒。
- 禁用 `Content Provider`：禁用 `Content Provider` 会导致应用程序之间无法共享数据，通常不需要禁用。

##### 识别组件的方法

禁用多余的组件可以极大的提高 App 运行时的流畅度，并减少 App 退出后的内存占用。但是想要禁用组件，就得先认识组件。通过组件名称中的英文关键词，可以大概判断出组件的作用，然后再决定是否禁用。

###### 常见禁用关键词

- 带 `push` 的都是推送通知服务，例如 `com.xiaomi.push`、`com.huawei.push` 等。
- 带 `gcm` 为谷歌推送通道，Play 版应用都会有 `google.gms` 服务。
- `sdk` 多为连接服务，比如使用 QQ、微信、微博登录等 `weibosdkbrower`。
- 有些 `sdk` 还可能是 `ads` 广告服务，例如 `igexin.sdk`、`qq.e.ads` 等。
- 带 `.ad` 或 `.ads` 的大多是广告服务。
- 非本应用厂商的服务大多都能禁用，例如 `bilibili` 里的 `alipay` 服务。
- 特殊广告名称：`umeng` 友盟、`igexin/getui` 个推、`kwad / kuaishou` 快手、`qq.e.ads` 腾讯、`socialbase / downloadlib / bytedance` 穿山甲、`douyin` 抖音

##### 常见英文名称识别

- Auth：连接第三方
- Backup：备份
- Camera：相机
- Debug：调试
- Dialog：对话框
- Download：下载
- f：定位服务
- FloatWindow：悬浮窗
- Install：安装
- Media：音频
- Message：消息通知
- Notify：消息通知
- Notification：消息通知
- Pay：支付
- Share：分享
- Sync：同步
- Update：更新
- Upload：上传
- Wallet：钱包
- Widget：桌面小组件

##### 辅助工具

还可以搭配辅助工具 [Libchecker](https://play.google.com/store/apps/details?id=com.absinthe.libchecker&hl=en_US) 来辅助识别组件。该应用可查看 App 的四大组件及原生库，并提供相应介绍。

![Libchecker](https://image.radishzz.cc/image/01-oneui/22.webp)

### 如何禁用组件

面对那么多的 App，如果真的一个组件一个组件地去识别，那无疑是愚公移山。因此我提供一个简单的禁用办法——**禁用 App 的所有服务和广播接收器**。非常简单，直接全部禁用，并且基本不影响 App 的正常使用。

因为国产 App 通常靠大量的 `Activity` 来运行，而不怎么依赖 `Service` 服务，因此全部禁用也没有关系。`Broadcast Receiver` 广播接收器，国产 App 大多利用它来实现监控、自启、推送、甚至是链式唤醒，因此也可以全部禁用。

这个方法适用于绝大多数不需要实时接收消息的国产 App，例如抖音、微博等。以抖音为例。在正常情况下，抖音在退出前台后，仍在后台运行，内存占用高达 1.7 G。

![图片](https://image.radishzz.cc/image/01-oneui/23.gif)

在全部禁用的情况下，抖音在退出前台后，立刻进入缓存，缓存占用减少到 0.9 G。

![图片](https://image.radishzz.cc/image/01-oneui/24.gif)

禁用 App 的所有服务和广播接收器以后，效果堪比墓碑模式：

- 应用退出后立刻进入缓存，不在后台驻留服务进程
- 应用的内存占用降低，不容易杀后台
- 应用不再自启，或被其它应用唤醒
- 系统也因此变得流畅省电

不过风险往往伴随着收益。部分应用在全部禁用后，会出现白屏/闪退等问题，可以根据这个 [《组件功能对照列表》](https://zhuanlan.zhihu.com/p/513280332?tdsourcetag=s_pctim_aiomsg) 来解禁对应组件，或者直接卸载重装应用，可以使应用恢复正常。

### 如何禁用应用

相比于禁用组件，禁用应用有更高的风险。为了提升续航，很多人会禁用一些以为没用的系统应用，但如果它是系统必要进程，设备就会卡开机，无法进入系统。那就只能双清刷机了。

因此最好是参考别人的禁用方案，再根据自己的需求进行调整。例如有些人需要 Google 服务，有些人则不需要。我这里提供两个自用的禁用方案：[基础禁用列表](https://www.123865.com/s/2xiAjv-AwzPh) 、[极限禁用列表](https://www.123865.com/s/2xiAjv-39qPh) ，请根据自己的需求进行调整。

禁用故障对照列表

> Apps　com.samsung.android.app.appsedge  
> 无法使用分屏多任务

> 启动器　com.sec.android.emergencylauncher  
> 无法使用省电模式

> 音质与音效　com.sec.android.app.soundalive  
> 无法开启全局杜比音效

> Samsung Core Services　com.samsung.android.scs  
> 侧栏矩形截图，无法自动识别选择图片。联系人无法搜索，无法自选截图

> Samsung Multi Connectivity　com.samsung.android.mcfserver  
> 无法使用多重连接，耳机无法随意切换

> Tethering　com.google.android.networkstack.tethering  
> 打开软件点击无响应，设置-连接闪退

> Samsung Device Health Manager Service　com.sec.android.sdhms  
> 打开三星设备健康闪退

> Settings Bixby　com.samsung.android.app.settings.bixby  
> 无法使用三星云恢复备份

> Factory Test Provider　com.samsung.android.app.providers.factory  
> 无法使用 *#0*\#。

> SumeNNService　com.samsung.android.sume.nn.service  
> Photo Remaster Service　com.samsung.android.photoremasterservice  
> 无法使用相册的重录

> DRParser Mode　com.sec.android.app.parser  
> 无法使用相册重录，无法使用 *#0*#

> Service Mode　com.sec.android.app.servicemodeapp  
> 无法使用 \*#06#

> Sec Media Storage　com.samsung.android.providers.media  
> 无法截图，显示由于安全政策无法截取

> 网络管理器　com.google.android.networkstack  
> 无法使用移动网络

> VPN Dialogs　com.android.vpndialogs  
> 无法使用 VPN

> 媒体　com.google.android.providers.media.module  
> 无法访问文件，内存里的文件

> Key Chain　com.android.keychain  
> 无法打开安全与隐私-其他安全设置

> Sec Soter Service　com.tencent.soter.soterserver  
> 微信无法使用，无法截图，无法录制视频

> 输入设备　com.android.inputdevices  
> 屏幕采样率下降，触控不跟手

> WLAN Test　com.sec.android.app.wlantest  
> WiFi 无法重连

> 强制门户登陆　com.google.android.captiveportallogin  
> 无法登陆 Wi-Fi

> Global Post ProcMgr　com.samsung.android.globalpostprocmgr  
> 拍照后相机打开预览图异常

> Tx Pwr Admin　vendor.qti.data.txpwradmin  
> 快充失效

> 生物识别　com.samsung.android.biometrics.app.setting  
> 无法录入指纹

> 通话设置　com.samsung.android.app.telephonyui  
> 无法在状态栏切换sim卡和流量，设置里无法显示移动网络选项

> Ifaa Manager Application　org.ifaa.aidl.manager  
> 无法使用支付宝指纹支付

> Sec Video Engine Service　com.sec.sve  
> 语音通话无法唤起摄像头，从而导致卡省电120失败

> CMH Provider　com.samsung.cmh  
> 相片重录完成保存时闪退

> Badge Provider　com.sec.android.provider.badge  
> 短信无法显示小红点

> 三星键盘　com.samsung.android.honeyboard  
> 侧屏幕的剪切板无法使用

> Call BG Provider　com.samsung.android.callbgprovider  
> 无通话背景

> Intent Resolver　com.android.intentresolver  
> 分享闪退

> 三星文字转语音引擎　com.samsung.SMT  
> 手字笔输入无效

> 设置建议　com.android.settings.intelligence  
> 无法使用电池小组件

> Always On Display　com.samsung.android.app.aodservice  
> 无法使用息屏提醒

> Container Service　com.samsung.android.container  
> 蓝牙设置里，切换耳机降噪环境音功能消失

> Cell Broadcast Service　com.google.android.cellbroadcastservice  
> 无法发送彩信，提示网络错误

> Sticker Center　com.samsung.android.stickercenter  
> 相册编辑器闪退

> Handwriting Service　com.samsung.android.sdk.handwriting  
> SPen无法写字输入

> 三星文字转语音引擎　com.samsung.SMT  
> 无法使用语音转文字

> Factory Camera　com.sec.factory.camera  
> Filter Provider　com.samsung.android.provider.filterprovider  
> 相机滤镜的选择和添加异常

> Secure Element Application　com.android.se  
> 钱包内公交卡余额相关异常

> App Linker　com.sec.android.app.applinker  
> 角标失效

> TxPwrAdmin　vendor.qti.data.txpwradmin  
> 快充失效

> Soter Sskds Service　com.samsung.android.sskds  
> 微信无法开启指纹支付

> Spritewallipaper　com.samsung.android.wallpaper.live  
> 桌面动态壁纸失效

> Samsung Editing Assets　com.sec.android.app.ve.vebgm  
> 相册故事没声音

> 配套设备管理器　com.android.companiondevicemanager  
> 重新连接手表异常

> 壁纸服务　com.samsung.android.dynamicock  
> 锁屏状态下无法直接显示内容

> Android Shared Library　com.google.android.ext.shared  
> 智能建议　com.samsung.android.smartsuggestions  
> 无法自动识别并选定网址

> Bluetooth Pairing Request　com.android.settings.bluetooth.BluetoothPairingRequest  
> 无法显示配对耳机弹窗

> Continuity Service　com.samsung.android.mcfds  
> 无法使用多屏联动

> 联系人存储　com.samsung.android.providers.contacts  
> 联系人功能异常

> 日历存储　com.android.providers.calendar  
> 无法创建新事件

> 密钥链　com.android.keychain  
> 无法打开安全与隐私-更多安全设置

> Shell　com.android.shell  
> 无法打开LSP

> 动态萌拍　com.samsung.android.aremoji  
> 通话背景失效

> Connectivity Overlay　com.samsung.android.ConnectivilyOverlay  
> Connectivity Ux Overlay　com.samsung.android.ConnectivityUxOverlay  
> 无法连接 Spen

> Galaxy Editing Service　ccm.samsung.android.globulpostprocmgr  
> 相机闪退

> 配置更新　com.samsung.android.cidmanager  
> DiagMon Agent　com.sec.android.diagmonagent  
> Adreno Graphics Drivers　com.qualcomm.qti.gpudrivers.kalama.api33  
> SumeNNService　com.samsung.android.sume.nn.service  
> 耗电异常

*列表来自酷安 @罗密欧与猪过夜*

### 安装教程

Lycan 是利用 Samsung Knox SDK 进行工作的，但它无法直接获取 Knox 权限，而 Splashtop-Add-on-Samsung 和 Lycan 的包名一致，所以在系统看来它俩是同一款应用。所以先由 Splashtop-Add-on-Samsung 获取并激活 Knox 权限，再让 Lycan 来顶替它，从而转移已激活的 Knox 权限。整个过程就相当于狸猫换太子。

#### [工具准备](https://www.123pan.com/s/2xiAjv-TStPh.html)

1. Lycan 安装包
2. Splashtop-Add-On-Samsung 安装包
3. Sam Helper
4. 炼妖壶

#### 完整步骤

不适用于部分 One UI 6.1 及之后的系统版本。因为官方在 24 年 10 月的系统更新中加强了 Knox 的安全等级，导致无法再通过 ADB 禁用 1.2.14 版本的 KLMS Agent。因此步骤 1 必定失败，显示 Failed to change state of package。

> - ***1\. 开放 Knox 权限***
> - 在 Sam Helper 中运行指令：  
> `pm enable com.samsung.klmsagent`

> - ***2\. 激活 Knox 权限***
> - 打开炼妖壶，建立壶中界
> - 打开系统自带的我的文件，点击 Splashtop-Add-On-Samsung 安装包
> - 打开方式选择 **工作**，不是选择个人
> - 选择 **工作** 中的炼妖壶并安装
> - 打开 Splashtop-Add-On-Samsung，按照提示激活 Knox 权限

> - ***3\. 禁用 Konx 权限***
> - 在 Sam Helper 中运行指令：  
> `pm disable-user com.samsung.klmsagent`

> - ***4\. 接管 Knox 权限***
> - 找到桌面上的炼妖壶设置并打开
> - 选择彻底摧毁，再选择毁灭
> - 安装 Lycan，按照提示激活 Knox 权限

> - ***5\. 恢复 Knox 权限***
> - 重复步骤1，教程完毕

#### 常见问题

1. One UI 6.1 能安装吗？  
不一定，本教程仅适用于 One UI 1.0 到部分 One UI 6.1。
2. 怎样算安装成功？  
进入主页后显示所有应用。
3. 主页不显示应用？  
重启设备即可。
4. 激活失败，显示 204 / 301 ？  
建议卸载干净，从头再试一遍。
5. Splashtop-Add-on-Samsung 激活失败 301？  
清除应用数据，按照提示授予所有权限。
6. Splashtop-Add-on-Samsung 卸载失败？  
设置中搜索设备管理应用程序，并取消授权。
7. 应用未安装：软件包与现有软件包存在冲突？  
确保 Lycan 和 Splashtop-Add-on-Samsung 都已经卸载，原因请看上述安装原理。
8. 需要一直挂在后台吗？  
不需要，它不会后台运行。
9. 怎么卸载？  
侧边栏点击卸载，选择不保留数据。
10. 会导致 Knox 熔断，或者影响系统安全吗？  
不会，没有任何影响。
11. 更新系统前，要解禁所有应用吗？  
可以不用，即使是大版本更新，实测也没有影响。
12. 炼妖壶不支持 Android 工作资料特性？  
改用 [安全文件夹](https://image.radishzz.cc/image/01-oneui/30.webp) 进行安装。

### 使用方法

![Lycan 使用方法](https://image.radishzz.cc/image/01-oneui/25.webp)

- **禁用应用**：主页-点击应用图标-点击左下方 `Disable` 禁用或 `Enable` 解禁（右上角可全选）
- **禁用组件**：主页-点击应用图标-点击组件图标-点击下方 `Disable` 禁用或 `Enable` 解禁（右上角可全选）
- **添加收藏**：主页-点击应用图标-点击右下角的爱心-选择默认文件夹，或创建新文件夹
- **导入/导出应用禁用方案**：主页-侧边栏-最爱-右上角三个点-导入/导出
- **导入/导出组件禁用方案**：主页-侧边栏-历史记录-右上角三个点-导入/导出

![Lycan 图标介绍](https://image.radishzz.cc/image/01-oneui/26.webp)

## Adhell 3 广告拦截篇

本篇章为进阶篇，主要介绍 Adhell 3 这款应用的功能与安装方法。

![Adhell 3](https://image.radishzz.cc/image/01-oneui/27.webp)

Adhell 3 也是一款专属于三星设备的应用，中文翻译为广告地狱，顾名思义其主打功能为去广告。它最初是由三星开发者 FiendFyre 开发，后因一些原因被迫下架。随后推出了 Adhell 2，但在一段时间后也停止了服务。直到 2017 年 Adhell 3 才出现。

它的工作原理是利用 Samsung Knox SDK 阻止广告域名，因此它只适用于三星设备。它是 Samsung Knox SDK 的一个前端，会把你的规则设定（广告域名、防火墙规则、白名单）写入 Knox，因此它不需要在后台运行。Adhell 3 共有以下四大功能。

### 四大功能

- **域规则**：通过订阅去广告 host 源或者添加本地 host 文件，Adhell 能够拦截对应的广告域名，从而达到去广告的效果，包括但不限于 App 内的开屏、信息流、弹窗广告等。
- **防火墙规则**：控制应用的移动数据/ WiFi 联网权限。自定义防火墙规则，例如通过添加 `com.android.chrome|*|53` 来阻止 Chrome 的所有 ip 地址通过 53 端口进行网络通信。
- **应用管理器**：管理系统应用程序。
- **组件管理器** ：管理 App 的权限与四大基本组件。

建议只使用域规则，其他功能可能有 bug。

#### 常见问题

1. 作用范围 ？  
在整个系统范围内阻止广告。
2. 耗电异常 ？  
Adhell 不会在后台保持运行，因此它本身不耗电。耗电异常的原因是，部分应用的广告被拦截后，在后台不断反复请求。
3. 与 Adguard 的区别 ？  
Adguard 运行时会占用 VPN 通道，此时无法再开启翻墙 VPN。而 Adhell 并不占用，因此可以同时开启。
4. Adhell 和李跳跳有什么区别 ？  
Adhell 是通过切断网络来阻止广告加载，李跳跳是在广告加载成功后帮你点击跳过。两者可以共存，起到互补作用。
5. 有 Adhell 还需要 Lycan 吗 ？  
Adhell 没法批量禁用，只能一个个手动点击，非常不方便。而 Lycan 可以，因此更推荐使用 Lycan 来禁用。
6. 推荐 host 订阅源 ？  
[Ad hosts](https://github.com/otobtc/ADhosts) 、[AdBlock DNS Filters](https://github.com/217heidai/adblockfilters)
7. 无法更新订阅源 ？  
请开启 VPN 代理。
8. 弄完怎么还有广告 ？  
本来就无法保证拦截所有广告。广告拦截效果是由你添加的 host 订阅源决定的，而 host 订阅源不可能收集到网络中的所有广告域名，因此有些漏网之鱼是正常现象。
9. 规则越多越好？  
规则越多，加载规则的时间越长，上网延迟也越高，甚至还有导致设备无限重启的案例，因此适量就好。

### 安装教程

Adhell 3 和 Lycan 的工作原理一样，都是利用 Samsung Knox SDK 进行工作的。因此安装原理同上，不再赘述。

#### [工具准备](https://www.123pan.com/s/2xiAjv-TStPh.html)

1. Adhell 3 安装包
2. NotifyRDS-Add-On-Samsung 安装包
3. Sam Helper
4. 炼妖壶

#### 完整步骤

不适用于部分 One UI 6.1 及之后的系统版本。因为官方在 24 年 10 月的系统更新中加强了 Knox 的安全等级，导致无法再通过 ADB 禁用 1.2.14 版本的 KLMS Agent。因此步骤 1 必定失败，显示 Failed to change state of package。

> - ***1\. 开放 Knox 权限***
> - 在 Sam Helper 中运行指令：  
> `pm enable com.samsung.klmsagent`

> - ***2\. 激活 Knox 权限***
> - 打开炼妖壶，建立壶中界
> - 打开系统自带的我的文件，点击 NotifyRDS-Add-On-Samsung 安装包
> - 打开方式选择 **工作**，不是选择个人
> - 选择 **工作** 中的炼妖壶并安装
> - 打开 NotifyRDS-Add-On-Samsung，按照提示激活 Knox 权限

> - ***3\. 禁用 Konx 权限***
> - 在 Sam Helper 中运行指令：  
> `pm disable-user com.samsung.klmsagent`

> - ***4\. 接管 Knox 权限***
> - 找到桌面上的炼妖壶设置并打开
> - 选择彻底摧毁，再选择毁灭
> - 安装 Adhell 3，按照提示激活 Knox 权限

> - ***5\. 恢复 Knox 权限***
> - 重复步骤1，教程完毕

按提示授予权限后，进入主页即为激活成功。显示激活证书的弹窗即为激活失败，从头再试一次。

#### 注意事项

1. 不建议开启防火墙规则。开启后电信卡无法接打电话和收发短信，只能流量上网，其它运营商请自测。
2. 同时开启 Adhell 与 Clash 会导致设备断网，代替方案是 [Clash Meta](https://github.com/MetaCubeX/ClashMetaForAndroid) 。
3. 开启域规则后，设备热点会无网络，暂时无解。
4. 有些域名被拦截后会反复请求，建议把这类域名加入到作用域页的白名单，否则可能会耗电异常，例如：  
`errlog.umeng.com` 错误日志  
`dataflow.biliapi.com` 数据流  
`loggw.alipay.com.cn` 日志网关
5. 不建议单独给某个应用开启应用白名单，否则加载域规则的时间将超级加倍。开一个翻一倍，开两个翻两倍。

### 替代方案

Adhell 3 从 2017 年至今已经年久失修，在 One UI 升级到 6.0 后又出现了一些 bug，我已经不再使用。但是拦截广告的方式不止一种，我再分享两个简单的方法。

#### DNS 广告拦截

![Adguard DNS](https://image.radishzz.cc/image/01-oneui/28.webp)

注册 [Adguard DNS](https://adguard-dns.io/) 后，点击连接新设备，如图设置私密 DNS 提供商主机名即可。如果想提升拦截效果，可以在 Adguard DNS 的服务器设置中添加以下拦截列表：

1. `AWAvenue Ads Rule`
2. `1Hosts (Lite)`
3. `HaGeZi's Normal Blocklist`
4. `OISD Blocklist Small`
5. `Steven Black's List`
6. `CHN: anti-AD`

#### ACL4SSR 广告拦截规则

![ACL4SSR](https://image.radishzz.cc/image/01-oneui/29.webp)

进入 [订阅转换页面](https://acl4ssr-sub.github.io/) ，如图进行订阅链接转换，其原理是在你的 VPN 订阅链接里添加 ACL4SSR 广告拦截规则。它仅在 VPN 开启时生效。

## 总结

![One UI](https://image.radishzz.cc/image/01-oneui/01.webp)

刚开始写这篇文章，只是想在 One UI 6.1 更新之前，捋一遍新系统的设置流程，方便自己刷机后进行恢复。结果花了好几天，写完一看都 1w+ 字数了，所以就整理成《优化指南》的形式分享出来，方便各位朋友进行参考。

那么关于整篇指南的主旨，想要提升设备的续航与流畅度，其实并不需要完成那么多花里胡哨的操作。如果你是以玩机为目的，那你确实可以全部跟着做一遍。但对于大多数人来说，日用才是关键，这些操作已经远远超纲了。通常你只需要完成应用安装篇和系统设置篇就可以达到很不错的续航和流畅度了，没必要再折腾禁用什么的，这些收益已经不大了。

最后给六个篇章的流畅省电效果排个名吧：  
**系统设置篇 > 应用安装篇 > 双清刷机篇 > Shizuku 应用篇 ≈ Lycan 禁用篇 > Adhell 3 广告拦截篇**

如果觉得本指南对你有一些帮助，欢迎赞助我一杯奶茶💰，我也可以为你解答相关问题。

打赏

- 微信
- 支付宝
- PayPal

![qrcode-wechat](https://image.radishzz.cc/image/qrcode-wechat.webp)

![qrcode-alipay](https://image.radishzz.cc/image/qrcode-alipay.webp)

![qrcode-paypal](https://image.radishzz.cc/image/qrcode-paypal.webp)