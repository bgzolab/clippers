---
comments: true
created: '2017-12-24T12:48:18'
draft: true
modified: '2017-12-24T12:48:19'
source: https://www.zhihu.com/question/264534131/answer/282054631
title: 数学里的「良定义（well-defined）」的定义是什么？
type: archive-web
---

谢邀。

良定义的意思就是在定义可能有ambiguity的时候，要检查一下给出的定义到底是不是清晰的，是不是有意义的。这个词最常见的用法就是定义映射
![f:X/\\sim\\to Y](https://www.zhihu.com/equation?tex=f%3AX%2F%5Csim%5Cto+Y)
的时候，很多情况下是先定义一个 ![\\tilde{f}:X\\to
Y](https://www.zhihu.com/equation?tex=%5Ctilde%7Bf%7D%3AX%5Cto+Y) ，然后再验证
![\\tilde{f}](https://www.zhihu.com/equation?tex=%5Ctilde%7Bf%7D)
跟代表元的选取无关，从而自然地给出了想要定义的f。

90%的情况下，良定义就是
与代表元选取无关的意思；剩下10%可能出现什么别的数学上的用法我一下子想不起来了。“良定义”这个词毕竟是一个自然语言的词语，不是在形式语言里面通过抽象符号来定义的东西；自然语言里面任何概念都不可能完全限定死它的含义，永远都有外延。