---
aliases:
  - C++ 中的各种进制转换函数汇总及学习
  - ~C++ 中的各种进制转换函数汇总及学习 -zwjjj- 博客园
created: 2019-10-24T00:03:51
modified: 2025-08-30T22:47:27
source: https://www.cnblogs.com/zwjjj/p/9953718.html
title: C++ 中的各种进制转换函数汇总及学习
type: archive-web
---
# C++ 中的各种进制转换函数汇总及学习

一.指定格式输出

1.C 中指定格式输出

```shell
printf("%05o\n",35);    //按八进制格式输出，保留5位高位补零
printf("%03d\n",35);    //按十进制格式输出，保留3位高位补零
printf("%05x\n",35);    //按十六进制格式输出，保留5位高位补零
```

2.C++ 中指定格式输出

```shell
#include <bitset>  
#include<iostream>
using namespace std;  
int main()  
{  
    cout << "35的8进制:" << std::oct << 35<< endl;  
    cout << "35的10进制" << std::dec << 35 << endl;  
    cout << "35的16进制:" << std::hex << 35 << endl;  
    cout << "35的2进制: " << bitset<8>(35) << endl;      //<8>：表示保留8位输出
    return 0;  
}
```

二.C/C++ 各种进制转换库函数

1.任意 2~36 进制数转化为 10 进制

自己实现函数

```shell
int Atoint(string s,int radix)    //s是给定的radix进制字符串
{
    int ans=0;
    for(int i=0;i<s.size();i++)
    {
        char t=s[i];
        if(t>='0'&&t<='9') ans=ans*radix+t-'0';
        else ans=ans*radix+t-'a'+10;
    }
        return ans;
}
```

strol() 函数：

函数原型：long int strtol(const char \*nptr, char \*\*endptr, int base)

格式：base 是要转化的数的进制，非法字符会赋值给 endptr，nptr 是要转化的字符，

例如：

```shell
#include<stdio.h>
int main()  
{  
    char a[20]="10549stend#12";  
    char *stop;  
    int ans=strtol(a, &stop, 8);   //将八进制数1054转成十进制，后面均为非法字符
    printf("%d\n",ans);  
    printf("%s\n", stop);   
    return 0;
}
//输出556
```

\* 注意：

1）如果 base 为 0，且字符串不是以 0x(或者 0X) 开头，则按十进制进行转化。

2）如果 base 为 0 或者 16，并且字符串以 0x（或者 0X）开头，那么，x（或者 X）被忽略，字符串按 16 进制转化。

3）如果 base 不等于 0 和 16，并且字符串以 0x(或者 0X) 开头，那么 x 被视为非法字符。

4）对于 nptr 指向的字符串，其开头和结尾处的空格被忽视，字符串中间的空格被视为非法字符 。

2.将 10 进制数转换为任意的 n 进制数，结果为 char 型。

自己实现函数

```shell
string intToA(int n,int radix)    //n是待转数字，radix是指定的进制
{
    string ans="";
    do{
        int t=n%radix;
        if(t>=0&&t<=9)    ans+=t+'0';
        else ans+=t-10+'a';
        n/=radix;
    }while(n!=0);    //使用do{}while（）以防止输入为0的情况
    reverse(ans.begin(),ans.end());
    return ans;    
}
```

1）itoa（）函数（可以将一个 10 进制数转换为任意的 2-36 进制字符串）:

函数原型：char\*itoa(int value,char\*string,int radix);

格式：itoa(num, str, 2); num 是一个 int 型的，是要转化的 10 进制数，str 是转化结果，后面的值为目标进制。

```shell
#include<stdio.h> 
#include<stdlib.h> 
int main()  
{  
    int num = 10;  
    char str[100];  
    _itoa(num, str, 2);  //c++中一般用_itoa，用itoa也行,
    printf("%s\n", str);  
    return 0;  
}
```

2） **sprintf()** 函数（可以将一个 10 进制数转换为指定格式的 n 进制字符串）

函数原型：int sprintf( char \*buffer, const char \*format, \[ argument\] … )

```shell
#include<stdio.h>  
int main()  
{  
    char s[100]={0};
    sprintf(s, "%d", 123); //十进制输出产生"123"
    sprintf(s, "%4d%4d", 123, 4567); //指定宽度不足的左边补空格，产生：" 1234567"
    sprintf(s, "%8o", 123);    //八进制输出，宽度占8个位置
    sprintf(s, "%8x", 4567); //小写16 进制，宽度占8 个位置，右对齐
    sprintf(s, "%10.3f", 3.1415626); //产生：" 3.142"
    int i = 100;
    sprintf(s, "%.2f", i);    //注意这是不对的
    sprintf(s, "%.2f", (double)i);    //要按照这种方式才行
    return 0;  
}
```

三.使用字符串流 string，stream

1）8,16->10

