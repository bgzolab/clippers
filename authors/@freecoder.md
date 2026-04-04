---
---
description: 作者一聽就是個大佬，真希望知道他現在過得怎麽樣？作者一定很久都沒有上來看看了，真希望能看到他的境況；via：[FreeCoder - YouTube](https://www.youtube.com/channel/UC8OGDmnyMgYOPgpnFJYUiGg)

- <iframe src="https://www.youtube.com/embed/ZFiYxdWKft8" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
<center>via: <a href='https://www.youtube.com/watch?v=ZFiYxdWKft8' target='_blank' class='external-link'>https://www.youtube.com/watch?v=ZFiYxdWKft8</a></center>
  #jvm/memory
  - 5 个区域
    - 栈
    - 堆
    - 本地方法栈（Native）
    - 程序计数器
    - 永久代，源数据空间，存储静态方法，常量，方法
  - 其中，134 是线程私有；
- <iframe src="https://www.youtube.com/embed/A20a0__mXvQ" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
<center>via: <a href='https://www.youtube.com/watch?v=A20a0__mXvQ' target='_blank' class='external-link'>https://www.youtube.com/watch?v=A20a0__mXvQ</a></center>
  #garbage_collection
  - {{youtube-timestamp 44}} GC 判断的标准 GC Root
    - 栈引用；
    - 本地方法 (Native) 栈 直接/间接 引用；
    - 方法区 Static 变量/常量 直接/间接 引用；
  - {{youtube-timestamp 120}} 清理堆区的思路
    - 标记——清理算法
      description: 对准备清理的对象打上标记，然后清理；
      - 产生内存碎片
    - 标记——整理算法
      description: 为了解决1的局限，删除之后，全部前移；
      - 代价巨大
    - 复制算法
      description: 开辟两片堆区，删除的时候，从1复制到2，全部清理1；
      - 需要两倍的内存空间
  - {{youtube-timestamp 260}} 实际 GC 的算法
    - description: 堆区划分为年轻代 (Young) 和老年代 (old)，年轻代再次划分为 Survivor Space(S0,S1), Eden Space, Eden Space, Tenured Generation, Permanent Generation
      - Eden：出生区（伊甸园）；将满的时候出发 Young GC
        - 采用复制算法，复制到 S0
        - Eden 和 Survivor 比例：$8:1:1$
        - S1 的存在是为了和 E区 交替使用
          - E + S1 => S0
          - E + S0 => S1
      - Old:
        - 每一次 GC，对象的年龄都会 +1，到了6岁的时候就会放在老年期
        - 大的对象，在复制的时候占用资源比较多；
        - Old GC 用时会伴随着 Young GC，也叫 Full GC，这个时候整个程序就会暂停（Stop the world）
    - ![[javamadesoeasy_com_what-are-young-old-tenured.png]]
      #jvm/memory
      via: [JavaMadeSoEasy.com (JMSE): What are Young, Old (tenured) and Permanent Generation in JVM in java](https://www.javamadesoeasy.com/2016/10/what-are-young-old-tenured-and.html)
  - {{youtube-timestamp 540}} 著名的垃圾回收器
    - ParNew 年轻代
    - CMS 老年代
    - G1 垃圾收集器（New 最新使用）
-
