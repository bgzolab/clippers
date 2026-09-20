---
comments: true
created: '2016-12-04T20:22:35'
draft: true
modified: '2016-12-31T11:41:28'
source: https://www.zhihu.com/question/52227656/answer/134307058
title: Atom, Vim, Visual Studio Code, Emacs 哪个好？
type: archive-web
---

回答题主的疑问，现在还有必要用UNIX和Emacs吗？

UNIX作为上世纪70年代开发的里程碑式操作系统，可以说是挑起了当时计算机科学圈的大梁。大量的科学家、黑客在它上面发明了无数有深远影响的技术、工具、语言，
比如C语言、emacs、vim。

虽然现在较少有人使用原生UNIX， 但从它衍生出来的类UNIX系统可谓桃李满天下， 比如Linux,、FreeBSD、
Darwin等。其中，使用Linux作为内核的Android和使用Darwin作为内核的iOS更是使它活生生地存在于每个人的手机里。与此同时，由于被各大互联网公司应用于服务器操作系统，Linux也通过网络与每个人的生活紧密结合在了一起。此外，还有嵌入式领域、科学计算领域，Linux都占据着相当大的份额，不再列举。

可以看到，UNIX在当今社会已经形成了一个巨大复杂的生态系统。类UNIX系统不仅不过时，还在世界中扮演着越来越重要的角色。

再单纯从学习C语言、学习编程的角度说。C语言当初就是为了方便开发UNIX系统而发明的，所以C语言的很多特性、很多标准库函数都有UNIX的影子，比如命令行参数、输入输出重定向等等。所以在类UNIX系统中学习和使用C语言是最自然、最舒服的。

综合以上两点，大学的计算机系课程选择UNIX作为教学系统是自然而然的选择，是必要的、绝不过时的。

再说Emacs。Emacs作为一个几乎与UNIX同样久远的工具，其出生之时就是一个让当时的黑客们在终端上提高编辑效率的工具，这一点与Vim是一样的。到了现在图形化的时代，各种IDE花哨易用的界面的确让Emacs显得有点过时，但回到编辑文本这一目的上来，至今Emacs和Vim仍是最高效的编辑工具。而且Emacs作为“伪装成编辑器的操作系统”具有极其强大的扩展能力，一旦你习惯了它，用它干了各种事情，就再也不想离开它了。

==========================================================================

答主目前研一，现在几乎只用Linux了，遇到实在要用Windows的情况就开一个WindowsXP的虚拟机:-)

双11买了一本很早就想买的古老的《UNIX编程环境》，因为觉得UNIX深入了解起来挺有趣的。有关LInux的发明故事可以读林纳斯的自传《Just for
fun》。

![](https://picx.zhimg.com/50/v2-dd824a56aed240858b57e221d494de7c_720w.jpg?source=2c26e567)  

再附上Emacs的使用截图～这是PHP+HTML

![](https://picx.zhimg.com/50/v2-0dbe3ddd34e71e80847d2355f1ddd8f5_720w.jpg?source=2c26e567)

这是C

![](https://picx.zhimg.com/50/v2-ce92bb62414e67d3d718dd53fc4fa7a1_720w.jpg?source=2c26e567)

这是在emacs里用gdb调试C

![](https://picx.zhimg.com/50/v2-14b81e83bdf0b9bdaf2341f04099ba2e_720w.jpg?source=2c26e567)

这是用emacs开Octave（可以看成MATLAB的开源克隆）

![](https://pic1.zhimg.com/50/v2-dec5b757dd85c2227b9cb8c6fb4d4c8d_720w.jpg?source=2c26e567)

这是用emacs的org-mode记课堂笔记，转成LaTeX、html、PDF随心所欲

![](https://pica.zhimg.com/50/v2-4a5fe5261a87a8082f9b9ba6306c7a74_720w.jpg?source=2c26e567)

这是用org-mode记笔记后转成的PDF

![](https://picx.zhimg.com/50/v2-e90fd8b91a31a77c397dc97aad5dbbc3_720w.jpg?source=2c26e567)

这是用org-mode做计划、记账

![](https://picx.zhimg.com/50/v2-77ee43b685a04c72e0f814c4e5687d59_720w.jpg?source=2c26e567)

至于用emacs看网页听歌煮咖啡这种花哨的玩法我就不提了哈哈，应该没有编辑器能做到emacs这种程度吧？题主自行选择，喜欢就好。

[Table of
Contents](https://link.zhihu.com/?target=http%3A//tuhdo.github.io/index.html)

附上当初学习emacs的教程，完全面向初学者，是英文的，但很详细易懂。