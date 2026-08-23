#!/usr/bin/env bash
# gk-unlock —— 无头解锁 gnome-keyring 登录密钥环（每次重启后执行一次）
set -euo pipefail

if gdbus call --session --dest org.freedesktop.secrets \
	--object-path /org/freedesktop/secrets/collection/login \
	--method org.freedesktop.DBus.Properties.Get org.freedesktop.Secret.Collection Locked 2>/dev/null | grep -q '(<false>'; then
	echo "密钥环已经是解锁状态，无需操作"
	exit 0
fi

# 密码从外部传入：参数 $1 或环境变量 GK_PASSWD，二者皆可用
passwd="${1:-${GK_PASSWD:-}}"
if [[ -z "$passwd" ]]; then
	echo "用法: $0 <密码>   或   GK_PASSWD=<密码> $0" >&2
	exit 2
fi

# 停掉当前锁定状态的 daemon（-f 匹配完整命令行，进程名被截断为 gnome-keyring-d）
# 注意：匹配裸名，否则杀不掉由脚本启动的 daemon（其 cmdline 无 /usr/bin/ 前缀）
pkill -u "$USER" -f 'gnome-keyring-daemon' 2>/dev/null || true
sleep 1

# 用密码重启并解锁（密码走 stdin，不落历史、不上屏）
# 注意：只有 --unlock 才会从 stdin 读密码；--start 与之互斥，单独用 --start 不读密码。
# read_login_password 会把 stdin 里包括换行在内的所有字节当作密码（见 gkd-login.c
# 原样使用、不剥换行），因此必须用 printf '%s'（无换行），否则尾部多一个 \n 永远解锁失败。
printf '%s' "$passwd" | gnome-keyring-daemon --unlock --replace \
	--components=pkcs11,secrets --daemonize >/dev/null 2>&1

unset passwd

sleep 1
if gdbus call --session --dest org.freedesktop.secrets \
	--object-path /org/freedesktop/secrets/collection/login \
	--method org.freedesktop.DBus.Properties.Get org.freedesktop.Secret.Collection Locked | grep -q '(<false>'; then
	echo "密钥环已解锁"
else
	echo "解锁失败：密码错误或 daemon 启动异常"
	exit 1
fi
