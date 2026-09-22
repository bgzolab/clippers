---
title: "ReagentX/imessage-exporter"
aliases: imessage-exporter
released: 2022-05-05T02:33:49Z
modified: 2026-09-23T00:00:45
created: 2026-09-22T13:07:48Z}
description: "Export iMessage data + run iMessage Diagnostics"
source: "https://github.com/ReagentX/imessage-exporter"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/ReagentX/imessage-exporter?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/ReagentX/imessage-exporter?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/ReagentX/imessage-exporter?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=ReagentX&repo=imessage-exporter&bg_color=00000000)](https://github.com/ReagentX/imessage-exporter)


# imessage-exporter

Export iMessage data + run iMessage Diagnostics

## README

# imessage-exporter

This crate provides both a library to interact with iMessage data as well as a binary that can perform some useful read-only operations using that data. The aim of this project is to provide the most comprehensive and accurate representation of iMessage data available.

This free and open-source software can:

- Save, export, backup, and archive iMessage data to open, portable formats
- Preserve multimedia content (images, videos, audio) from conversations
- Facilitate easy migration of message history between devices and platforms
- Run diagnostics on the iMessage database
- Give you full ownership and control over your communication history
- Support compliance with data retention policies or legal requirements
- Run on macOS, Linux, and Windows

## Example Export

![HTML Export Sample](/docs/hero.png)

## Binary

The `imessage-exporter` binary exports iMessage data to `txt` or `html` formats. It can also run diagnostics to find problems with the iMessage database.

Installation instructions for the binary are located [here](imessage-exporter/README.md).

## Library

The `imessage_database` library provides models that allow us to access iMessage information as native, cross-platform data structures.

Documentation for the library is located [here](imessage-database/README.md).

### Supported Features

This crate supports every iMessage feature as of macOS Golden Gate 27.0 (26A428) and iOS 27.0 (24A437):

- iMessage, RCS, SMS, and MMS
- Multi-part messages
- Replies/Threads
- Formatted text
- Attachments
- Expressives
- Tapbacks
- Stickers
- Apple Pay
- Group chats
- Digital Touch
- URL Previews
- Audio messages
- App Integrations
- Edited messages
- Business messages
- Handwritten messages

See more detail about supported features [here](docs/features.md).

## Frequently Asked Questions

The FAQ document is located [here](/docs/faq.md).

## Special Thanks

- All of my friends, for putting up with me sending them random messages to test things
- [SQLiteFlow](https://www.sqliteflow.com), the SQL viewer I used to explore and reverse engineer the iMessage database
- [Xplist](https://github.com/ic005k/Xplist), an invaluable tool for reverse engineering the `payload_data` plist format
- [Compart](https://www.compart.com/en/unicode/), an amazing resource for looking up esoteric unicode details
- [GNU Project](https://github.com/gnustep/libobjc) and [Archive.org](https://archive.org/details/darwin_0.1), for hosting source code referenced to reverse engineer the `typedstream` format


## Notes

