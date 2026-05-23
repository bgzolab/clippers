---
title: "yqchilde/JDMemberCloseAccount"
aliases: JDMemberCloseAccount
released: 2021-05-04T09:55:40Z
modified: 2026-05-23T18:11:52
created: 2026-05-23T18:11:52
description: "学习python操作selenium的一个🌰 ，也是一种京东全自动退会方案"
source: "https://github.com/yqchilde/JDMemberCloseAccount"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/yqchilde/JDMemberCloseAccount?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/yqchilde/JDMemberCloseAccount?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/yqchilde/JDMemberCloseAccount?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=yqchilde&repo=JDMemberCloseAccount&bg_color=00000000)](https://github.com/yqchilde/JDMemberCloseAccount)


# JDMemberCloseAccount

学习python操作selenium的一个🌰 ，也是一种京东全自动退会方案

## README

# JDMemberCloseAccount

* [介绍](#介绍)
* [声明](#声明)
* [须知](#须知)
* [思路](#思路)
* [如何使用本项目](#如何使用本项目)
    * [一、下载项目以及配置浏览器驱动](#一下载项目以及配置浏览器驱动)
    * [二、获取 jd\_wstool 监听地址及选择 jd\_wstool 工具（IOS未越狱跳过此步骤）](#二获取-jd_wstool-监听地址及选择-jd_wstool-工具ios未越狱跳过此步骤)
    * [三、填写配置](#三配置项目)
    * [四、运行程序](#四运行程序)
* [关于 jd\_wstool 工具](#关于-jd_wstool-工具)
* [常见问题](#常见问题)
* [测试](#测试)
* [ScreenShots](#screenshots)
* [TG讨论群](#tg讨论群)
* [Thanks](#thanks)

## 介绍

本项目是我学习python操作selenium的一个🌰，也是一种京东自动退会方案，用来全自动退出京东加入的所有店铺会员

## 声明

1. 本项目仅限于学习研究selenium库的操作，以及一些python知识，不含收集用户信息

## 须知

1. 有一定的电脑知识 or 有耐心爱折腾
2. chrome驱动(只在chrome测试了，故只留了chrome)
3. 操作系统(只在mac上测试了，非M1)
4. 使用`python3.x`版本执行
5. 有一定python基础知识，没有的话先去学一下，起码得会搭python环境
6. [视频讲解-脚本如何使用](https://www.bilibili.com/video/BV1aR4y1E7Eq/)

## 思路

![项目思路](https://github.com/yqchilde/JDMemberCloseAccount/blob/main/doc/project_1.png)

1. 利用selenium打开退会页面

2. 第一关：手机验证码

    1. 安卓端（以下两种任选一个用就行）：

        * 利用[macrodroid软件](https://wwa.lanzoui.com/iSwocpqow3a) 监听，一旦监听到就立即通过HTTP请求利用websocket推送过来，由`jd_wstool`
          工具监听并送到selenium中填写

        * 利用[tasker软件](https://wwa.lanzoui.com/iLeAYps1x1i) 监听，同上

        * 使用方法：下载以上任一软件，导入相应的配置，并修改自己的IP为`main.py`程序监听的IP即可

        * 关于 `tasker` 和 `macrodroid` 配置均在 [extra](https://github.com/yqchilde/JDMemberCloseAccount/tree/main/extra) 目录下

    2. ios端：

        1. 越狱机（来自[@curtinlv](https://github.com/curtinlv)
           大佬的越狱监听短信方法，[#61](https://github.com/yqchilde/JDMemberCloseAccount/pull/61) ）

            * 像安卓端一样传验证码（基本逻辑：iOS设备通过访问短信数据库，监听最新的jd验证码并传到 `jd_wstool`）

                1.
              下载 [getiOSMessages.py](https://github.com/yqchilde/JDMemberCloseAccount/blob/main/extra/iOSPlus/getiOSMessages.py)
              传到手机上（测试Pythonista 3可以，其他软件自行研究）

                2. 填写`jd_wstool` 监听地址ip

                   如：监听地址1： http://192.168.0.101:5201 ，填在脚本开头 ipaddr= '192.168.0.101'

                3. 运行脚本

        2. 非越狱机 （任选以下一种类型）

           > 首先感谢tg群的朋友[@millerchen](https://github.com/bluewatercg)
           提供的思路，具体实现方案是电脑屏幕留出一个区域用来显示手机投屏的地方（如果你电脑是Mac，无需投屏，只需要打开IMessage，并保持短信同步即可，然后OCR识别IMessage），然后打开短信列表，然后找个截图工具记一下当前需要识别的的`左上角`和`右下角`坐标(最好截取那一整条短信的坐标，当然截取范围越小，识别越快)，然后通过ocr工具识别数字验证码

           > **注意：** OCR只是处理识别短信验证码并填入，不要误解为图形验证码也可以解决。如果定位不准，看一下项目目录生成的`captcha_screenshot.png`
           图片位置在当前屏幕的哪个位置，[测试识别效果gif点我查看](https://github.com/yqchilde/JDMemberCloseAccount#screenshots) , 此外，坐标和电脑分辨率有关，如果分辨是是1080P，那么qq截图识别的坐标就是刚好一比一的，比我的是4k显示器，是以百分之200显示的，那所有坐标就要乘以2了

           百度ocr (
           之前用过的用户还是免费500次/天的额度，新用户调整为1000次/月的额度，调整详情参考[这里](https://ai.baidu.com/support/news?action=detail&id=2390))

                * 需要在config.yaml中配置如下参数：

                * sms_captcha.is_ocr设置为 true

                * sms_captcha.is_ocr.type设置为 baidu

                * sms_captcha.is_ocr.baidu_app_id补充完整

                * sms_captcha.is_ocr.baidu_api_key补充完整

                * sms_captcha.is_ocr.baidu_secret_key补充完整

           阿里云ocr (
           用户新购0元500次，后续500次/0.01元，开通地址[阿里云市场](https://market.aliyun.com/products/57124001/cmapi028554.html?spm=5176.2020520132.101.2.608172181RzlnC#sku=yuncode2255400000))

                * 同上，需要在config.yaml中配置如下参数：

                * sms_captcha.is_ocr设置为 true

                * sms_captcha.is_ocr.type设置为 aliyun

                * sms_captcha.is_ocr.aliyun_appcode补充完整

           easyocr (免费，本地识别)

                * 同上，需要在config.yaml中配置如下参数：

                * sms_captcha.is_ocr设置为 true

                * sms_captcha.is_ocr.type设置为 easyocr

                * 使用时注意框选识别的范围只显示6位数字验证码(现支持一整条完整短信的区域，当然范围越大识别速度也会相应增加，区域扩大是为了优化某些用户短信验证码6位数字每次位置不一致问题)（毕竟免费开源，识别条件有点苛刻）

           百度翻译 (免费额度 10000次/每月，开通地址 [百度翻译开放平台](https://fanyi-api.baidu.com/register))

           **开通教程：**
            1. 打开 [百度翻译开放平台](https://fanyi-api.baidu.com/register) 注册个人开发者并实名认证

            2. 打开 [开发者信息](https://fanyi-api.baidu.com/api/trans/product/desktop?req=developer) 查看appid 和 秘钥

            3. 打开 [服务选择](https://fanyi-api.baidu.com/choose) 选择图片翻译服务开通

           **配置信息：**

                * 同上，需要在config.yaml中配置如下参数：

                * sms_captcha.is_ocr设置为 true

                * sms_captcha.is_ocr.type设置为 baidu_fanyi

                * sms_captcha.is_ocr.baidu_fanyi_appid补充完整

                * sms_captcha.is_ocr.baidu_fanyi_appkey补充完整

3. 第二关：图形验证码（任选以下一种类型，更新文档时，验证方式为滑块验证码或点选式验证码，**滑块已内置，仅需个人解决点选式**）

    1. 本地识别

        * 2022-06-06更新文档：之前的本地识别皆已失效，需重新训练

    2. 收费的打码平台

        * 图形验证码用 [超级鹰打码](https://www.chaojiying.com/) ，费用是1块=1000积分，一次扣15积分

        * 图形验证码用 [图鉴打码](http://www.ttshitu.com/) ，费用是1块=1积分，一次扣0.01积分

## 如何使用本项目

### 一、下载项目以及配置浏览器驱动

**注意：** 以下关于`python3`， `pip3` 命令只代表`python3.x`环境，故如果电脑`python`环境已是3.x，可直接用`python`、`pip`代替

1. 克隆到本地或下载项目压缩包到本地

   ```shell
   git clone https://github.com/yqchilde/JDMemberCloseAccount.git
   ```

2. 在项目根目录下打开终端执行以下命令，安装所需要的包

   ```shell
   pip3 install -r requirements.txt
   ```

   如果因没有代理拉不下包，请使用国内阿里云代理，执行如下命令：

   ```shell
   pip3 install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/
   ```

3. 下载对应的浏览器驱动

   `chrome`请打开`设置-关于chrome`查看浏览器的版本，然后去 [chromedriver](http://chromedriver.storage.googleapis.com/index.html)
   下载对应的版本/系统驱动，[如图所示](https://raw.githubusercontent.com/yqchilde/JDMemberCloseAccount/main/doc/test_img5.png)
   ，将解压出来的`chromedriver`文件放入项目的`drivers`目录下即可）

### 二、获取 jd_wstool 监听地址及选择 jd_wstool 工具（IOS未越狱跳过此步骤）

两种方式二选一即可

1. 外置 jd_wstool 工具: [点击下载](https://github.com/yqchilde/JDMemberCloseAccount/releases) 对应系统的 jd_wstool 工具

    * 运行下载的 jd_wstool，使用 **手机** 打开 jd_wstool 显示的url地址，记下能打开的url地址


2. 内置 jd_wstool 工具: 将`config.yaml`文件第41行改为`jd_wstool: false`

    * 打开命令行工具，使用`cd`命令进入项目的`utils`文件夹下运行`python listener.py`，使用 **手机** 访问 jd_wstool
      显示的url地址，记下访问时控制台有反应的url地址（手机无法访问但是控制台有反应）

### 三、配置项目

#### 1. 添加`cookie`

* **自动添加：** 使用`add_cookie.py`可以获取手机端`Cookie` 并自动配置到 `config.yaml` 文件中


* **手动添加：** 在 `config.yaml` 中第2行写入 `cookie` 项，注意是pt_key=123456;pt_pin=jd_987654的那个（**请不要随意泄露你的cookie**）

#### 2. 配置转发短信验证码

<details>
<summary><b>安卓</b></summary>

* 安装 [tasker](https://wwa.lanzoui.com/iLeAYps1x1i) 或 [macrodroid](https://wwa.lanzoui.com/iSwocpqow3a) 并开放**短信权限**
    * **tasker：**
      参照 [tasker_1.jpg](https://raw.githubusercontent.com/yqchilde/JDMemberCloseAccount/main/extra/tasker/tasker_1.jpg)
      和 [tasker_2.jpg](https://raw.githubusercontent.com/yqchilde/JDMemberCloseAccount/main/extra/tasker/tasker_2.jpg)
      进行设置，记得修改IP为在 jd_wstool
      获得的IP地址，或者直接导入 [配置文件](https://raw.githubusercontent.com/yqchilde/JDMemberCloseAccount/main/extra/tasker/%E7%9B%91%E5%90%AC%E4%BA%AC%E4%B8%9C%E9%80%80%E4%BC%9A%E9%AA%8C%E8%AF%81%E7%A0%81.prf.xml)

    * **macrodroid：**
      参照 [macrodroid.jpg](https://raw.githubusercontent.com/yqchilde/JDMemberCloseAccount/main/extra/macrodroid/macrodroid.jpg)
      进行设置，记得修改IP为在 jd_wstool
      获得的IP地址，或者直接导入 [配置文件](https://raw.githubusercontent.com/yqchilde/JDMemberCloseAccount/main/extra/macrodroid/%E7%9B%91%E5%90%AC%E4%BA%AC%E4%B8%9C%E9%80%80%E4%BC%9A%E9%AA%8C%E8%AF%81%E7%A0%81.macro)

</details>

<details>
<summary><b>IOS越狱</b></summary>

* 安装 Pythonista 3

    * 下载 [监听脚本](https://raw.githubusercontent.com/yqchilde/JDMemberCloseAccount/main/extra/iOSPlus/getiOSMessages.py)
      ，修改第10行的`ipaddr = '192.168.0.101'`为第二步得到的IP地址

</details>

<details>
<summary><b>IOS未越狱</b></summary>

1. 使用投屏软件将手机投射到电脑上


2. 获取验证码区域的坐标

    * **windows**：按prtsc键（F12旁边）截图或其他软件截**全屏**，打开Windows附件*
      画图，粘贴进去，切换铅笔工具，就可以在左下角查看坐标，坐标格式请查看[图片](https://raw.githubusercontent.com/yqchilde/JDMemberCloseAccount/main/doc/test_img3.png)
      ，将坐标填入`ocr_range`，例`ocr_range: [100, 200, 300, 400]`，填完坐标后不要移动投屏软件的窗口

    * **mac**：参考windows，请注意，windows坐标原点\(0, 0)位于左上角，而mac坐标原点\(0, 0)位于左下角

    * **Tips**：推荐使用[snipaste](https://zh.snipaste.com)截图软件查看屏幕坐标，屏幕左上角为原点


3. 去百度云或阿里云申请一个OCR，或者使用本地OCR（三选一）


4. 修改`config.yaml`文件

    1. 第40行改为`is_ocr: true`

    2. 将百度云`baidu`或阿里云`aliyun`或本地OCR`easyocr`（第三步选什么就填什么）填入45行`type`，例`type: "easyocr"`

    3. （本地OCR跳过此步）选择百度OCR请填写第48-50行`baidu_app_id` `baidu_api_key` `baidu_secret_key`，选择阿里OCR请填写第51行`aliyun_appcode`
       ，不会填就看第35-38行注释

</details>

#### 3. 选择图形验证码识别方式（可跳过）

* [x] 手动：`config.yaml`第96行改为`type: "manual"`

* [ ] 本地识别：~~`config.yaml`第96行改为`type: "local"`~~

* [x] 超级鹰（付费）：`config.yaml`第96行改为`type: "cjy"`，并填写第97-99行

* [x] 图鉴（付费）：`config.yaml`第96行改为`type: "tj"`，并填写第101-102行

#### 👇👇👇本项目配置文件详细说明👇👇👇

<details>
<summary><b>config.yaml</b> - 详细说明</summary>

```yaml
# 手机端cookie，是pt_key=xxx;pt_pin=xxx;
cookie: ""
debug: false

# selenium 相关
# selenium.browserType: 浏览器类型
# selenium.headless: 无头模式，建议默认设置
# selenium.binary: 可执行路径，如果驱动没有找到浏览器的话需要你手动配置，路径 “\” 符号注意转义需要写成 "\\"
# selenium.timeout: selenium操作超时时间，超过会跳过当前店铺，进行下一个店铺，默认为30秒
# selenium.check_wait: selenium操作发送验证码和校验是否成功注销的等待时间，目的是跳过黑店，默认3秒
selenium:
  browserType: "Chrome"
  headless: false
  binary: ""
  timeout: 30
  check_wait: 3

# shop 店铺设置相关
# shop.skip_shops: 需要跳过的店铺，需要填写卡包中的完整卡包名称，多个店铺用英文逗号隔开，格式为["aag会员中心", "大自然品牌会员"]
# shop.specify_shops: 指定注销的店铺，指定店铺优先级大于需要跳过的店铺，多个店铺用英文逗号隔开，格式为["aag会员中心", "大自然品牌会员"]
# shop.phone_tail_number: 手机后4位尾号，若填写将会校验店铺尾号是否是规定的，不符合就跳过，支持多手机号，格式为["0123","1234"]
# shop.member_close_max_number: 设置本次运行注销的最大店铺数，默认为0，代表不限制
shop:
  skip_shops: [ ]
  specify_shops: [ ]
  phone_tail_number: [ ]
  member_close_max_number: 0

# sms_captcha 短信验证码相关
# sms_captcha.is_ocr: 是否开启OCR模式，IOS设备必须开启，安卓非必须
# sms_captcha.jd_wstool: 是否调用jd_wstool工具监听验证码，默认为开启，如果不想开启，设置为false会调用内置websocket监听
# sms_captcha.ws_conn_url: websocket链接地址，不用动
# sms_captcha.ws_timeout: websocket接收验证码时间超时时间，超时会跳过当前店铺，进行下一个店铺，默认为60秒
# sms_captcha.ocr.type: ocr的类型，可选：baidu、aliyun、easyocr、baidu_fanyi
# sms_captcha.ocr.ocr_range: 需要截取的投屏区域的验证码左上角和右下角坐标，顺序依次是 [左x,左y,右x,右y]，如[1,2,3,4]
# sms_captcha.ocr.ocr_delay_time: OCR识别的延迟时间，如果没识别到就几秒后再次尝试，默认为5
# sms_captcha.ocr.baidu_app_id: 需要在[百度智能云](https://cloud.baidu.com/) 注册个账号，搜索文字识别项目，创建应用后的`app_id`
# sms_captcha.ocr.baidu_api_key: 需要在[百度智能云](https://cloud.baidu.com/) 注册个账号，搜索文字识别项目，创建应用后的`api_key`
# sms_captcha.ocr.baidu_secret_key: 需要在[百度智能云](https://cloud.baidu.com/) 注册个账号，搜索文字识别项目，创建应用后的`secret_key`
# sms_captcha.ocr.baidu_fanyi_appid: 百度翻译图片翻译的`app_id`，需要在[百度翻译](https://fanyi-api.baidu.com/register) 注册账号，开通图片翻译
# sms_captcha.ocr.baidu_fanyi_appkey: 百度翻译图片翻译的`秘钥`，需要在[百度翻译](https://fanyi-api.baidu.com/register) 注册账号，开通图片翻译
# sms_captcha.ocr.aliyun_appcode: 需要在[阿里云市场](https://market.aliyun.com/products/57124001/cmapi028554.html?spm=5176.2020520132.101.2.608172181RzlnC#sku=yuncode2255400000) 购买后的`AppCode`
sms_captcha:
  is_ocr: false
  jd_wstool: true
  ws_conn_url: "ws://localhost:5201/subscribe"
  ws_timeout: 60
  ocr:
    type: ""
    ocr_range: [ ]
    ocr_delay_time: 10
    baidu_app_id: ""
    baidu_api_key: ""
    baidu_secret_key: ""
    baidu_fanyi_appid: ""
    baidu_fanyi_appkey: ""
    aliyun_appcode: ""

# image_captcha 图形验证码相关
# image_captcha.type: 图形验证码类型，可选：local、cjy、tj、manual（manual为手动验证）
# image_captcha.cjy_username: 超级鹰账号，仅在 image_captcha.type 为 cjy 时需要设置
# image_captcha.cjy_password: 超级鹰密码，仅在 image_captcha.type 为 cjy 时需要设置
# image_captcha.cjy_soft_id: 超级鹰软件ID，仅在 image_captcha.type 为 cjy 时需要设置
# image_captcha.cjy_kind: 超级鹰验证码类型，仅在 image_captcha.type 为 cjy 时需要设置，且该项目指定为 9101
# image_captcha.tj_username: 图鉴账号，仅在 image_captcha.type 为 tj 时需要设置
# image_captcha.tj_password: 图鉴密码，仅在 image_captcha.type 为 tj 时需要设置
# image_captcha.tj_type_id: 图鉴验证码类型，仅在 image_captcha.type 为 tj 时需要设置，且该项目指定为 19
image_captcha:
  type: "tj"
  cjy_username: ""
  cjy_password: ""
  cjy_soft_id: ""
  cjy_kind: 9101
  tj_username: ""
  tj_password: ""
  tj_type_id: 19

# user-agent 用户代理，可自行配置
user-agent:
  - Mozilla/5.0 (Linux; Android 11; M2007J3SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.210 Mobile Safari/537.36
  - okhttp/3.12.1;jdmall;android;version/10.0.2;build/88569;screen/1080x2266;os/11;network/wifi;
```

</details>

### 四、运行程序

* 如果你选择外置 jd_wstool 请保持**开启**

* 如果你选择内置 jd_wstool 请**关闭**所有 jd_wstool 工具，防止堵塞

* 保持手机短信监听软件开启，IOS未越狱请保持开启短信界面的投屏

以上条件满足后在项目目录下执行`python3 main.py`，等待执行完毕即可

## 关于 `jd_wstool` 工具

该工具是用来监听手机端发送HTTP请求传递验证码的，实现原理是websocket

如果不想用`jd_wstool`，配置文件`sms_captcha`下面的`jd_wstool`设置为false，就会走内置websocket，默认为true

1. 我编译好了各种操作系统的包，直接下载 [jd_wstool](https://github.com/yqchilde/JDMemberCloseAccount/releases), 选择自己的电脑系统对应的压缩包，解压运行

2. 自行编译，代码在 [jd_wstool](https://github.com/yqchilde/JDMemberCloseAccount/tree/main/jd_wstool) 目录下

## 常见问题

1. Tasker | Macrodroid 监听不到短信怎么办？

    * vivo手机和iqoo手机的验证码保护取消： 短信-设置-隐私保护-验证码安全保护关闭

    * 小米手机：权限-允许读取短信 & 允许读取通知类短信

    * 华为手机：短信-右上角三个点-设置-验证码安全保护关闭

    * 权限没问题的，看下tasker的日志或macrodroid的日志，有错误会显示

2. 百度OCR报错 `{'error_code': 18, 'error_msg': 'Open api qps request limit reached'}`

    * 答案在这里 https://github.com/yqchilde/JDMemberCloseAccount/issues/48

3. 百度OCR报错 `{'error_code': 14, 'error_msg': 'IAM Certification failed'}`

    * 说明从百度复制到配置文件的`baidu_app_id`, `baidu_api_key`, `baidu_secret_key` 不正确

4. 百度OCR报错，根据错误码在官方API文档中查找原因

    * [查询百度文字识别API错误码文档](https://ai.baidu.com/ai-doc/OCR/dk3h7y5vr)

5. 电脑端没有监听到验证码，显示等待websocket推送短信验证码超时

    * 先用手机浏览器访问监听地址，确保能访问通，如果访问不通可尝试更改电脑网络配置文件为专用或开放防火墙

    * 如果访问通说明IP没问题，请查看手机端MacroDroid或Tasker里main的日志，确保有监听到

6. EasyOCR报错 `[ERROR] 发生了一点小问题：（'title cannot extend outside image'）`

    * 该报错说明配置文件`config.yaml`中的`ocr_range`坐标超出屏幕，导致异常，请重新填写坐标

7. 程序如下报错说明外部的jd_wstool没有开启，请开启外部jd_wstool或使用内置的jd_wstool，或者是5201端口未被开放：

    * [WARNING] WebSocket监听时发生了问题 (22, '远程计算机拒绝网络连接。', None, 1225, None)

    * [WARNING] WebSocket监听时发生了问题 ("Multiple exceptions: [Errno 61] Connect call failed ('::1', 5201, 0, 0), [Errno 61]
      Connect led ('127.0.0.1', 5201)",)

## 测试

1. websocket转发验证码

    1. 电脑运行`python3 ./tests/test_websocket.py`和 `./jd_wstool` 工具，windows记得 `.exe` ，此时模拟启动main程序和监听验证码程序

    2. 手机访问 `http://你的IP:5201/publish?smsCode=1234522`，之后查看电脑上`jd_wstool` 和 `test_main.py` 的控制台输出信息

2. 百度OCR

    1. 运行`python3 ./captcha/baidu_ocr.py`测试

3. Easy OCR

    1. 运行`python3 ./captcha/easy_ocr.py`测试

4. `main.py`执行报错

    1. 在`config.yaml`里设置`debug: true`再次执行可以看到具体报错，如解决不了请反馈tg群

## ChangeLog

- [更新日志](https://github.com/yqchilde/JDMemberCloseAccount/blob/main/CHANGELOG.md)

## ScreenShots

<div align=center>
<img src="https://github.com/yqchilde/JDMemberCloseAccount/blob/main/doc/test_img1.gif" width="600" />
</div>

<div align=center>
<img src="https://github.com/yqchilde/JDMemberCloseAccount/blob/main/doc/test_img2.gif" width="600" />
</div>

<div align=center>
<img src="https://github.com/yqchilde/JDMemberCloseAccount/blob/main/doc/test_img3.png" width="600" />
</div>

<div align=center>
<img src="https://github.com/yqchilde/JDMemberCloseAccount/blob/main/doc/test_img4.png" width="800" />
</div>

<div align=center>
<img src="https://github.com/yqchilde/JDMemberCloseAccount/blob/main/extra/iOSPlus/test.png" width="600" />
</div>

## TG讨论群

[JD退会频道 https://t.me/JDCloseAccount](https://t.me/JDCloseAccount)

[JD退会讨论群 https://t.me/jdMemberCloseAccount](https://t.me/jdMemberCloseAccount)

## 贡献者

感谢帮助构建完善本项目的所有开发者！

<a href="https://github.com/yqchilde/JDMemberCloseAccount/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=yqchilde/JDMemberCloseAccount" />
</a>


## Notes

