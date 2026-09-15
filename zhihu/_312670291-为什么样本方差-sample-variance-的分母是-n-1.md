---
comments: true
created: '2018-02-06T10:29:21'
draft: true
modified: '2024-01-05T10:59:35'
source: https://www.zhihu.com/question/20099757/answer/312670291
title: 为什么样本方差（sample variance）的分母是 n-1？
type: archive-web
---

先把问题完整地描述下。

如果已知随机变量 ![X](https://www.zhihu.com/equation?tex=X) 的期望为 ![\\mu
](https://www.zhihu.com/equation?tex=%5Cmu+) ，那么可以如下计算方差 ![\\sigma
^2](https://www.zhihu.com/equation?tex=%5Csigma+%5E2) ：

![\\sigma ^2=E\[\(X-\\mu
\)^2\]\\\\](https://www.zhihu.com/equation?tex=%5Csigma+%5E2%3DE%5B%28X-%5Cmu+%29%5E2%5D%5C%5C)

上面的式子需要知道 ![X](https://www.zhihu.com/equation?tex=X)
的具体分布是什么（在现实应用中往往不知道准确分布），计算起来也比较复杂。

所以实践中常常采样之后，用下面这个 ![S^2](https://www.zhihu.com/equation?tex=S%5E2) 来近似
![\\sigma ^2](https://www.zhihu.com/equation?tex=%5Csigma+%5E2) ：

![S^2=\\frac{1}{n}\\sum _{i=1}^{n}\(X_ i-\\mu
\)^2\\\\](https://www.zhihu.com/equation?tex=S%5E2%3D%5Cfrac%7B1%7D%7Bn%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Cmu+%29%5E2%5C%5C)

其实现实中，往往连 ![X](https://www.zhihu.com/equation?tex=X) 的期望 ![\\mu
](https://www.zhihu.com/equation?tex=%5Cmu+) 也不清楚，只知道样本的均值：

![\\overline{X}=\\frac{1}{n}\\sum _{i=1}^{n}X_
i\\\\](https://www.zhihu.com/equation?tex=%5Coverline%7BX%7D%3D%5Cfrac%7B1%7D%7Bn%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7DX_+i%5C%5C)

那么可以这么来计算 ![S^2](https://www.zhihu.com/equation?tex=S%5E2) ：

![S^2=\\frac{1}{n-1}\\sum _{i=1}^{n}\(X_
i-\\overline{X}\)^2\\\\](https://www.zhihu.com/equation?tex=S%5E2%3D%5Cfrac%7B1%7D%7Bn-1%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Coverline%7BX%7D%29%5E2%5C%5C)

那这里就有两个问题了：

  * 为什么可以用 ![S^2](https://www.zhihu.com/equation?tex=S%5E2) 来近似 ![\\sigma ^2](https://www.zhihu.com/equation?tex=%5Csigma+%5E2) ？
  * 为什么使用 ![\\overline{X}](https://www.zhihu.com/equation?tex=%5Coverline%7BX%7D) 替代 ![\\mu ](https://www.zhihu.com/equation?tex=%5Cmu+) 之后，分母是 ![\\displaystyle \\frac{1}{n-1}](https://www.zhihu.com/equation?tex=%5Cdisplaystyle+%5Cfrac%7B1%7D%7Bn-1%7D) ？

我们来仔细分析下细节，就可以弄清楚这两个问题。

**1 为什么可以用** ![S^2](https://www.zhihu.com/equation?tex=S%5E2) **来近似**
![\\sigma ^2](https://www.zhihu.com/equation?tex=%5Csigma+%5E2) **？**

举个例子，假设 ![X](https://www.zhihu.com/equation?tex=X) 服从这么一个正态分布：

![X \\sim N\(145,
1.4^2\)\\\\](https://www.zhihu.com/equation?tex=X+%5Csim+N%28145%2C+1.4%5E2%29%5C%5C)

即， ![\\mu =145,\\sigma
^2=1.4^2=1.96](https://www.zhihu.com/equation?tex=%5Cmu+%3D145%2C%5Csigma+%5E2%3D1.4%5E2%3D1.96)
，图形如下：

![](https://picx.zhimg.com/50/v2-2a912ab7bcbd2d0e8752b1b2abbd04c0_720w.jpg?source=2c26e567)

当然，现实中往往并不清楚 ![X](https://www.zhihu.com/equation?tex=X)
服从的分布是什么，具体参数又是什么？所以用虚线来表明我们并不是真正知道 ![X](https://www.zhihu.com/equation?tex=X)
的分布：

![](https://picx.zhimg.com/50/v2-16a45eb505a1a0bdb30a8c73a7562470_720w.jpg?source=2c26e567)

很幸运的，我们知道 ![\\mu =145](https://www.zhihu.com/equation?tex=%5Cmu+%3D145) ，因此对
![X](https://www.zhihu.com/equation?tex=X) 采样，并通过：

![S^2=\\frac{1}{n}\\sum _{i=1}^{n}\(X_ i-\\mu
\)^2\\\\](https://www.zhihu.com/equation?tex=S%5E2%3D%5Cfrac%7B1%7D%7Bn%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Cmu+%29%5E2%5C%5C)

来估计 ![\\sigma ^2](https://www.zhihu.com/equation?tex=%5Csigma+%5E2) 。某次采样计算出来的
![S^2](https://www.zhihu.com/equation?tex=S%5E2) ：

![](https://pic1.zhimg.com/50/v2-53cee2fbcd66549455a612ffb367cad0_720w.jpg?source=2c26e567)

看起来比 ![\\sigma
^2=1.96](https://www.zhihu.com/equation?tex=%5Csigma+%5E2%3D1.96)
要小。采样具有随机性，我们多采样几次， ![S^2](https://www.zhihu.com/equation?tex=S%5E2) 会围绕
![\\sigma ^2](https://www.zhihu.com/equation?tex=%5Csigma+%5E2) 上下波动：

![](https://picx.zhimg.com/50/v2-e17dbe3914a263804b8a693d42753797_720w.gif?source=2c26e567)

用 ![S^2](https://www.zhihu.com/equation?tex=S%5E2) 作为 ![\\sigma
^2](https://www.zhihu.com/equation?tex=%5Csigma+%5E2) 的一个估计量，算是可以接受的选择。

很容易算出：

![E\[\\frac{1}{n}\\sum _{i=1}^{n}\(X_ i-\\mu \)^2\]=\\sigma
^2\\\\](https://www.zhihu.com/equation?tex=E%5B%5Cfrac%7B1%7D%7Bn%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Cmu+%29%5E2%5D%3D%5Csigma+%5E2%5C%5C)

因此，根据中心极限定理， ![S^2](https://www.zhihu.com/equation?tex=S%5E2) 的采样均值会服从 ![\\mu
=1.4^2](https://www.zhihu.com/equation?tex=%5Cmu+%3D1.4%5E2) 的正态分布：

![](https://pic1.zhimg.com/50/v2-c0c0a0be91ee262163cba543261b3562_720w.jpg?source=2c26e567)

这也就是所谓的无偏估计量。从这个分布来看，选择 ![S^2](https://www.zhihu.com/equation?tex=S%5E2)
作为估计量确实可以接受。

**2 为什么使用**
![\\overline{X}](https://www.zhihu.com/equation?tex=%5Coverline%7BX%7D) **替代**
![\\mu ](https://www.zhihu.com/equation?tex=%5Cmu+) **之后，分母是**
![\\displaystyle
\\frac{1}{n-1}](https://www.zhihu.com/equation?tex=%5Cdisplaystyle+%5Cfrac%7B1%7D%7Bn-1%7D)
**？**

更多的情况，我们不知道 ![\\mu ](https://www.zhihu.com/equation?tex=%5Cmu+) 是多少的，只能计算出
![\\overline{X}](https://www.zhihu.com/equation?tex=%5Coverline%7BX%7D)
。不同的采样对应不同的
![\\overline{X}](https://www.zhihu.com/equation?tex=%5Coverline%7BX%7D) ：

![](https://pic1.zhimg.com/50/v2-f0157542f13d0cde65b92257c9faac63_720w.gif?source=2c26e567)

对于某次采样而言，当 ![\\mu
=\\overline{X}](https://www.zhihu.com/equation?tex=%5Cmu+%3D%5Coverline%7BX%7D)
时，下式取得最小值：

![\\sum _{i=1}^{n}\(X_ i-\\mu
\)^2\\\\](https://www.zhihu.com/equation?tex=%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Cmu+%29%5E2%5C%5C)

我们也是比较容易从图像中观察出这一点，只要 ![\\mu ](https://www.zhihu.com/equation?tex=%5Cmu+) 偏离
![\\overline{X}](https://www.zhihu.com/equation?tex=%5Coverline%7BX%7D)
，该值就会增大：

![](https://picx.zhimg.com/50/v2-6ea6369dc101ce7262325376941d1342_720w.gif?source=2c26e567)

所以可知：

![\\sum _{i=1}^{n}\(X_ i-\\overline{X}\)^2 \\leq \\sum _{i=1}^{n}\(X_ i-\\mu
\)^2\\\\](https://www.zhihu.com/equation?tex=%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Coverline%7BX%7D%29%5E2+%5Cleq+%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Cmu+%29%5E2%5C%5C)

可推出：

![\\frac{1}{n}\\sum _{i=1}^{n}\(X_ i-\\overline{X}\)^2 \\leq \\frac{1}{n}\\sum
_{i=1}^{n}\(X_ i-\\mu
\)^2\\\\](https://www.zhihu.com/equation?tex=%5Cfrac%7B1%7D%7Bn%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Coverline%7BX%7D%29%5E2+%5Cleq+%5Cfrac%7B1%7D%7Bn%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Cmu+%29%5E2%5C%5C)

进而推出：

![E\[\\frac{1}{n}\\sum _{i=1}^{n}\(X_ i-\\overline{X}\)^2\] \\leq
E\[\\frac{1}{n}\\sum _{i=1}^{n}\(X_ i-\\mu \)^2\]=\\sigma
^2\\\\](https://www.zhihu.com/equation?tex=E%5B%5Cfrac%7B1%7D%7Bn%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Coverline%7BX%7D%29%5E2%5D+%5Cleq+E%5B%5Cfrac%7B1%7D%7Bn%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Cmu+%29%5E2%5D%3D%5Csigma+%5E2%5C%5C)

如果用下面这个式子来估计：

![S^2=\\frac{1}{n}\\sum _{i=1}^{n}\(X_
i-\\overline{X}\)^2\\\\](https://www.zhihu.com/equation?tex=S%5E2%3D%5Cfrac%7B1%7D%7Bn%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Coverline%7BX%7D%29%5E2%5C%5C)

那么 ![S^2](https://www.zhihu.com/equation?tex=S%5E2) 采样均值会服从一个偏离
![1.4^2](https://www.zhihu.com/equation?tex=1.4%5E2) 的正态分布：

![](https://picx.zhimg.com/50/v2-35fad280f5681ec4978e1c18ec3beb9f_720w.jpg?source=2c26e567)

可见，此分布倾向于低估 ![\\sigma ^2](https://www.zhihu.com/equation?tex=%5Csigma+%5E2) 。

具体小了多少，我们可以来算下：

![ {\\displaystyle {\\begin{aligned} \\operatorname {E} \[S^{2}\]&
=\\operatorname {E} \\left\[{\\frac{1}{n}}\\sum _{i=1}^{n}{\\big
\(}X_{i}-{\\overline{X}}{\\big \)}^{2}\\right\]=\\operatorname {E}
{\\bigg\[}{\\frac{1}{n}}\\sum _{i=1}^{n}{\\bigg\(}\(X_{i}-\\mu
\)-\({\\overline{X}}-\\mu \){\\bigg\)}^{2}{\\bigg\]}\\\\\[8pt\]&
=\\operatorname {E} {\\bigg\[}{\\frac{1}{n}}\\sum
_{i=1}^{n}{\\bigg\(}\(X_{i}-\\mu \)^{2}-2\({\\overline{X}}-\\mu \)\(X_{i}-\\mu
\)+\({\\overline{X}}-\\mu \)^{2}{\\bigg\)}{\\bigg\]}\\\\\[8pt\]&
=\\operatorname {E} {\\bigg\[}{\\frac{1}{n}}\\sum _{i=1}^{n}\(X_{i}-\\mu
\)^{2}-{\\frac{2}{n}}\({\\overline{X}}-\\mu \)\\sum _{i=1}^{n}\(X_{i}-\\mu
\)+{\\frac{1}{n}}\({\\overline{X}}-\\mu \)^{2}\\sum
_{i=1}^{n}1{\\bigg\]}\\\\\[8pt\]& =\\operatorname {E}
{\\bigg\[}{\\frac{1}{n}}\\sum _{i=1}^{n}\(X_{i}-\\mu
\)^{2}-{\\frac{2}{n}}\({\\overline{X}}-\\mu \)\\sum _{i=1}^{n}\(X_{i}-\\mu
\)+{\\frac{1}{n}}\({\\overline{X}}-\\mu \)^{2}\\cdot n{\\bigg\]}\\\\\[8pt\]&
=\\operatorname {E} {\\bigg\[}{\\frac{1}{n}}\\sum _{i=1}^{n}\(X_{i}-\\mu
\)^{2}-{\\frac{2}{n}}\({\\overline{X}}-\\mu \)\\sum _{i=1}^{n}\(X_{i}-\\mu
\)+\({\\overline{X}}-\\mu \)^{2}{\\bigg\]}\\\\\[8pt\]\\end{aligned}}}
\\\\](https://www.zhihu.com/equation?tex=+%7B%5Cdisplaystyle+%7B%5Cbegin%7Baligned%7D+%5Coperatorname+%7BE%7D+%5BS%5E%7B2%7D%5D%26+%3D%5Coperatorname+%7BE%7D+%5Cleft%5B%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%7B%5Cbig+%28%7DX_%7Bi%7D-%7B%5Coverline%7BX%7D%7D%7B%5Cbig+%29%7D%5E%7B2%7D%5Cright%5D%3D%5Coperatorname+%7BE%7D+%7B%5Cbigg%5B%7D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%7B%5Cbigg%28%7D%28X_%7Bi%7D-%5Cmu+%29-%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%7B%5Cbigg%29%7D%5E%7B2%7D%7B%5Cbigg%5D%7D%5C%5C%5B8pt%5D%26+%3D%5Coperatorname+%7BE%7D+%7B%5Cbigg%5B%7D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%7B%5Cbigg%28%7D%28X_%7Bi%7D-%5Cmu+%29%5E%7B2%7D-2%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%28X_%7Bi%7D-%5Cmu+%29%2B%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5E%7B2%7D%7B%5Cbigg%29%7D%7B%5Cbigg%5D%7D%5C%5C%5B8pt%5D%26+%3D%5Coperatorname+%7BE%7D+%7B%5Cbigg%5B%7D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_%7Bi%7D-%5Cmu+%29%5E%7B2%7D-%7B%5Cfrac%7B2%7D%7Bn%7D%7D%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_%7Bi%7D-%5Cmu+%29%2B%7B%5Cfrac%7B1%7D%7Bn%7D%7D%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5E%7B2%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D1%7B%5Cbigg%5D%7D%5C%5C%5B8pt%5D%26+%3D%5Coperatorname+%7BE%7D+%7B%5Cbigg%5B%7D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_%7Bi%7D-%5Cmu+%29%5E%7B2%7D-%7B%5Cfrac%7B2%7D%7Bn%7D%7D%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_%7Bi%7D-%5Cmu+%29%2B%7B%5Cfrac%7B1%7D%7Bn%7D%7D%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5E%7B2%7D%5Ccdot+n%7B%5Cbigg%5D%7D%5C%5C%5B8pt%5D%26+%3D%5Coperatorname+%7BE%7D+%7B%5Cbigg%5B%7D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_%7Bi%7D-%5Cmu+%29%5E%7B2%7D-%7B%5Cfrac%7B2%7D%7Bn%7D%7D%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_%7Bi%7D-%5Cmu+%29%2B%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5E%7B2%7D%7B%5Cbigg%5D%7D%5C%5C%5B8pt%5D%5Cend%7Baligned%7D%7D%7D+%5C%5C)

其中：

![ {\\displaystyle {\\begin{aligned} {\\overline{X}}-\\mu ={\\frac{1}{n}}\\sum
_{i=1}^{n}X_{i}-\\mu ={\\frac{1}{n}}\\sum _{i=1}^{n}X_{i}-{\\frac{1}{n}}\\sum
_{i=1}^{n}\\mu \\ ={\\frac{1}{n}}\\sum _{i=1}^{n}\(X_{i}-\\mu
\).\\\\\[8pt\]\\end{aligned}}}
\\\\](https://www.zhihu.com/equation?tex=+%7B%5Cdisplaystyle+%7B%5Cbegin%7Baligned%7D+%7B%5Coverline%7BX%7D%7D-%5Cmu+%3D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7DX_%7Bi%7D-%5Cmu+%3D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7DX_%7Bi%7D-%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%5Cmu+%5C+%3D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_%7Bi%7D-%5Cmu+%29.%5C%5C%5B8pt%5D%5Cend%7Baligned%7D%7D%7D+%5C%5C)

所以我们接着算下去：

![ {\\displaystyle {\\begin{aligned} \\operatorname {E} \[S^{2}\]&
=\\operatorname {E} {\\bigg\[}{\\frac{1}{n}}\\sum _{i=1}^{n}\(X_{i}-\\mu
\)^{2}-{\\frac{2}{n}}\({\\overline{X}}-\\mu \)\\sum _{i=1}^{n}\(X_{i}-\\mu
\)+\({\\overline{X}}-\\mu \)^{2}{\\bigg\]}\\\\\[8pt\]& =\\operatorname {E}
{\\bigg\[}{\\frac{1}{n}}\\sum _{i=1}^{n}\(X_{i}-\\mu
\)^{2}-{\\frac{2}{n}}\({\\overline{X}}-\\mu \)\\cdot n\\cdot
\({\\overline{X}}-\\mu \)+\({\\overline{X}}-\\mu \)^{2}{\\bigg\]}\\\\\[8pt\]&
=\\operatorname {E} {\\bigg\[}{\\frac{1}{n}}\\sum _{i=1}^{n}\(X_{i}-\\mu
\)^{2}-2\({\\overline{X}}-\\mu \)^{2}+\({\\overline{X}}-\\mu
\)^{2}{\\bigg\]}\\\\\[8pt\]& =\\operatorname {E} {\\bigg\[}{\\frac{1}{n}}\\sum
_{i=1}^{n}\(X_{i}-\\mu \)^{2}-\({\\overline{X}}-\\mu
\)^{2}{\\bigg\]}\\\\\[8pt\]& =\\operatorname {E} {\\bigg\[}{\\frac{1}{n}}\\sum
_{i=1}^{n}\(X_{i}-\\mu \)^{2}{\\bigg\]}-\\operatorname {E}
{\\bigg\[}\({\\overline{X}}-\\mu \)^{2}{\\bigg\]}\\\\\[8pt\]& =\\sigma
^{2}-\\operatorname {E} \\left\[\({\\overline{X}}-\\mu
\)^{2}\\right\]\\end{aligned}}}\\\\](https://www.zhihu.com/equation?tex=+%7B%5Cdisplaystyle+%7B%5Cbegin%7Baligned%7D+%5Coperatorname+%7BE%7D+%5BS%5E%7B2%7D%5D%26+%3D%5Coperatorname+%7BE%7D+%7B%5Cbigg%5B%7D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_%7Bi%7D-%5Cmu+%29%5E%7B2%7D-%7B%5Cfrac%7B2%7D%7Bn%7D%7D%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_%7Bi%7D-%5Cmu+%29%2B%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5E%7B2%7D%7B%5Cbigg%5D%7D%5C%5C%5B8pt%5D%26+%3D%5Coperatorname+%7BE%7D+%7B%5Cbigg%5B%7D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_%7Bi%7D-%5Cmu+%29%5E%7B2%7D-%7B%5Cfrac%7B2%7D%7Bn%7D%7D%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5Ccdot+n%5Ccdot+%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%2B%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5E%7B2%7D%7B%5Cbigg%5D%7D%5C%5C%5B8pt%5D%26+%3D%5Coperatorname+%7BE%7D+%7B%5Cbigg%5B%7D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_%7Bi%7D-%5Cmu+%29%5E%7B2%7D-2%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5E%7B2%7D%2B%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5E%7B2%7D%7B%5Cbigg%5D%7D%5C%5C%5B8pt%5D%26+%3D%5Coperatorname+%7BE%7D+%7B%5Cbigg%5B%7D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_%7Bi%7D-%5Cmu+%29%5E%7B2%7D-%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5E%7B2%7D%7B%5Cbigg%5D%7D%5C%5C%5B8pt%5D%26+%3D%5Coperatorname+%7BE%7D+%7B%5Cbigg%5B%7D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_%7Bi%7D-%5Cmu+%29%5E%7B2%7D%7B%5Cbigg%5D%7D-%5Coperatorname+%7BE%7D+%7B%5Cbigg%5B%7D%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5E%7B2%7D%7B%5Cbigg%5D%7D%5C%5C%5B8pt%5D%26+%3D%5Csigma+%5E%7B2%7D-%5Coperatorname+%7BE%7D+%5Cleft%5B%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5E%7B2%7D%5Cright%5D%5Cend%7Baligned%7D%7D%7D%5C%5C)

其中（证明见[Prove that $E (\overline{X} - \mu)^2 =
\frac{1}{n}\sigma^2$](https://link.zhihu.com/?target=https%3A//math.stackexchange.com/questions/1363505/prove-
that-e-overlinex-mu2-frac1n-sigma2)）：

![ {\\displaystyle \\operatorname {E} {\\big \[}\({\\overline{X}}-\\mu
\)^{2}{\\big \]}={\\frac{1}{n}}\\sigma ^{2}.}
\\\\](https://www.zhihu.com/equation?tex=+%7B%5Cdisplaystyle+%5Coperatorname+%7BE%7D+%7B%5Cbig+%5B%7D%28%7B%5Coverline%7BX%7D%7D-%5Cmu+%29%5E%7B2%7D%7B%5Cbig+%5D%7D%3D%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csigma+%5E%7B2%7D.%7D+%5C%5C)

所以：

![E\[\\frac{1}{n}\\sum _{i=1}^{n}\(X_ i-\\overline{X}\)^2\]=\\sigma
^{2}-{\\frac{1}{n}}\\sigma ^{2}=\\frac{n-1}{n}\\sigma
^{2}\\\\](https://www.zhihu.com/equation?tex=E%5B%5Cfrac%7B1%7D%7Bn%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Coverline%7BX%7D%29%5E2%5D%3D%5Csigma+%5E%7B2%7D-%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csigma+%5E%7B2%7D%3D%5Cfrac%7Bn-1%7D%7Bn%7D%5Csigma+%5E%7B2%7D%5C%5C)

也就是说，低估了 ![\\displaystyle {\\frac{1}{n}}\\sigma
^{2}](https://www.zhihu.com/equation?tex=%5Cdisplaystyle+%7B%5Cfrac%7B1%7D%7Bn%7D%7D%5Csigma+%5E%7B2%7D)
，进行一下调整：

![\\frac{n}{n-1}E\[\\frac{1}{n}\\sum _{i=1}^{n}\(X_
i-\\overline{X}\)^2\]=E\[\\frac{1}{n-1}\\sum _{i=1}^{n}\(X_
i-\\overline{X}\)^2\]=\\sigma
^{2}\\\\](https://www.zhihu.com/equation?tex=%5Cfrac%7Bn%7D%7Bn-1%7DE%5B%5Cfrac%7B1%7D%7Bn%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Coverline%7BX%7D%29%5E2%5D%3DE%5B%5Cfrac%7B1%7D%7Bn-1%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Coverline%7BX%7D%29%5E2%5D%3D%5Csigma+%5E%7B2%7D%5C%5C)

因此使用下面这个式子进行估计，得到的就是无偏估计：

![S^2=\\frac{1}{n-1}\\sum _{i=1}^{n}\(X_
i-\\overline{X}\)^2\\\\](https://www.zhihu.com/equation?tex=S%5E2%3D%5Cfrac%7B1%7D%7Bn-1%7D%5Csum+_%7Bi%3D1%7D%5E%7Bn%7D%28X_+i-%5Coverline%7BX%7D%29%5E2%5C%5C)最新文章请查看（可能会有后继更新）：[为什么样本方差的分母是n-1？](https://link.zhihu.com/?target=https%3A//www.matongxue.com/madocs/607.html)

更多内容推荐**马同学图解数学** 系列教程