---
created: '2025-12-04T10:22:44'
modified: '2025-12-04T10:22:44'
source: https://sspai.com/prime/story/extract-from-screenshots-with-gemini-on-iphone
title: 在 Apple Intelligence 到来之前，用快捷指令做个 Gemini 识屏助手
type: archive-web
---

从Pixel9Pro换到iPhone后我怀念过很多东西，系统级的Gemini整合是其中之一：在Pixel上，我可以随时长按电源键或「HeyGoogle」唤起Gemini，然后将当前在看的页面「分享」给
...

从 Pixel 9 Pro 换到 iPhone 后我怀念过很多东西，系统级的 Gemini 整合是其中之一：在 Pixel
上，我可以随时长按电源键或「Hey Google」唤起 Gemini，然后将当前在看的页面「分享」给它。

![](https://cdnfile.sspai.com/2025/12/03/0e182de5cd28e5a65d3c861055067aa7.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

这套交互可以在 Google 自家的生态内一步到位完成很多事，比如当 Google I/O 官网给的日历没有做时区转换时，我可以让
Gemini「看看」屏幕上的时间给我转换并新建一个北京时间的日程，再比如微信聊到什么后续需要留意的东西、添置的生活用品等，也可以随时拉起 Gemini 往
Google Tasks 或 Google Keep 里记东西。

在还没有 Apple Intelligence 的国行 iPhone 上，类似的操作成为了一个需要依赖第三方工具才能解决的问题。所以当我在 Android
平台上又发现一款调用 Gemini API 来梳理、归类截图信息并建立索引的小工具时，一个想法在我脑海里自然而然地蹦了出来：**为什么不用快捷指令和
Gemini API 试试看呢？**

最后做出来的东西效果还不错：

![](https://cdnfile.sspai.com/2025/12/03/1b213182ddb9f9d1b188346cebe7a370.gif)

关注大模型领域的朋友应该知道 Gemini 向来以多模态能力见长，第一时间想到它也是这个原因，毕竟这玩意免费层级从模型到速率限制都能满足个人日常使用。API
Key 的生成网络上有不少的教程本文不再赘述，如果你此前完全没有接触过这些东西，比较麻烦的地方可能是在此之前还得设置好 Google Cloud
控制台的结算信息。

![](https://cdnfile.sspai.com/2025/12/03/ec0d618cb86dd28449ea08acbd0df432.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

在假设你已经拿到了 Gemini API 密钥的前提下，我们整个快捷指令的流程设计其实就很简单了：**截取当前屏幕的图片 > 将它喂给 Gemini API
识别 > 将识别到的信息预填进日历或提醒**。完整的快捷指令设计如下：

![](https://cdnfile.sspai.com/2025/12/03/5300b3b226b52bd8e99be70b56b3913c.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

你可以点击这个链接查看并导入这个快捷指令的[公开版本](https://www.icloud.com/shortcuts/f5595745f6384957918c83d1913f8516)，导入后除了替换你自己的
Gemini API 密钥，还有一些细节可能需要你注意：

首先，在截屏这一步我使用了「截屏」这个快捷指令操作而不是「获取最新的截屏」，这样可以避免快捷指令运行完成后往图库新增一张截图。在我设想中的这类场景下，屏幕上的信息在转换为日程/提醒之后便失去了留存的价值，所以如果你仍然需要保存一份截图——比如想给截图做
AI 信息标注（**在此征稿 xD** ）方便后续索引，也可以采用生成截图图像后「获取最新截屏」的操作作为开始。

这一步的另一个建议是对图像进行适当的「瘦身」，因为在快捷指令尚无可能调用本地模型的前提下，我们传递给远端 Gemini API
的信息越小、整个快捷指令执行的速度和效率就越高。所以这里我用了「调整图像大小」这个操作来适当减小图片尺寸。至于究竟多小是 Gemini
的识别极限，感兴趣的朋友可以在这里多探索探索。

处理好截图，接下来就是如何把截图「喂」给 Gemini API 了。阅读 Google 的 Gemini API
[文档](https://ai.google.dev/gemini-api/docs/image-understanding?hl=zh-
cn)可知这里我们一般有两种途径：

  * [传递内嵌图片数据](https://ai.google.dev/gemini-api/docs/image-understanding?hl=zh-cn#inline-image)：适合小一点的文件，文档给出的具体数据是包含提示词在内不超过 20MB
  * [使用 File API 上传图片](https://ai.google.dev/gemini-api/docs/image-understanding?hl=zh-cn#upload-image)：建议用于较大的文件或在多个请求中重复使用图片

适合快捷指令的方式只有内嵌图片数据。熟悉快捷指令的朋友对此应该也不陌生，选择「Base64
编码」操作并将对象设置为「调整尺寸后的图像」，然后在下一步选择「获取 URL 内容」。

这里就来到了整个流程中最为复杂的部分——当然很大一部分原因是快捷指令交互设计的问题。将 URL 的内容填写为
`https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=你的Gemini
API 密钥`，然后点击旁边的箭头填写请求参数：

  * 方法：选择 `POST`，你可以理解为我们通过这种方式向 Gemini 的 generateContent API 发送了一封信件
  * 请求体：选择 `JSON`，这是 generateContent API 能够读懂的四种信件格式之一
