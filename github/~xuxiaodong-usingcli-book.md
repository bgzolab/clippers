---
title: 像黑客一样使用命令行
aliases:
  - 像黑客一样使用命令行
  - "usingcli-book"
created: 2023-01-03T22:38:43
modified: 2026-03-26T22:38:59
comments: true
draft: true
description: "像黑客一样使用命令行"
source: "https://github.com/xuxiaodong/usingcli-book"
tags:
  - "github/star"
  - commandline 
  - nix
cover: https://rawcdn.githack.com/xuxiaodong/usingcli-book/main/images/cover-thumb.png
author: xuxiaodong
lang: chinese
published: 20221118
rating: ⭐⭐⭐
status: book/done
type: book/dev
---
**
# 像黑客一样使用命令行

![](https://img.shields.io/github/stars/xuxiaodong/usingcli-book?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/xuxiaodong/usingcli-book?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/xuxiaodong/usingcli-book?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=xuxiaodong&repo=usingcli-book&bg_color=00000000)](https://github.com/xuxiaodong/usingcli-book)

## [[quickref]]
  - ((0ad5daf6-95a7-44f6-8f77-dd4623b9076a))
  - ((63b3f83a-9ce8-4210-b8d0-1364acd2142b))
    #a-picture-is-worth-a-thousand-words #vim
    - | 命令    | 作用                                            |
      | ------- | ----------------------------------------------- |
      | h       | 向左移动一个字符                                |
      | l       | 往右移动一个字符                                |
      | b       | 向左移动一个单词                                |
      | w       | 往右移动一个单词                                |
      | e       | 移到单词结尾                                    |
      | B、W、E | 与 `b`、`w`、`e` 类似，按不同的单词定义进行移动 |
      | 0       | 移到行首                                        |
      | ^       | 移到行首，但第一个字符为非空白字符              |
      | $       | 移到行尾                                        |
    - | 命令 | 作用                       |
      | ---- | -------------------------- |
      | i    | 在光标左边插入新的文本内容 |
      | a    | 在光标右边追加新的文本内容 |
      | I    | 在行开头插入新的文本内容   |
      | A    | 在行结尾追加新的文本内容   |
    - | 命令 | 作用                                               |
      | ---- | -------------------------------------------------- |
      | x    | 删除光标下的字符                                   |
      | X    | 删除光标左边的字符                                 |
      | dm   | **m** 为某个移动指令，如 **db** 删除光标左边的单词 |
      | D    | 从光标处删除到行尾                                 |
      | dd   | 删除整行内容                                       |
    - | 命令 | 作用                                                  |
      | ---- | ----------------------------------------------------- |
      | ym   | **m** 为某个移动命令，如**yw** 用来复制光标右边的单词 |
      | p    | 在光标右边粘贴文本                                    |
      | P    | **p** 的大写形式，在光标左边粘贴文本                  |
    - | 命令 | 作用                               |
      | ---- | ---------------------------------- |
      | cm   | **m** 为某个移动命令，如 `cw`      |
      | C    | 从光标处删除到行尾，并进入插入模式 |
      | cc   | 删除整行，并进入插入模式           |
      | r    | 替换光标下的字符                   |
      | R    | 进入替换文本模式                   |
      | s    | 利用输入的字符来替换光标下的字符   |
    - | 命令 | 作用                                             |
      | ---- | ------------------------------------------------ |
      | fc   | 移动光标到 **c** 的下一处                        |
      | Fc   | 与 **f** 相反方向搜索，移动光标到 **c** 的上一处 |
      | tc   | 移动光标到 **c** 左边的字符                      |
      | Tc   | 移动光标到 **c** 右边的字符                      |
      | ;    | 重复上次的 **f** 或 **F** 命令                   |
      | ,    | 以相反的方向重复上次的 **f** 或 **F** 命令       |
  - ((1381e7a1-1b26-4bdd-9820-414429b64c00))
  - ((e58a4e3b-5d73-4f84-854b-98b1e72dd71f))
## Content
  - 第一章 入门指引
    - 控制台
    - 终端
    - 终端模拟器
    - Shell
    - 命令行界面
    - 如何进入命令行
    - 你好，命令行
  - 第二章 神奇补全
    - 何谓补全
    - 补全触发按键
    - 文件名、路径名补全
    - 程序名、命令名补全
    - 用户名、主机名及变量名补全
      - 用户名、主机名及变量名自动补全前缀字符
        - |前缀字符| 自动补全类型|
          |~ |用户名|
          |@ |主机名|
          |$ |变量名|
    - 可编程补全
      id: 0ad5daf6-95a7-44f6-8f77-dd4623b9076a
      - bash 示例
        - `/etc/bash_completion.d/mycmd`
```bash
          #
          # Completion for mycmd
          #
          _mycmd() {
              local cur opts
              cur="${COMP_WORDS[COMP_CWORD]}"
              opts="--help --version"
              if [[ ${cur} == -* ]]; then
                  COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
                  return 0
              fi
          }
          complete -F _mycmd mycmd
```
          - `local` 声明了两个变量：`cur` 和 `opts`。其中，`cur` 存储当前在命令行正输入的字，它通过 bash 内置的变量 `COMP_WORDS` 和 `COMP_CWORD` 获取。
          - `COMP_WORDS`：数组变量，包含当前命令行中单独的字。
          - `COMP_CWORD`：表示当前光标位置在 `${COMP_WORDS}` 中的索引。
          - 而 `opts` 则用来保存 `mycmd` 命令所有的命令选项。
          - 然后，我们判断 `$cur` 是否为 `-` 打头，若为真，那么就用 `compgen` 命令来生成可供补全的选项列表。`-W` 选项后跟我们需要的 `mycmd` 命令选项。
          - 与此同时，我们将 `compgen` 产生的输出赋给又一个 bash 内置变量 `COMPREPLY`。这样，当需要补全时，bash 就会采用 `compgen` 生成的补全列表了。
          - 最后，我们用 `complete` 将补全函数 `_mycmd`（`-F` 选项）与程序 `mycmd` 绑定在一起即可。
      - zsh 示例
```bash
          #compdef mycmd
          #
          # Completion for mycmd
          #
          _mycmd() {
              local cur opts
              cur="${words[CURRENT]}"
              opts=(--help --version)
              if [[ ${cur} == -* ]]; then
                  compadd -- ${opts}
                  return 0
              fi
          }
          _mycmd "$@"
```
        - 第一行的注释并非普通注释（`#compdef mycmd`），它允许 zsh 为我们自动载入补全代码。
        - 接下来定义的函数与变量跟 bash 示例相似，其中已经替换成 zsh 里等价的内容。
        - `words` 相当于 bash 中的 `COMP_WORDS`
        - `CURRENT` 与 bash 中的 `COMP_CWORD` 类似
        - `COMPREPLY` 则和 `compadd` 这个内置的 zsh 命令相同
        - 要试验 `mycmd` 在 zsh 中的补全效果，只需先执行一下 `source ~/.zshrc`。从下面的例子中，你可以看到 `mycmd` 的命令补全跟 bash 中几乎一样，当然也带着 zsh 原本的补全功能。
        - 值得一提的是，zsh 本身还提供了一些辅助函数以用于补全，比如 `_arguments`、`_describe`、`_message` 等等，各位读者诸君不妨参考 zsh 的官方文档详加了解，以便用到自己的补全代码中。
      - ==有什么用吗? 写命令行是需要自己实现在系统中吗?==
  - 第三章 重温历史
    - 设置历史变量
    - 查看历史命令
    - 搜索历史命令
    - 前后移动历史命令
    - 快速修改并执行上一条命令
    - 快速执行历史命令
    - 快速引用上一条命令的参数
    - 快速引用参数的部分内容
    - 历史命令展开模式总结
  - 第四章 编辑大法
    - 设置编辑模式
    - Emacs 编辑模式实战
    - vi 编辑模式实战
      - ![[image_1672738875178_0.png]]
        id: 63b3f83a-9ce8-4210-b8d0-1364acd2142b
  - 第五章 必备锦囊
    - 快速导航
    - 使用别名
    - 利用 {} 构造参数
      id: 1381e7a1-1b26-4bdd-9820-414429b64c00
      - 备份文件
        - 我发现很多朋友在备份文件时执行的命令是：
```bash
          xiaodong@codeland:~$ cp file file.bak
```
          这条命令将 `file` 备份为 `file.bak`。通过 `{}` (花括号)，我们可以将该命令改写成：
```bash
          xiaodong@codeland:~$ cp file{,.bak}
```
          `cp` 命令的参数 `file{,.bak}` 展开后将变成 `file file.bak`。这里的 `,` (逗号) 必不可少，否则 Shell 就不会将其展开了。
          类似的，我们也可以利用 `tar` 结合 `{}` (花括号) 来创建存档：
```bash
          xiaodong@codeland:~$ tar cf docs{.tar,}
```
          这里，`tar` 命令将 `docs` 目录存档为 `docs.tar`。
      - 生成序列
        - 对于按照一定顺序排列的条目，代替 `,` (逗号)，Shell 也支持通过 `..` (两点) 来指定一个区间。比如：
```bash
          xiaodong@codeland:~$ echo {a..z}
          a b c d e f g h i j k l m n o p q r s t u v w x y z
```
          `echo` 将回显从 a 到 z 所有的小写字母。
          又如：
```bash
          xiaodong@codeland:~$ echo {0..9}
          0 1 2 3 4 5 6 7 8 9
```
          `echo` 将回显 0 到 9 的数字。
          在区间开头数字的前面也可以添加前导的 0，比如：
```bash
          xiaodong@codeland:~$ echo {01..10}
```
          这将罗列出以下数字序列：
```bash
          01 02 03 04 05 06 07 08 09 10
```
          我们甚至还可以在区间的尾端添加一个步进值：
```bash
          xiaodong@codeland:~$ echo {1..9..2}
```
          末尾的 `2` 为步进值，这样就只会罗列奇数：
```bash
          1 3 5 7 9
```
          在 zsh 中，步进值可以为负数，这种情况下将按倒序罗列数字，例如：
```bash
          xiaodong@codeland:~$ echo {1..9..-2}
          9 7 5 3 1
```
          bash 中想要达到同样的效果需要将区间的首尾端对调，比如：
```bash
          xiaodong@codeland:~$ echo {9..1..2}
          9 7 5 3 1
```
          最后，让我们来看一个实际使用序列的例子。通过生成的序列，将其与路径组合，在下载多个文件时尤其有用。
```bash
          xiaodong@codeland:~$ wget https://linuxtoy.org/img/{1..5}.png
```
          上述命令中，`wget` 将从 <https://linuxtoy.org> 依次下载 1.png、2.png、3.png ... 等图片文件。
          值得一提的是，除了 `..` (两点) 的区间表示法，zsh 也支持 `-` (减号) 这种区间表示，不过需要启用 `braceccl` 选项。
```bash
          xiaodong@codeland:~$ setopt braceccl
          xiaodong@codeland:~$ echo {A-Za-z}
          A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
          a b c d e f g h i j k l m n o p q r s t u v w x y z
```
          我们在使用 `setopt` 开启 `braceccl` 选项后，执行 `echo {A-Za-z}` 罗列出了所有大写和小写字母。
      - 连用与嵌套
        - Shell 的 `{}` (花括号) 结构非常灵活和强大，特别是在连用和嵌套时更是威力无穷。先来让我们看一个 `{}` (花括号) 连用的例子。
```bash
          xiaodong@codeland:~$ mkdir -p 2019/{01..12}/{baby,photo}
```
          在本例中，我们连用两个 `{}` (花括号)，这样在每个月份的目录下又分别创建了 `baby` 和 `photo` 两个子目录。这条命令实际上执行的是以下命令：
```bash
          xiaodong@codeland:~$ mkdir -p 2019/01/baby 2019/01/photo \
          2019/02/baby 2019/02/photo \
          2019/03/baby 2019/03/photo \
          2019/04/baby 2019/04/photo \
          2019/05/baby 2019/05/photo \
          2019/06/baby 2019/06/photo \
          2019/07/baby 2019/07/photo \
          2019/08/baby 2019/08/photo \
          2019/09/baby 2019/09/photo \
          2019/10/baby 2019/10/photo \
          2019/11/baby 2019/11/photo \
          2019/12/baby 2019/12/photo
```
          我们不妨将两个命令比较一下，如果直接手动输入后者该是多么枯燥和乏味的事情。但是，有了 `{}` (花括号) 的帮助，我们就变轻松了不少。
          `{}` (花括号) 结构不仅可以连用，而且能够嵌套。例如：
```bash
          xiaodong@codeland:~$ echo {{A..Z},{a..z},{0..9}}
          A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
          a b c d e f g h i j k l m n o p q r s t u v w x y z
          0 1 2 3 4 5 6 7 8 9
```
          `echo` 命令的外层 `{}` (花括号) 中包含 3 个内层 `{}` (花括号)，这样就将所有的大写字母、小写字母以及从 0 到 9 的数字都罗列出来了。
    - 其它妙招
      - 重复执行命令
        - 当我为演讲主题准备材料时，我想用 `figlet` 这个工具来制作一些有趣的 ASCII 艺术字。虽然 `figlet` 提供了很多艺术样式，但是我并没有见过每一种。要想选择最酷的 ASCII 艺术字，所以我必须把每种样式都浏览一遍。于是，我执行了下面的命令：
```bash
          xiaodong@codeland:~$ figlet -f ascii9 Linux
          xiaodong@codeland:~$ figlet -f bigmono9 Linux
          xiaodong@codeland:~$ figlet -f emboss Linux
          ...
```
          可是，`figlet` 还有很多样式，这样一个一个的查看实在枯燥乏味。Shell 有没有什么重复执行命令的快捷方法呢？回答是肯定的。利用 Shell 提供的 `for` 循环，我们可以一遍又一遍的重复执行命令。下面让我们来一次性查看 `figlet` 的所有样式。
```bash
          xiaodong@codeland:~$ cd /usr/share/figlet
          xiaodong@codeland:~$ for font in *.tlf
          > do
          >     echo "Font: $font"
          >     figlet -f $(basename $font .tlf) Linux
          > done
```
          `for` 和 `in` 中间的 `font` 为循环的变量，`*.tlf` 表示扩展名为 `tlf` 的所有文件。`do` 与 `done` 之间的内容为循环体，针对当前目录下的每个 `tlf` 文件都会执行这两条命令。
          除了上面多行形式的 `for ... in` 循环结构外，我们也可以使用其单行形式，例如：
```bash
          for font in *.tlf; do figlet -f $(basename $font .tlf) Linux; done
```
  - 第六章 周边好品
    - 配置框架
    - 增强工具
  - 第七章 结语
## Comment
  - 因为 WSL2 比较吃性能, 所以之前我对写过一遍命令行的配置, 很多东西都已经接触过, 加上有 Linux 编程课, 很多细碎的操作老师也讲解过, 所以就不以为然了.
  - 说实话一般, 前期多很多琐碎的概括, 内容好多都是稀松平常的目录切换, 补全, 别名, 搜索历史, 唯几的亮点就是后面的使用技巧, 以及编译器的那几张总结性的图.
  - 比较 #awesome  的点还是这本书的构建技巧
    - > 源文件使用 [R Markdown](https://rmarkdown.rstudio.com/) 格式编写而成，通过 [bookdown](https://bookdown.org/) 工具生成 PDF 及 ePub 电子书。
    - `Makefile`
```makefile
      .PHONY: all
      all: pdf epub
      pdf:
          Rscript -e "bookdown:render_book('index.Rmd', 'bookdown:pdf_book')"
      epub:
          Rscript -e "bookdown:render_book('index.Rmd', 'bookdown:epub_book')"
      mobi:
          cd _book && ebook-convert usingcli.epub usingcli.mobi --input-profile default --output-profile kindle
      png:
          cd _book && pdftoppm -f 3 -l 5 -png usingcli.pdf usingcli-toc
      tar:
          cd _book && \
          mv usingcli_full.pdf 像黑客一样使用命令行.pdf && \
          mv usingcli.epub 像黑客一样使用命令行.epub && \
          mv usingcli.mobi 像黑客一样使用命令行.mobi && \
          tar zcvf usingcli.tar.gz 像黑客一样使用命令行.*
      .PHONY: clean
      clean:
          rm -v usingcli.*
```