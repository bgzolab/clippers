#!/bin/bash
# 同步一系列平台内容到本地

# 本周周六日期
sat_date=$(date -d "saturday" +"%Y%m%d")
index_file="./newsletters/sync/index/${sat_date}-index.md"

# 引入环境变量
source ./.env

# Weread [Obdisian Required]
# Snippd [Manual export required]
# RSS reader
eto --index-file "${index_file}" qireader -t tag-Jw3lnV59k7Vaky2g -o ./qireader/


# Bangumi
# 小说
eto --index-file "${index_file}" bangumi -t ./newsletters/sync/templates/bangumi.md -s 1 -c 2 -o ./bangumi/
# 动画
eto --index-file "${index_file}" bangumi -t ./newsletters/sync/templates/bangumi.md -s 2 -c 2 -o ./bangumi/
# 三次元
eto --index-file "${index_file}" bangumi -t ./newsletters/sync/templates/bangumi.md -s 3 -c 2 -o ./bangumi/
# 游戏
eto --index-file "${index_file}" bangumi -t ./newsletters/sync/templates/bangumi.md -s 4 -c 2 -o ./bangumi/

# CnBlog
eto --index-file "${index_file}" cnblog --output ./cnblogs/

# Zhihu
eto --index-file "${index_file}" zhihu -c 908297073 -o ./zhihu/

# V2EX 
# TODO: 时间顺序 
eto --index-file "${index_file}" v2ex -o ./v2ex/

# Telegram TODO

# Weibo TODO
# eto --index-file "${index_file}" weibo -u 8221250887 -o ./weibo/

# bilibili
eto --index-file "${index_file}" bilibili -f 49128283 -o ./bilibili/
