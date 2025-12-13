---
comments: true
created: '2025-12-03T08:31:19'
draft: true
modified: '2025-12-03T08:31:19'
source: https://www.v2ex.com/t/1176510
title: 'webview2 (wails) 应用真的比 electron 应用更省内存吗？但似乎不是这样， 实测: Windows 任务管理器骗了你！'
type: archive-web
---

webview2 (wails) 应用真的比 electron 应用更省内存吗？ 以下仅讨论 windows 系统。

  之前经常看到有人说 electron 内存占用高， 就会有人推荐使用 wails tauri 等 webview2 应用，我一直以为，webview2 的优势是，更小的应用体积，更小的内存占用， 最近要写个 windows 应用，我想使用 wails 来写，顺便测试对比一下。

  如果电脑上安装有 webview2 ， 那么更小的安装包毋庸置疑，如果没有，它的运行时完整安装包是 186M ，安装完成后占用大概八九百兆，不过我们一般使用仅有几兆的在线安装器，进行在线下载，并自动安装，安装过程没有显示下载包大小，淡化了这个过程，不过我们主要想讨论的是内存占用，这里略过。

  那 webview2 应用内存占用是否更小呢，我使用 go ，使用 wails 实际测试一下吧，我使用它们官方第一个 app 教程，分别编译了一个 hello demo ，直接运行。
  electron https://www.electronjs.org/zh/docs/latest/tutorial/tutorial-first-app
  wails3  https://v3alpha.wails.io/quick-start/first-app/
  
  
 https://i.imgur.com/SAzYegk.png
 可以看到 electron 应用内存使用 88MB ，wails3 应用内存使用约 4MB 到 8MB , webview2 应用确实占存更低，1/15 ，低的多，但是我在低版本的 windows 系统中进行测试时，发现了一个问题。
 
 https://i.imgur.com/l2m2jor.png 
 从图上可以看到，同一个程序，占存占用又变成了 70 多兆，后来发现，同一个程序，在有些版本的 windows 任务管理器中，webview2 进程和程序进程是在一起显示的(父子级)， 有些版本 windows 中又分别显示，所以看起来内存使用量很少，但是用 process explorer 进行查看，它们总是父子级进程。
 
 我进行 AI 查询，说 WebView2 更省内存，因为 WebView2 应用共享系统的内核进程，如果是这样，那应该也不错吧， 继续测试一下，如果我多运行几个 WebView2 ，是不是只占用一份 WebView2 运行时内存呢。
 
  https://i.imgur.com/j6IQIrq.png
  
  我用一个新系统，启动一个 demo.exe, 内存占用 112MB ， 再多运行两次， 占用占用 5MB ，6MB ，似乎确实共享了 webview 运行内存， 但是我将 demo.exe 复制一份，改名运行， 内存占用又变成了 70MB ， 可能是共享了部分内存(约 40MB)。
  
  https://i.imgur.com/O0SUpTn.png
  同时也有一个小问题，这个 demo.exe 我在之前的电脑上内存占用是 70 多，这个电脑上占用 112MB, 我返回之前的电脑发现，windows search 进程使用了 webview2 运行时， 应该是首个启动的程序，占用内存更大，之后启动的程序占用内存会小一点。
  
  
  https://i.imgur.com/u8hQUqH.png 
  如果只运行一个 webview2 应用， 内存占用是否比 electron 应用占用占用低呢，仅针对这两个空应用，直接说结果：electron 86MB, wails 110MB,如果是系统上运行的第二个 webview2 应用，内存是 70MB ， 同一应用启动多份时，内存是五六兆， 没有太大意义，同一应用开多个窗口应该更省内存。
  
  
  https://i.imgur.com/bX4Thfm.png 
  以上内存都是指  [ windows 任务管理器] 中 [进程] 选项中显示的内存，这都是进程私有内存，windows11 叫专用工作集，如果加上进程可共享内存（共享工作集）， 那么 webview2 占用内存更大。
  
  https://i.imgur.com/8nOAZ94.png 
  另外一点发现， 使用工具查看窗口层级发现，webview2 (wails) 应用，窗体显示的也是 chrome ， 约等于 electron 应用之上套了一层 webview ，再套上一层 wails ，如果这样，同样的内核，理论上来说，webview2 应该更费内存吧。
  
  最后结论：系统只运行一个 webview2 应用时，更用内存更多，运行多个时，比 electron 应该节省一点吧（ 10% 左右？），所以内存应该不在考虑范围之内吧。