#!/bin/bash
# 同步一系列平台内容到本地

# 引入环境变量
source ./.env

# Weread [Obdisian Required]
# Snippd [Manual export required]
# RSS reader
eto qireader -t tag-Jw3lnV59k7Vaky2g -o ./qireader/

# Bangumi
# 小说
eto bangumi -t ./templates/sync-bangumi-template.md -s 1 -o ./bangumi/
# 动画
eto bangumi -t ./templates/sync-bangumi-template.md -s 2 -o ./bangumi/
# 三次元
eto bangumi -t ./templates/sync-bangumi-template.md -s 3 -o ./bangumi/
# 游戏
eto bangumi -t ./templates/sync-bangumi-template.md -s 4 -o ./bangumi/

# CnBlog
eto cnblog --output ./cnblogs/

# Zhihu
eto zhihu -c 908297073 -o ./zhihu/

# V2EX 
# TODO: 时间顺序 
eto v2ex -o ./v2ex/

# Telegram TODO

# Weibo TODO
eto weibo -u 8221250887 -o ./weibo/

# bilibili
eto bilibili -f 49128283 -o ./bilibili/
