---
title: "nab138/iloader"
aliases: "iloader"
created: 2026-04-19T13:48:26
modified: 2026-04-19T13:48:26
description: "User friendly sideloader"
source: "https://github.com/nab138/iloader"
tags:
  - "github/star"
---

# iloader

![](https://img.shields.io/github/stars/nab138/iloader?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/nab138/iloader?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/nab138/iloader?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=nab138&repo=iloader&bg_color=00000000)](https://github.com/nab138/iloader)

[![](https://github.com/nab138/iloader/raw/main/iloader-dark.svg)](https://iloader.app/)

## iloader

---

Install SideStore (or other apps) and import your pairing file with ease

**This repository and [iloader.app](https://iloader.app/) are the only official ways to download iloader. There is also an unofficial [Homebrew cask](https://formulae.brew.sh/cask/iloader) and an unofficial [AUR package](https://aur.archlinux.org/packages/iloader-bin) maintained by the community. Do not download from any other sources or websites.**

[![iloader0](https://private-user-images.githubusercontent.com/56705177/514645630-93cd135d-6d89-46ee-9b9f-12c596806911.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NzY1NzgwMDMsIm5iZiI6MTc3NjU3NzcwMywicGF0aCI6Ii81NjcwNTE3Ny81MTQ2NDU2MzAtOTNjZDEzNWQtNmQ4OS00NmVlLTliOWYtMTJjNTk2ODA2OTExLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA0MTklMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNDE5VDA1NDgyM1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTU3OGMzNzA4N2FiNGQzMWM5YjQ2OWVjMDQ5OWI0MDZhMTc0YjYwMTU2NjhiMzNlYTBjOGNmODUwMmU1MmU5NjgmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9._LjcOo_eKB-8hzN0nHVEbzRpearSu77yCDBoekqG9oQ)](https://private-user-images.githubusercontent.com/56705177/514645630-93cd135d-6d89-46ee-9b9f-12c596806911.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NzY1NzgwMDMsIm5iZiI6MTc3NjU3NzcwMywicGF0aCI6Ii81NjcwNTE3Ny81MTQ2NDU2MzAtOTNjZDEzNWQtNmQ4OS00NmVlLTliOWYtMTJjNTk2ODA2OTExLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA0MTklMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNDE5VDA1NDgyM1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTU3OGMzNzA4N2FiNGQzMWM5YjQ2OWVjMDQ5OWI0MDZhMTc0YjYwMTU2NjhiMzNlYTBjOGNmODUwMmU1MmU5NjgmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9._LjcOo_eKB-8hzN0nHVEbzRpearSu77yCDBoekqG9oQ)

## How to use

- Install usbmuxd for your platform
	- Windows: [iTunes](https://apple.co/ms)
		- macOS: Included
		- Linux: Potentially included, if not, install via your package manager
- Install the latest version for your platform from the [releases](https://github.com/nab138/iloader/releases)
	- NixOS: Use the flake `github:nab138/iloader`
- Plug in your iDevice to your computer
- Open the app
- Sign into your Apple ID
- Select your action (e.g. install SideStore)

## Features

- Install SideStore (or LiveContainer + SideStore), import certificate and place rppairing+lockdown pairing files automatically
- Import any IPA
- Intelligent error suggestions to help resolve common issues
- Manage pairing files in apps like StikDebug, SideStore, Protokolle, etc
- See and revoke development certificates & app ids

## Troubleshooting

- If you are unable to solve an issue on your own, copy the full error message and ask on the [idevice Discord server](https://discord.gg/EA6yVgydBz) or [open an issue](https://github.com/nab138/iloader/issues).
- You can view app logs with the "View Logs." If nothing is showing up, change the log level to "Debug."
- If those logs aren't helpful, logs with additional are stored in the following locations:
	- Windows: `%APPDATA%\me.nabdev.iloader\logs`
		- macOS: `~/Library/Application Support/me.nabdev.iloader/logs`
		- Linux: `~/.local/share/me.nabdev.iloader/logs/`

## Translating

iloader needs localization! If you speak another language and notice iloader does not support it or has mistakes, please consider contributing.

To update/edit an existing language, make a PR modifying `src/locales/<lang>.json`.

To add a new language, add your language to `src/i18next.ts`, and in `src/locales` copy `en.json` to a new file titled `<langcode>.json` and update the strings.

**i18next.ts:**

```
const languages = [
    ["en", "English"],
    ["es", "Español"],
    // Your language here...
] as const;
```

You can also add your name to the translators section of the README.

Thank you for translating!

## Building from source

1. Install [bun](https://bun.sh/) (or [Node.js](https://nodejs.org/)) and [Rust](https://www.rust-lang.org/tools/install)
2. Clone the repository and `cd` into it
3. Run `bun i` (or `npm i`)

For development with hot reload: `bun tauri dev` (or `npm run tauri dev`) Make a production build: `bun tauri build` (or `npm run tauri build`)

## Credits

- Icon made by [Transistor](https://github.com/transistor-exe)
- UI improved by [StephenDev0](https://github.com/StephenDev0)
- [idevice](https://github.com/jkcoxson/idevice) by [jkcoxson](https://github.com/jkcoxson) for communicating with iOS devices
- [isideload](https://github.com/nab138/isideload) for installing apps
	- A [modified version of apple-platform-rs](https://github.com/nab138/isideload-apple-platform-rs) was used for codesigning, based off [plume-apple-platform-rs](https://github.com/plumeimpactor/plume-apple-platform-rs)
		- [Impactor](https://github.com/khcrysalis/Impactor) was used as a reference for cryptography, codesigning, and provision file parsing.
		- [Sideloader](https://github.com/Dadoum/Sideloader) was used as a reference for how apple private developer endpoints work
- [idevice\_pair](https://github.com/jkcoxson/idevice_pair) was used as a reference for pairing file management
- App made with [tauri](https://tauri.app/)

## Translators

Thank you to everyone who has contributed translations! See the [Translating](#translating) section if you would like to contribute as well.

- [TNT-333](https://github.com/TNT-333): German (de)
- [basketshoe](https://github.com/basketshoe): Italian (it)
- [baocreata](https://github.com/baocreata): Vietnamese (vt)
- [IamArayel](https://github.com/IamArayel): French (fr)
- [kkula9999](https://github.com/kkula9999): Traditional & Simplified Chinese (zh\_tw & zh\_cn)
- [sibwaze](https://github.com/sibwaze): Russian (ru)
- [mirdukkkkk](https://github.com/mirdukkkkk): Improved Russian (ru)
- [okinaau](https://github.com/okinaau): Arabic (ar)
- [WingChunWong](https://github.com/WingChunWong): Cantonese (zh\_hk) & Improved Chinese (zh\_tw & zh\_cn)
- [marcinmajsc](https://github.com/marcinmajsc): Polish (pl)
- [ern775](https://github.com/ern775): Turkish (tr)
- [canpng](https://github.com/canpng): Improved Turkish (tr)
- [jazoppix](https://github.com/jazoppix): Spanish (es)
- [eseiker](https://github.com/eseiker): Korean (ko)
- [seomin0610](https://github.com/seomin0610): Improved Korean (ko)
- [Ordyan777](https://github.com/Ordyan777): Armenian (am)
- [kakik0u](https://github.com/kakik0u): Japanese (ja)
- [lkspodmol](https://github.com/lkspodmol): Czech (cs\_cz)
- [marcusherelammonstyle-cmd](https://github.com/marcusherelammonstyle-cmd): Swedish (sv)
- [MCI49312](https://github.com/MCI49312): Hungarian (hu)

## License

Copyright (C) 2026 nab138

The source code of this repository is licensed under the MIT License. See the [LICENSE](https://github.com/nab138/iloader/blob/main/LICENSE) file for the full text.

Branding, logos, media assets, and the name “iloader” are not licensed under the MIT License and are subject to separate restrictions.

You may retain or use branding materials in forks, tutorials, or documentation if you include a clear link to either the official site ([https://iloader.app](https://iloader.app/)) or the iloader source code repository ([https://github.com/nab138/iloader](https://github.com/nab138/iloader)) and do not imply official endorsement. See [LICENSE-BRANDING](https://github.com/nab138/iloader/blob/main/LICENSE-BRANDING) for full details.

## Future Plans

- Checks for if device is in developer mode, has password set, etc
- Automatic anisette fallback
- Team selection when an account has multiple teams
- Auto-refresh installed apps
- Set a "default" account to automatically log into
- Import SideStore account info automatically
- Mount DDI and open sidestore after installation
