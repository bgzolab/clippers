---
comments: true
created: '1970-01-01T08:00:00'
draft: true
modified: '1970-01-01T08:00:00'
source: https://zhuanlan.zhihu.com/p/265597723
title: 蓝牙音频编码简介 - SBC、AAC、AptX、LDAC、LHDC
type: archive-web
---

早在2000年，蓝牙耳机就已经出现，但由于技术限制，只能用于通话。2008年，随着蓝牙A2DP(Advanced Audio Distribution
Profile)开始普及，立体声蓝牙耳机日渐流行。发展到现在，手机的耳机插口几近取消，双无线（TWS, True Wireless
Stereo）耳机正处于爆发期...

本文从蓝牙音频传输原理讲起，从旧到新介绍五种蓝牙音频编码，最后落脚实地，介绍如何选择和配置耳机/手机的蓝牙音频编码，获得更好的音质体验。

## 1 蓝牙音频传输原理

在《[数字音频基础­­­­­－从PCM说起](https://zhuanlan.zhihu.com/p/212318683)》中，我们知道mp3和flac音频编码都是在PCM音频编码基础上**二次编码**
得到的，其目的是减小文件体积。那么，在音频播放 (playback)
时，就需要把mp3，flac等编码格式的数据还原为PCM编码格式的数据，这个过程叫做**解码** 。然后经过数字-
模拟转换（DAC）变成模拟信号，最后经过放大电路驱动喇叭，将声音播放出来。

![](https://pic2.zhimg.com/v2-dbefd8246e133f6093c3ba3ee360a513_1440w.jpg)

对于无线系统来说，音频数据的传输还要遵从无线通信协议的规定，毕竟“此路是我开”嘛。如上图，在蓝牙系统中，发射端要将PCM编码**二次编码**
为蓝牙支持的编码，接受端收到后，再将其解码为PCM编码。整个系统中，影响音质的因素有：**音源质量** （有损编码与无损编码不同），**蓝牙音频编码**
，**蓝牙信号质量** ，**耳机品质** （喇叭与声腔设计等）。

作为一种无线通讯技术标准，蓝牙在其A2DP (Advanced Audio Distribution Profile)
中规定：**SBC是必须支持的编码** ，其余有三种可选编码，此外厂商还可以制定自己的编码。

> 【A2DP协议可以在蓝牙官网-www.bluetooth.com, HOME - SPECIFICATIONS - Traditional
> Profile Specifications 中找到并下载。】

![](https://pic4.zhimg.com/v2-649cd019c73709759905c9054da81369_1440w.jpg)

由上图可见，mp3 (全称MPEG-1 or MPEG-2 Audio Layer III)
和AAC编码都是可选编码。除了必须支持的SBC编码以外，目前蓝牙芯片支持最多的编码是AAC，AptX次之，LDAC和LHDC则较少。

## 2 蓝牙音频编码简介

**2.1 SBC**

SBC全称Subband Coding，**子带编码** 。**SBC是专为蓝牙设计的音频编码** ，复杂度低，可在中等比特率下实现较高音频质量。

![](https://pica.zhimg.com/v2-a846d68fefd1e5136668456a2e14d0b0_1440w.jpg)

其原理是：通过带通滤波器将音频信号分成不同频段的**子带信号**
，然后将这些信号经过频率搬移转变成基带信号，再对它们分别取样，量化和编码，最后合成一个总的码流传送出去，如下图所示。

![](https://picx.zhimg.com/v2-1654876a26d8cb1a44419a7ad92e9717_1440w.jpg)

这样做的好处是：舍弃或减小人耳听觉不敏感的频率部分，在敏感频率处采用较细的量化，在低比特率条件下获得更好的听觉效果。

A2DP中规定SBC编码支持最大比特率是单声道320kbps，立体声512kbps。但按其推荐，实际上使用最多的是44.1KHz，328kbps的立体声传输。

**2.2 AAC**

AAC全称Advanced Audio Coding，**高级音频编码** ，1997年诞生，基于MPEG-2技术。2000年在MPEG-4基础上更新。

![](https://pic4.zhimg.com/v2-83f13cf7cf1c06af20ad803aec4c1dd3_1440w.png)

作为mp3的后继者，AAC相较于MP3的改进有：更多的采样率选择(8 KHz至96 KHz，MP3为16 KHz至48
KHz)；更高的声道数上限(48个，MP3在MPEG-1模式下为最多双声道，MPEG-2模式下5.1声道)；任意的比特率和可变的帧长度。

AAC是一种高压缩比的音频编码，主要采取两种策略：舍去与感知上无关的信号成分，去除编码后信号的冗余部分。实际上，在128Kbps比特率以下，AAC编码的效果是最好的，杜比实验室认为：AAC格式在96Kbps比特率上的表现超过了128Kbps的MP3格式；同样是128Kbps，AAC格式的音质明显好于MP3。

AAC在蓝牙中常用的比特率是256Kbps。但是有一点，即使使用AAC音频源，蓝牙并不能直接传输其原数据流，而是先将AAC解码成PCM，然后再编码成蓝牙支持的AAC编码再传输。应用上，AAC编码最大的支持者是**苹果**
，iPhone、iPad和AirPods等设备都支持AAC，iTunes软件里的音乐很多也是以AAC编码格式存储的。

**2.3 AptX**

aptX原名叫apt-X，CSR在2010年将其收购，改名为aptX，而CSR于2015年被**高通** 收购。

![](https://pica.zhimg.com/v2-bf727efa1d1bf69c51d54c6c7c777a58_1440w.jpg)

aptX的设计基于自适应差分脉码调制（ADPCM）原理，并没有使用心理声学或掩蔽效应技术（mp3，SBC，AAC中使用）。**目前aptX共有四个版本**
，对比如下：

![](https://pic1.zhimg.com/v2-4ef4068aec6b235c60b7fa20c25f1218_1440w.jpg)

> 数据来源：[http://www.aptx.com/which-
> aptx](https://link.zhihu.com/?target=http%3A//www.aptx.com/which-aptx)

aptX的四个版本各有所长。aptX是最基础的版本。aptX Low Latency简称aptX
LL，特点在于低延迟。其实人耳可以感觉到的延迟极限是70ms，而达到40ms则意味着我们不会感觉到延迟。aptX
HD主打高清音频，传输速率大幅增加，并且有着更高的信噪比和更少的失真。而aptX
Adaptive，就如同它名字一样，可以按需自动调节传输比特率和延时。aptX Adaptive向下兼容aptX和aptX HD。

虽然使用aptX技术需要得到高通的专利授权并支付费用，但在高通的大力推广下，aptX在安卓手机和部分蓝牙耳机上都得到了支持。截止2019年5月，有超过70亿只设备支持了aptX，可以在[http://www.aptx.com/product-
listing](https://link.zhihu.com/?target=http%3A//www.aptx.com/product-
listing)中查询所有支持aptX的设备。

**2.4 LDAC与Hi-Res Audio认证标准**

**2.4.1 LDAC编码**

![](https://pic2.zhimg.com/v2-d928492128544dd3cac362e4ffd60df9_1440w.jpg)

LDAC是索尼开发的一种音频编码，实现了以最高 **990Kbps** 的比特率通过蓝牙传输 24bit/96kHz 的高分辨率音频(Hi-Res
Audio)。高传输码率使得高解析度的音频文件不会被过分压缩，保证了音质。

如下是来自索尼官网
[http://www.sony.net](https://link.zhihu.com/?target=http%3A//www.sony.net)
/Products /LDAC的对比图，可以看到，Hi-Res音频通过LDAC编码传输，还可以较好的还原高音质，SBC则较差。

![](https://picx.zhimg.com/v2-4974f0b84bb05c9e5f8f8360d90f92c9_1440w.jpg)![](https://pic4.zhimg.com/v2-4791d2a1725e8843e87207b2c1db7c7b_1440w.jpg)

其实在上两幅对比图中，索尼有夸大LDAC技术之嫌，图片的右下角都标注了 "仅供展示使用"。图一，对于4.5Mbps的Hi-
Res音频，要通过最高990Kbps的带宽传输，压缩率需要达到1:4.5，而目前最好的无损压缩率也只有1:2。实际上，**LDAC是一种有损编码**
，即使是最后在耳机端还原成了96KHz/24bit，4.5Mbps的音频，参数上与发送端一致，但是其内容也明显不如原来的好了。所以说，**LDAC可以传输CD级音质，但是并不能无损传输Hi-
Res音频，只能是接近（程度未知）。**

LDAC提升传输速率的原理是增加了蓝牙通信的信道，这对蓝牙天线的要求也提高了。实际上，在信号较差，或者是受到干扰的时候，LDAC还会以660Kbps或330Kbps的比特率通信，保证连接性。

2017年，从安卓8.0开始，
LDAC加入了安卓开放源代码项目，以后安卓用户也可以用上原本索尼专属的技术了，不过使用LADC解码器（耳机侧）还需要索尼的专利授权。

**2.4.2 Hi-Res Audio认证标准**

Hi-Res Audio全称为High-Resolution Audio，一般翻译**为高解析度音频**
，最开始是音乐和音响设备商的营销术语，通常表示指比CD音质更好（**采样率高于44.1KHz 或位深高于16bit** ）的音频。

2014年，日本电子信息技术产业协会（Japan Electronics and Information Technology Industries
Association, JEITA）定义了Hi-Res Audio术语，含义为一种采样频率或量化位数超过CD规范的音频。

日本音响学会（Japan Audio Society, JAS）根据JEITA的定义，提出了 **" Hi-Res
Audio"认证标准**，要求麦克风，放大电路与喇叭的频响大于40KHz，数字过程都需要96KHz/24bit及以上的规格，是针对产品的一系列规定。对于无线产品，还要附加满足其他条件，比如必须使用JAS认定的音频编码，目前只有LDAC和LHDC两种。

![](https://pic4.zhimg.com/v2-680873542a724048aa134c73ac82f0df_1440w.jpg)

获得此项认证的产品可以贴上图标识，国内俗称"**小金标** "，满足Hi-Res
Audio认证的产品不仅在蓝牙音质上，而且在耳机喇叭单元上也作了要求，能更好的满足最终的效果。索尼的大量音频产品都获得了此认证。

**2.5 LHDC与HWA**

**2.5.1 LHDC编码**

LHDC全称Low-Latency Hi-Definition Audio Codec，是一种高音质蓝牙编解码方案，由台湾厂商 **Savitech**
盛微先进科技开发。

![](https://pica.zhimg.com/v2-8332896e7ad1ff7403855d340d518c3a_1440w.jpg)

LHDC支持通过速度最高达**900kbps** 的蓝牙连接传输 24bit/96kHz
的串流音频（也称高解析度音频）。与LDAC会先把原始音频进行升/降频到
24bit/96kHz不同，LHDC则可依照原始取样率输出，减少SRC过程的延迟。2019年9月，LHDC通过了JRS的Hi-Res Audio
Wireless标准认证。

LHDC根据信号情况支持400/560/900 kbps的比特率。此外还有低延迟音频编解码器（LLAC）版本，也称为LHDC LL，端到端延迟约为30毫秒。

在应用上，从安卓10开始，LDAC加入了安卓开放源代码项目。

**2.5.2 HWA联盟与HWA认证标准**

HWA的全称是Hi-Res Wireless Audio，中文是**高清无线音频** 。它是一项基于LHDC音频编码技术的**认证标准**
，并非蓝牙音频编码。其性质与日本音响协会（JAS）所主导的Hi-Res Audio Wireless标准是相同的。由于HWA有点像Huawei
audio的缩写，很多人误以为是华为的音频协议，这是错误的。下图是HWA的徽标：

![](https://pica.zhimg.com/v2-5207158aefe5e9bb9aa0d19863847e12_1440w.jpg)

HWA也代指HWA联盟，全称为高清音频无线传输标准与产业联盟，成立于2018年9月。HWA联盟是由华为与中国音响协会主导，华为是手机端的技术推广者以及联盟核心成员，但并非技术主导。技术主导是台湾厂商
Savitech 盛微先进科技。

HWA联盟态度较为开放，只需要是符合性能指标等方面的要求，即可申请HWA认证。HWA认证分为白金级和黄金级两种：

![](https://pica.zhimg.com/v2-009347fb88a193837689c6959ce74b96_1440w.jpg)

> 数据来源：[http://www.hwa-lhdc.org/copy-of-how-it-
> works](https://link.zhihu.com/?target=http%3A//www.hwa-lhdc.org/copy-of-how-
> it-works)

作为HWA联盟的主导者之一，华为手机率先支持HWA标准，下图是2018年华为P20手机的巴黎发布会截图，就特意提到了HWA。不过其实在这里把HWA标准与各音频编码并列并不合理。

![](https://pic3.zhimg.com/v2-f85e173c00214622dd6f25d955bd8ff8_1440w.jpg)

其实制定一个蓝牙音频标准并不难，但是哪个标准会成为市场主流，更重要的还是看市场而不是技术，如何在高音质标准下能够保证正常的使用距离和体验才是需要关注的。虽然HWA标准被寄予厚望，但是其发展并不理想。现在华为似乎已经暂停了对HWA标准的支持。最新发布的FreeBuds
Pro无线耳机也没有提到HWA或者LHDC，去年发布的FreeBuds 3耳机也只支持AAC和SBC。

  

**2.6 总结**

总的来说，从音质上，**LHDC ≈ LDAC > aptX > AAC > SBC。**

![](https://pic2.zhimg.com/v2-ddf3532c47b99ceef92e4cf27492142d_1440w.jpg)

SBC是蓝牙唯一强制支持的编码，编码方案较为简单，但是比特率较低，压缩率较高，损失了部分细节，音质一般。

AAC的码率与SBC相当，但是得益于更好的编码技术，即使在同样的低码率下，AAC的听感也好于SBC和MP3。

Aptx的传输码率比之前两者略有所提升，同时更为高效的编码使得更多的音频细节能够得以保留，听感好于SBC以及AAC。aptX HD已经属于高清音频编码了。

LHDC和LDAC类似，都宣称可以传输高于CD音质的音频，传输比特率达900Kbps，是目前音质最好的蓝牙音频编码。

## 3 实际应用

**3.1 蓝牙编码的选择与匹配**

**3.1.1 匹配逻辑**

SBC编码规格是蓝牙协议的一部分，所有的经典蓝牙(Classic Bluetooth，区别于BLE -Bluetooth Low Energy)
都支持SBC，保证了所有蓝牙设备的语音互联互通。也就是说，所有支持经典蓝牙的手机和耳机都至少可以使用SBC编码互相传输音频。

对于其他音频编码，则需要手机和耳机的同时支持，如不满足，那还是使用SBC编码。

**3.1.2 手机蓝牙编码的配置**

苹果手机是AAC的重要支持者，搭载iOS的设备都默认使用AAC，而且由于iOS的封闭性，苹果手机也无从查看正在使用的蓝牙音频编码。不过，有网友发现macOS
Catalina 10.15可以配置使用aptX编码。

对于安卓系统手机，在开发者选项中可以查看和配置蓝牙相关参数。以小米MIUI12系统为例，路径为设置->更多设置->开发者选项。下图可见小米MIX2S手机系统支持目前所有的主流音频编码。

![](https://pica.zhimg.com/v2-eeb146db9314e7d17ad2e827fb1a620a_1440w.jpg)

手机一般会根据耳机自动选择最优的编码。MIUI系统还会在蓝牙设置界面显示实际使用的音频编码，点开详情可以手动设置为AAC，如果不兼容还可以手动改回，非常贴心。

![](https://pic1.zhimg.com/v2-0c01caaf7e99551fbffb2168cbea5852_1440w.jpg)

**3.1.3 蓝牙耳机的选择**

目前最流行的双无线(TWS)耳机都是以手机厂商品牌居多，那自然是用哪家的手机就推荐用哪家的耳机了，会有很多搭配自家手机的功能。

如果使用苹果设备，那么使用支持AAC的耳机就够了，使用符合Hi-Res Audio
Wireless小金标标准的耳机则显得超配。而如果是较新的安卓手机，追求更好的蓝牙音质的话可以选择支持aptX，LADC编码的耳机。支持aptX耳机机身上会有下图示的标志。而贴有Hi-
Res Audio标志的产品则一定支持LDAC或LHDC。

![](https://pic4.zhimg.com/v2-b4f54a5913a5ba0dcd29ffdda7171aff_1440w.jpg)

**3.2 正确认识蓝牙编码的优缺点**

影响蓝牙音质的因素很多，单纯从编码技术上我们认为 LHDC ≈ LDAC > aptX > AAC >
SBC。除此之外，在手机端，要使用高比特率的音源；在耳机端，需要具有更宽频响的耳机单元。甚至两者的蓝牙天线性能也要考虑，因为多数音频编码在蓝牙信号较差时会降低比特率，优先保证连接。

关于音质与延迟，两者是不可兼得的。如果要音质好，比如LDAC提高了蓝牙信道，就容易受到干扰，传输延迟也会变长。如果要延时低，则就要牺牲一定的音质。

最后还有很重要的一点，人的耳朵也是很重要的。实际上多数人无法盲听分辨上述几种编码的好坏，也只有极少的人能听出Hi-Res
Audio音质与CD音质的区别。不信的话可以去下面的网站测试一下你能不能分辨320kbps和128kbps的音频吧，记得用品质较好的有线耳机。

![](https://pic2.zhimg.com/v2-917d1affec23b6a4ffda82aabf894999_1440w.jpg)

\----------------------------

以上本人原创，禁止转载。

首发于微信公众号：**1E实验室** ，欢迎关注。