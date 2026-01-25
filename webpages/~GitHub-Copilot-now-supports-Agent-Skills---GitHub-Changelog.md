---
comments: true
draft: true
aliases:
  - GitHub Copilot now supports Agent Skills - GitHub Changelog
created: 2026-01-25T15:21:17
description: "You can now create Agent Skills to teach Copilot how to perform specialized tasks in a specific, repeatable way. Agent Skills are folders containing instructions, scripts, and resources that Copilot…"
modified: 2026-01-25T15:21:31
source: "https://github.blog/changelog/2025-12-18-github-copilot-now-supports-agent-skills/"
tags: []
title: GitHub Copilot now supports Agent Skills - GitHub Changelog
type: "archive-web"
---

# GitHub Copilot now supports Agent Skills - GitHub Changelog

You can now create **Agent Skills** to teach Copilot how to perform specialized tasks in a specific, repeatable way.

Agent Skills are folders containing instructions, scripts, and resources that Copilot automatically loads when relevant to your prompt.

They work across Copilot coding agent, Copilot CLI, and agent mode in [Visual Studio Code Insiders](https://code.visualstudio.com/insiders/). Skills support is coming to the stable version of VS Code in early January.

When Copilot determines a skill is relevant to your task, it loads the instructions and follows them—including any resources you’ve included in the skill directory.

You can write your own skills, or use skills shared by others, such as those in the [`anthropics/skills`](https://github.com/anthropics/skills) repository or GitHub’s community created [`github/awesome-copilot`](https://github.com/github/awesome-copilot) collection.

If you’ve already set up skills for Claude Code in the `.claude/skills` directory in your repository, Copilot will pick them up automatically.
