#!/bin/bash
# 同步一系列平台内容到本地
# git pull origin clippers --ff

script_dir="$(cd "$(dirname "$0")" && pwd)"
cd "$script_dir"

# cron 的 PATH 很精简，显式补上用户级安装目录。
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

# 0. 检查 eto
if ! command -v eto &> /dev/null
then
    echo "eto could not be found, please install it first."
    exit
fi

# 1. 先拉取最新的 clippers 分支
git pull origin clippers --rebase

# 2. 准备环境变量
sat_date=$(date -d "saturday" +"%Y%m%d")
index_file="./newsletters/sync/index/${sat_date}-index.md"
# 引入环境变量
source ./.env

# 3. 同步内容
# Weread [Obdisian Required]
# Snippd [Manual export required]
# RSS reader
eto --prefix "_" --index-file "${index_file}" qireader -t tag-Jw3lnV59k7Vaky2g -o ./qireader/ 


# Bangumi
# 小说
eto --prefix "_" --index-file "${index_file}" bangumi -t ./newsletters/sync/templates/bangumi.md -s 1 -c 2 -o ./bangumi/
# 动画
eto --prefix "_" --index-file "${index_file}" bangumi -t ./newsletters/sync/templates/bangumi.md -s 2 -c 2 -o ./bangumi/
# 三次元
eto --prefix "_" --index-file "${index_file}" bangumi -t ./newsletters/sync/templates/bangumi.md -s 3 -c 2 -o ./bangumi/
# 游戏
eto --prefix "_" --index-file "${index_file}" bangumi -t ./newsletters/sync/templates/bangumi.md -s 4 -c 2 -o ./bangumi/

# CnBlog
eto --prefix "_" --index-file "${index_file}" cnblog --output ./cnblogs/

# Zhihu
eto --prefix "_" --index-file "${index_file}" zhihu -c 908297073 -o ./zhihu/

# V2EX 
# TODO: 时间顺序 
eto --prefix "_" --index-file "${index_file}" v2ex -o ./v2ex/

# Telegram TODO

# Weibo TODO
# eto --prefix "_" --index-file "${index_file}" weibo -u 8221250887 -o ./weibo/

# bilibili
eto --prefix "_" --index-file "${index_file}" bilibili -f 49128283 -o ./bilibili/

# github
eto --prefix "_" --index-file "${index_file}" github -t ./newsletters/sync/templates/github.md --output ./github/

# 4. 提交到 git
git add .
git commit -m "docs(bot): Sync content for ${sat_date}"
git push origin clippers
