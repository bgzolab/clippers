---
aliases:
  - 使用 playnite 整理本地黄油和模拟器游戏的一些方法。
created: 2025-09-07T00:24:16
description: "使用playnite整理本地黄油和模拟器游戏的一些方法。"
modified: 2025-09-07T00:24:21
source: "https://bgm.tv/group/topic/397822"
tags: []
title: 使用 playnite 整理本地黄油和模拟器游戏的一些方法。
type: "archive-web"
---

# 使用 playnite 整理本地黄油和模拟器游戏的一些方法。

在楼里大佬指引下花了几天时间整理了一下本地的游戏、音乐和漫画本子库，关于一些问题我个人一些比较笨的解决方法和一些教程的指路和汇总。

本地游戏管理器：Playnite（需要全程魔法，不然没法刮削信息和下载插件）

基础的安装和配置跟着这两篇文章来就可以：[个人游戏启动器 | 游戏数据库 playnite 折腾记录](https://blog.csdn.net/wangrui1573/article/details/135216566)

[playnite管理Galgame和游戏](https://zhuanlan.zhihu.com/p/677996344)

插件汇总：[https://vika.cn/share/shrApaSWa1TLxAcRtD6y0](https://vika.cn/share/shrApaSWa1TLxAcRtD6y0)（B 站 UP zero ゼロ零整理）

[https://github.com/darklinkpower/PlayniteExtensionsCollection](https://github.com/darklinkpower/PlayniteExtensionsCollection)

单机游戏类推荐是直接从 steam store 刮削，steam 上没有的可以考虑从 IGDB 上刮削，想要游戏中文名称的就自己手动修改。

galgame 信息的刮削

推荐是 VNDB+bangumi+dlsite 刮削结合起来用（bangumi 的挂削参考 github 插件作者的教程获取 Access Token：[https://github.com/Ivanlon30000/PlayniteBangumiMetadata](https://github.com/Ivanlon30000/PlayniteBangumiMetadata)，dlsite 的挂削参考 [https://bgm.tv/group/topic/379720](https://bgm.tv/group/topic/379720)（没有强迫症的后面的就不用看），问题其一，一些游戏刮削下来的封面图和背景图是用同一张低分辨率的图像，这个问题在纯拔作上更难受背景图基本没有高分辨率的可以用，非纯拔作的封面在搜索里基本就能搜到清晰度比较高的，拔作我个人的解决方法是用 waifu2x 放大，dlsite、bangumi、vndb 和 getchu 上对比了一下还是 getchu 的封面比较清晰，可以从 getchu 上下载封面然后丢到 waifu2x 跑两倍分辨率再添加到背景图里，但是效果还是有点拉而且比较麻烦，目前我没有找到更好的解决方案了，嫌麻烦可以刮削完数据后把背景图删掉，留个封面就好。问题其二，使用 dlsite 刮削器无法直接在刮削器搜索框内搜到游戏，这个问题在上面 dliste 刮削器帖子里就有解决办法，但是这个插件已经很久没有更新，无法支持最新的 VJ 号和必须在编辑里先加上游戏名称才能搜索，所以还是不太建议使用这个插件，想要中文标签用 bangumi 不在意英文标签的 vndb 也可。问题其三：流派标签混乱，如果要使用 gameactivity 插件记录游戏时间且要在 bangumi 上刮削信息，务必把插件设置里的流派去除勾选，不然当你记录时长游戏超过 10 个的时候就会在 gameactivity 流派栏下看见整个晋西北乱成一锅粥，筛选器的流派栏也会变得很混乱，所以还是推荐不要在刮削信息的时候选上流派，刮削完信息统一加上一个标签就好，比如 galgame/Visual novel/ADV。问题其四：一些比例的封面封面图片很糊或者显示不正常，在左上角手柄图标 - 设置 - 网格视图里重新选一下拉伸模式即可。问题其五，一些需要转区的游戏如何添加进 playnite 运行，方法有以下两个：1.右键需要转区的游戏启动文件，点击 Locale Emulator - 以此程序配置运行，然后在高级选项中选择需要的选项后点击建立快捷方式，然后把桌面的快捷方式丢进游戏文件夹，之后用 playnite 扫描添加即可。2.参考贴吧的这篇帖子：[https://tieba.baidu.com/p/8893305673](https://tieba.baidu.com/p/8893305673)

整理之后的效果展示（装了主题 stardust）

![](https://s2.loli.net/2024/05/02/HwcDhVdxflWoFSv.png)

![](https://s2.loli.net/2024/05/02/bwDSiud1lt8AZvo.png)

![](https://s2.loli.net/2024/05/02/u7lXKqn2OwDMRzB.png)

![](https://s2.loli.net/2024/05/02/z5UxkLAg9m6CZDn.png)

![](https://s2.loli.net/2024/05/02/MuAD6B971zcF2ka.png)

关于模拟器游戏的添加

只说一下我自己有下的 PCSX2，ppsspp，wiiu，vita3k 和龙神

1.配置模拟器

点击左上角手柄图标 - 库 - 配置模拟器 - 导入 - 扫描文件夹 - 选择模拟器所在文件夹 - 模拟器 exe 然后保存即可

2.添加模拟器游戏

PCSX2，PPSSPP 配置好模拟器后，左上角手柄图标 - 添加游戏 - 添加模拟器端游戏 - 添加扫描器 - 选择 PCSX2/PPSSPP- 扫描文件夹选择游戏 ISO 所在文件夹添加即可

cemu 的步骤跟 PCSX2，PPSSPP 的配置一样，不过最后扫描的文件夹是模拟器设置的游戏路径，cemu 模拟器 - 选项 - 通用设置 - 通用 - 游戏路径可以看到游戏所在路径

PSV 模拟器 Vita3k 和 switch 模拟器龙神无法使用一样方法添加，Vita3k 是完全扫描不到，龙神是加载不了升级补丁，最后折腾出来可以直接在模拟器内新建快捷方式然后通过快捷方式添加即可

3.游戏信息的刮削

模拟器的推荐到这个网站 [https://www.screenscraper.fr/index.php](https://www.screenscraper.fr/index.php) 上注册一个账号，然后下载对应的 playnite 插件进行刮削。

不知道是插件原因还是我自己的原因，有时候会抽风封面加载不出来，如果有一样问题的话缺少的封面可以到这里找 [https://gamefaqs.gamespot.com/](https://gamefaqs.gamespot.com/)，基本各个平台游戏的封面都有甚至还有分地区版本，很良心，强烈推荐。

整理之后的效果展示（装了主题 stardust）

![](https://s2.loli.net/2024/05/02/KZhYCxoj4r5b7kf.png)

![](https://s2.loli.net/2024/05/02/Wvrpt3HQZOJm69X.png)

另外还有很多实用的插件，比如记录游戏游玩时间的 gameactivity，Extra Metadata Loader+Extra Metadata Fullscreen Mode Helper 给游戏添加宣传片和 galgameOP 搭配上一些大屏幕主题可以实现实时预览视频效果，记录游戏成就的 success story 和备份游戏存档的 ludusavi，这些就不再赘述，有需要的同学按需在 playnite 上下载即可

本地音乐管理

基本的方法就是音乐播放管理软件（如 MusicBee、foobar2000）搭配上标签编辑（MusicTag、Mp3tag）使用。

最后在这两个里选了带 foobox 皮肤的 foobar2000，效果如下

![](https://s2.loli.net/2024/05/02/PUxAoz5DnlwFgZK.png)

MusicBee 的使用方法可以参考这篇博客：[本地音乐的管理——Musicbee简单上手指南](https://blog.dewsweet.cc/archives/1708007305156#comment-15c9c2b1-5c12-4bb7-85fc-588b7fc9ed98)

最后请教下各位没有 nas 的情况下本地漫画管理有什么推荐的吗？最好是可以设置作者和标签分类、局域网内访问漫画库的功能。还有本地的阅读器，尝试了好几个使用起来都不是很符合我的习惯，唯一一个还可以的 Neeview 又蛋疼的不支持 epub 格式。
