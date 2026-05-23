---
created: '2026-02-02T14:57:26'
modified: '2026-02-02T14:57:26'
source: https://sspai.com/post/105506
title: NAS 自部署 TrendRadar：搭建基于 AI 的热点情报站
type: archive-web
---

**Matrix 首页推荐**  

[Matrix](https://sspai.com/matrix)
是少数派的写作社区，我们主张分享真实的产品体验，有实用价值的经验与思考。我们会不定期挑选 Matrix 最优质的文章，展示来自用户的最真实的体验和观点。

文章代表作者个人观点，少数派仅对标题和排版略作修改。

* * *

大家好，我是飘雷。

在这个全民刷手机的时代，我们看似阅尽天下事，实则很容易被困在信息茧房里。

各种资讯 app
每天都在争先恐后地把它们认为用户可能喜欢的内容推送给我们，久而久之，我们获得的信息难免会落入同质化，真正有价值的信息其实不多。想要解决这个问题，就要尝试从被动投喂，变成主动获取。

![](https://cdnfile.sspai.com/2026/01/16/article/cb8102934ebb87d2273935a6f60fc68a.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

最近 GitHub 上大火的 TrendRadar 项目，恰好击中了这个痛点。

项目地址：<https://github.com/sansan0/TrendRadar>

它能根据咱们自己设置的关键词和监控策略，聚合多平台热点和 RSS 订阅，还能将 AI 分析简报直推手机，也支持接入 MCP
架构，利用AI大模型进行自然语言的对话分析、情感洞察与趋势预测。

![](https://cdnfile.sspai.com/2026/01/16/article/6e2da370c9221df8b4eb775b15df1fe5.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

TrendRadar 特别适合投资者、自媒体人、企业公关、关注时事等用户使用，这也使得它在 GitHub 上获得了 4.3 万的超高星收藏。

趁着这几天有空，我用手头的威联通 NAS 把这个情报雷达搭建了起来，部署和配置的过程虽然有些繁琐，但成果也是喜人的。

我们可以通过网页访问 NAS IP 来查阅自己感兴趣的新闻：

![](https://cdnfile.sspai.com/2026/01/16/article/0b13f8a264f4e7b21d21221d4581fad2.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

也可以让它把热点新闻自动推送到邮箱等平台：

![](https://cdnfile.sspai.com/2026/01/16/article/4d901655daefa8e2e93c458414e35230.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

还可以在推送信息中看到 AI 分析的简报：

![](https://cdnfile.sspai.com/2026/01/16/article/3d49f9f8b181e04dbb2b18f971bd6187.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

这种对信息掌控感真的拉满了情绪价值，个人觉得特别好用，所以本期我就同大家分享 TrendRadar 的手把手部署配置教程。

这里我们来展示如何在威联通 NAS 上通过 Docker Compose 进行部署，用到的设备是威联通最新的八盘位旗舰新品 Qu805。

### 下载项目文件

首先我们要用一些魔法打开 TrendRadar 的 GitHub 页面，点击绿色的 Code 按钮，选择 Download
ZIP，将这个项目的所有文件以压缩包形式下载。

![](https://cdnfile.sspai.com/2026/01/16/article/73f5b93598edaccd00dca3b64559463b.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)![](https://cdnfile.sspai.com/2026/01/16/article/5c1aec0f54e1c5c699c8d5616601704d.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

解压下载的压缩包，会得到一个名为` TrendRadar-master `的文件夹：

![](https://cdnfile.sspai.com/2026/01/16/article/8968803d580a720431b357de3db6b749.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

接下来咱们将上图中这些文件和文件夹全部上传到威联通 NAS 里，这里我放在了` /Container/TrendRadar
`目录内，大家可以根据自己的实际情况灵活调整，只需要记住保存位置即可。

![](https://cdnfile.sspai.com/2026/01/16/article/3ea39ade85932c38c34ea65edec6fe56.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

### Docker Compose 部署

TrendRadar 自带的 Docker Compose 文件是根据本机访问的默认情况配置的，不太适合 NAS 场景，所以这里我们需要进行一些改动。

登录威联通 NAS 后台，打开 Container Station 容器工作站，点击左侧的应用程序，然后点击右侧黑色创建按钮。

![](https://cdnfile.sspai.com/2026/01/16/article/17176d173691a05077870af36d8fb3e9.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

在弹出的代码输入框中，我们输入以下 YAML 代码。注意里面的注释部分，像推送设置之类的选项可以在 YAML
代码中提前指定，也可以通过修改文件后期进行调整，这里大家需要根据自己的实际情况进行配置：

    
    
    services:
      trendradar:
        image: wantcat/trendradar:latest
        container_name: trendradar
        restart: unless-stopped
        # 左边 8848 是你访问 NAS 的端口 (http://nas-ip:8848)，根据需要修改
        # 右边 8080 是容器内部端口，不要改
        ports:
          - "8848:8080"
    
    
        # 映射目录，左侧为NAS文件夹路径，这里需要根据实际情况修改，比如我是在NAS的 /share/Container/TrendRadar
        volumes:
          - /share/Container/TrendRadar/config:/app/config
          - /share/Container/TrendRadar/output:/app/output
    
    
        environment:
          - TZ=Asia/Shanghai
          # 核心配置
          - ENABLE_CRAWLER=${ENABLE_CRAWLER:-}
          - ENABLE_NOTIFICATION=${ENABLE_NOTIFICATION:-}
          - REPORT_MODE=${REPORT_MODE:-}
          - DISPLAY_MODE=${DISPLAY_MODE:-}
          # Web 服务器，True为强制启用，启用后可以通过网页访问
          - ENABLE_WEBSERVER=true
          - WEBSERVER_PORT=${WEBSERVER_PORT:-8080}
          # 通知渠道
          # 飞书
          - FEISHU_WEBHOOK_URL=${FEISHU_WEBHOOK_URL:-}
          # 电报
          - TELEGRAM_BOT_TOKEN=${TELEGRAM_BOT_TOKEN:-}
          - TELEGRAM_CHAT_ID=${TELEGRAM_CHAT_ID:-}
          # 钉钉
          - DINGTALK_WEBHOOK_URL=${DINGTALK_WEBHOOK_URL:-}
          # 企业微信
          - WEWORK_WEBHOOK_URL=${WEWORK_WEBHOOK_URL:-}
          - WEWORK_MSG_TYPE=${WEWORK_MSG_TYPE:-}
          # 邮件配置
          - EMAIL_FROM=${EMAIL_FROM:-}
          - EMAIL_PASSWORD=${EMAIL_PASSWORD:-}
          - EMAIL_TO=${EMAIL_TO:-}
          - EMAIL_SMTP_SERVER=${EMAIL_SMTP_SERVER:-}
          - EMAIL_SMTP_PORT=${EMAIL_SMTP_PORT:-}
          # ntfy配置
          - NTFY_SERVER_URL=${NTFY_SERVER_URL:-https://ntfy.sh}
          - NTFY_TOPIC=${NTFY_TOPIC:-}
          - NTFY_TOKEN=${NTFY_TOKEN:-}
          # Bark配置
          - BARK_URL=${BARK_URL:-}
          # Slack配置
          - SLACK_WEBHOOK_URL=${SLACK_WEBHOOK_URL:-}
          # 通用Webhook配置
          - GENERIC_WEBHOOK_URL=${GENERIC_WEBHOOK_URL:-}
          - GENERIC_WEBHOOK_TEMPLATE=${GENERIC_WEBHOOK_TEMPLATE:-}
          # AI 分析配置，如果你需要开启 AI 分析，可以在这里填，或者去config.yaml填
          - AI_ANALYSIS_ENABLED=${AI_ANALYSIS_ENABLED:-false}
          - AI_API_KEY=${AI_API_KEY:-}
          - AI_PROVIDER=${AI_PROVIDER:-}
          - AI_MODEL=${AI_MODEL:-}
          - AI_BASE_URL=${AI_BASE_URL:-}
          # 远程存储配置（S3 兼容协议）
          - S3_ENDPOINT_URL=${S3_ENDPOINT_URL:-}
          - S3_BUCKET_NAME=${S3_BUCKET_NAME:-}
          - S3_ACCESS_KEY_ID=${S3_ACCESS_KEY_ID:-}
          - S3_SECRET_ACCESS_KEY=${S3_SECRET_ACCESS_KEY:-}
          - S3_REGION=${S3_REGION:-}
          # 运行模式
          - CRON_SCHEDULE=${CRON_SCHEDULE:-*/30 * * * *}
          - RUN_MODE=${RUN_MODE:-cron}
          - IMMEDIATE_RUN=${IMMEDIATE_RUN:-true}
    
    
    # MCP 服务：提供接口给 Claude Desktop 等客户端，用不上的话下面这些代码可以删除
      trendradar-mcp:
        image: wantcat/trendradar-mcp:latest
        container_name: trendradar-mcp
        restart: unless-stopped
    
    
        ports:
          - "3333:3333"
    
    
        # 必须挂载与上面相同的路径，否则读取不到数据
        volumes:
          - /share/Container/TrendRadar/config:/app/config:ro
          - /share/Container/TrendRadar/output:/app/output
    
    
        environment:
          - TZ=Asia/Shanghai

代码粘贴无误后，记得点击下方的验证按钮，确保 YAML 格式正确。

![](https://cdnfile.sspai.com/2026/01/16/article/c3de66e7fac9dd48a48dd1e9d2b586c6.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

最后点击创建按钮，系统就会自动拉取这个非常精简的镜像并启动服务，咱们可以在概览或容器列表中看到` trendradar `和` trendradar-mcp
`两个容器正在运行，状态显示为绿色小圆点。

## 常用配置选项解析

TrendRadar 的作者在项目页面提供了详细的个性化配置方法，感兴趣的朋友可以去详细阅读下，这里咱们就来看看一些常用的部分。

### 1配置监控平台

TrendRadar 的资讯数据来源于 newsnow，默认会抓取11个平台的热点新闻，需要抓取其他平台数据的的朋友可以去 newsnow 网站里查找一下。

查询地址：<https://newsnow.busiyi.world/>

![](https://cdnfile.sspai.com/2026/01/16/article/a39ecb4297a8d2d4d4b906b4bdab7220.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

需要对监控平台进行修改的话，可以打开` config `文件夹下的` config.yaml `文件，修改 `platforms `部分：

![](https://cdnfile.sspai.com/2026/01/16/article/2e601ab4895afc2f4c225ec0c1d88fdb.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

威联通自带文本编辑器。你可以右键点击该文件，选择「打开方式 -> Text Editor」直接在线编辑，改完保存即可，无需下载到本地再上传。

    
    
    platforms:
      - id: "toutiao"
        name: "今日头条"
      - id: "baidu"
        name: "百度热搜"
      - id: "wallstreetcn-hot"
        name: "华尔街见闻"
      # 添加更多平台...

去 newsnow 添加有点麻烦，图省事儿的话可以去下面的项目复制别人整理的` config.yaml `文件。

项目地址：<https://github.com/sansan0/TrendRadar/issues/95>

不过需要注意，监控的平台不是越多越好，建议选择 10 到 15 个核心平台，平台过多会导致信息过载，反而降低使用体验。

![](https://cdnfile.sspai.com/2026/01/16/article/4404b2a1e04168cf4318ef49a274a147.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

### 配置关键词

TrendRadar 的关键词设置是决定我们每天看到的是满屏含金量的干货，还是充斥着垃圾信息的关键一步。TrendRadar 的核心过滤逻辑存放在`
config `文件夹下的` frequency_words.txt `文件中，需要手动细心配置。

这里打开威联通的 File Station，定位到我们部署时映射的路径，比如我使用的是`
/share/Container/TrendRadar/config/`，找到名为` frequency_words.txt `的文件。

![](https://cdnfile.sspai.com/2026/01/16/article/49efb5fd9215d5c3075b3e898963502e.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)![](https://cdnfile.sspai.com/2026/01/16/article/8413af50a61ea0b9f9deff77b4394c50.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

TrendRadar 对关键字的配置不仅仅是写几个词那么简单，它支持七种语法，咱们简单举例来介绍下。

    
    
    # --- 核心关注区 ---
    NAS
    威联通
    群晖
    Docker
    TrendRadar
    DeepSeek
    ChatGPT
    显卡 & 降价
    # --- 必须屏蔽区 (净化眼球) ---
    !出轨
    !离婚
    !绯闻
    !男星
    !女星
    !只有我一个人
    !震惊
    !拼多多 & 砍一刀
    # --- 行业观察 ---
    人工智能
    开源项目
    # --- 这里的每一行代表一个规则，系统会逐行扫描 ---
    
    

  * 基础匹配（直接写词）：威联通：只要标题或内容里有「威联通」，就会被抓取。
  * 强制屏蔽（使用 ! 表示「非」）；在关键字前面加上感叹号后，包含此关键字的新闻会被直接丢弃。比如不想看娱乐圈的出轨八卦破事，使用「!出轨」，任何包含出轨的新闻就不会被显示出了。
  * 组合逻辑（使用 & 表示「与」）：「NAS & 教程」的意思是，只有同时包含「NAS」和「教程」的文章才会被抓取，这能帮你过滤掉单纯的NAS降价广告，只看干货。
  * 多选逻辑（使用 | 表示「或」）：「DeepSeek | ChatGPT | Claude」的意思是，只要包含这三个 AI 模型中的任意一个，都抓取。
  * 短语匹配（使用英文双引号""）：以"Black Myth"为例，如果你直接写 Black Myth（没引号），系统可能会分别匹配 Black 和 Myth。加上引号后，会强制匹配由于空格隔开的专有名词（如《黑神话》）。
  * 权重提升（使用 ^）：「^漏洞」的意思是，给「漏洞」这个词极高的权重，一旦出现，即使它在热榜排名不高，也会被强制推送到显眼位置。
  * 正则匹配式（使用 ~，适合硬核玩家）：这部分就有点复杂了，不太适合普通玩家折腾，感兴趣的硬核玩家直接去项目原网页详细研究即可。

编辑完成后，点击威联通 Text Editor 右上角的「保存」，最后别忘了，修改关键词后，需要重启容器才能生效。

![](https://cdnfile.sspai.com/2026/01/16/article/d37732b294d97b87bdcf37fe5b519132.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

### 热点权重新调整

很多时候我们觉得热搜没啥意思，是因为平台的算法优先推荐短时间内爆发力强的内容，比如什么某明星忘本了道歉了之类的。但很多用户往往更关注那些有持久影响力的大事，比如国家重大政策和科技突破的消息等等。

![](https://cdnfile.sspai.com/2026/01/16/article/a1a3879389bbe24a4a4ef08cbf687569.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

    
    
    advanced:
      weight:
        rank: 0.6           # 排名权重
        frequency: 0.3      # 频次权重
        hotness: 0.1        # 热度权重

在 TrendRadar 的` config/config.yaml `文件中，有一个` advanced -> weight
`模块，这里就是控制热点筛选逻辑的地方，包含` rank、frequency、hotness `三个参数，这三个数字相加必须严格等于
1.0，否则程序会报错罢工。

在修改之前，咱们需要明白这三个数字代表什么，TrendRadar 默认使用的是较为平衡的配置：

  * rank（排名权重）：代表爆发力，数值越高，越倾向于抓取各大榜单前几名的内容，哪怕它只火了十分钟。
  * frequency（频次权重）：代表持久力，数值越高，越倾向于抓取那些在一天内反复上榜、被不同平台多次讨论的内容。这是过滤标题党的关键。
  * hotness（热度权重）：代表绝对数值，由于不同平台的热度单位不同，有的几百万，有的几万，参考价值较低，通常保持低位即可。

一般来说，追求速度和时效性的用户提高排名权重，追求深度和稳定性的用户提高频次权重。

建议每次只调整 0.1 到 0.2 的数值，调完后保存文件，并在 Container Station 中重启容器生效。

修改后观察一两天的推送效果，如果觉得信息太滞后，就稍微调高 rank；如果觉得垃圾信息还是多，就继续调高 frequency。

接下来咱们来看看两个典型的配置案例。

### 抓取实时热点

如果你是自媒体博主或者营销人员，不想错过任何稍纵即逝的大瓜，想快速了解当前最火话题，可以使用这个配置，把所有瞬间冲上榜首的内容都推给你：

    
    
    advanced:
      weight:
        rank: 0.8       # 拉高排名权重，只要进前三，立刻抓取
        frequency: 0.1  # 稍微关注一下持续性，不太在乎
        hotness: 0.1    # 保持默认

### 追踪重点话题

如果想要多看一些经过时间沉淀的重大新闻，可以使用这个配置：

    
    
    advanced:
      weight:
        rank: 0.4           # 降低排名权重，不迷信热度榜首
        frequency: 0.5      # 拉高频次权重，更偏向持续热度
        hotness: 0.1

### 推送配置

TrendRadar v5.0 版本对推送内容进行了大规模重构，现在的推送内容不再是简单的链接堆砌，而是被划分为热榜新闻、RSS 订阅、全新热点（New
标记）、独立展示区、AI 分析五大核心板块。

而在推送方式方面，TrendRadar 支持微信、飞书、钉钉、Telegram、邮件、ntfy、bark、Slack
等渠道的智能推送，并且有当日汇总、当前榜单、增量监控三种推送模式。

![](https://cdnfile.sspai.com/2026/01/16/article/a4e1a8d412a92d87504470390e7a8642.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

推送相关的配置也是通过` config/config.yaml `文件来修改，同时也可以在 Docker Compose
代码中提前写好，在部署容器时就完整设置。这里我们以邮件推送为例进行展示。

![](https://cdnfile.sspai.com/2026/01/16/article/e947ae00986169c88a76d18e4f83a267.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

### 开启 HTML 格式

很多用户反馈邮件收到的是一堆乱码或者纯文本，没有任何排版，原因就是没开启 HTML 支持。

得确保` config/config.yaml`，找到 `storage -> formats -> html`，设置为` true`。

    
    
    storage:
      formats:
        sqlite: true
        txt: false
        html: true   # 必须启用，否则邮件推送会失败

![](https://cdnfile.sspai.com/2026/01/16/article/68bec64892eae3c993eab0ccd84e9d50.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

### 配置 SMTP 发送服务（以 163 邮箱为例）

虽然 TrendRadar 支持多种推送方式（如飞书、钉钉），但邮件依然是阅读长文和 AI 分析报告的最佳载体。

国内网络环境下，我自己是选择使用 163 邮箱作为发送方，稳定性非常高。当然 QQ 邮箱也可以，就是容易被系统判定为垃圾邮件。

首先登录你的 163 网页版邮箱，点击顶部「设置」 -> 「POP3/SMTP/IMAP」，开启「IMAP/SMTP 服务」或「POP3/SMTP
服务」，然后新增一个授权码。

系统会让你发送短信验证，验证成功后会弹出一个只显示一次的授权码，复制这个授权码，这是我们接下来要填的密码。

![](https://cdnfile.sspai.com/2026/01/16/article/4e71eb0205dd54bb6f793605a52d539c.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)![](https://cdnfile.sspai.com/2026/01/16/article/04fea734220e47867e84591fdbb59766.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

接下来咱们继续编辑` config.yaml`，首先找到` notification `通知总开关的位置，将` enabled `设置为`
true`，开启通知。

![](https://cdnfile.sspai.com/2026/01/16/article/8b4b5cb1b8987a3a23a2ade263171346.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

然后找到` email `相关的配置区域：

![](https://cdnfile.sspai.com/2026/01/16/article/be89378ecfe93d97f45d1175e6815aa9.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

具体设置方法如下所示：

    
    
          # 邮件发送方配置 (163邮箱)
          - EMAIL_FROM=你的账号@163.com
          # 注意：这里填的是刚刚获得的【授权码】，不是邮箱登录密码！
          - EMAIL_PASSWORD=填入你刚才获取的授权码
          - EMAIL_SMTP_SERVER=smtp.163.com
          - EMAIL_SMTP_PORT=465
          
          # 邮件接收方配置
          # 接收邮箱可以是同一个163邮箱，也可以是QQ邮箱或Gmail
          - EMAIL_TO=接收通知的邮箱@qq.com

如果这里不适用 163 邮箱来推送，可以根据作者提供的表格来修改 SMTP 服务器和端口地址：

![](https://cdnfile.sspai.com/2026/01/16/article/e4315f2950b49a8eec86cee08a24917b.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

配置完成后，保存文件并重启容器。

如果配置正确，TrendRadar 运行完毕后，你会收到一封标题类似《TrendRadar 每日热点报告》的邮件。

![](https://cdnfile.sspai.com/2026/01/16/article/fdb80bf904c837a4245e8ed5d82a1283.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

如果还想要设置推送频率和推送模式的话，同样可以查看作者给出的详细配置说明，限于篇幅这里不赘述了。

### AI 分析配置

在 5.0 版本之前，TrendRadar 只能算一个勤恳的新闻搬运工；但从 5.0 开始，作者进行了重大升级，通过接入 AI 大模型 API
来对内容进行深度分析，自动生成热点洞察。

分析的内容包括：

  * 热点趋势概述
  * 关键词热度分析
  * 跨平台关联分析
  * 潜在影响评估
  * 值得关注的信号
  * 总结与建议

这里我们以 DeepSeek 为例，展示如何进行设置。

获取 API 的过程这里不再赘述，大家去自己的 API 提供商平台上复制即可，我们主要讲讲本地设置，同样要修改` config/config.yaml
`这个配置文件，找到` ai_analysis `部分：

![](https://cdnfile.sspai.com/2026/01/16/article/2c906006a5e9f5af69af748ff7eaff37.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

以 DeepSeek 官方 API 为例，如下设置：

    
    
    ai_analysis:
      enabled: true                     # 是否启用 AI 分析，true为开启
      provider: "deepseek"              # AI 提供商
      api_key: ""                       # API Key
      model: "deepseek-reasoner"        # 模型名称,deepseek-reasoner为深度思考模式
      base_url: ""                      # 自定义 API 端点（可选）
      timeout: 120                      # 请求超时（秒）
      push_mode: "both"                 # 推送模式，both (推送到所有渠道)
      max_news_for_analysis: 50         # 最多分析多少条新闻
      include_rss: true                 # 是否包含 RSS 内容
      prompt_file: "ai_analysis_prompt.txt"  # 提示词配置文件

另外在` config `文件夹下，还有一个名为` ai_analysis_prompt.txt `的文件。这里存放的是发给 AI 的 Prompt
提示词。

作者已经将默认的提示词写好，包含趋势概述、关键词热度、跨平台关联、潜在影响等。但如果你有特殊需求，那可以根据自己需求进行针对性修改。

配置并重启容器后，AI 模块会在每次的抓取任务结束后运行，我们能在推送消息的底部看到像这样的分析报告：

![](https://cdnfile.sspai.com/2026/01/16/article/ea8dd932d42c4fc99a3169c822fa9ae4.png?imageView2/2/w/1120/q/90/interlace/1/ignore-
error/1)

## 总结

经过这一番折腾，当看到自己想看的新闻躺在邮箱里时，之前所有的复杂的配置都是值得的了。

以前，我们是算法的猎物，被锁在各大平台推送算法打造的信息茧房里，免不了被标题党牵着鼻子走。

而现在借助 TrendRadar 和 AI
的深度思考，我们终于可以翻身成为信息的主人，可以更清晰的知道这个世界发生了什么，哪些是转瞬即逝的信息泡沫，哪些是真正值得关注的行业暗流。

写到这里我又想到，像 TrendRadar 这类应用，或许才是许多公司和工作室采购 NAS 的原因之一。NAS 并非只能在家用环境中保存照片、挂挂
PT，更是能通过持久稳定工作，帮助用户圈出一块清醒的自留地，把实现各种功能的主动权重新握在自己手里。

> 关注
> [少数派小红书](https://www.xiaohongshu.com/user/profile/63f5d65d000000001001d8d4)，感受精彩数字生活
> 🍃

> 实用、好用的 [正版软件](https://sspai.com/mall)，少数派为你呈现 🚀
