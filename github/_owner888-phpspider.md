---
title: "owner888/phpspider"
aliases: phpspider
released: 2015-08-06T01:33:17Z
modified: 2026-05-23T18:11:52
created: 2026-05-23T18:11:52
description: "《我用爬虫一天时间“偷了”知乎一百万用户，只为证明PHP是世界上最好的语言 》所使用的程序"
source: "https://github.com/owner888/phpspider"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/owner888/phpspider?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/owner888/phpspider?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/owner888/phpspider?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=owner888&repo=phpspider&bg_color=00000000)](https://github.com/owner888/phpspider)


# phpspider

《我用爬虫一天时间“偷了”知乎一百万用户，只为证明PHP是世界上最好的语言 》所使用的程序

## README

# phpspider -- PHP蜘蛛爬虫框架
《我用爬虫一天时间“偷了”知乎一百万用户，只为证明PHP是世界上最好的语言 》所使用的程序  

phpspider是一个爬虫开发框架。使用本框架，你不用了解爬虫的底层技术实现，爬虫被网站屏蔽、有些网站需要登录或验证码识别才能爬取等问题。简单几行PHP代码，就可以创建自己的爬虫，利用框架封装的多进程Worker类库，代码更简洁，执行效率更高速度更快。

demo目录下有一些特定网站的爬取规则，只要你安装了PHP环境，代码就可以在命令行下直接跑。 对爬虫感兴趣的开发者可以加QQ群一起讨论：147824717。

下面以糗事百科为例, 来看一下我们的爬虫长什么样子:

```
$configs = array(
    'name' => '糗事百科',
    'domains' => array(
        'qiushibaike.com',
        'www.qiushibaike.com'
    ),
    'scan_urls' => array(
        'http://www.qiushibaike.com/'
    ),
    'content_url_regexes' => array(
        "http://www.qiushibaike.com/article/\d+"
    ),
    'list_url_regexes' => array(
        "http://www.qiushibaike.com/8hr/page/\d+\?s=\d+"
    ),
    'fields' => array(
        array(
            // 抽取内容页的文章内容
            'name' => "article_content",
            'selector' => "//*[@id='single-next-link']",
            'required' => true
        ),
        array(
            // 抽取内容页的文章作者
            'name' => "article_author",
            'selector' => "//div[contains(@class,'author')]//h2",
            'required' => true
        ),
    ),
);
$spider = new phpspider($configs);
$spider->start();
```
爬虫的整体框架就是这样, 首先定义了一个$configs数组, 里面设置了待爬网站的一些信息, 然后通过调用```$spider = new phpspider($configs);```和```$spider->start();```来配置并启动爬虫.

#### 运行界面如下:      

![](http://www.epooll.com/zhihu/pachong.gif)

更多详细内容，移步到：

[开发文档](http://doc.phpspider.org)


## Notes

