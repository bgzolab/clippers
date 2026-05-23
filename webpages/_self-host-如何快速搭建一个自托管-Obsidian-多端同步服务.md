---
created: 2025-06-04T21:19:08
modified: 2025-06-04T21:19:12
description: "obsidian 作为一款主打本地化、文件化的笔记软件，本地使用非常方便，但是也总会遇到需要电脑、手机等多端同步的场景。虽然官方提供了云同步的订阅服务，但是本着保障数据安全（其实是不想付费）的态度，咱们还是研究一下怎么搭建一个自托管的同步服务吧。"
source: "https://aarontalk.com/posts/how-to-setup-obsidian-livesync/"
tags:
type: "archive-web"
---
笔记软件在程序员群体最喜欢折腾的工具清单中属于名列前茅的，估计仅次于博客。我自己就体验过各式各类的笔记软件，从最早的印象笔记、有道云笔记，到 Notion、Flowus 以及思源笔记等等，但都没有成为我的主力记录工具。直到我遇到了 Obisidian。

最开始是被 Obsidian 的笔记关联的图谱化显示所吸引。后来用了一段时间之后，现在基本是把它当成一个本地化的 Markdown 笔记软件来用了。然而纯本地化的一个缺憾就是有时候需要在手机或 Pad 上去查看和记录时会很不方便，于是多端同步成了一个问题。

当然，也正因为它是在本地都是以 md 文件形式进行管理的（配置也是 json 文件存储），所以其实只要是把文件进行了多端同步，那么 obsidian 的笔记体验就是多端同步的了。下面就简单介绍几种同步的解决方案。

## 1\. iCloud 同步

对于苹果全家桶用户来讲，其实最方便快捷的文件同步方式就是使用 iCloud。所以你只需要将 obsidian 的笔记文件夹（Vault）创建在 iCloud 中，在每个终端都是通过 iCloud 打开同一个文件夹，你的笔记就可以顺利实现多端同步了。

## 2\. 坚果云

对于非苹果全家桶用户来讲，比如 windows + Android，那么坚果云其实也是个不错的选择。虽然目前它的免费套餐对于上传和下载的流量给的比较少了，但是用来同步文字为主的笔记来说还是绰绰有余的。

使用方法也同样简单，只要在要同步的两端都安装了坚果云，并开启对应 obsidian 文件夹的同步就可以了。

## 3\. obsidian 官方同步

为什么把官方同步放在第三位呢，是因为它是收费的。🤣

没错，官方提供了云同步的服务，但是需要按月订阅付费，目前是 4$/月。这个就没啥好说的了，官方的支持体验肯定是最无缝、最无感的。

## 4\. obsidian 社区插件

最后，咱们来重点介绍一下我想分享的重头戏——obsidian-livesync.

作为一款受欢迎的笔记软件，开源社区的支持肯定少不了。很多程序员同学为 obsidian 开发了各式各样的社区插件，那么多端同步这个痛点肯定也少不了被关注到。这其中比较有名的就是 obsidian-livesync 了。

要实现多端同步，本质上就是需要一个后台的服务来实现多个设备之间的文件自动同步互传，obsidian-livesync 就是基于 CouchDB 这么一项云端服务，所以是需要有服务器来部署这项服务才可以。

我其实很早以前就注意到了这款社区插件，但是因为它的部署其实有点麻烦，而我一直在用 icloud + NAS 互为备份来实现笔记同步，所以也就没折腾。但是前几天在逛 github 的时候，又偶然看到这个 repo，发现现在的部署门槛其实非常低了，所以又来了兴趣，想上手体验一下看看。

这里结合代码仓库中提供的 “3 分钟快速部署教程” 来记录一下我的体验过程。

### 第一步，部署 CouchDB 服务

先不要被标题吓到，正如前面所说，现在的部署门槛其实已经非常低了。因为可以直接使用 fly.io 这个平台部署，基本上按照步骤点 - 点 - 点就可以了。

官方提供的指导如下：

