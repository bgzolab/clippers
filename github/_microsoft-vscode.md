---
title: VSCode
aliases:
  - Visual Studio Code
  - VSCode
created: 2023-02-23T00:00:00
modified: 2026-04-18T23:57:11
description: a distribution of the `Code - OSS` repository with Microsoft-specific customizations released under a traditional https://code.visualstudio.com/License; combines the simplicity of a code editor with what developers need for their core edit-build-debug cycle. It provides comprehensive code editing, navigation, and understanding support along with lightweight debugging, a rich extensibility model, and lightweight integration with existing tools; updated monthly with new features and bug fixes.
document: https://code.visualstudio.com/docs， https://code.visualstudio.com/updates, https://code.visualstudio.com
source: https://github.com/microsoft/vscode
tags:
  - github/star
  - tool/using
---

# VSCode

![](https://img.shields.io/github/stars/microsoft/vscode?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/microsoft/vscode?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/microsoft/vscode?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=microsoft&repo=vscode&bg_color=00000000)](https://github.com/microsoft/vscode)

## Shortcuts

![[VscodeKeyboardReferenceSheet.png]]

## Theme

[VS Code Themes](https://vscodethemes.com/)

## Changelog #monthly

> [!tip]
> Reading in [Visual Studio Code (@code) / Twitter](https://twitter.com/code) is better😇 Each tweet has a demo attachment

## [[macos|Macos]]

## [[copilot|Copilot]] 使用备注

### 三种 Agent 的区别

总体上 Local 对 VSCode 支持最完美，Copilot CLI 无法定位具体的文件更改， Cloud 基本没用过，第三方的也还没用；

- [**Local**](https://code.visualstudio.com/docs/copilot/agents/local-agents): use the VS Code agent loop to run the agent interactively in the editor with full access to your workspace, tools, and models.
- [**Copilot CLI**](https://code.visualstudio.com/docs/copilot/agents/copilot-cli): use the Copilot CLI to run in the background on your machine, optionally using Git worktrees for isolation.
- [**Cloud**](https://code.visualstudio.com/docs/copilot/agents/cloud-agents): use GitHub Copilot to run remotely and integrate with GitHub pull requests for team collaboration.
- [**Third-party**](https://code.visualstudio.com/docs/copilot/agents/third-party-agents): use the third-party agent harness and SDK from Anthropic and OpenAI to run either locally on your machine or in the cloud.

via: https://code.visualstudio.com/docs/copilot/agents/overview#_hand-off-a-session-to-another-agent
