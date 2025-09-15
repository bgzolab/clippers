---
aliases:
  - "brew"
created: 2025-01-20T20:57:26
description: "🍺 The missing package manager for macOS (or Linux)"
modified: 2025-09-15T07:42:15
source: "https://github.com/Homebrew/brew"
tags:
  - "github/star"
title: Homebrew-brew
type: "repo"
---

# Homebrew-brew

## Meta

![](https://img.shields.io/github/stars/Homebrew/brew?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/Homebrew/brew?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/Homebrew/brew?style=for-the-badge&label=since)

## 核心理念

> “在用户空间安装和管理软件，尽量不干涉系统本身。”

## Install

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After install, add path via those commands:

```shell
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/bgzo/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```
