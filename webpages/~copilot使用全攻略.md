---
draft: true
aliases:
  - Copilot 使用全攻略😎
created: 2025-07-19T19:28:27
description: "介绍 copilot它是一个提高效率的强大助手，掌握它，可以让你的编程效率提高数倍。 GitHub Copilot 是由 GitHub 和 OpenAI 共同开发的人工智能代码辅助工具，俗称：副驾驶，通过插件的方式安装到编辑器（vs code）后,可以帮我们自动补全代码、根据注释生成代码、解释代码、生成测试代码、生成注释等等。 为什么有了 GPT 还需要 copilot？  copilot 内嵌到"
modified: 2025-07-20T22:50:39
source: "https://2weirdo.github.io/2024/04/16/05/"
tags: []
title: Copilot 使用全攻略😎
type: "archive-web"
---
# Copilot 使用全攻略😎

## 介绍 copilot

它是一个提高效率的强大助手，掌握它，可以让你的编程效率提高数倍。

GitHub Copilot 是由 GitHub 和 OpenAI 共同开发的人工智能代码辅助工具，俗称：副驾驶，通过插件的方式安装到编辑器（vs code）后,可以帮我们自动补全代码、根据注释生成代码、解释代码、生成测试代码、生成注释等等。

为什么有了 GPT 还需要 copilot？

- copilot 内嵌到 vs code 编辑器中,无需离开我们的代码编写环境就能提问、处理、生成代码（省去把问题或者 GPT 的回答来回粘贴的繁琐）
- copilot 生成的代码更贴近项目（它是基 **于项目当前代码上下文生成** 的），因此能生成基于当前项目代码风格的代码，可移植性更高。

Copilot 使用很简单，在 VSCode/JetBrains 上安装对应的插件，然后登录 GitHub 账号即可。

安装后，输入代码时，Copilot 会自动提示代码。

如果不希望使用提示，则继续输入代码即可，如果希望使用提示的代码，按下 Tab 键即可。

