---
draft: true
aliases:
  - Yt-dlp 使用教程 - Leone-
created: 2025-08-07T15:08:36
modified: 2025-08-30T21:04:03
source: https://www.cnblogs.com/doseoer/p/19026892
title: Yt-dlp 使用教程 - Leone-
type: archive-web
---
# Yt-dlp 使用教程 - Leone-

之前用 you-get、youtube-dl 下载油管视频都很慢，只有几十 KB 最多。于是网上找到了这个 yt-dlp 的代替工具。项目地址：https://github.com/yt-dlp/yt-dlp

[youtube-dl](\"https://zhida.zhihu.com/search?content_id=225568623&content_type=Article&match_order=1&q=youtube-dl&zhida_source=entity\")

[https://github.com/yt-dlp/yt-dlp](\"https://link.zhihu.com/?target=https%3A//github.com/yt-dlp/yt-dlp\")

## 安装 yt-dlp

### 1. 安装 Python 和 ffmpeg

[Python](\"https://zhida.zhihu.com/search?content_id=225568623&content_type=Article&match_order=1&q=Python&zhida_source=entity\")

[ffmpeg](\"https://zhida.zhihu.com/search?content_id=225568623&content_type=Article&match_order=1&q=ffmpeg&zhida_source=entity\")

- Python：安装时把 pip 和添加系统环境变量都选上
- ffmpeg：下载好 exe 文件，把目录添加到系统环境变量就行

## 2. 安装 yt-dlp

pip install yt-dlp

如果不想用 pip 安装的，就去项目地址下载 exe 版本：https://github.com/yt-dlp/yt-dlp#release-files

[https://github.com/yt-dlp/yt-dlp#release-files](\"https://link.zhihu.com/?target=https%3A//github.com/yt-dlp/yt-dlp%23release-files\")

然后把 yt-dlp.exe 也一样放到系统环境的目录下就行。比如就放到 ffmpeg 的 bin 目录下，跟 ffmpeg.exe 和 youtube-dl.exe 放一起就行。

## 下载视频

支持下载哪些网站，项目文档上也有：https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md

[https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md](\"https://link.zhihu.com/?target=https%3A//github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md\")

比如我想下载这个视频：https://youtu.be/sKrT6mBrosc

[https://youtu.be/sKrT6mBrosc](\"https://link.zhihu.com/?target=https%3A//youtu.be/sKrT6mBrosc\")

## 1. 直接下载

默认格式，高于 720P 的格式一般是 webm 格式

[webm](\"https://zhida.zhihu.com/search?content_id=225568623&content_type=Article&match_order=1&q=webm&zhida_source=entity\")

yt-dlphttps://youtu.be/sKrT6mBrosc

[https://youtu.be/sKrT6mBrosc](\"https://link.zhihu.com/?target=https%3A//youtu.be/sKrT6mBrosc\")

下载视频转换成 mp4（用–merge-output-format 参数）

[mp4](\"https://zhida.zhihu.com/search?content_id=225568623&content_type=Article&match_order=1&q=mp4&zhida_source=entity\")

yt-dlp –merge-output-format mp4https://youtu.be/sKrT6mBrosc

[https://youtu.be/sKrT6mBrosc](\"https://link.zhihu.com/?target=https%3A//youtu.be/sKrT6mBrosc\")

## 2. 查看视频所有分辨率

跟用 youtube-dl 命令一样，先用 -F 参数查看有哪些分辨率。

yt-dlp -Fhttps://youtu.be/sKrT6mBrosc

[https://youtu.be/sKrT6mBrosc](\"https://link.zhihu.com/?target=https%3A//youtu.be/sKrT6mBrosc\")

结果跟用 youtube-dl 命令的差不多，标题行含义： > ID：文件 ID > EXT：格式 > RESOLUTION：分辨率 > FPS：视频的帧率 > FILESIZE：文件大小 > VCODEC：audio only 表示仅音频 > ACODEC：video only 表示仅视频（没有音频）；像 mp4a.40.2（720p）就直接包含了音频

## 3. 下载指定分辨率

1.只下载音频

找 m4a 格式，列表越靠后越清晰。比如 ID：140 | EXT：m4a | audio only

yt-dlp -f140https://youtu.be/sKrT6mBrosc

[https://youtu.be/sKrT6mBrosc](\"https://link.zhihu.com/?target=https%3A//youtu.be/sKrT6mBrosc\")

2.下载音频转换成 mp3（加上 -x –audio-format 参数）

yt-dlp -f140 -x –audio-format mp3https://youtu.be/sKrT6mBrosc

[https://youtu.be/sKrT6mBrosc](\"https://link.zhihu.com/?target=https%3A//youtu.be/sKrT6mBrosc\")

3.下载视频（带音频）ID：22 | EXT：mp4 | 1280*720

yt-dlp -f22https://youtu.be/sKrT6mBrosc

[https://youtu.be/sKrT6mBrosc](\"https://link.zhihu.com/?target=https%3A//youtu.be/sKrT6mBrosc\")

4.下载指定分辨率视频 + 音频（为了方便就直接下载 mp4 格式了）

1080 及以上分辨率的音频和视频是分开的，所以一般会音频和视频一起下载

yt-dlp -f299+140https://youtu.be/sKrT6mBrosc

[https://youtu.be/sKrT6mBrosc](\"https://link.zhihu.com/?target=https%3A//youtu.be/sKrT6mBrosc\")

5.(通用）下载最佳 mp4 视频 + 最佳 m4a 音频格式并合成 mp4

yt-dlp -f ‘bv[ext=mp4]+ba[ext=m4a]’ –embed-metadata –merge-output-format mp4https://youtu.be/sKrT6mBrosc

[https://youtu.be/sKrT6mBrosc](\"https://link.zhihu.com/?target=https%3A//youtu.be/sKrT6mBrosc\")

6.指定文件名下载（用 -o 参数）

默认下载的文件格式是：title+ 空格 +[id].格式，比如 *[sKrT6mBrosc].mp4

文件名只要标题，不要 id，加上 -o ‘%(title)s.mp4’

yt-dlp -f ‘bv[ext=mp4]+ba[ext=m4a]’ –embed-metadata –merge-output-format mp4https://www.youtube.com/watch?v=sKrT6mBrosc-o ‘%(title)s.mp4’

[https://www.youtube.com/watch?v=sKrT6mBrosc](\"https://link.zhihu.com/?target=https%3A//www.youtube.com/watch%3Fv%3DsKrT6mBrosc\")

最方便直接用，可以直接用最后一种通用的下载最佳视频的方式。

## 4. 下载播放列表所有视频

yt-dlphttps://www.youtube.com/playlist?list=**

[https://www.youtube.com/playlist?list=](\"https://link.zhihu.com/?target=https%3A//www.youtube.com/playlist%3Flist%3D\")
