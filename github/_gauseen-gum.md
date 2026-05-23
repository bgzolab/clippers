---
title: "gauseen/gum"
aliases: gum
released: 2021-06-24T10:17:54Z
modified: 2026-05-23T18:11:52
created: 2026-05-23T18:11:52
description: "Git multiple user config manager"
source: "https://github.com/gauseen/gum"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/gauseen/gum?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/gauseen/gum?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/gauseen/gum?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=gauseen&repo=gum&bg_color=00000000)](https://github.com/gauseen/gum)


# gum

Git multiple user config manager

## README

# Git multiple user config manager

## Install

```sh
$ npm i -g @gauseen/gum
```

## Example

```sh
$ gum list

Currently used name=gauseen email=gauseen@gmail.com
┌────────────┬─────────┬─────────────────────────┐
│ group-name │    name │                   email │
├────────────┼─────────┼─────────────────────────┤
│    global  │ gauseen │ gauseen@gmail.com       │
│    user1   │ li si   │ lisi@gmail.com          │
│    user2   │ wang er │ wanger@gmail.com        │
└────────────┴─────────┴─────────────────────────┘
```

```sh
$ gum use user1

Currently used name=li si email=lisi@gmail.com
```

## Usage

```sh
Usage: gum [options] [command]

Options:
  -V, --version               output the version number
  -h, --help                  display help for command

Commands:
  list                        List all the user config group
  set [options] <group-name>  Set one group for user config
    --name                    User name
    --email                   User email
  use [options] <group-name>  Use one group name for user config
    --global                  Git global config
  delete <group-name>         Delete one group
  help [command]              display help for command
```

## Change Log

### v1.0.5

- feat: Support `gum use <group-name> --global` commands that are not Git repositories

### v1.0.4

- fix: support user.name contain space

### v1.0.3

- fix: Group name can't be 'global'

### v1.0.2

- feat: `gum --version` cmd
- fix: support node v9.0.0


## Notes

