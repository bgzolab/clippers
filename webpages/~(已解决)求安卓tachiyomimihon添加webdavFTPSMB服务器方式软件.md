---
aliases:
  - (已解决) 求安卓 tachiyomi/mihon 添加 webdav/FTP/SMB 服务器方式/软件
created: 2025-10-16T05:16:35
description: "(已解决)求安卓tachiyomi/mihon添加webdav/FTP/SMB服务器方式/软件"
modified: 2025-10-16T05:17:08
source: "https://bgm.tv/group/topic/438749"
tags: []
title: (已解决) 求安卓 tachiyomi/mihon 添加 webdav/FTP/SMB 服务器方式/软件
type: "archive-web"
---

# (已解决) 求安卓 tachiyomi/mihon 添加 webdav/FTP/SMB 服务器方式/软件

虽然 tachiyomi 插件 Mango, lanraragi, komga​, Suwayomi，Kavita 等这些服务器支持但都依赖 PC❗而且貌似还只支持独家的，所以想找摆脱 PC 能用的，以下是窝搜集到的相关信息：

https://github.com/getmango/Mango/issues/33

https://github.com/getmango/Mango/issues/268

https://github.com/Suwayomi/Suwayomi-Server/issues/477

https://xsinger.me/diy/1610.html

https://imnks.com/7455.html

https://sspai.com/post/79100

https://docs.startrekcn.cn/guide/comic-server-guide.html

https://www.himiku.com/archives/komga.html

https://duke486.com/posts/acgn%E ... %E6%BC%AB%E7%94%BB/

貌似支持以上涉及到的插件支持的协议的服务器软件 (还没深究不确定以上插件支持与否：

https://github.com/happypandax/happypandax PC 端漫画服务器

https://happypandax.github.io/us ... ing-from-happypanda

https://github.com/wa2c/cifs-documents-provider

https://github.com/chenxiaolong/RSAF

总感觉有的，就是窝找的方式不对？所以知道的有劳分享一下，感谢！

相关 https://bgm.tv/group/topic/430764

---

#1 - 2025-10-9 09:54

倒序显示

\- 2025-10-9 10:10

[回复](https://bgm.tv/group/topic/ "回复")

[贴贴](https://bgm.tv/group/topic/)

**[ゆめ)就像(み)做梦(た一)样](https://bgm.tv/user/gonsenmad)** (二次元界 acgn#%G 潜行中……)

差点忘了有安卓或其他版本的：

[https://github.com/tachimanga/Tachidesk-Sorayomi](https://github.com/tachimanga/Tachidesk-Sorayomi) 全平台，安卓的只是客户端

全平台，同上❗

[https://github.com/Suwayomi/Suwayomi-JUI](https://github.com/Suwayomi/Suwayomi-JUI) 安卓的同上，

[https://github.com/Utazukin/Ichaival](https://github.com/Utazukin/Ichaival) 安卓，客户端

\- 2025-10-9 22:28

[回复](https://bgm.tv/group/topic/ "回复")

[贴贴](https://bgm.tv/group/topic/)

**[ゆめ)就像(み)做梦(た一)样](https://bgm.tv/user/gonsenmad)** (二次元界 acgn#%G 潜行中……)

网上找了一天了愣是毛都没见着😓，

最多有支持 opds 的但也是 PC 端的真是❗手机端的都是清一色的客户端…………，看来目前只有用虚拟终端这条路了诶

\- 2025-10-10 04:31

[回复](https://bgm.tv/group/topic/ "回复")

[贴贴](https://bgm.tv/group/topic/)

**[ゆめ)就像(み)做梦(た一)样](https://bgm.tv/user/gonsenmad)** (二次元界 acgn#%G 潜行中……)

以下是窝找到的挂载 FTP 方法：

1\. 启动 FTP 服务器软件 (mix，文件管理器 +

2\. CIFS Documents Provider 挂载 FTP 服务器，第 3 空存储选 FTP(Apache commons)，帐密，点击目录选择目标后保存，

3\. 选择支持修改存储位置的 tachiyomi 分支 (aniyomi✅，komikku✅，Yōkai，mihon，tachiyomiSY，kahon)，选择挂载 CIFS Documents Provider 保存的服务器，路径确保符合存储位置（例如/ tachiyomi /），应该有一个本地文件夹。 将正确的结构系列放在其中（例如/ tachiyomi / local /）内。

如果在文件夹中添加系列，建议添加名为.Nomedia 的文件到本地文件夹所以图像不会在画廊中显示。

现在应该能够在本地源下的浏览→源中访问该系列。

如果你添加更多章节，那么你必须手动刷新章节列表（通过拉下列表）。

支持的章节格式是文件夹，其中包含图片（如 jpg，.png 等）或存档文件（zip | cbz，rar / cbr 和 epub）。 但预计目录和 ZIP / CBZ 的性能更好。具体： [https://bgm.tv/group/topic/431929](https://bgm.tv/group/topic/431929) ， [https://meta.appinn.net/t/topic/74276](https://meta.appinn.net/t/topic/74276)

经测试，局域网加载慢，就差不多十来个文件就加载半天还可能会失败/软件卡机/闪退，而且流量还很大❗不是局域网的……，CIFS Documents Provider 只支持 smb2～3，而 mix 文件管理器 smb1 经过测试没用，只能用 FTP，但 FTP 两个软件几乎都一样，文件管理器 + 好点，

关于挂载外部存储 SAF 的软件可以用其他的比如质感文件，Solid Explorer，Ghost Commander，FX File Explorer，Total Commander，X-plore，

\- 2025-10-10 20:36

[回复](https://bgm.tv/group/topic/ "回复")

[贴贴](https://bgm.tv/group/topic/)

**[ゆめ)就像(み)做梦(た一)样](https://bgm.tv/user/gonsenmad)** (二次元界 acgn#%G 潜行中……)

第二：CIFS Documents Provider/超级分享/FTP，komikku/aniyomi 加载没多久就闪退❗️

质感文件/FTP 一样❗️加载还很慢❗️komikku 卡机，aniyomi 闪退❗️

第三，x21/es 文件管理器/FTP，只有本机正常❗️

NMM/FTP(本机要连 WIFI 才能用❗️，aniyomi 勉强算正常，加载有点慢，komikku/r10 加载不了❗️

x-plore/FTP 同上，komikku❌

amaze 文件管理器/FTP，komikku/aniyomi❌

RSAF 也可以 SAF 外挂网盘，但目前不知咋用，没中文，目前就发现它和前面的 CIFS DP 相似，还有 Server ultimate pro，andSMB 这些服务器端参数复杂目前也不知咋设置才能用 FTP/SMB，

\- 2025-10-13 07:54

[回复](https://bgm.tv/group/topic/ "回复")

[贴贴](https://bgm.tv/group/topic/)
