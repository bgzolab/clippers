---
title: "violentmonkey/violentmonkey"
aliases: violentmonkey
released: 2013-09-03T08:23:19Z
modified: 2026-05-23T18:11:52
created: 2026-05-23T18:11:52
description: "Violentmonkey provides userscripts support for browsers. It works on browsers with WebExtensions support."
source: "https://github.com/violentmonkey/violentmonkey"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/violentmonkey/violentmonkey?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/violentmonkey/violentmonkey?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/violentmonkey/violentmonkey?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=violentmonkey&repo=violentmonkey&bg_color=00000000)](https://github.com/violentmonkey/violentmonkey)


# violentmonkey

Violentmonkey provides userscripts support for browsers. It works on browsers with WebExtensions support.

## README

# Violentmonkey

[![Chrome Web Store](https://img.shields.io/chrome-web-store/v/jinjaccalgkegednnccohejagnlnfdag.svg)](https://chrome.google.com/webstore/detail/violentmonkey/jinjaccalgkegednnccohejagnlnfdag)
[![Firefox Add-ons](https://img.shields.io/amo/v/violentmonkey.svg)](https://addons.mozilla.org/firefox/addon/violentmonkey)
[![Microsoft Edge Add-on](https://img.shields.io/badge/dynamic/json?label=microsoft%20edge%20add-on&query=%24.version&url=https%3A%2F%2Fmicrosoftedge.microsoft.com%2Faddons%2Fgetproductdetailsbycrxid%2Feeagobfjdenkkddmbclomhiblgggliao)](https://microsoftedge.microsoft.com/addons/detail/eeagobfjdenkkddmbclomhiblgggliao)

Violentmonkey provides userscripts support for browsers.
It works on browsers with [WebExtensions](https://developer.mozilla.org/en-US/Add-ons/WebExtensions) support.

More details can be found [here](https://violentmonkey.github.io/).

Join our Discord server:

[![Discord](https://img.shields.io/discord/995346102003965952?label=discord&logo=discord&logoColor=white&style=for-the-badge)](https://discord.gg/XHtUNSm6Xc)

## Automated Builds for Testers

A test build is generated automatically for changes between beta releases. It can be installed as an unpacked extension in Chrome and Chromium-based browsers or as a temporary extension in Firefox. It's likely to have bugs so do an export in Violentmonkey settings first. This zip is available only if you're logged-in on GitHub site. Open an entry in the [CI workflows](https://github.com/violentmonkey/violentmonkey/actions/workflows/ci.yml) table and click the `Violentmonkey-...` link at the bottom to download it.

## Workflows

### Development

Install [Node.js](https://nodejs.org/) and Yarn v1.x.
The version of Node.js should match `"node"` key in `package.json`.

``` sh
# Install dependencies
$ yarn

# Watch and compile
$ yarn dev
```

Then load the extension from 'dist/'.

### Build

To release a new version, we must build the assets and upload them to web stores.

``` sh
# Build for normal releases
$ yarn build

# Build for self-hosted release that has an update_url
$ yarn build:selfHosted
```

### Release

See [RELEASE](RELEASE.md) for the release flow.

## Related Projects

- [Violentmonkey for Opera Presto](https://github.com/violentmonkey/violentmonkey-oex)
- [Violentmonkey for Maxthon](https://github.com/violentmonkey/violentmonkey-mx)


## Notes

