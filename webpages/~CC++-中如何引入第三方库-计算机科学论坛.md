---
title: C/C++ 中如何引入第三方库
aliases:
  - C/C++ 中如何引入第三方库
created: 2026-04-11T23:49:37
modified: 2026-04-11T23:49:56
description: "当我们在编写 C/C++ 程序的时候如何引入第三方的代码或者库呢？相信你跟我有类似的疑问，带着这个疑问我们一道去探究一下。经过编写测试代码和查阅网上的文章，我大概总结了下面这几种方式： 一、直接引入他人的源文..."
source: "https://learnku.com/articles/67364"
tags:
  - "archive-web"
---

# C/C++ 中如何引入第三方库

当我们在编写 C/C++ 程序的时候如何引入第三方的代码或者库呢？相信你跟我有类似的疑问，带着这个疑问我们一道去探究一下。经过编写测试代码和查阅网上的文章，我大概总结了下面这几种方式：

- 一、直接引入他人的源文件
- 二、分别引入头文件和源文件
- 三、引入头文件和静态库（打包好的二进制目标文件）
- 四、引入头文件和动态链接库（下文会具体解释什么是动态链接库）
- 五、在代码中通过 `shell` 调用他人的可执行命令程序

下面我们详细看一下流程是怎样的。

## 一、直接引入源文件

首先先新建一个项目文件夹 `import-project` 用来存放我们的代码。创建 `main.c` 文件，这里面是我们自己写的代码。然后在 `import-project` 目录下再创建一个子文件夹 `thirdparty` ，这个文件夹是用来存放我们需要引入的第三方的代码，目录结构大致如下：

```bash
~/import-project/
  ├─ thirdparty/
  │  └─ sum.c
  └─ main.c
```

大致思路是： `main.c` 中要调用一个外部函数 `sum()` 来实现两个数相加，而这个 `sum()` 是一个第三方的函数，需要引入才能使用，下面是这两个文件的代码：

```cpp
// main.c 文件
#include <stdio.h>
#include "thirdparty/sum.c"
int main()
{
    int a = 1;
    int b = 2;
    printf("%d + %d = %d\n", a, b, sum(a, b));
    return 0;
}

// thirdparty/sum.c 文件
int sum(int a, int b)
{
    return a + b;
}
```

在命令行中使用 `gcc` 编译我们的项目，然后执行生成的可执行程序。

```bash
~/import-project$ gcc main.c -o main
~/import-project$ ./main
1 + 2 = 3
```

