---
comments: true
created: '2016-01-06T14:28:14'
draft: true
modified: '2016-01-06T14:49:44'
source: https://www.zhihu.com/question/20355486/answer/80233297
title: 关于nodejs的模板引擎，如何选择 EJS 和 Jade？
type: archive-web
---

前端和后端往往不是由一个人写的。我在团队项目中就很少前端的页面。页面是别人写，他不懂什么是后端，我就跟他商量好数据的契约，缺失的数据都用某个标签填充。然后他干完活把页面给我，他给我的东西都是html格式。

ejs有一个好，就是它基本是html，前端那边改个扩展名就是html，他怎么编译的跟我没关系，到我这边改个扩展名就是模板。

如果我用jade，要费劲去转格式，jade用了缩进，看似方便了开发者，但是不以html为基础的模板都是耍流氓不是么。