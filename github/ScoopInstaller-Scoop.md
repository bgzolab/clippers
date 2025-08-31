---
title: ScoopInstaller/Scoop
aliases: tools/scoop
created: 2024-02-25T00:00:00
modified: 2025-06-07T14:21:36
description: A command-line installer for Windows.
source: https://github.com/ScoopInstaller/Scoop
tags:
  - github/star
tags-link: 
type: repo
---

## Repo Meta

![](https://img.shields.io/github/stars/ScoopInstaller/Scoop?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/ScoopInstaller/Scoop?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/ScoopInstaller/Scoop?style=for-the-badge&label=since)

[![](https://github-readme-stats.vercel.app/api/pin/?username=ScoopInstaller&repo=Scoop&bg_color=00000000)](https://github.com/ScoopInstaller/Scoop)

[[chawyehsu-dorado]]

## Notes

- [[skills/devops/linux/commandline/index]]

## How
### Find Software
    - online via:
      <iframe src='https://bjansen.github.io/scoop-apps/' style='height:40vh;width:100%' class='iframe-radius' allow='fullscreen'></iframe>
<center>via: <a href='https://bjansen.github.io/scoop-apps/' target='_blank' class='external-link'>https://bjansen.github.io/scoop-apps/</a></center>
    - local: `scoop search xxx`

### Migrate PCs
    - {{embed ((65ccf1f1-1c85-4844-8e8f-b0947b25b0fd))}}
      #star
    - > 你可以 scoop export 一个 json 文件，下次重装直接 scoop import 就行了
      — [Windows 包管理 scoop 太好用了! - V2EX](https://www.v2ex.com/t/869453)

### Reset Version
```shell
      scoop reset logseq@0.10.8
```

## What
  - [x] 用 scoop 安装浏览器存在兼容问题： `Start Menu\Programs\Scoop Apps` 启动 和 默认浏览器启动
    - **加载了不同的数据目录 `User Data`**
      - Default Setting: `C:\Users\15517\scoop\apps\ungoogled-chromium\current\chrome.exe --user-data-dir="C:\Users\15517\scoop\apps\ungoogled-chromium\current\User Data"`
      - Actual Setting: `C:\Users\15517\AppData\Local\Chromium`
    - Processing in [(Bug) Brave does not always use `--user-data-dir` · Issue #9548 · ScoopInstaller/Extras](https://github.com/ScoopInstaller/Extras/issues/9548) with [ScoopInstaller/Extras: 📦 The Extras bucket for Scoop.](https://github.com/ScoopInstaller/Extras)
      - [Code search results · GitHub](https://github.com/search?q=repo%3AScoopInstaller%2FExtras%20%22User%20Data%22&type=code)
        - ==can not find create **Symbolic Link** Ways using Powershell==
          - [symlink - Creating hard and soft links using PowerShell - Stack Overflow](https://stackoverflow.com/questions/894430/creating-hard-and-soft-links-using-powershell)
            - `New-Item -Path $link -ItemType SymbolicLink -Value $target`
        - vivaldi / brave, ungoogle-chromium 两者的脚本不同
          - vivaldi 没出问题是因为 Settings App Default 里默认应用选择的是 scoop 的 shortcuts 是配置好 `User Data` 的.
          - 后两者没有这样的配置, 可能我还需要 再去修改下注册表, via: [从根源上解决Win10修改默认应用打开方式——注册表 - 简书](https://www.jianshu.com/p/7b5a7b304c2c)
        - Json 里面没有脚本信息 (`New-DirectoryJunction`, 只有 `Copy-Item`) 我不确定是不是 Extras 控制的这部分...
          - https://github.com/ScoopInstaller/Extras/blob/ee8f752e6f152e86ba61cbe1de8c00bac7efee84/bucket/chromium.json#L22
        - ==草, 他们的符号链接到底是怎么创建的...==
          - https://github.com/ScoopInstaller/Scoop/issues/4573#issuecomment-990631332
- Get [Code search results · GitHub](https://github.com/search?q=repo%3AScoopInstaller%2FScoop%20mklink&type=code) in `lib/install.ps1`
```shell
                function New-DirectoryJunction($source, $target) {
                  # test if this script is being executed inside a docker container
                  if (Get-Service -Name cexecsvc -ErrorAction SilentlyContinue) {
                    cmd.exe /d /c "mklink /j `"$source`" `"$target`""
                  } else {
                    New-Item -Path $source -ItemType Junction -Value $target
                  }
                    ...
```
        - scoop bucket 怎么配置... Json 的作用是什么???
      - Solution
        - https://github.com/ScoopInstaller/Extras/blob/ee8f752e6f152e86ba61cbe1de8c00bac7efee84/bucket/chromium.json#L32-L37
```shell
          "post_install": [
            "if (!(Test-Path \"$dir\\User Data\\*\") -and (Test-Path \"$env:LocalAppData\\Chromium\\User Data\")) {",
              " info '[Portable Mode]: Copying user data...'",
              " Copy-Item \"$env:LocalAppData\\Chromium\\User Data\\*\" \"$dir\\User Data\" -Recurse",
            // FIXME: New-DirectoryJunction Scipt???
              // Reference:
                // https://github.com/search?q=repo:ScoopInstaller/Scoop+function+info&type=code
                // https://github.com/search?q=repo:ScoopInstaller/Scoop+function+New-DirectoryJunction&type=code
            "}"
          ],
```
        - Location
          - [bucket/brave.json](https://github.com/ScoopInstaller/Extras/blob/90b31955ada69b6bc83d35ad365feef6f9581120/bucket/brave.json#L30)
          - [bucket/googlechrome.json](https://github.com/ScoopInstaller/Extras/blob/90b31955ada69b6bc83d35ad365feef6f9581120/bucket/googlechrome.json#L26)
          - [bucket/chromium.json](https://github.com/ScoopInstaller/Extras/blob/90b31955ada69b6bc83d35ad365feef6f9581120/bucket/chromium.json#L22)
          - [bucket/ungoogled-chromium.json](https://github.com/ScoopInstaller/Extras/blob/90b31955ada69b6bc83d35ad365feef6f9581120/bucket/ungoogled-chromium.json#L21)
  - 从零开始配置
```shell
      $psversiontable.psversion.major
      set-executionpolicy remotesigned -scope currentuser
      # check up ”PS”
      $env:SCOOP='D:\scoop'
      [environment]:setEnvironmentVariable('SCOOP',$env:SCOOP,'User')
      iwr -useb get.scoop.sh | iex
      # customize scoop path
      scoop bucket add extras
      scoop bucket add dorado https://github.com/chawyehsu/dorado
      scoop bucket add dodorz https://github.com/dodorz/scoop
      # add extra repo
      ##Beautify###########################################
      # Maybe u should install scoop first from
      # https://github.com/lukesampson/scoop
      # Dowmload powershell 7.x instead of default 5.x form
      # https://github.com/PowerShell/PowerShell/releases
      # then run the powershell 7.x
      Install-Module posh-git -Scope CurrentUser
      Install-Module oh-my-posh -Scope CurrentUser
      #
      $PROFILE
      if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
      notepad $PROFILE
      # then code $PROFILE
      # you could input the path to freash the powershell
      # add the config like this:
      Import-Module posh-git
      Import-Module oh-my-posh
      Set-PoshPrompt Paradox
```
      - Refs
        - Hidden
          - [「一行代码」搞定软件安装卸载，用 Scoop 管理你的 Windows 软件 - 少数派](https://sspai.com/post/52496)
          - [给 Scoop 加上这些软件仓库，让它变成强大的 Windows 软件管理器 - 少数派](https://sspai.com/post/52710)
          - [你需要掌握的Scoop技巧和知识 - 知乎](https://zhuanlan.zhihu.com/p/135278662)
          - [Windows | Scoop软件包管理神器 | 小新博客](https://www.limufang.com/post/569.html)
        - could see more prompts from [Themes | Oh My Posh](https://ohmyposh.dev/docs/themes)
        - notice its not "Set-Theme" from [Windows Terminal - PowerShell customization via oh-my-posh/posh-git Set-Theme error? · Issue #9237 · microsoft/terminal](https://github.com/microsoft/terminal/issues/9237#issuecomment-798913706)
          - > It seems the "Set-Theme" cmdlet was renamed to "Set-PoshPrompt".
        - more color-schemes: [Windows 终端配色方案 | Microsoft Learn](https://learn.microsoft.com/zh-cn/windows/terminal/customize-settings/color-schemes)

## References
  - [Scoop——也许是Windows平台最好用的软件（包）管理器 - 知乎](https://zhuanlan.zhihu.com/p/463284082)
- [Scoop - Windows下的包管理工具 - 简书 (jianshu.com)](https://www.jianshu.com/p/d88616d7138e)
