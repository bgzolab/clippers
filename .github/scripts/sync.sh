#!/bin/bash
# 同步一系列平台内容到本地
# git pull origin clippers --ff

script_dir="$(cd "$(dirname "$0")" && pwd)"
clippers_dir="$(cd "$script_dir/../.." && pwd)"
cd "$clippers_dir"

# cron 的 PATH 很精简，显式补上用户级安装目录。
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

# 0. 检查 eto
if ! command -v eto &> /dev/null
then
    echo "eto could not be found, please install it first."
    exit
fi

# 1. 先拉取最新的 clippers 分支
# 注意 Linux 的机器需要先解锁钥匙环，否则用不了
git pull origin main --rebase

# 2. 准备环境变量
sat_date=$(date -d "saturday" +"%Y%m%d")
index_file="${clippers_dir}/newsletters/${sat_date}-index.md"
# 引入环境变量
source ${clippers_dir}/.env

# 3. 同步内容
# Weread [Obdisian Required]
# Snippd [Manual export required]
# RSS reader
eto --prefix "_" --index-file "${index_file}" qireader -t tag-Jw3lnV59k7Vaky2g -o ${clippers_dir}/qireader/


# Bangumi
# 小说
eto --prefix "_" --index-file "${index_file}" bangumi -t ${clippers_dir}/.github/templates/bangumi.md -s 1 -c 2 -o ${clippers_dir}/bangumi/
# 动画
eto --prefix "_" --index-file "${index_file}" bangumi -t ${clippers_dir}/.github/templates/bangumi.md -s 2 -c 2 -o ${clippers_dir}/bangumi/
# 三次元
eto --prefix "_" --index-file "${index_file}" bangumi -t ${clippers_dir}/.github/templates/bangumi.md -s 3 -c 2 -o ${clippers_dir}/bangumi/
# 游戏
eto --prefix "_" --index-file "${index_file}" bangumi -t ${clippers_dir}/.github/templates/bangumi.md -s 4 -c 2 -o ${clippers_dir}/bangumi/

# CnBlog
eto --prefix "_" --index-file "${index_file}" cnblog --output ${clippers_dir}/cnblogs/

# Zhihu
eto --prefix "_" --index-file "${index_file}" zhihu -c 908297073 -o ${clippers_dir}/zhihu/

# V2EX
# TODO: 时间顺序
eto --prefix "_" --index-file "${index_file}" v2ex -o ${clippers_dir}/v2ex/

# Telegram TODO

# Weibo TODO
# eto --prefix "_" --index-file "${index_file}" weibo -u 8221250887 -o ./weibo/

# bilibili
eto --prefix "_" --index-file "${index_file}" bilibili -f 49128283 -o ${clippers_dir}/bilibili/

# github
eto --prefix "_" --index-file "${index_file}" github -t ${clippers_dir}/.github/templates/github.md --output ${clippers_dir}/github/

# 4. 提交到 git
git add .

# 设置提交用户（CI)
git -c user.name="github-actions[bot]" \
    -c user.email="github-actions[bot]@users.noreply.github.com" \
    commit -m "ci: sync content for ${sat_date} [skip ci]"

git push origin main
