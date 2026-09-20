---
comments: true
created: '2019-12-21T12:35:26'
draft: true
modified: '2019-12-21T12:35:26'
source: https://www.zhihu.com/question/51316930/answer/944475751
title: arcsin(x)和tan(x)的泰勒展开有没有通项公式？
type: archive-web
---

![\\arcsin x](https://www.zhihu.com/equation?tex=%5Carcsin+x)
的Taylor展开（准确来讲是Maclaurin级数）应该很熟悉吧

  

实际上，你要是遇到过让你求级数
![\\sum_{n=1}^{\\infty}{\\frac{1}{n^{2}}}](https://www.zhihu.com/equation?tex=%5Csum_%7Bn%3D1%7D%5E%7B%5Cinfty%7D%7B%5Cfrac%7B1%7D%7Bn%5E%7B2%7D%7D%7D)
的和的问题，你应该知道，其中一个经典方法就是利用 ![\\arcsin x=\\sum_{n=0}^{\\infty} {\\frac{\\left\(
2n-1 \\right\)!!}{\\left\( 2n
\\right\)!!}\\frac{x^{2n+1}}{2n+1}}](https://www.zhihu.com/equation?tex=%5Carcsin+x%3D%5Csum_%7Bn%3D0%7D%5E%7B%5Cinfty%7D+%7B%5Cfrac%7B%5Cleft%28+2n-1+%5Cright%29%21%21%7D%7B%5Cleft%28+2n+%5Cright%29%21%21%7D%5Cfrac%7Bx%5E%7B2n%2B1%7D%7D%7B2n%2B1%7D%7D)

  

**证明：**

  

首先，根据广义牛顿二项式定理 ![\\left\( 1+x \\right\)^{\\alpha} =1+\\alpha
x+\\frac{\\alpha\\left\( \\alpha-1 \\right\)}{2!}x^{2}+\\cdots
+\\frac{\\alpha\\left\( \\alpha-1 \\right\)\\cdots \\left\( \\alpha-n+1
\\right\)}{n!}x^{n}+\\cdots](https://www.zhihu.com/equation?tex=%5Cleft%28+1%2Bx+%5Cright%29%5E%7B%5Calpha%7D+%3D1%2B%5Calpha+x%2B%5Cfrac%7B%5Calpha%5Cleft%28+%5Calpha-1+%5Cright%29%7D%7B2%21%7Dx%5E%7B2%7D%2B%5Ccdots+%2B%5Cfrac%7B%5Calpha%5Cleft%28+%5Calpha-1+%5Cright%29%5Ccdots+%5Cleft%28+%5Calpha-n%2B1+%5Cright%29%7D%7Bn%21%7Dx%5E%7Bn%7D%2B%5Ccdots)

即 ![\\left\( 1+x \\right\)^{\\alpha} =\\sum_{n=0}^{\\infty}{{\\alpha \\choose
n}x^{n}}](https://www.zhihu.com/equation?tex=%5Cleft%28+1%2Bx+%5Cright%29%5E%7B%5Calpha%7D+%3D%5Csum_%7Bn%3D0%7D%5E%7B%5Cinfty%7D%7B%7B%5Calpha+%5Cchoose+n%7Dx%5E%7Bn%7D%7D)

（
![\\alpha\\in\\mathbb{R}](https://www.zhihu.com/equation?tex=%5Calpha%5Cin%5Cmathbb%7BR%7D)
）

由**D 'Alembert比式判别法**，很容易得出其收敛半径为
![R=1](https://www.zhihu.com/equation?tex=R%3D1)

  

取
![\\alpha=-\\frac{1}{2}](https://www.zhihu.com/equation?tex=%5Calpha%3D-%5Cfrac%7B1%7D%7B2%7D)

得 ![\\frac{1}{\\sqrt{1+x}} =1-\\frac{x}{2}+\\frac{1\\cdot3}{2\\cdot4}x^{2}
-\\frac{1\\cdot3\\cdot5}{2\\cdot4\\cdot6}x^{3}+\\cdots +\\left\( -1
\\right\)^{n} \\frac{\\left\( 2n-1 \\right\)!!} {\\left\( 2n \\right\)!!}x^{n}
+\\cdots](https://www.zhihu.com/equation?tex=%5Cfrac%7B1%7D%7B%5Csqrt%7B1%2Bx%7D%7D+%3D1-%5Cfrac%7Bx%7D%7B2%7D%2B%5Cfrac%7B1%5Ccdot3%7D%7B2%5Ccdot4%7Dx%5E%7B2%7D+-%5Cfrac%7B1%5Ccdot3%5Ccdot5%7D%7B2%5Ccdot4%5Ccdot6%7Dx%5E%7B3%7D%2B%5Ccdots+%2B%5Cleft%28+-1+%5Cright%29%5E%7Bn%7D+%5Cfrac%7B%5Cleft%28+2n-1+%5Cright%29%21%21%7D+%7B%5Cleft%28+2n+%5Cright%29%21%21%7Dx%5E%7Bn%7D+%2B%5Ccdots)

再用 ![-x^{2}](https://www.zhihu.com/equation?tex=-x%5E%7B2%7D) 取代
![x](https://www.zhihu.com/equation?tex=x)

即得

![\\frac{1}{\\sqrt{1-x^{2}}}
=1+\\frac{1}{2}x^{2}+\\frac{1\\cdot3}{2\\cdot4}x^{4}
+\\frac{1\\cdot3\\cdot5}{2\\cdot4\\cdot6}x^{6}+\\cdots +\\frac{\\left\( 2n-1
\\right\)!!}{\\left\( 2n \\right\)!!}x^{2n}
+\\cdots](https://www.zhihu.com/equation?tex=%5Cfrac%7B1%7D%7B%5Csqrt%7B1-x%5E%7B2%7D%7D%7D+%3D1%2B%5Cfrac%7B1%7D%7B2%7Dx%5E%7B2%7D%2B%5Cfrac%7B1%5Ccdot3%7D%7B2%5Ccdot4%7Dx%5E%7B4%7D+%2B%5Cfrac%7B1%5Ccdot3%5Ccdot5%7D%7B2%5Ccdot4%5Ccdot6%7Dx%5E%7B6%7D%2B%5Ccdots+%2B%5Cfrac%7B%5Cleft%28+2n-1+%5Cright%29%21%21%7D%7B%5Cleft%28+2n+%5Cright%29%21%21%7Dx%5E%7B2n%7D+%2B%5Ccdots)

再对其逐项求积分，得

![\\begin{alignat}{0} \\arcsin
x=\\int_{0}^{x}\\frac{\\mathrm{d}t}{\\sqrt{1-t^{2}}}\\\\
=x+\\frac{1}{2}\\frac{x^{3}}{3} +\\frac{1\\cdot3}{2\\cdot4}\\frac{x^{5} }{5}
+\\frac{1\\cdot3\\cdot5}{2\\cdot4\\cdot6}\\frac{x^{7}}{7}+\\cdots
+\\frac{\\left\( 2n-1 \\right\)!!}{\\left\( 2n
\\right\)!!}\\frac{x^{2n+1}}{2n+1} +\\cdots
\\end{alignat}](https://www.zhihu.com/equation?tex=%5Cbegin%7Balignat%7D%7B0%7D+%5Carcsin+x%3D%5Cint_%7B0%7D%5E%7Bx%7D%5Cfrac%7B%5Cmathrm%7Bd%7Dt%7D%7B%5Csqrt%7B1-t%5E%7B2%7D%7D%7D%5C%5C+%3Dx%2B%5Cfrac%7B1%7D%7B2%7D%5Cfrac%7Bx%5E%7B3%7D%7D%7B3%7D+%2B%5Cfrac%7B1%5Ccdot3%7D%7B2%5Ccdot4%7D%5Cfrac%7Bx%5E%7B5%7D+%7D%7B5%7D+%2B%5Cfrac%7B1%5Ccdot3%5Ccdot5%7D%7B2%5Ccdot4%5Ccdot6%7D%5Cfrac%7Bx%5E%7B7%7D%7D%7B7%7D%2B%5Ccdots+%2B%5Cfrac%7B%5Cleft%28+2n-1+%5Cright%29%21%21%7D%7B%5Cleft%28+2n+%5Cright%29%21%21%7D%5Cfrac%7Bx%5E%7B2n%2B1%7D%7D%7B2n%2B1%7D+%2B%5Ccdots+%5Cend%7Balignat%7D)

（ ![x\\in\\left\[ -1,1
\\right\]](https://www.zhihu.com/equation?tex=x%5Cin%5Cleft%5B+-1%2C1+%5Cright%5D)
）

  

这里， ![x\\in\\left\( -1,1
\\right\)](https://www.zhihu.com/equation?tex=x%5Cin%5Cleft%28+-1%2C1+%5Cright%29)
上幂级数的收敛性没有任何疑问，直接用D'Alembert比值判别法即可

而端点 ![x=1](https://www.zhihu.com/equation?tex=x%3D1) 处 ![\\sum_{n=0}^{\\infty}
{\\frac{\\left\( 2n-1 \\right\)!!}{\\left\( 2n
\\right\)!!}\\frac{1}{2n+1}}](https://www.zhihu.com/equation?tex=%5Csum_%7Bn%3D0%7D%5E%7B%5Cinfty%7D+%7B%5Cfrac%7B%5Cleft%28+2n-1+%5Cright%29%21%21%7D%7B%5Cleft%28+2n+%5Cright%29%21%21%7D%5Cfrac%7B1%7D%7B2n%2B1%7D%7D)
的收敛性也可使用D'Alembert比值判别法

![x=-1](https://www.zhihu.com/equation?tex=x%3D-1) 处则使用**Leibniz判别法** 判定收敛性

或者，注意到 ![\\frac{\\left\( 2n-1 \\right\)!!}{\\left\( 2n
\\right\)!!}\\frac{1}{2n+1} \\sim\\cfrac{2}{\\pi}\\left\( 2n+1
\\right\)^{-\\frac{3}{2}}](https://www.zhihu.com/equation?tex=%5Cfrac%7B%5Cleft%28+2n-1+%5Cright%29%21%21%7D%7B%5Cleft%28+2n+%5Cright%29%21%21%7D%5Cfrac%7B1%7D%7B2n%2B1%7D+%5Csim%5Ccfrac%7B2%7D%7B%5Cpi%7D%5Cleft%28+2n%2B1+%5Cright%29%5E%7B-%5Cfrac%7B3%7D%7B2%7D%7D)

这可由Wallis公式

![\\lim_{n \\rightarrow \\infty}{\\frac{1}{2n+1} \\left\( \\frac{\\left\( 2n-1
\\right\)!!}{\\left\( 2n \\right\)!!} \\right\)^{2}}
=\\frac{\\pi}{2}](https://www.zhihu.com/equation?tex=%5Clim_%7Bn+%5Crightarrow+%5Cinfty%7D%7B%5Cfrac%7B1%7D%7B2n%2B1%7D+%5Cleft%28+%5Cfrac%7B%5Cleft%28+2n-1+%5Cright%29%21%21%7D%7B%5Cleft%28+2n+%5Cright%29%21%21%7D+%5Cright%29%5E%7B2%7D%7D+%3D%5Cfrac%7B%5Cpi%7D%7B2%7D)

推出

所以端点处的收敛性也可由**Tauber定理** 证明，此处亦不详细展开

  

  

  

  

![\\tan x](https://www.zhihu.com/equation?tex=%5Ctan+x)
的Maclaurin级数的推导要复杂一些，详细过程可见我这个回答：

[tan
x的麦克劳林公式系数和伯努利数的关系是怎么得到的？](https://www.zhihu.com/question/25662383/answer/913175006)

简单来说，就是利用幂级数的除法

指数函数的Maclaurin级数：

![e^{x}=\\sum_{n=0}^{\\infty}{\\frac{x^{n}}{n!}}
=1+x+\\frac{x^{2}}{2!}+\\cdots+\\frac{x^{n}}{n!}+\\cdots](https://www.zhihu.com/equation?tex=e%5E%7Bx%7D%3D%5Csum_%7Bn%3D0%7D%5E%7B%5Cinfty%7D%7B%5Cfrac%7Bx%5E%7Bn%7D%7D%7Bn%21%7D%7D+%3D1%2Bx%2B%5Cfrac%7Bx%5E%7B2%7D%7D%7B2%21%7D%2B%5Ccdots%2B%5Cfrac%7Bx%5E%7Bn%7D%7D%7Bn%21%7D%2B%5Ccdots)

考虑幂级数的除法

![\\begin{alignat}{0} \\frac{x}{e^{x}-1}
=\\cfrac{x}{\\sum_{n=1}^{\\infty}{\\cfrac{x^{n}}{n!}}}
=\\cfrac{x}{x+\\cfrac{x^{2}}{2!}+\\cdots+\\cfrac{x^{n}}{n!}+\\cdots}\\\\
=\\cfrac{1}{1+\\cfrac{x}{2!}+\\cdots+\\cfrac{x^{n-1}}{n!}+\\cdots}
=\\cfrac{1}{\\sum_{n=1}^{\\infty}{\\cfrac{x^{n-1}}{n!}}}
\\end{alignat}](https://www.zhihu.com/equation?tex=%5Cbegin%7Balignat%7D%7B0%7D+%5Cfrac%7Bx%7D%7Be%5E%7Bx%7D-1%7D+%3D%5Ccfrac%7Bx%7D%7B%5Csum_%7Bn%3D1%7D%5E%7B%5Cinfty%7D%7B%5Ccfrac%7Bx%5E%7Bn%7D%7D%7Bn%21%7D%7D%7D+%3D%5Ccfrac%7Bx%7D%7Bx%2B%5Ccfrac%7Bx%5E%7B2%7D%7D%7B2%21%7D%2B%5Ccdots%2B%5Ccfrac%7Bx%5E%7Bn%7D%7D%7Bn%21%7D%2B%5Ccdots%7D%5C%5C+%3D%5Ccfrac%7B1%7D%7B1%2B%5Ccfrac%7Bx%7D%7B2%21%7D%2B%5Ccdots%2B%5Ccfrac%7Bx%5E%7Bn-1%7D%7D%7Bn%21%7D%2B%5Ccdots%7D+%3D%5Ccfrac%7B1%7D%7B%5Csum_%7Bn%3D1%7D%5E%7B%5Cinfty%7D%7B%5Ccfrac%7Bx%5E%7Bn-1%7D%7D%7Bn%21%7D%7D%7D+%5Cend%7Balignat%7D)

  

对于足够小的 ![x](https://www.zhihu.com/equation?tex=x) ，这个商式可以表示为幂级数

![\\frac{x}{e^{x}-1}=1+\\sum_{n=1}^{\\infty}{\\frac{\\beta_{n}}{n!}x^{n}}](https://www.zhihu.com/equation?tex=%5Cfrac%7Bx%7D%7Be%5E%7Bx%7D-1%7D%3D1%2B%5Csum_%7Bn%3D1%7D%5E%7B%5Cinfty%7D%7B%5Cfrac%7B%5Cbeta_%7Bn%7D%7D%7Bn%21%7Dx%5E%7Bn%7D%7D)

不妨令 ![\\beta_{0}=1](https://www.zhihu.com/equation?tex=%5Cbeta_%7B0%7D%3D1)

那么有

![\\begin{alignat}{0} \\left\( \\sum_{n=0}^{\\infty}{\\frac{x^{n}}{n!}}
\\right\) \\left\( \\sum_{n=0}^{\\infty}{\\frac{\\beta_{n}}{n!}x^{n}}
\\right\)=\\\\ \\left\(
1+x+\\frac{x^{2}}{2!}+\\cdots+\\frac{x^{n}}{n!}+\\cdots \\right\) \\left\(
\\beta_{0}+\\beta_{1}x+\\frac{\\beta_{2}}{2!}x^{2}
+\\cdots+\\frac{\\beta_{n}}{n!}x^{n}+\\cdots \\right\)\\\\ =1
\\end{alignat}](https://www.zhihu.com/equation?tex=%5Cbegin%7Balignat%7D%7B0%7D+%5Cleft%28+%5Csum_%7Bn%3D0%7D%5E%7B%5Cinfty%7D%7B%5Cfrac%7Bx%5E%7Bn%7D%7D%7Bn%21%7D%7D+%5Cright%29+%5Cleft%28+%5Csum_%7Bn%3D0%7D%5E%7B%5Cinfty%7D%7B%5Cfrac%7B%5Cbeta_%7Bn%7D%7D%7Bn%21%7Dx%5E%7Bn%7D%7D+%5Cright%29%3D%5C%5C+%5Cleft%28+1%2Bx%2B%5Cfrac%7Bx%5E%7B2%7D%7D%7B2%21%7D%2B%5Ccdots%2B%5Cfrac%7Bx%5E%7Bn%7D%7D%7Bn%21%7D%2B%5Ccdots+%5Cright%29+%5Cleft%28+%5Cbeta_%7B0%7D%2B%5Cbeta_%7B1%7Dx%2B%5Cfrac%7B%5Cbeta_%7B2%7D%7D%7B2%21%7Dx%5E%7B2%7D+%2B%5Ccdots%2B%5Cfrac%7B%5Cbeta_%7Bn%7D%7D%7Bn%21%7Dx%5E%7Bn%7D%2B%5Ccdots+%5Cright%29%5C%5C+%3D1+%5Cend%7Balignat%7D)

  

比较 ![x^{n}](https://www.zhihu.com/equation?tex=x%5E%7Bn%7D) 的系数，有

![\\begin{alignat}{0} \\frac{1}{n!1!}\\beta_{n}+\\frac{1}{\\left\( n-1
\\right\)!2!}\\beta_{n-1}+\\cdots+\\frac{1}{\\left\( n-k+1
\\right\)!k!}\\beta_{n-k+1}\\\\
+\\cdots+\\frac{1}{1!n!}\\beta_{1}+\\frac{1}{\\left\( n+1 \\right\)!}=0
\\end{alignat}](https://www.zhihu.com/equation?tex=%5Cbegin%7Balignat%7D%7B0%7D+%5Cfrac%7B1%7D%7Bn%211%21%7D%5Cbeta_%7Bn%7D%2B%5Cfrac%7B1%7D%7B%5Cleft%28+n-1+%5Cright%29%212%21%7D%5Cbeta_%7Bn-1%7D%2B%5Ccdots%2B%5Cfrac%7B1%7D%7B%5Cleft%28+n-k%2B1+%5Cright%29%21k%21%7D%5Cbeta_%7Bn-k%2B1%7D%5C%5C+%2B%5Ccdots%2B%5Cfrac%7B1%7D%7B1%21n%21%7D%5Cbeta_%7B1%7D%2B%5Cfrac%7B1%7D%7B%5Cleft%28+n%2B1+%5Cright%29%21%7D%3D0+%5Cend%7Balignat%7D)

  

两边同时乘以 ![\\left\( n+1
\\right\)!](https://www.zhihu.com/equation?tex=%5Cleft%28+n%2B1+%5Cright%29%21)
，有

![{n+1 \\choose 1}\\beta_{n}+{n+1 \\choose 2}\\beta_{n-1}+\\cdots+ {n+1
\\choose k}\\beta_{n-k+1}+\\cdots+{n+1 \\choose n}\\beta_{1}
+\\beta_{0}=0](https://www.zhihu.com/equation?tex=%7Bn%2B1+%5Cchoose+1%7D%5Cbeta_%7Bn%7D%2B%7Bn%2B1+%5Cchoose+2%7D%5Cbeta_%7Bn-1%7D%2B%5Ccdots%2B+%7Bn%2B1+%5Cchoose+k%7D%5Cbeta_%7Bn-k%2B1%7D%2B%5Ccdots%2B%7Bn%2B1+%5Cchoose+n%7D%5Cbeta_%7B1%7D+%2B%5Cbeta_%7B0%7D%3D0)

![\\sum_{i=0}^{n}{{n+1 \\choose
i}\\beta_{i}}=0](https://www.zhihu.com/equation?tex=%5Csum_%7Bi%3D0%7D%5E%7Bn%7D%7B%7Bn%2B1+%5Cchoose+i%7D%5Cbeta_%7Bi%7D%7D%3D0)
， ![\\beta_{0}=1](https://www.zhihu.com/equation?tex=%5Cbeta_%7B0%7D%3D1)

很明显，这就是Bernoulli数

所以

![\\frac{x}{e^{x}-1}=\\sum_{n=0}^{\\infty}{\\frac{\\beta_{n}}{n!}x^{n}}
=\\beta_{0}+\\beta_{1}x+\\frac{\\beta_{2}}{2!}x^{2}
+\\cdots+\\frac{\\beta_{n}}{n!}x^{n}+\\cdots](https://www.zhihu.com/equation?tex=%5Cfrac%7Bx%7D%7Be%5E%7Bx%7D-1%7D%3D%5Csum_%7Bn%3D0%7D%5E%7B%5Cinfty%7D%7B%5Cfrac%7B%5Cbeta_%7Bn%7D%7D%7Bn%21%7Dx%5E%7Bn%7D%7D+%3D%5Cbeta_%7B0%7D%2B%5Cbeta_%7B1%7Dx%2B%5Cfrac%7B%5Cbeta_%7B2%7D%7D%7B2%21%7Dx%5E%7B2%7D+%2B%5Ccdots%2B%5Cfrac%7B%5Cbeta_%7Bn%7D%7D%7Bn%21%7Dx%5E%7Bn%7D%2B%5Ccdots)

其中数列 ![\\left\\{ \\beta_{n}
\\right\\}](https://www.zhihu.com/equation?tex=%5Cleft%5C%7B+%5Cbeta_%7Bn%7D+%5Cright%5C%7D)
是Bernoulli数，
![\\beta_{0}=1,\\beta_{1}=-\\frac{1}{2},\\cdots](https://www.zhihu.com/equation?tex=%5Cbeta_%7B0%7D%3D1%2C%5Cbeta_%7B1%7D%3D-%5Cfrac%7B1%7D%7B2%7D%2C%5Ccdots)

  

注意到

![\\frac{x}{e^{x}-1}+\\frac{x}{2} =\\frac{x}{2}\\cdot\\frac{e^{x}+1}{e^{x}-1}
=\\frac{x}{2}\\cdot\\frac{e^{x/2}+e^{-x/2}}{e^{x/2}-e^{-x/2}}
=\\frac{x}{2}\\coth\\frac{x}{2}](https://www.zhihu.com/equation?tex=%5Cfrac%7Bx%7D%7Be%5E%7Bx%7D-1%7D%2B%5Cfrac%7Bx%7D%7B2%7D+%3D%5Cfrac%7Bx%7D%7B2%7D%5Ccdot%5Cfrac%7Be%5E%7Bx%7D%2B1%7D%7Be%5E%7Bx%7D-1%7D+%3D%5Cfrac%7Bx%7D%7B2%7D%5Ccdot%5Cfrac%7Be%5E%7Bx%2F2%7D%2Be%5E%7B-x%2F2%7D%7D%7Be%5E%7Bx%2F2%7D-e%5E%7B-x%2F2%7D%7D+%3D%5Cfrac%7Bx%7D%7B2%7D%5Ccoth%5Cfrac%7Bx%7D%7B2%7D)

  

![\\frac{x}{2}\\coth\\frac{x}{2}
=1+\\sum_{n=2}^{\\infty}{\\frac{\\beta_{n}}{n!}x^{n}}](https://www.zhihu.com/equation?tex=%5Cfrac%7Bx%7D%7B2%7D%5Ccoth%5Cfrac%7Bx%7D%7B2%7D+%3D1%2B%5Csum_%7Bn%3D2%7D%5E%7B%5Cinfty%7D%7B%5Cfrac%7B%5Cbeta_%7Bn%7D%7D%7Bn%21%7Dx%5E%7Bn%7D%7D)

令 ![\\beta_{2n}=\\left\( -1
\\right\)^{n-1}B_{n}](https://www.zhihu.com/equation?tex=%5Cbeta_%7B2n%7D%3D%5Cleft%28+-1+%5Cright%29%5E%7Bn-1%7DB_%7Bn%7D)
（
![n\\in\\mathbb{N}^{*}](https://www.zhihu.com/equation?tex=n%5Cin%5Cmathbb%7BN%7D%5E%7B%2A%7D)
）

则

![\\frac{x}{2}\\coth\\frac{x}{2} =1+\\sum_{n=1}^{\\infty} {\\frac{\\left\( -1
\\right\)^{n-1}B_{n}}{\\left\( 2n
\\right\)!}x^{2n}}](https://www.zhihu.com/equation?tex=%5Cfrac%7Bx%7D%7B2%7D%5Ccoth%5Cfrac%7Bx%7D%7B2%7D+%3D1%2B%5Csum_%7Bn%3D1%7D%5E%7B%5Cinfty%7D+%7B%5Cfrac%7B%5Cleft%28+-1+%5Cright%29%5E%7Bn-1%7DB_%7Bn%7D%7D%7B%5Cleft%28+2n+%5Cright%29%21%7Dx%5E%7B2n%7D%7D)

用 ![2x](https://www.zhihu.com/equation?tex=2x) 取代
![x](https://www.zhihu.com/equation?tex=x) ，可得

![x\\coth x =1+\\sum_{n=1}^{\\infty} {\\frac{\\left\( -1
\\right\)^{n-1}2^{2n}B_{n}}{\\left\( 2n
\\right\)!}x^{2n}}](https://www.zhihu.com/equation?tex=x%5Ccoth+x+%3D1%2B%5Csum_%7Bn%3D1%7D%5E%7B%5Cinfty%7D+%7B%5Cfrac%7B%5Cleft%28+-1+%5Cright%29%5E%7Bn-1%7D2%5E%7B2n%7DB_%7Bn%7D%7D%7B%5Cleft%28+2n+%5Cright%29%21%7Dx%5E%7B2n%7D%7D)

  

注意到 ![x\\cot x=ix\\coth
ix](https://www.zhihu.com/equation?tex=x%5Ccot+x%3Dix%5Ccoth+ix)

那么显然

![x\\cot x=1-\\sum_{n=1}^{\\infty} {\\frac{2^{2n}B_{n}}{\\left\( 2n
\\right\)!}x^{2n}}](https://www.zhihu.com/equation?tex=x%5Ccot+x%3D1-%5Csum_%7Bn%3D1%7D%5E%7B%5Cinfty%7D+%7B%5Cfrac%7B2%5E%7B2n%7DB_%7Bn%7D%7D%7B%5Cleft%28+2n+%5Cright%29%21%7Dx%5E%7B2n%7D%7D)

![\\cot x=\\frac{1}{x}-\\sum_{n=1}^{\\infty} {\\frac{2^{2n}B_{n}}{\\left\( 2n
\\right\)!}x^{2n-1}}](https://www.zhihu.com/equation?tex=%5Ccot+x%3D%5Cfrac%7B1%7D%7Bx%7D-%5Csum_%7Bn%3D1%7D%5E%7B%5Cinfty%7D+%7B%5Cfrac%7B2%5E%7B2n%7DB_%7Bn%7D%7D%7B%5Cleft%28+2n+%5Cright%29%21%7Dx%5E%7B2n-1%7D%7D)

  

由于 ![\\tan x=\\cot x-2\\cot
2x](https://www.zhihu.com/equation?tex=%5Ctan+x%3D%5Ccot+x-2%5Ccot+2x)

所以

![\\tan x=\\sum_{n=1}^{\\infty} {\\frac{\\left\( 2^{2n}-1
\\right\)2^{2n}B_{n}}{\\left\( 2n
\\right\)!}x^{2n-1}}](https://www.zhihu.com/equation?tex=%5Ctan+x%3D%5Csum_%7Bn%3D1%7D%5E%7B%5Cinfty%7D+%7B%5Cfrac%7B%5Cleft%28+2%5E%7B2n%7D-1+%5Cright%292%5E%7B2n%7DB_%7Bn%7D%7D%7B%5Cleft%28+2n+%5Cright%29%21%7Dx%5E%7B2n-1%7D%7D)

其中数列 ![\\left\\{ B_{n}
\\right\\}](https://www.zhihu.com/equation?tex=%5Cleft%5C%7B+B_%7Bn%7D+%5Cright%5C%7D)
（
![n\\in\\mathbb{N}^{*}](https://www.zhihu.com/equation?tex=n%5Cin%5Cmathbb%7BN%7D%5E%7B%2A%7D)
）满足：

![B_{1}=\\frac{1}{6},B_{2}=\\frac{1}{30},B_{3}=\\frac{1}{42},B_{4}=\\frac{1}{30},
\\cdots](https://www.zhihu.com/equation?tex=B_%7B1%7D%3D%5Cfrac%7B1%7D%7B6%7D%2CB_%7B2%7D%3D%5Cfrac%7B1%7D%7B30%7D%2CB_%7B3%7D%3D%5Cfrac%7B1%7D%7B42%7D%2CB_%7B4%7D%3D%5Cfrac%7B1%7D%7B30%7D%2C+%5Ccdots)

（有的时候这个 ![\\left\\{ B_{n}
\\right\\}](https://www.zhihu.com/equation?tex=%5Cleft%5C%7B+B_%7Bn%7D+%5Cright%5C%7D)
也被称作Bernoulli数）