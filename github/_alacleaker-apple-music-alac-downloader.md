---
title: "alacleaker/apple-music-alac-downloader"
aliases: apple-music-alac-downloader
released: 2024-03-04T21:54:07Z
modified: 2026-05-23T17:15:32
created: 2025-05-28T23:59:10Z}
description: "Apple Music ALAC Downloader"
source: "https://github.com/alacleaker/apple-music-alac-downloader"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/alacleaker/apple-music-alac-downloader?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/alacleaker/apple-music-alac-downloader?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/alacleaker/apple-music-alac-downloader?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=alacleaker&repo=apple-music-alac-downloader&bg_color=00000000)](https://github.com/alacleaker/apple-music-alac-downloader)


# apple-music-alac-downloader

Apple Music ALAC Downloader

## README

# Apple Music ALAC Downloader
Original script by Sorrow. Modified by me to include some fixes and improvements.

## How to use
1. Create a virtual device on Android Studio with a image that doesn't have Google APIs.
2. Install this version of Apple Music: https://www.apkmirror.com/apk/apple/apple-music/apple-music-3-6-0-beta-release/apple-music-3-6-0-beta-4-android-apk-download/. You will also need SAI to install it: https://f-droid.org/pt_BR/packages/com.aefyr.sai.fdroid/.
3. Launch Apple Music and sign in to your account. Subscription required.
4. Port forward 10020 TCP: `adb forward tcp:10020 tcp:10020`.
5. Start frida server.
6. Start the frida agent: `frida -U -l agent.js -f com.apple.android.music`.
7. Start downloading some albums: `go run main.go https://music.apple.com/us/album/whenever-you-need-somebody-2022-remaster/1624945511`.


## Notes

