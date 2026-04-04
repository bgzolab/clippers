---
---

## 2025-08-14 15:25:34
![](assets/QC_Grove/20250815_175230_545722.jpg) 

因为现代 CPU 都是超标量的，有多个功能单元（比如两个算术逻辑单元 &#43; 一个浮点运算单元 &#43; 别的），可以一次性发射多条指令到不同的功能单元一起计算，因此一个 cycle 内实际上可以执行多条指令，称之为 instruction-level parallelism（ILP）。当然高并行的前提是有足够的功能单元以及指令之间没有依赖。有关内容可以阅读一下[《现代处理器结构》](https://blog.eastonman.com/blog/2021/05/modern-processor/)。

我还在用 zen2 没有 TMA 可用。但对于这个场景有非常适合的工具：uiCA 和 llvm-mca。

举个例子，这里的无脑算法我们在 godbolt.org 用 gcc15.2 &#43; O3 的到循环体部分的汇编如下：


.L3:
        movsd   xmm2, QWORD PTR [rax]
        add     rax, 8
        mulsd   xmm2, xmm0
        mulsd   xmm0, xmm3
        addsd   xmm1, xmm2
        cmp     rdx, rax
        jne     .L3


把这串代码丢到 uiCA 模拟，可以得到结果是 4 cycles per iteration。而霍纳算法是 8 cycles per iteration。但是为什么呢？

在 HTML output 里面打开 Trace Table，里面有流水线的可视化模拟，包括指令使用了哪个端口、在第几个周期发射（I）、调度（D）、执行（E）、退役（R）等等。如果调度等了很久，那可能是端口不太够；如果退役等了很久，那可能是指令之间有依赖。在霍纳算法的图里，我们可以看到超长的 E-&gt;R 距离，所以降低 IPC 的主因就是指令间依赖了。更多有关 Trace Table 的信息，可以看[《Visualizing Performance-Critical Dependency Chains》](https://easyperf.net/blog/2022/05/11/Visualizing-Performance-Critical-Dependency-Chains)。

https://t.me/QC_Grove/968

Published on 2025-08-14 15:25:34. Saved on 2025-08-15 17:52:31
