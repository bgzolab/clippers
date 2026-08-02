---
title: "bgzo/dotfiles"
aliases: dotfiles
released: 2026-08-01T13:11:03Z
modified: 2026-08-03T00:03:57
created: 2026-08-02T14:02:46Z}
description: ""
source: "https://github.com/bgzo/dotfiles"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/bgzo/dotfiles?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/bgzo/dotfiles?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/bgzo/dotfiles?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=bgzo&repo=dotfiles&bg_color=00000000)](https://github.com/bgzo/dotfiles)


# dotfiles



## README

# dotfiles

![](https://pub-89c11651a8434f18a530bd6f93e399da.r2.dev/2026/20260802224146107.webp)

This is a bounch dotfiles[^DOTFILES_INTRO] repo, including:

[^DOTFILES_INTRO]: https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/

1. dev tool configuration
2. userscripts (bash/powershell, not released dist)
3. docker config
4. zsh, samba, proxy, frp, cron and more linux server config
5. commandline history

> [!NOTE]
> I use this repo in several devices, the first class is productivity, I don't want build a complex system just ship myself to webclawer, so this repo **should never open source**, which would expose my sensitive string like password, email, token and more. 
> 
> To prevent myself turn back this decision one day in future, read this: 
> 
> If you really want to share some fucking shit configuration, just to write a **blog** please, **do never touch this repo setting**.

## Quick start

> [!NOTE]
> `gh` / `git`/ `zsh` / `which` / `stow` are required, install them first if not exist.

```bash
git config --global user.name 'HX'
git config --global user.email '57313137+bgzo@users.noreply.github.com'
ssh-keygen -t rsa -C ""
```

If you login in with ssh, you could add your client public key to `~/.ssh/authorized_keys` on server:

```bash
cat ~/.ssh/id_rsa.pub | ssh user@server 'cat >> ~/.ssh/authorized_keys'
```

Then you can login without password.  

### Start

Clone this repo:

```bash
gh repo clone bgzo/dotfiles
```

Clone submodules

```bash
git submodule update --init --recursive
git submodule update --remote --recursive 
```

### Unix(bash)

```bash
cd linux/zsh
chmod +x install.sh
./install.sh
```

The script will:

- Backup your existing `.zshrc`
- Link the configuration to this repo (automatically fixing paths)
- Switch your default shell to Zsh

Or manual move those, use stow to link dotfiles:

```bash
cd /linux/stow && stow --target=$HOME zsh vim
```

If not have stow, use following is same thing:

```
cp zsh/zshrc ~/.zshrc
vim ~/.zshrc
chsh -s /usr/bin/zsh
```


## Notes

