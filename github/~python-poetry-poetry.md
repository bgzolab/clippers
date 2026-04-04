---
aliases:
  - "poetry"
  - Poetry
  - Python-poetry-poetry
created: 2025-02-22T14:04:11
description: "Python packaging and dependency management made easy"
modified: 2025-08-09T13:50:18
source: "https://github.com/python-poetry/poetry"
tags:
  - github/star
title: Poetry
---
# Poetry

![](https://img.shields.io/github/stars/python-poetry/poetry?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/python-poetry/poetry?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/python-poetry/poetry?style=for-the-badge&label=since)

用起来非常像前端的 NPM

## Quick Start

```shell
poetry new my_project
poetry init
```

## [[proxy|代理]]

poetry 通过 [PyPI](https://pypi.org/) 软件仓库来下载依赖。如果在国内访问默认的镜像速度很慢，可以通过在 pyproject.toml 末尾添加下面的内容来设置自定义镜像源：

```toml
[[tool.poetry.source]]
name = "aliyun"
url = "https://mirrors.aliyun.com/pypi/simple/"
priority = "primary"


[[tool.poetry.source]]
name = "PyPI"
priority = "primary"
```

附常用的国内 PyPI 镜像列表：

- 阿里云 [https://mirrors.aliyun.com/pypi/simple/](https://mirrors.aliyun.com/pypi/simple/)
- 豆瓣 [https://pypi.doubanio.com/simple/](https://pypi.doubanio.com/simple/)
- 网易 [https://mirrors.163.com/pypi/simple/](https://mirrors.163.com/pypi/simple/)
- 清华大学 [https://pypi.tuna.tsinghua.edu.cn/simple/](https://pypi.tuna.tsinghua.edu.cn/simple/)

via： https://yanxi123.com/post/2023/12/python-poetry/

## Install locally

Before install, you should build it:

```shell
poetry build
```

In venv environment, you could run command directly:

```shell
poetry install .
```

But If you want install globally and test, recommend you using [[~pypa-pipx|pipx]]

```shell
deactivate
pipx install .
```

## [[publish-pip-package|Publish-pip-package]]

## Sync requirements

```shell
poetry add $(cat requirements.txt)
```