1. 打开已经写好的 [setup-flyio-on-the-fly-v2.ipynb.](https://github.com/vrtmrz/obsidian-livesync/blob/main/setup-flyio-on-the-fly-v2.ipynb)
2. 点击左上角的 “open in colab” (Google Colab 是 Google 提供的基于云端的免费的 Jupyter 笔记本环境，用户可以使用它来编写和执行 Python 代码；这里需要科学上网环境) ![open-in-colab](https://aarontalk.com/_astro/open-in-colab-button.BSrI2xrl_1knn4K.webp)
3. 在打开的 colab 页面中，逐步运行每个代码块，下面逐个注释说明一下代码块的作用：

```sh
# 安装依赖，分别是fly.io的命令行工具、deno 和 jq
!curl -L https://fly.io/install.sh | sh
!curl -fsSL https://deno.land/x/install/install.sh | sh
!apt update && apt -y install jq

# 设置环境变量
import os
%env PATH=/root/.fly/bin:/root/.deno/bin/:{os.environ["PATH"]}

# 拉取 obsidian-livesync 的代码
!git clone --recursive https://github.com/vrtmrz/obsidian-livesync
```

```sh
# 注册/登录 fly.io，需要在命令行输入账号注册/登录信息，然后会有个验证链接，打开链接验证账户登录
!flyctl auth signup
```

```sh
# 这一步就是配置 fly.io 的部署位置，建议国内用户选新加坡或者日本，访问速度会稍微快一些
region = "nrt/Tokyo, Japan" #@param ["ams/Amsterdam, Netherlands","arn/Stockholm, Sweden","atl/Atlanta, Georgia (US)","bog/Bogotá, Colombia","bos/Boston, Massachusetts (US)","cdg/Paris, France","den/Denver, Colorado (US)","dfw/Dallas, Texas (US)","ewr/Secaucus, NJ (US)","eze/Ezeiza, Argentina","gdl/Guadalajara, Mexico","gig/Rio de Janeiro, Brazil","gru/Sao Paulo, Brazil","hkg/Hong Kong, Hong Kong","iad/Ashburn, Virginia (US)","jnb/Johannesburg, South Africa","lax/Los Angeles, California (US)","lhr/London, United Kingdom","mad/Madrid, Spain","mia/Miami, Florida (US)","nrt/Tokyo, Japan","ord/Chicago, Illinois (US)","otp/Bucharest, Romania","phx/Phoenix, Arizona (US)","qro/Querétaro, Mexico","scl/Santiago, Chile","sea/Seattle, Washington (US)","sin/Singapore, Singapore","sjc/San Jose, California (US)","syd/Sydney, Australia","waw/Warsaw, Poland","yul/Montreal, Canada","yyz/Toronto, Canada" ] {allow-input: true}
%env region={region.split("/")[0]}
#%env appame=
#%env username=
#%env password=
#%env database=
#%env passphrase=

# 进入到前面拉取的仓库目录，运行部署脚本deploy-server.sh，并将脚本运行结果写入到 deploy-result.txt  -->
%cd obsidian-livesync/utils/flyio
!./deploy-server.sh | tee deploy-result.txt

## 这里是为了读取运行结果，并在部署成功返回 “obsidian://“ 开头的结果后，显示一个复制按钮，点击按钮即可将后面在 obsidian 中需要用到的 URI 地址复制到剪贴板。
from IPython.display import HTML
last_line=""
with open('deploy-result.txt', 'r') as f:
  last_line = f.readlines()[-1]
  last_line = str.strip(last_line)

if last_line.startswith("obsidian://"):
  result = HTML(f"Copy your setup-URI with this button! -&gt; <button onclick=\"navigator.clipboard.writeText('{last_line}')\">Copy setup uri</button><br>Importing passphrase is \`welcome\`. <br>If you want to synchronise in live mode, please apply a preset after ensuring the imported configuration works.")
else:
  result = "Failed to encrypt the setup URI"
result
```

### 第二步，在 obsidian 安装社区插件 selfhost

打开“设置”-“第三方插件”，进入到社区插件页面。出于风险规避策略，社区插件默认是不能安装的，所以如果之前没有安装过的，这里需要点击“关闭安全模式”，从而允许安装插件；

![关闭安全模式进入第三方插件](https://aarontalk.com/_astro/turn-off-safe-mode-button.CMlcGCZJ_2fhf5X.webp)

然后进可以进入社区插件列表页面（这里可能也需要科学上网才可以正常显示），在搜索栏输入”self-hosted livesync” 即可找到插件；在插件详情页点击“安装”后“启用”即可。

![self-hosted livesync](https://aarontalk.com/_astro/self-hosted-livesync.BasP6h17_Z1G7MF2.webp)

安装成功后，即可进入插件设置界面，默认在第二个 tab 栏中，这里有个 setup wizard，下面是 use the copied setup URI, 点击右侧的 “Use”，填入前面部署服务最后拷贝的 URI 地址即可（如果没复制，可以回到 colab 网页那重新点击按钮复制，地址是以“obsidian://”开头的）

![input-uri](https://aarontalk.com/_astro/input-uri.igHbTEGF_ZzThFY.webp)

然后，在你需要同步的机器上，比如其他电脑，或者是手机端的 obsidian 中都安装好插件，并参照设置 URI 即可实现多端同步了。

![mobile-obsidian](https://aarontalk.com/_astro/mobile-obsidian.aefFFD0o_1xlaHF.webp)

OK, 打完收工。有问题的小伙伴可以联系我。

最后附上我体验过程的记录和讲解视频，供大家参考：
