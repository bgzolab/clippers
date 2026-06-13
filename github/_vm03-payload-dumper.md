---
title: "vm03/payload_dumper"
aliases: payload_dumper
released: 2019-08-20T13:05:46Z
modified: 2026-06-14T00:04:35
created: 2026-06-13T13:24:13Z}
description: "Android OTA payload dumper"
source: "https://github.com/vm03/payload_dumper"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/vm03/payload_dumper?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/vm03/payload_dumper?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/vm03/payload_dumper?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=vm03&repo=payload_dumper&bg_color=00000000)](https://github.com/vm03/payload_dumper)


# payload_dumper

Android OTA payload dumper

## README

# payload dumper
Script tested on Yandex Amber OTA's (full and incremental) under Linux (but may works on Windows too)

## System requirement

- Python3, pip
- google protobuf for python `pip install protobuf`

### Docker

Alternatively you can use Docker:
```bash
docker run --rm -v "${PWD}":/data -it vm03/payload_dumper /data/payload.bin --out /data
```
or self build Docker image 
```bash
# build the container image
$ docker build -t payload_dumper .

# mount current PWD and pass payload.bin
$ docker run --rm -v "${PWD}":/data -it payload_dumper /data/payload.bin --out /data
```

## Guide

### Preparation
- Make sure you have Python 3.6 or later installed.
- Download payload_dumper.py, update_metadata_pb2.py and requirements.txt
- Extract your OTA zip and place payload.bin in the same folder as these files.
- Open PowerShell, Command Prompt, or Terminal depending on your OS.
- Enter the following command: python -m pip install -r requirements.txt

### Full OTA

- When that’s finished, enter this command: python payload_dumper.py payload.bin
- This will start to extract the images within the payload.bin file to the output folder you are in.

### Incremental OTA

- Copy original images (from full OTA or dumped from devices) to old folder (with part name + .img, ex: boot.img, system.img)
- run python payload_dumper.py --diff payload.bin
- file extracted to the output folder you are in.


## Notes

