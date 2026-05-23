---
title: "presburger/qmc-decoder"
aliases: qmc-decoder
released: 2019-04-09T04:10:43Z
modified: 2026-05-23T18:11:52
created: 2026-05-23T18:11:52
description: "Fastest & best convert qmc 2 mp3 | flac tools"
source: "https://github.com/presburger/qmc-decoder"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/presburger/qmc-decoder?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/presburger/qmc-decoder?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/presburger/qmc-decoder?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=presburger&repo=qmc-decoder&bg_color=00000000)](https://github.com/presburger/qmc-decoder)


# qmc-decoder

Fastest & best convert qmc 2 mp3 | flac tools

## README

# QQMusic QMC Decoder (convert QMC File to MP3 or FLAC)

[![LICENSE](https://img.shields.io/badge/license-Anti%20996-blue.svg?style=flat-square)](https://github.com/996icu/996.ICU/blob/master/LICENSE)
[![LICENSE](https://img.shields.io/badge/license-MIT-red.svg?style=flat-square)](https://github.com/Presburger/qmc-decoder/blob/master/LICENSE)

![Build Binary](https://github.com/Presburger/qmc-decoder/workflows/Build%20Binary/badge.svg)

***SUPPORT QMC3/QMC0/QMCFLAC, Faster***

### MUSIC FILE TAG FIX, CAN TRY THIS SOFTWARE 
[Tag Editor](https://amvidia.com/tag-editor)
## Release

binary executable file is released [release](https://github.com/Presburger/qmc-decoder/releases)

## Build

* for linux

```shell
git clone https://github.com/Presburger/qmc-decoder.git
cd qmc-decoder
git submodule update --init
mkdir build
cd build
cmake ..
make
```

* for macOS
```shell
# install cmake 
brew install cmake
git clone https://github.com/Presburger/qmc-decoder.git
cd qmc-decoder
git submodule update --init
mkdir build && cd build
cmake ..
make
```

* for windows

```bat
# PowerShell, please install MSVC compiler and Git with environment variables configured
# or in x86 or x64 Native Tools Command Prompt for VS 2019 
git clone https://github.com/Presburger/qmc-decoder.git
cd qmc-decoder
git submodule update --init
mkdir build
cd build
cmake -G "NMake Makefiles" .. -DCMAKE_BUILD_TYPE=Release
nmake
```

## Convert

Run the following command from terminal:
```bash
qmc-decoder /PATH/TO/SONG
```

Or:

Put the execuatable file in the directory that contains the qmc music files. Run the execuatable.

For macOS users, put the `decoder.command` and `qmc-decoder` files in the directory that contains the qmc music files. Double-clike on the `decoder.command` file.

![EjHn9U.gif](https://s2.ax1x.com/2019/05/19/EjHn9U.gif)

For windows user, just click the `decoder-win.exe` when you put the `decoder-win.exe` into your qmc file directory, it will convert all qmc file automatically.

![tW1w7D.gif](https://s1.ax1x.com/2020/06/08/tW1w7D.gif)

* Todo

support auto fetch albums

support auto fix music meta data


## Notes