```shell
#include<iostream>
#include<string>
#include<sstream>
using namespace std;
int main(void)
{
    string s="20";
    int a;
    stringstream ss;
    ss<<hex<<s;    //以16进制读入流中
    ss>>a;        //10进制int型输出
    cout<<a<<endl;
        return 0;
}
//输出：32
```

2)10->8,16

```shell
#include<cstdio>
#include<iostream>
#include<string>
#include<sstream>
using namespace std;
int main(void)
{
    string s1,s2;
    int a=30;
    stringstream ss;
    ss<<oct<<a;        //10进制转成八进制读入流中，再以字符串输出
    ss>>s1;            
    cout<<s1<<endl;        //输出：36
    ss.clear();        //不清空可能会出错。
    ss<<hex<<a;         //10进制转成十六进制读入流中，，再以字符串输出
    ss>>s2;            
    cout<<s2<<endl;        //输出：1e
    return 0;
}
```

posted @ [zwjjj](https://www.cnblogs.com/zwjjj)   阅读 (33763)  评论 (1) [收藏](https://www.cnblogs.com/zwjjj/p/) [举报](https://www.cnblogs.com/zwjjj/p/)

\[Ctrl+Enter 快捷键提交\]

[![](https://img2024.cnblogs.com/blog/35695/202508/35695-20250830121216742-1062949948.jpg)](https://developer.huawei.com/consumer/cn/activity/digixActivity/digixcmsdetail/101750143863263087?ha_source=BKYQ3&ha_sourceId=89000408)

**编辑推荐：**
· [Redis 缓存一致性：从“数据不一致”根源到解决方案全梳理](https://www.cnblogs.com/ryanzheng/p/19060580)
· [优雅求模，一致性哈希算法](https://www.cnblogs.com/lmy5215006/p/18993854)
· [解疑释惑 - 日志体系之 slf4j + logback 组合（一）](https://www.cnblogs.com/imadc/p/19056003)
· [平滑加权轮询负载均衡的底层逻辑](https://www.cnblogs.com/thisiswhy/p/19057693)
· [C# 13 与.NET 9 跨平台开发实战 - 第一章](https://www.cnblogs.com/jackyfei/p/19046660)

**阅读排行：**
· [一个.NET 开源、功能强大的在线文档编辑器，类似于 Microsoft Word，支持信创！](https://www.cnblogs.com/Can-daydayup/p/19063391)
· [独立开发一期收尾，有点傻眼了！](https://www.cnblogs.com/cicada-smile/p/19063834)
· [Claude Code 官方内部团队最佳实践！](https://www.cnblogs.com/leadingcode/p/19064358)
· [使用c#强大的SourceGenerator现对象的深克隆](https://www.cnblogs.com/gmmy/p/19064599)
· [面试被问：OOM类型有哪些？怎么答？](https://www.cnblogs.com/chengxy-nds/p/19064067)

<table><tbody><tr><td colspan="7"><table><tbody><tr><td><a href="https://www.cnblogs.com/zwjjj/p/">&lt;</a></td><td align="center">2025年8月</td><td align="right"><a href="https://www.cnblogs.com/zwjjj/p/">&gt;</a></td></tr></tbody></table></td></tr><tr><th align="center">日</th><th align="center">一</th><th align="center">二</th><th align="center">三</th><th align="center">四</th><th align="center">五</th><th align="center">六</th></tr><tr><td align="center">27</td><td align="center">28</td><td align="center">29</td><td align="center">30</td><td align="center">31</td><td align="center">1</td><td align="center">2</td></tr><tr><td align="center">3</td><td align="center">4</td><td align="center">5</td><td align="center">6</td><td align="center">7</td><td align="center">8</td><td align="center">9</td></tr><tr><td align="center">10</td><td align="center">11</td><td align="center">12</td><td align="center">13</td><td align="center">14</td><td align="center">15</td><td align="center">16</td></tr><tr><td align="center">17</td><td align="center">18</td><td align="center">19</td><td align="center">20</td><td align="center">21</td><td align="center">22</td><td align="center">23</td></tr><tr><td align="center">24</td><td align="center">25</td><td align="center">26</td><td align="center">27</td><td align="center">28</td><td align="center">29</td><td align="center">30</td></tr><tr><td align="center">31</td><td align="center">1</td><td align="center">2</td><td align="center">3</td><td align="center">4</td><td align="center">5</td><td align="center">6</td></tr></tbody></table>

## 阅读排行榜

- [1\. C++中的各种进制转换函数汇总及学习(33763)](https://www.cnblogs.com/zwjjj/p/9953718.html)
- [2\. putchar()和getchar()使用解析(27380)](https://www.cnblogs.com/zwjjj/p/9953888.html)
- [3\. 求n！（高精度问题）(431)](https://www.cnblogs.com/zwjjj/p/9953496.html)
- [4\. 单调队列(337)](https://www.cnblogs.com/zwjjj/p/10462513.html)
- [5\. 2020软件工程最后一次作业(279)](https://www.cnblogs.com/zwjjj/p/13394739.html)