[![image-20240418113233479](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181132578.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181132578.png "image-20240418113233479")

对于 VSCode 用户来说，如果要开启侧边栏 Chat 功能，需要额外安装 Copilot Chat 插件：

[![image-20240418113254230](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181132272.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181132272.png "image-20240418113254230")

安装后侧边栏就会有相应的 chat 图标了

## 使用方法

> - `alt(option) + \` 手动触发提示
> - `alt(option) + ]` 下一条建议
> - `alt(option) + [` 上一条建议
> - `ctrl(comand) + → ` 一步步补全
> - `ctrl + enter` 十种代码实现
> - `ctrl(comand) + I` 行内操作
> - `Tab` 接受建议
> - `Esc` 拒绝建议

### 代码补全

**自动建议 (Tab）**

你在写代码的时候它自动的给你提示，提示的内容是灰色的

您可以按下 Tab 键接受建议， 通过 Esc 键丢弃提示。

**主动触发**

除了 Copilot 自动触发外，我们也可以主动触发代码补全:

- `Window` 为 `Alt + \`
- `Mac` 为 `Option + \`

> 虽然主动快捷键比较少用到，但网络波动时可以测试下 Copilot。

触发代码补全后，按下 Tab 接受会接受全部的代码

**部分补全**

但有时候我们只需要部分补全代码, 可以使去一步步接受补全代码：

- `Window` 为 `Ctrl + → `
- `Mac` 为 `Command + → `

[![image-20240418113305221](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181133269.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181133269.png "image-20240418113305221")

**切换**

如果对当前的补全代码不满意，可以去切换下一个或者上一个建议：

- `Window` 为 `Alt + ]` 或者 `Alt + [`
- `Mac` 为 `Option + ]` 或者 `Option + [`

[![image-20240418113313167](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181133209.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181133209.png "image-20240418113313167")

**注释生成代码**

你可以先写一段注释,写的越详细，它生成的代码就越满足您的要求。

1. 一般而言你写完注释后，它在下一行它会有自动提示，如果没有自动提示。你可以通过 `alt(option) + \` 来触发自动提示。
2. 另外一种更好的方式是，此时按下 `ctrl + enter` 输出十种代码实现,哪种好，接受那种就行。

> 当然你也可以直接在 chat 中直接问, 生成的内容也很详细

### Copilot Chat

它相当于为编辑器直接配置一个 GPT-4，可以方便快速地快速问答项目问题。

[![image-20240418113400277](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134366.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134366.png "image-20240418113400277")

VSCode 它会自行判断是引用文件全部，还是仅引用鼠标选中的

或者选中要解释的代码,在 chat 聊天框中输入 `/explain` 如果要按照中文解释，多写一些字。

> 比如： `/explain 用中文解释`

[![image-20240418113412099](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134183.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134183.png "image-20240418113412099")

> @workspace 表示询问工作区

**生成测试**

前面的解释代码的方法, 换成 `/tests generate tests` 即可

[![image-20240418113422328](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134408.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134408.png "image-20240418113422328")

**输入 `/help` 查看更多命令**

[![image-20240418113430203](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134279.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134279.png "image-20240418113430203")

> 在当前工作区下 `@workspace` ，可以解释选中的代码 `/explain` ，创建单元测试用例 `/tests` 、修复问题 `/fix` 、用脚手架创建新的项目 `/new` 、 写文档 `newNotebook`

此外, 我们还可以通过 `#` 来解释特定部分

[![image-20240418113441356](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134401.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134401.png "image-20240418113441356")

> 解释终端报错

[![image-20240418113449287](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134360.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134360.png "image-20240418113449287")

### 行内操作 Copilot Editor

所有的解释、生成代码、测试、fix 等都可以利用 `Copilot Editor` 在行内操作进行。

所谓行内，就是在不离开编辑器文件代码的的情况下操作，这个时候只需要按 `(Ctrl)comand + I` 这个时候会当前光标所在的行展示一个输入框，在输入框可以提问，也可以输入 `/explain` `/tests` 等等。

对于 VSCode 来说，可以在代码中唤起 `Copilot Editor` ：

- `Window` 为 `Ctrl + I`
- `Mac` 为 `Command + I`

[![image-20240418113458597](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134669.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181134669.png "image-20240418113458597")

> 点击接收即可将代码插入到相应位置

有时候对自动生成的代码不满意，可以选中代码，对它提要求，可以在行内操作完成。

## 小功能

**q / a 对话**

在任意代码文件中输入注释符号，然后输入 `q:` 后跟一个问题,比如 `// q: xx问题 `

在下一行中输入 `// a: `, copilot 会提供最简短的回答内容。

[![image-20240418113506112](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181135153.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181135153.png "image-20240418113506112")

**生成 Commit Message**

[![image-20240418113513788](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181135854.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181135854.png "image-20240418113513788")

点击这个图标后, 它会检测所有文件变更，并且生成合适的 Message。

**chat 聊天区域扩大**

如果我们嫌 chat 区域不够大或者不方便，我们可以点击 chat 顶部的三个点扩大后使用，变大了非常爽！

[![image-20240418113521093](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181135140.png)](https://weirdo-blog.oss-cn-chengdu.aliyuncs.com/blog/202404181135140.png "image-20240418113521093")

更多使用场景, 可以查看 [使用场景](https://tutorials.tinkink.net/zh-hans/vscode/usage-scenarios-of-github-copilot.html)

> 参考文章
>
> 1. [100% 压榨 GitHub Copilot 指南 - 掘金](https://juejin.cn/post/7356867483829518345?searchId=202404161011054C3E9E79E3BFD0FC5F71#heading-0)
> 2. [github copilot最强使用攻略 - 掘金](https://juejin.cn/post/7315347551687147539?searchId=202404161011054C3E9E79E3BFD0FC5F71)
> 3. [【AI】优雅地使用Github Copilot - 掘金](https://juejin.cn/post/7351300139720097811?searchId=202404161011054C3E9E79E3BFD0FC5F71)

---
