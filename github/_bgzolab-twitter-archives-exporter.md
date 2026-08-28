---
title: "bgzolab/twitter-archives-exporter"
aliases: twitter-archives-exporter
released: 2026-08-28T14:53:24Z
modified: 2026-08-29T00:00:20
created: 2026-08-28T14:54:12Z}
description: ""
source: "https://github.com/bgzolab/twitter-archives-exporter"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/bgzolab/twitter-archives-exporter?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/bgzolab/twitter-archives-exporter?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/bgzolab/twitter-archives-exporter?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=bgzolab&repo=twitter-archives-exporter&bg_color=00000000)](https://github.com/bgzolab/twitter-archives-exporter)


# twitter-archives-exporter



## README

<a id="readme-top"></a>


<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![project_license][license-shield]][license-url]
![Size][size-shield]

[contributors-shield]: https://img.shields.io/github/contributors/bGZo/playground.svg?style=for-the-badge
[contributors-url]: https://github.com/bGZo/playground/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/bGZo/playground.svg?style=for-the-badge
[forks-url]: https://github.com/bGZo/playground/network/members
[stars-shield]: https://img.shields.io/github/stars/bGZo/playground.svg?style=for-the-badge
[stars-url]: https://github.com/bGZo/playground/stargazers
[issues-shield]: https://img.shields.io/github/issues/bGZo/playground.svg?style=for-the-badge
[issues-url]: https://github.com/bGZo/playground/issues
[license-shield]: https://img.shields.io/github/license/bGZo/playground.svg?style=for-the-badge
[license-url]: https://github.com/bGZo/playground/blob/template/LICENCE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[size-shield]: https://img.shields.io/github/repo-size/bGZo/playground?style=for-the-badge



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/bGZo/playground">
    <img src="https://abs.twimg.com/favicons/twitter.2.ico" alt="">
  </a>
<h3 align="center">Twitter Archives Exporter</h3>
  <p align="center">
    将 Twitter 官方存档（优先 tweets.js、like.js）导出为可直接给站点消费的 Markdown 文件。
    <br />
    <!-- <a href="https://github.com/bGZo/playground"><strong>Explore the docs »</strong></a>
    <br />
    <br /> -->
    <!-- <a href="https://github.com/bGZo/playground">View Demo</a>
    &middot;
    <a href="https://github.com/bGZo/playground/issues/new?labels=bug">Report Bug</a>
    &middot;
    <a href="https://github.com/bGZo/playground/issues/new?labels=enhancement">Request Feature</a> -->
  </p>
</div>


<!-- ABOUT THE PROJECT -->
## About The Project

<!-- ![Playground Name Screen Shot](https://raw.githubusercontent.com/bGZo/assets/dev/2025/202508021439235.JPG) -->

1. 扫描 `data/` 下多个 Twitter 存档目录；
2. 解析 Twitter 的 JS 包裹 JSON 数据；
3. 映射为统一内部模型（tweet / like）；
4. 导出 Markdown（frontmatter + 正文 + Obsidian 尾行）；
5. 生成 `summary.json` 和 `errors.jsonl`。


以某个存档 `<archive>` 为例：

- `output/<archive>/tweets/<twitter-id>.md`
- `output/<archive>/likes/<twitter-id>.md`
- `output/<archive>/summary.json`
- `output/<archive>/errors.jsonl`

Markdown 文件规则：

- frontmatter 固定字段：`title`、`aliases`、`tweet_id`、`source`、`created`、`modified`、`comments`、`draft`、`description`、`tags`、`author`
- 时间格式：`YYYY-MM-DDTHH:mm:ss`（无 `Z`，秒级）
- 正文后空一行追加：`![](https://x.com/i/web/status/{twitter-id})`
- 重复 `twitter-id` 不覆盖，直接跳过
- 文件编码统一 UTF-8 + LF

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

### 1) 安装依赖

```bash
uv sync
```

### 2) 运行导出

批量导出（处理 `data/` 下所有合法存档）：

```bash
uv run twitter-archives-exporter export --input-dir data --output-dir output
```

只导出一个存档：

```bash
uv run twitter-archives-exporter export \
  --input-dir data \
  --output-dir output \
  --archive twitter-imbgzo-20260210 \
  --log-level warn
```

### 3) 查看帮助

```bash
uv run twitter-archives-exporter --help
```


## Development Checks

按顺序执行：

1. `uv run ruff format --check .`
2. `uv run ruff check .`
3. `uv run pytest -q`

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Roadmap

- MVP 主链路已打通（扫描 → 解析 → 映射 → 导出 → 汇总）；
- 已在真实样本上完成端到端验证；
- 可选在线补全能力（阶段 5）尚未实现。


<!-- CONTRIBUTING -->
## Contributing

Any contributions made are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


<!-- CONTRIBUTING -->
### Top contributors:

<a href="https://github.com/bGZo/playground/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=bGZo/playground" alt="contrib.rocks image" />
</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->
## License

All code is licensed under the AGPL-3.0 license. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

- Telegram: @imbGZo

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## Notes

