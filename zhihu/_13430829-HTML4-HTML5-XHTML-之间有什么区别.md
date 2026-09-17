---
comments: true
created: '2011-12-01T01:01:12'
draft: true
modified: '2011-12-01T01:01:12'
source: https://www.zhihu.com/question/19818208/answer/13430829
title: HTML4，HTML5，XHTML 之间有什么区别？
type: archive-web
---

我来从HTML的历史谈谈他们3者的区别。

在HTML的早期发展中，W3C成立之前，很多标准的制定都是在浏览器的开发者们互相讨论的情况下完成的，比如HTML 2.0, 3.2直到4.0,
4.01，这些标准大部分都是所谓的retro-
spec，即先有实现后有标准。在这种情况下，HTML标准不是很规范，浏览器也对HTML页面中的错误相当宽容。这反过来又导致了HTML作者写出了大量的含有错误的HTML页面。据说，时至今日web上99%的页面都含有HTML错误。

W3C随后意识到了这个问题，并认为这是互联网的一个基础性问题，应该加以解决。为了规范HTML，W3C结合XML制定了XHTML
1.0标准，这个标准没有增加任何新的tag，只是按照XML的要求来规范HTML，并定义了一个新的MIME
type，application/xhtml+xml。W3C的初衷是对这个MIME
type浏览器要实行强错误检查，既如果页面有HTML错误，就要显示错误信息。但是由于已有的web页面中已经有了大量的错误，很多开发者拒绝使用新的MIME
type。W3C不得已，在XHTML 1.0的标准之后加了一个附录C，允许开发者使用XHTML语法来写页面，同时使用旧的MIME
type，application/html，来分发页面。这个旧的MIME
type不会触发浏览器的强错误检查。这就是我们今天看到的情况，很多网站宣称自己遵守XHTML
1.0标准，那只不过是说，他的页面中用了XHTML语法，但并不能保证完全没有错误。要验证XHTML有没有真正起效，需要查看web服务器使用哪种MIME
type来分发页面的。

  

W3C随后在XHTML 1.1中取消了附录C，即使用XHTML 1.1标准的页面必须用新的MIME
type来分发。于是这个标准并没有很多人采用。这种情况同样发生在尚未完成的XHTML
2.0身上，它要求强错误检查，于是没有人采用。XHTML的故事也告诉我们，有时候先有标准再来实现，是行不通的。

  

有了XHTML的教训，WHAT Working
Group和W3C在制定下一代HTML标准，也就是HTML5的时候，就将向后兼容作为了一个很重要的原则。HTML5确实引入了许多新的特性，但是它最重要的一个特性是，不会break已有的网页。你可以将任何已有的网页的第一行改成<!DOCTYPE
html>，它就成也一个HTML5页面，并且可以照样在浏览器里正常的展示。