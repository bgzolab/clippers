---
title: "SideStore/SideStore"
aliases: SideStore
released: 2022-05-06T20:49:30Z
modified: 2026-07-14T00:00:29
created: 2026-07-13T14:34:12Z}
description: "SideStore is a fork of AltStore that doesn't require an AltServer."
source: "https://github.com/SideStore/SideStore"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/SideStore/SideStore?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/SideStore/SideStore?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/SideStore/SideStore?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=SideStore&repo=SideStore&bg_color=00000000)](https://github.com/SideStore/SideStore)


# SideStore

SideStore is a fork of AltStore that doesn't require an AltServer.

## README

# SideStore

> SideStore is an *untethered, community driven* alternative app store for non-jailbroken iOS devices 

[![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://makeapullrequest.com)
[![Nightly SideStore build](https://github.com/SideStore/SideStore/actions/workflows/nightly.yml/badge.svg)](https://github.com/SideStore/SideStore/actions/workflows/nightly.yml)
[![.github/workflows/beta.yml](https://github.com/SideStore/SideStore/actions/workflows/beta.yml/badge.svg)](https://github.com/SideStore/SideStore/actions/workflows/beta.yml)
[![Discord](https://img.shields.io/discord/949183273383395328?label=Discord)](https://dis.sidestore.io)

![Alt](https://repobeats.axiom.co/api/embed/3a329ce95955690b9a9366f8d5598626a847d96c.svg "Repobeats analytics image")

SideStore is an iOS application that allows you to sideload apps onto your iOS device with just your Apple ID. SideStore resigns apps with your personal development certificate, and then uses a [specially designed VPN](https://github.com/jkcoxson/em_proxy) in order to trick iOS into installing them. SideStore will periodically "refresh" your apps in the background, to keep their normal 7-day development period from expiring.

SideStore's goal is to provide an untethered sideloading experience. It's a community driven fork of [AltStore](https://github.com/rileytestut/AltStore), and has already implemented some of the community's most-requested features.

(Contributions are welcome! 🙂)

## Requirements
- Xcode 15
- iOS 14+
- Rustup (`brew install rustup`)

Why iOS 14? Targeting such a recent version of iOS allows us to accelerate development, especially since not many developers have older devices to test on. This is corrobated by the fact that SwiftUI support is much better, allowing us to transistion to a more modern UI codebase.
## Project Overview

### SideStore
SideStore is a just regular, sandboxed iOS application. The AltStore app target contains the vast majority of SideStore's functionality, including all the logic for downloading and updating apps through SideStore. SideStore makes heavy use of standard iOS frameworks and technologies most iOS developers are familiar with.

### EM Proxy
[EM Proxy](https://github.com/jkcoxson/em_proxy) powers the defining feature of SideStore: untethered app installation. By leveraging a custom-built App Store app with additional entitlements ([LocalDevVPN](https://github.com/jkcoxson/LocalDevVPN)) to create the VPN tunnel for us, it allows SideStore to take advantage of [Jitterbug](https://github.com/osy/Jitterbug)'s loopback method without requiring a paid developer account.

### Minimuxer
[Minimuxer](https://github.com/jkcoxson/minimuxer) is a lockdown muxer that can run inside iOS’s sandbox. It replicates Apple’s usbmuxd protocol on macOS to “discover” devices to interface with LocalDevVPN on-device.

### Roxas
[Roxas](https://github.com/rileytestut/roxas) is Riley Testut's internal framework from AltStore used across many of their iOS projects, developed to simplify a variety of common tasks used in iOS development.

We're hoping to eventually eliminate our dependency on it, as it increases the amount of unnecessary Objective-C in the project.

## Contributing/Compilation Instructions

Please see [CONTRIBUTING.md](./CONTRIBUTING.md)

## Licensing

This project is licensed under the **AGPLv3 license**.


## Notes

