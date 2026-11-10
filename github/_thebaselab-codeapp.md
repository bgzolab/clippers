---
title: "thebaselab/codeapp"
aliases: codeapp
released: 2020-12-15T13:31:44Z
modified: 2026-11-10T16:00:30
created: 2026-11-10T07:06:18Z}
description: "Building a full-fledged code editor for iPad"
source: "https://github.com/thebaselab/codeapp"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/thebaselab/codeapp?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/thebaselab/codeapp?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/thebaselab/codeapp?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=thebaselab&repo=codeapp&bg_color=00000000)](https://github.com/thebaselab/codeapp)


# codeapp

Building a full-fledged code editor for iPad

## README

# Code App

Bringing desktop-like editing experience to iPad, available on [App Store](https://apps.apple.com/us/app/code-app/id1512938504) and [TestFlight](https://testflight.apple.com/join/EgZ8sE2P).

![Code App Screenshot](https://thebaselab.com/code/clang.png)

## About the repository

This repository contains the source code of the app. We also work on issues, listen to your feedback and publish our development plan here.

## Documentation

See [code.thebaselab.com](https://code.thebaselab.com)

## The Plan

Use [VS Code](https://github.com/microsoft/vscode) as a design template while providing key functionalities with [monaco-editor](https://github.com/microsoft/monaco-editor) and native code:

- Version Control (Git clone, commits, diff editor, push, pull and gutter indicator) ✅
- Embedded terminal (70+ commands available) ✅
- Local web development environment (Node + PHP) ✅
- Built in Python runtime ✅
- C/C++ Runtime with WebAssembly (with clang) ✅
- Local Java (OpenJDK) ✅
- SSH Support ✅
- [LSP](https://microsoft.github.io/language-server-protocol) support (Python & Java) ✅ 

## Building the project

1. `git clone https://github.com/thebaselab/codeapp`
2. `./downloadFrameworks.sh`
3. Open Code.xcodeproj
4. Switch to CodeUI target if you wish to run the app on a simulator
5. Click build

The source code of the built-in languages are hosted on these repositories.
| Language | Repository |
|-----------------|-------------------|
| Python 3.9.2 | [cpython](https://github.com/holzschu/cpython/tree/3.9)|
| Clang 14.0.0 | [llvm-project](https://github.com/holzschu/llvm-project)|
| PHP 8.3.2 | [php-src](https://github.com/bummoblizard/php-src/tree/PHP-8.3.2)|
| Node.js 18.19.0 | [nodejs-mobile](https://github.com/1Conan/nodejs-mobile)|
| OpenJDK 8 | [android-openjdk-build-multiarch](https://github.com/thebaselab/android-openjdk-build-multiarch)|


## Notes

