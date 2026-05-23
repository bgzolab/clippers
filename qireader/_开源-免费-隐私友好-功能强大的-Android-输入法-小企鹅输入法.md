---
created: '2025-11-24T16:49:39'
modified: '2025-11-24T16:49:39'
source: https://sspai.com/post/103871
title: 开源、免费、隐私友好，功能强大的 Android 输入法：小企鹅输入法
type: archive-web
---

**编注：** 本文为[少数派 11
月主题征稿活动](https://sspai.com/post/103691)入选投稿之一，除本文外，我们后续还有其他投稿选送首页，敬请留意。

* * *

## 前言

在中文环境中，无论使用什么操作系统，一个好用的输入法软件都是必不可少的。但输入法往往也是隐私问题的重灾区，它们常驻后台，我们也免不了会借助它们输入大量敏感内容，互联网公司们自然也可以轻松利用输入法来监视用户行为、篡改系统设定甚至注入后门程序。

如果你觉得这有些危言耸听了，不妨了解一下早些时候火绒团队曝光的《[搜狗输入法云控下发模块，“暗中”篡改浏览器配置](https://www.huorong.cn/document/tech/vir_report/1845)》。

所以无论在电脑还是手机上，我个人都会尽量选择使用开源注重隐私的输入法软件，在 Android 系统上，我一直使用的则是小企鹅输入法。

小企鹅输入法是由 Linux 端的输入法软件 [Fcitx5](https://github.com/fcitx/fcitx5)
移植而来的，它几乎不会申请任何额外权限，甚至不需要联网，这保证了它的隐私与安全性。但另一方面它的功能又非常丰富，内置了多种输入方案支持，还允许我们通过安装插件的方式来进一步扩展功能。

我算是这个输入法最早期的用户之一，在这期间看着这个输入法一点点改进，也变得越来越好用。但必需要说的是，即便当下这个输入法也算不上完美，尽管有着强大的
Fcitx 作为基础，小企鹅输入法依然缺失了一些功能，比如目前默认只有 qwerty
布局，不支持自定义键盘布局，没有九键布局可以使用，更没有手写输入支持；也没有内置语音输入功能，要想使用语音输入需要[额外配置](https://fcitx5-android.github.io/faq/#_14)；使用门槛也比较高，有些配置选项比较复杂，甚至有一部分选项因为是直接从桌面端移植过来的，在手机上并不会真正起效。

如果能够接受上面的缺点，这个输入法软件的功能还是十分强大的，这篇文章我将详细介绍这款输入法软件的配置与使用，除了能够快速上手外，我还会介绍一些实用的高级功能。

## 下载与安装

你可以直接从 [GitHub
Releases](https://github.com/fcitx5-android/fcitx5-android/releases)、[F-Droid](https://f-droid.org/packages/org.fcitx.fcitx5.android)
或 [Google
Play](https://play.google.com/store/apps/details?id=org.fcitx.fcitx5.android)
三个渠道下载到最新稳定版的小企鹅输入法，从 GitHub Release 和 F-Droid 下载到的安装包可以相互覆盖安装，但是 Google Play
版本无法覆盖安装。

你也可以使用[小企鹅输入法更新器](https://github.com/fcitx5-android/fcitx5-android-
updater)下载最新版 CI 构建的安装包，更新器还可以用来下载输入法插件，这就是后话了。从[这里](https://jenkins.fcitx-
im.org/job/android/job/fcitx5-android-updater/)可以下载到更新器的最新版本。

![](https://cdnfile.sspai.com/2025/11/19/056f62937070df72d0ddb7585d65a521.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

## 开始使用

### 快速上手

第一次打开，你需要按照 APP
指示把小企鹅输入法设为系统输入法，每一步都挺直观的，无需多说，之后小企鹅输入法会申请唯一一个需要的权限——通知权限，授予权限后就可以进到软件主界面了。

![](https://cdnfile.sspai.com/2025/11/19/8e1c12cc5dbb2a729d569eedc0663930.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

**首先打开全局选项** 。我个人不太喜欢显示预编辑，所以关掉了，下面几个选项可开可不开，影响不大，其余的就没什么需要更改的了。

![](https://cdnfile.sspai.com/2025/11/19/60b754f24624d31b9f7c7a9422f93c90.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

**接着是第二项输入法，默认有英语和拼音两个**
。我个人主要用小鹤双拼，所以我点击上方的编辑按钮移除了默认的拼音输入法，然后点击右下方的加号添加了双拼输入，长按并拖动可以调整输入法的顺序，我将双拼放在最上方，优先使用双拼方案，再点击双拼右边的齿轮图标。双拼方案设置成了小鹤，我不太习惯输入法开预测，所以我把预测也关掉了。

![](https://cdnfile.sspai.com/2025/11/19/18541e8a669ad6fb089dfb454dab8156.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

这样我们就得到了一个基本可用的输入法了，虽然看起来比较丑。

![](https://cdnfile.sspai.com/2025/11/19/5e33e89d3a9d9c59df3c91ac1ff9f0f3.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

### 配置外观

接下来对外观进行配置。

首先进入主题，小企鹅输入法内置了几个主题配色，最近的版本更新中还加入了根据壁纸自动取色的主题。如果对内置的主题不满意，可以去[这个网址](https://fcitx5-android.github.io/theme-
designer/)自己设计主题配色，再导入到 APP 内。

主题配置里，我习惯启用按键边框和水波纹特效。边距和圆角这个按照个人喜好更改就好，另外还可以设置跟随深色模式切换主题。

![](https://cdnfile.sspai.com/2025/11/19/9e983741a6116a7ba1e42d457e8e5826.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

虚拟键盘设置里，我习惯默认展开工具栏，键盘字母保持大写，不显示语言切换键，并把长按空格设置为切换输入法。

![](https://cdnfile.sspai.com/2025/11/19/6e91cfd59bd3b6f4d6eb2b0935c4c960.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

这样一番设置，输入法就看起来顺眼很多了。

![](https://cdnfile.sspai.com/2025/11/19/6034e27733769b6e90d73bfbcea15b8f.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

### 基本用法

抛开没有九宫格布局不谈，小企鹅输入法的功能其实已经非常完善，正常的 qwerty 键盘、数字键盘、特殊符号、emoji
甚至是颜文字都一应俱全，按键也支持长按弹出更多选项。

![](https://cdnfile.sspai.com/2025/11/19/45572e47a7d4ce7c8b1ce776f1191502.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

除此之外，小企鹅输入法还有一些很有意思的功能。比如当输入法有预编辑未提交的文本时，可以按住退格键并向左滑动一次性取消所有预编辑内容，如果没有预编辑文本且光标在文本框内的话，也可以通过按住退格键并左右滑动快速选中文本并删除。

这个功能太过于好用，以至于我在长期使用后已经形成了肌肉记忆。

![](https://cdnfile.sspai.com/2025/11/19/84a6581a109fb2c0093da55c2b5e1dd3.gif)![](https://cdnfile.sspai.com/2025/11/19/12d0e4dd68755ae36aaa499edb544393.gif)

另外他还有从 Gboard、或者说更早的 Google Pinyin
借鉴过来的，使用空格移动光标的功能。当有预编辑未提交的文本时，可以按住空格左右滑动编辑未提交文本，当没有预编辑文本且光标在文本框内，也可以按住空格并左右滑动移动光标。

![](https://cdnfile.sspai.com/2025/11/19/0097decacc203abb21d424db2508aed0.gif)![](https://cdnfile.sspai.com/2025/11/19/3dfedd3dc6397963e2bda232d234a9a6.gif)

它也有拆字模式，当想要打的字记得长什么样但忘记读音，就可以把字拆开分别输入，输入法会自动识别出你想打的字，比如输入「鑫」字，就可以连续输入三个「金」字的读音，在候选中会自动出现「鑫」字。

![](https://cdnfile.sspai.com/2025/11/19/42033dd9385cc34ef27c8b3af5a4d6e1.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

如果手机中有安装兼容的自动填充软件，比如我使用的 Bitwarden 密码管理器，小企鹅输入法也支持在工具栏中显示自动填充预览。

![](https://cdnfile.sspai.com/2025/11/19/139ac481f5c22c7451621c39c09e422c.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

### 添加词库

词库的丰富与否决定了输入法体验的好坏，小企鹅输入法自带的词库其实体量不是很大，不过我主要用双拼输入，重码率本来就比较低，再加上时间长了输入法也会记住输入习惯，所以我个人感觉上即使不添加额外词库，体验也不是很糟糕。

但话说回来，小企鹅输入法本身确实也是支持加载额外词库的。它支持 3 种格式的词库：

第一种是 Fcitx5 专用的词库格式，扩展名为 `.dict`，在 Github 上有一些现成的项目，比如 [zhwiki
词库](https://github.com/felixonmars/fcitx5-pinyin-
zhwiki)，它是使用中文维基百科词条生成的词库，词条数有超过百万，每月更新一次；再一个是 [moegirl
词库](https://github.com/outloudvi/mw2fcitx)，它是使用萌娘百科词条生成的词库，也是每月更新一次。

上面两个词库基本就覆盖了日常用语和网络用语。还有一个 [Minecraft
词库](https://github.com/oldherl/fcitx5-pinyin-minecraft)，它是使用 Minecraft Wiki
词条生成的词库，如果平时玩 Minecraft 比较多，可以考虑装这个词库。其实上面三个词库都是使用 MW2Fcitx 生成的1，理论上任何使用
MediaWiki 搭建的维基站点，都可以使用 MW2Fcitx
爬取下来生成词库，少数派站内已经有相关的[文章](https://sspai.com/post/90068)介绍了。

上面这三个词库其实都可以作为小企鹅输入法的插件安装，在小企鹅输入法更新器里，有 `pinyin-zhwiki`、`pinyin-moegirl` 以及
`pinyin-minecraft`
三个插件，安装词库后，需要重载配置才能生效，可以通过在多任务界面划掉小企鹅输入法的后台卡片实现重载，也可以点开输入法工具栏的三个点，其中有个重载配置的按钮。

![](https://cdnfile.sspai.com/2025/11/19/b374ea191023b34ae33b1f0912d4a0f3.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

值得一提的还有一个项目
[CustomPinyinDictionary](https://github.com/wuhgit/CustomPinyinDictionary)，这是一个从各种来源收集的同样有百万词条数的大词库，不过这个词库没有供小企鹅输入法使用的插件，所以安装起来要麻烦一点。它有手动安装和
Magisk 模块安装两种方法，如果手机已经使用 Magisk 或 KernelSU 获取了 Root 权限，那就直接刷入 Releases 里的
`CustomPinyinDictionary_Fcitx_Magisk_******.zip` 模块文件，刷入之后无需重启。如果手机没有获取 Root
权限，就需要从 Releases 下载 `CustomPinyinDictionary_Fcitx_*******.tar.gz` 文件，解压后获得扩展名为
`.dict`
的文件，再手动安装词库。在小企鹅输入法主界面点击第三个附加组件选项，找到「拼音」，点击右边的齿轮按钮，往下翻找到「管理词库」，点击右下角加号，选择刚刚获取到的词库文件，便可以导入词库了，同样导入词库后不要忘了重载配置。

![](https://cdnfile.sspai.com/2025/11/19/f144e7a6e37ee87bfef8ad91d650a67f.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

小企鹅拼音支持的第二种词库则是 txt 格式的纯文本词库，词库的格式为 `词语 拼音
权重`，每行一条，每个单字的拼音之间要用半角单引号隔开。不过需要注意每个汉字与拼音需要一一对应，且要遵循汉语拼音的基本规则。如果拼音不规范，即使导入也不会起作用。

需要注意的是，韵母中含有 `ü` 的话会比较特殊，特别是 `üe` ，其他的输入法大多是 `ue` 和 `ve` 都可以使用，而 fcitx5
的词库似乎只接受 `ue` 的拼法。按照 2001 年发布的
[《汉语拼音方案的通用键盘表示规范》](https://zh.wikisource.org/wiki/GF_3006-2001_%E6%B1%89%E8%AF%AD%E6%8B%BC%E9%9F%B3%E6%96%B9%E6%A1%88%E7%9A%84%E9%80%9A%E7%94%A8%E9%94%AE%E7%9B%98%E8%A1%A8%E7%A4%BA%E8%A7%84%E8%8C%83_\(2001%E5%B9%B4\)#4.3_%E9%9F%B5%E6%AF%8D%E8%A1%A8)，虽然在键盘输入时字母
`v` 可以代替拼音字符 `ü` 使用，但是绝大部分时候 `ü` 上的两点都可以省略掉写成 `u`，只有在少数情况，比如 `lü` 和 `lu`
两个读音完全不同且都有意义，才需要使用 `v` 代替 `ü`。这样看来，Fcitx5 对于拼音的处理是更规范的。

比如我可以组下面三个词：

    
    
    阅后即忘 yue'hou'ji'wang 555
    后羿奔月 hou'yi'ben'yue 555
    宁滥毋缺 ning'lan'wu'que 555

将上述内容保存为 `custom.txt` 文件，导入词库的步骤和前面完全一样，重载配置后，就可以加载自定义词库了，下面是输入的效果：

![](https://cdnfile.sspai.com/2025/11/19/460b67d86704c707ff153696610a2809.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

而如果将其中的韵母 `ue` 改成 `ve`，像下面这样：

    
    
    阅后即忘 yve'hou'ji'wang 555
    后羿奔月 hou'yi'ben'yve 555
    宁滥毋缺 ning'lan'wu'qve 555

那么导入词库后就不会起作用：

![](https://cdnfile.sspai.com/2025/11/19/171480b1ec884d13391a0feacdcf4688.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

第三种是搜狗的细胞词库，以[网络流行新词](https://pinyin.sogou.com/dict/detail/index/4)为例，直接下载扩展名为
`.scel` 的细胞词库，也是同样导入词库的步骤，并重载配置，就可以加载搜狗细胞词库。

![](https://cdnfile.sspai.com/2025/11/19/a97110f04bfffa618a2adc785c44524b.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

另外，我上面提到的这些词库都是只适用于拼音输入法的，如果你使用的是其他的形码方案，比如五笔，那么这些词库就不适用了，不过形码方案一般应该也不需要额外加载词库吧。

## 高级用法

### Unicode 与快速输入

如果想要输入无法直接打出来的特殊字符，小企鹅输入法从桌面端 Fcitx5 移植来了两个功能：Unicode 模式和快速输入（Quick
Phrase）模式。键盘左下角的逗号按键，在长按时会弹出三个选项，中间的是 emoji 键盘，往左划是 Unicode 模式，往右划是快速输入模式。

![](https://cdnfile.sspai.com/2025/11/19/f8b6815fa4ffc401ea34450b4ba8fdba.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

在 Unicode 模式下，可以通过输入字符的 Unicode 编码或是关键词来查找相关的字符，以输入希腊字母「π」为例，按住逗号按钮并左划进入
Unicode 模式，然后输入编码 `03C0` 或是关键词「greek small letter pi」就可以找到「π」字符了。

![](https://cdnfile.sspai.com/2025/11/19/b0818f6bd6fd920f81b7d94b28997ef6.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

具体的 Unicode 字符表可以到[这里](https://zh.wikipedia.org/zh-
cn/Unicode%E5%AD%97%E7%AC%A6%E5%88%97%E8%A1%A8)查看。

不过我有点想吐槽：这个 Unicode 模式也太硬核了，想要输个特殊字符还要去查 Unicode 表，查到了以后就能直接从表里复制了，还要输入法干嘛😆。

快速输入模式简单来说就是一些自定义短语来快速定位一些特殊字符，和词库不同的是它不需要拼音和汉字一一对应，也不需要严格遵循拼音规则，小企鹅输入法已经内置了一些
QuickPhrase 表，想要查看的话，在附加组件里找到「快速输入」，点击右边的齿轮按钮，再点击「编辑器」，就可以看到内置的快速输入表了，默认有
emoji、颜文字和 LaTeX，点击旁边的编辑按钮可以看到每个表内的内容。

![](https://cdnfile.sspai.com/2025/11/19/bfc72545c07de4c17a06d28682edc3c7.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

可以看到，为了防止三个表内容混乱，emoji 和 LaTeX 的短语都是有一个特殊字符作为开头的，emoji 表是以冒号开头，而 LaTeX
表是以反斜杠开头。

但是这里就出现了一个问题，这些内置的快速输入表也是从桌面端移植来的，所以也没有考虑在移动端输入的情况，还是以前面的字符「π」为例，这个字符在 LaTeX
表里，但是经过我的尝试，在小企鹅输入法的快速输入模式里，是没办法打出来反斜杠的，这就导致了无法使用快速输入模式输入「π」以及其他 LaTeX 字符。

不过好在快速输入表也是可以进行自定义的，我从[这里](https://github.com/fcitx/fcitx5/blob/master/src/modules/quickphrase/quickphrase.d/latex.mb)找到了
LaTeX
表的原文件，稍微更改了一下，把开头的反斜杠改成了普通斜杠，这样就可以在小企鹅输入法上正常输入了，我把修改过的文件放在了[这里](https://gist.github.com/so1ar/1c3e94e8ce66184a574b26e6dbec1e07)，把文件下载下来保存为
`custom-latex.mb`。在快速输入编辑器界面点击右下角的加号，选择导入文件，选择刚刚下载的文件，就可以导入自定义快速输入表了。

![](https://cdnfile.sspai.com/2025/11/19/f9a00775ae872273c139d42c2349fb68.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

同样以输入「π」为例，按住逗号按钮并右划进入快速输入模式，然后输入 `/pi`，就可以找到符号「π」了。

![](https://cdnfile.sspai.com/2025/11/19/7c3a03dd69e198d2989569b320c0fe93.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

### Lua 脚本

支持载入 Lua 脚本是小企鹅输入法从桌面端 Fcitx5 移植而来的另一个功能，简单来说就是可以使用自定义 Lua
脚本来修改输入内容。小企鹅输入法已经内置并默认启用了一些 Lua 脚本2，比如在输入「时间」、「日期」关键词时，会自动在候选中出现当前的时间和日期：

![](https://cdnfile.sspai.com/2025/11/19/14620ee19f3c2d412b10c57f8daad8e0.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

同样 Lua 脚本也可以进行自定义，不过有些复杂，Fcitx5
官方的[文档](https://fcitx.github.io/fcitx5-lua/)写的有些过于精简了，我在互联网上也只找到了一个写的比较通俗易懂的[教程](https://www.aloxaf.com/2020/09/fcitx5_plugin/)。

Fcitx5 的 Lua 脚本支持两种格式：[Google Pinyin
格式](https://fcitx.github.io/fcitx5-lua/modules/ime.html)和 [Fcitx
格式](https://fcitx.github.io/fcitx5-lua/modules/fcitx.html)。本篇文章我就只简单介绍一下
Google Pinyin 格式的 Lua 脚本怎么编写，因为 Fcitx 格式的脚本更加复杂，我也没有搞明白😂。

Google Pinyin 格式的 Lua
脚本，按照我的理解可以分为两个部分，第一个部分定义一个函数，用来返回想要输出的内容，第二个部分使用特殊的函数来调用之前定义的函数，从而决定在何时用什么方法输出内容。而可用的特殊函数有三个，分别为：

  * `register_command (command_name, lua_function_name, description, leading, help)`，用于在快速输入模式中自定义内容。其中 `command_name` 是快速输入的触发词，只可以是两个字符；`lua_function_name` 是调用的函数名；`description` 是命令的描述；`leading` 是选择结果的快捷键，可以设置为 `digit` 用数字键选择，也可以设置为 `alpha` 用字母选择，也可以选择 `none` 禁用快捷键；`help` 是命令更详细的帮助，不过似乎这个选项并不会生效。
  * `register_trigger (lua_function_name, description, input_trigger_strings, candidate_trigger_strings)`，可以用于直接在候选中添加自定义内容。其中 `lua_function_name`、`description` 和第一个函数用法相同；`input_trigger_strings` 是匹配输入的字符串；`candidate_trigger_strings` 是匹配候选中的字符串。
  * `register_converter (lua_function_name, description)`，用于直接修改输出的内容。其中只有两个参数，用法和上方一样。

作为演示，我编写了一个 Lua 脚本，主要有以下功能：

  * 当输入「少数派」或「派」的时候，自动在候选中添加希腊字母「π」；
  * 在快速输入模式中输入 `pi`，会出现汉字「少数派」；
  * 当想要打出「我是少数派」时，会自动替换为「少数派，高效工作，品质生活」。

    
    
    -- 定义一个函数，返回希腊字母 π
    function pai(str)
      return "π"
    end
    
    -- 定义一个函数，返回字符串「少数派」
    function sspai(str)
      return "少数派"
    end
    
    -- 定义一个函数，把「少数派」三个字替换为「少数派，高效工作，品质生活」
    function sspai_plus(str)
      local tmp = string.gsub(str, "我是少数派", "少数派，高效工作，品质生活")
      if tmp ~= nil then
        str = tmp
      end
      return str
    end
    
    -- 当候选中存在「少数派」，在候选中添加希腊字母 π
    ime.register_trigger("pai", "希腊字母 π", { }, { "少数派" })
    -- 当候选中存在「派」，在候选中添加希腊字母 π
    ime.register_trigger("pai", "希腊字母 π", { }, { "派" })
    -- 在快速输入模式中输入 pi，返回字符串「少数派」
    ime.register_command("pi", "sspai", "少数派", "none", "")
    -- 当打出「我是少数派」三个字时，自动替换为「少数派，高效工作，品质生活」
    ime.register_converter("sspai_plus", "替换少数派")

将上述内容保存为 `custom_plugin.lua` 文件，并放入用户根目录的
`Android/data/org.fcitx.fcitx5.android/files/data/lua/imeapi/extensions/`
里面，如果没有文件夹就需要手动创建。重载输入法后，就可以测试 Lua 脚本是否生效了：

![](https://cdnfile.sspai.com/2025/11/19/758abaf9b9e18c7fe69262a796cbe667.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)![](https://cdnfile.sspai.com/2025/11/19/16793b760373a0215388833f3031b0dd.gif)

另外在小企鹅输入法的交流群里，有人[分享](https://t.me/fcitx5_android_group/168815)了一个计算器脚本，同样将
`calculator.lua` 文件放入指定文件夹，重载配置后就可以生效，在快速输入模式下先输入等号 `=`，再输入算式，就会自动计算：

![](https://cdnfile.sspai.com/2025/11/19/d2d83922ce5bd2b1b83dde8580540a97.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

问题是在高版本 Android 系统中，用户无法直接访问 `Android/data` 目录了，我个人推荐使用 MT 管理器，如果获取了 ROOT
权限，可以直接访问 `Android/data` 目录，如果没有 ROOT 权限，则可以尝试使用 Shizuku 授权而获得访问
`Android/data` 的能力。

### 程序插件

在小企鹅输入法更新器中，还可以下载很多程序插件来扩展小企鹅输入法的功能。

除了前文提到的三个词库插件，还可以添加其他的中文输入方案，比如五笔
98、郑码和仓颉；或者添加其他语种的支持，比如日语、韩语和越南语；甚至可以添加中州韵输入法引擎，从而支持导入现成的 Rime
输入法方案；还有一个特殊的功能剪贴板过滤插件。

受限于我个人的知识水平以及篇幅，我不可能详细介绍每个插件，这里我只稍微讲一下两个插件：剪贴板过滤插件和 Rime 插件。

剪贴板过滤插件（fcitx5-android-plugin-clipboard-filter）的功能其实很简单，就是对复制到剪贴板的网页链接应用
[ClearURLs](https://github.com/ClearURLs/Addon)
规则，从而去除链接中的跟踪元素。安装插件并重载后即刻生效，无需额外配置。之后尝试复制一个带跟踪元素的链接，比如
`https://example.com?utm_source=newsletter1&utm_medium=email&utm_campaign=sale`，就会发现在输入法的剪贴板历史里跟踪元素被自动去除了：

![](https://cdnfile.sspai.com/2025/11/19/a2365325746ba2341ec685ca4774eee5.gif)

不过需要注意的是，如果使用的是后台限制比较严格的国产安卓系统，这个插件可能不会生效，可能要把输入法和剪贴板过滤插件全部设为允许后台运行才能生效。

另一个要讲的插件是中州韵输入法插件（fcitx5-android-plugin-
rime），[中州韵](https://rime.im/)输入法是一个跨平台的开源输入法引擎，自定义程度极高。在小企鹅输入法引入中州韵插件之前，Android
平台唯一可用的中州韵输入法实现是[同文输入法
trime](https://github.com/osfans/trime)，我在之前也是用的它，并且自行维护了一套 Rime
输入方案，不过同文输入法我用下来稳定性比较差，经常崩溃，也比较卡顿，所以在小企鹅输入法达到了基本可用状态后，我就不再用同文输入法了，对于 Rime
配置文件怎么写也忘得差不多了😂。

中州韵的具体配置比较复杂，为了演示方便我就直接使用现成的输入法方案：[雾凇拼音](https://github.com/iDvel/rime-ice)。

  * 在安装了中州韵插件并重载配置后，在小企鹅输入法主界面的输入法选项里就可以添加中州韵输入法了；
  * 把雾凇拼音的 Github 仓库整个打包下载，解压后将全部文件复制到 `Android/data/org.fcitx.fcitx5.android/files/data/rime/` 目录下；
  * 在任意输入框中呼出小企鹅输入法，点击工具栏上的三个点展开工具栏，点击重载配置，会在左下角出现一个 `< >` 图标，点击这个图标，在弹出框中点击重新部署；

![](https://cdnfile.sspai.com/2025/11/19/836152478fa906a5b2134b579c50c22d.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

  * 等待部署成功后会弹出提示，此时再次点击 `< >` 图标，就可以选择想要的输入法了，我这里选择小鹤双拼；

![](https://cdnfile.sspai.com/2025/11/19/7178096370e385b8ed81fb9c6bdc5fa3.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

  * 之后就可以使用雾凇拼音方案了。

![](https://cdnfile.sspai.com/2025/11/19/6b3303566d54676dc9ff00a58fd6f270.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

## 结尾

目前来看，小企鹅输入法确实是相对于 iOS 平台来说的 Android 独占应用，未来这个情况可能会发生改变，在其 GitHub 仓库的 README
中提到，小企鹅输入法的 [iOS 版本](https://github.com/fcitx-contrib/fcitx5-ios)、[MacOS
版本](https://github.com/fcitx-contrib/fcitx5-macos)、[HarmonyOS
版本](https://github.com/fcitx-contrib/fcitx5-harmony)、[Windows
版本](https://github.com/fcitx-contrib/fcitx5-windows)以及 [ChromeOS
版本](https://github.com/fcitx-contrib/fcitx5-chrome)都在开发中，iOS
版本目前正处于开发者公测阶段，功能有所缺失且还未上架 APP Store，其他的版本目前都还不可用。不过还是值得期待的。

> 关注 [少数派公众号](https://sspai.com/s/J71e)，解锁全新阅读体验 📰

> 实用、好用的 [正版软件](https://sspai.com/mall)，少数派为你呈现 🚀