可见我们成功引入了他人的代码，并编译出了可执行程序。这种引入方式还是比较常见的，Github 上有很多小工具库都可以用类似的方式引入，通常它们只是一些.h、.hpp、.cpp、.cc 的单文件。下载下来直接 include 即可，如： [Github：nlohmann/json](https://github.com/nlohmann/json) 。

## 二、分别引入头文件和源文件

当然绝大部分的 C/C++ 库是把头文件和源文件分开了的，这样分开主要有以下两个好处：

1. 作为接口：当源文件编译为不可读的二进制文件时，其他开发者依然可以通过头文件去了解此二进制包含哪些函数和功能可供调用。
2. 拆分编译：在大型项目中，源文件特别多，任意一个文件做了小小的修改，都需要全部重新编译生成可执行文件，这个过程是很耗时间的。于是开发者想到了拆分编译，只需单独编译修改过的源文件，再把上一次已经编译好的其他文件链接起来，就构成了最终的可执行程序。但 C 语言中变量和函数的使用必须先有定义，要想单独编译一个源文件，就必须先把它里边要用的外部变量和函数先声明好，这便是引入头文件的作用。

了解完头文件，我们再来看看这种头文件和源文件分开的第三方代码如何引入。代码还是我们之前的代码，不过我们要新增加一个 `sum.h` 头文件，再做一点小小的修改。

```cpp
// main.c 文件
#include <stdio.h>
#include "thirdparty/sum.h"
int main()
{
    int a = 1;
    int b = 2;
    printf("%d + %d = %d\n", a, b, sum(a, b));
    return 0;
}

// thirdparty/sum.h 文件
int sum(int a, int b);

// thirdparty/sum.c 文件
int sum(int a, int b)
{
    return a + b;
}
```

在命令行中我们使用 gcc 编译我们的项目，然后执行生成的可执行程序。

```bash
~/import-project$ gcc main.c ./thirdparty/sum.c -o main
~/import-project$ ./main
1 + 2 = 3
```

`main.c` 中调用的 `sum()` 函数我们通过 `#include "thirdparty/sum.h"` 引入了定义，因此编译不会出错。gcc 会分别编译 `main.c` 和 `sum.c` ，最后再把他们链接起来构成最终的 `main` 程序。

## 三、引入头文件和静态库

先说明一下什么是目标文件？

目标文件（Object，`.o` 结尾）是由源文件（`.c` 、`.cpp` ）编译但还未链接得到的二进制文件，目标文件此时已完成为了编译流程（预处理 -> 编译 -> 组装 -> 链接）中的前三步。

那什么又是静态库呢，怎样获得静态库呢？

静态库是由多个目标文件打包到一起得到的二进制文件，命名约定俗成以 `lib` 开头，中间是库名，然后是 `.a` 结尾，形如： `libNAME.a` 。（感谢酷友 [小瑾她爸](https://learnku.com/users/94475) 的提示）

这里我们把第二点中编译的流程拆成三步来完成，代码保持不变，我们只更改一下编译流程。

步骤 1：首先我们用 `gcc -c` 参数只编译 `sum.c` 为二进制目标文件。注意这里生成的 `sum.o` 二进制文件，不能在命令行中直接执行，是因为：

- `gcc -c` 只会编译出二进制，但并不会链接，因此生成的目标文件无法调用 C 的任何库。
- `sum.c` 文件中并没有 `main()` 函数，这是程序执行的入口，没有是无法启动执行的。

```bash
~/import-project$ gcc -c ./thirdparty/sum.c -o sum.o
```

步骤 2：接着我们把 `sum.o` 打包到静态库中，这里需要用到一个命令 `ar` （archive 的缩写），简单介绍一下参数：

- `-r` replace 如果静态库中目标文件已存在，则替换为最新的。
- `-c` 如果静态库不存在，在创建的时候不用弹出警告提示。

```bash
~/import-project$ ar -rc libsum.a sum.o
```

如果我们有多个目标文件可以依次放在后面，最终会被一并打包进 `libsum.a` 静态库中。查看静态库中目标文件列表可以用 `ar -t` 参数：

```bash
~/import-project$ ar -t libsum.a
sum.o
```

步骤 3：把 `main.c` 和 上一步输出的静态库 `libsum.a` 合在一起编译出最终的可执行程序。

```bash
~/import-project$ gcc main.c libsum.a -o main
~/import-project$ ./main
1 + 2 = 3
```

通过上面的例子可以看出，如果我们只是修改了 `main()` 函数中的业务代码，我们并不需要重新编译生成 `libsum.a` ，这大大节省了我们的编译时间。

## 四、引入头文件和动态链接库

在 Linux 系统中，你可以看到 `/lib` 和 `/usr/lib` 目录下有很多形如 `lib___.so._` 的二进制文件，这些都是库文件。

Linux 下的可执行程序为了让打包出来的可执行程序尽可能小，同时也为了尽可能重用代码，把常用的一些函数功能都封装到了这些共享库（Shared Object，后缀 `.so` ）中。

在编译程序时共享库的内容并不打包到最终的可执行程序中，而是在程序执行时动态链接调用，因此这些共享库通常也被称之为动态链接库，程序运行时会自动到 `/lib` 和 `/usr/lib` 等库目录去搜索，当然你也可以指定一个自己的库目录。

此外 Linux 中库文件的命名约定俗成以 `lib` 开头，中间是库名，然后是 `.so` 结尾，形如： `libNAME.so` 。

下面我们来试试自己构建一个动态链接库，然后让可执行文件调用此库中的 `sum()` 函数。

使用的代码任然和第二点中的一致（希望你还没有删掉），我们使用这个命令来生成 `sum.c` 的动态链接库：

```bash
~/import-project$ gcc -shared ./thirdparty/sum.c -o libsum.so
```

接着去生成 `main.c` 的可执行程序，简单介绍一下参数：

- `-L.` 指定编译时自定义的链接库目录，`.` 代表当前目录。
- `-lsum` 指定要动态链接的库，只需写名字，系统会自动加前后缀，即： `libsum.so`
- `-Wl,-rpath=.` 首先 `-Wl,<option>` 是传递选项给链接器，选项之间用 `,` 号分隔， `-rpath=.` 这个选项设置了程序运行时自定义库的目录为当前目录。

```bash
~/import-project$ gcc main.c -o main -L. -lsum -Wl,-rpath=.
~/import-project$ ./main
1 + 2 = 3
```

可见生成的 `main` 可执行程序比之前小了一点，但结果依旧符合预期。

Linux 中 `ld` 命令用来链接库， `ldd` 则可以打印程序链接库信息。我们用 `ldd` 来打印一下 `main` 程序的链接库信息：

```bash
~/import-project$ ldd ./main
    linux-vdso.so.1 (0x00007fffe1174000)
    libsum.so => ./libsum.so (0x00007ff8c9340000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007ff8c9140000)
    /lib64/ld-linux-x86-64.so.2 (0x00007ff8c935f000)
```

`libsum.so` 库确实被链接上了。

### 运行时链接动态库

除了上面那种在编译时添加动态库的链接外，一种更灵活的方式是在运行时进行动态库的链接，这样可以像插件一样自由载入需要使用的动态库。代码如下：

```cpp
// main.c
#include <stdio.h>
#include <dlfcn.h>

int main()
{
    void *handle = dlopen("./libsum.so", RTLD_NOW);
    if (handle == NULL) {
        printf("%s\n", dlerror());
        return 1;
    }

    int (*sum)(int, int); // 定义一个函数指针
    sum = dlsym(handle, "sum");
    char *err = dlerror();
    if (err != NULL) {
        printf("%s\n", err);
        return 1;
    }

    int a = 1;
    int b = 2;
    printf("%d + %d = %d\n", a, b, sum(a, b));

    dlclose(handle);
    return 0;
}
```

`dlfcn.h` 对应的库不在标准库中，而是作为动态库存在于系统，因此编译时需要使用 `-ldl` 来使用这个动态库。

```bash
~/import-project$ gcc main.c -o main -ldl
~/import-project$ ./main
1 + 2 = 3
```

可见，我们在运行时加载 `libsum.so` 库成功了。

## 五、调用可执行命令

介绍最后一种调用他人代码的方式：调用他人已编译好的可执行命令。这次我们需要调整一下我们的代码，首先删除 `sum.h` 头文件，让 `sum.c` 直接编译出一个可以执行的命令，代码修改后如下：

```cpp
// main.c 文件
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void exec(const char *cmd, char *res)
{
    FILE *fp = NULL;
    if ((fp = popen(cmd, "r")) == NULL) {
        return;
    }
    fscanf(fp, "%s", res);
    fclose(fp);
}
int main()
{
    int a = 1;
    int b = 2;
    char cmd[50], res[20];

    sprintf(cmd, "./sum %d", a);
    strcat(cmd, " %d");
    sprintf(cmd, cmd, b);
    exec(cmd, res);

    printf("%s = %s\n", cmd, res);
    return 0;
}

// thirdparty/sum.c 文件
#include <stdio.h>
#include <stdlib.h>
int sum(int a, int b)
{
    return a + b;
}
int main(int argc, char *argv[])
{
    int a = argc > 1 ? atoi(argv[1]) : 0;
    int b = argc > 2 ? atoi(argv[2]) : 0;
    printf("%d\n", sum(a, b));
    return 0;
}
```

先编译 `sum.c` 生成一个可执行的命令，测试一下运算 `4 + 5` 的结果：

```bash
~/import-project$ gcc ./thirdparty/sum.c -o sum
~/import-project$ ./sum 4 5
9
```

`sum` 命令编译测试好了，接着编译 `main.c` 生成主可执行程序，运行测试：

```bash
~/import-project$ gcc main.c -o main
~/import-project$ ./main
./sum 1 2 = 3
```

测试成功！在 `main` 主程序中通过 `shell` 的方式执行了 `sum` 命令完成了求和运算，最后将结果输出。

至此这五种 C/C++ 引入第三方的代码的方式就介绍完了～

> 本作品采用 [《CC 协议》](https://learnku.com/docs/guide/cc4.0/6589) ，转载必须注明作者和本文链接
