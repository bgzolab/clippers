---
aliases:
  - c++ 中函数参数的求值顺序
  - ~c++ 中函数参数的求值顺序 -Leon-Yan- 博客园
created: 2025-07-13T13:28:17
modified: 2025-08-30T22:47:28
source: https://www.cnblogs.com/Leon-Yan/p/7567766.html
title: c++ 中函数参数的求值顺序
type: archive-web
---

# c++ 中函数参数的求值顺序

[![](https://img2024.cnblogs.com/blog/35695/202508/35695-20250830122018806-1574270965.jpg)](https://developer.huawei.com/consumer/cn/activity/digixActivity/digixcmsdetail/101750143863263087?ha_source=BKYQ3&ha_sourceId=89000408)

c++ 中如果函数的参数列表包含多个实参，那么对参数的求值顺序是不确定的。

在谭浩强的《C++ 程序设计》（第二版）P94 中提到， GCC 对参数求值是按从右到左的顺序求值的 。 但我实测并非如此。

```csharp
#include <iostream>
#include <iomanip>
using namespace std;

void test(int x, int y) {
    cout << 'x' << x << " y" << y << endl;
}

int main() {

    int i = 3;
    test(i, i++);
    i = 3;
    test(i, ++i);
    i = 3;
    test(i++, i);
    i = 3;
    test(++i, i);

    return 0;
}
```

这段程序的输出为：

```csharp
x4 y3
x4 y4
x3 y4
x4 y4
```

　　由此可见，哪怕是对于同一编译器， 参数的求值顺序也是不确定的 。

在实际使用中，要尽量 避免一个语句中包含多个表达式 的情况，或者 保证多个表达式之间不存在互相影响结果的情况 。
