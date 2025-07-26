---
aliases:
  - "onedrive"
  - Onedrive for linux
  - OneDrive for linux
created: 2025-03-17T21:19:14
description: "OneDrive Client for Linux"
modified: 2025-07-22T06:28:30
source: "https://github.com/abraunegg/onedrive"
tags:
  - "github/star"
tags-link:
title: OneDrive for linux
type: "repo"
---

# OneDrive for linux

## Repo Meta

![](https://img.shields.io/github/stars/abraunegg/onedrive?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/abraunegg/onedrive?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/abraunegg/onedrive?style=for-the-badge&label=since)

[![](https://github-readme-stats.vercel.app/api/pin/?username=abraunegg&repo=onedrive&bg_color=00000000)](https://github.com/abraunegg/onedrive)

## Install

> [!help]
> 我不理解为什么 Github 不提供构建的包，还需要每个系统自己去添加源，然后再安装，直接提供对应版本的应用，放在根目录下不好吗？升级直接替换就行了，对宿主机无侵入。

### [[skills/devops/docker|docker]]

https://hub.docker.com/r/driveone/onedrive 失败了

### [[mint]] 22 -> Ubuntu 24

```shell
~/Onedrive > wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_24.04/Release.key | gpg --dearmor | sudo tee /usr/share/keyrings/obs-onedrive.gpg > /dev/null

~/Onedrive > echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_24.04/ ./" | sudo tee /etc/apt/sources.list.d/onedrive.list
deb [arch=amd64 signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_24.04/ ./

~/Onedrive > sudo apt-get update                                                                                 
忽略:1 https://mirrors.tuna.tsinghua.edu.cn/linuxmint wilma InRelease
...
获取:60 https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_24.04 ./ Packages [841 B]
已下载 12.3 MB，耗时 5秒 (2,330 kB/s)
正在读取软件包列表... 完成

~/Onedrive > sudo apt install --no-install-recommends --no-install-suggests onedrive                             
将会同时安装下列软件：
  libphobos2-ldc-shared106
下列【新】软件包将被安装：
  libphobos2-ldc-shared106 onedrive
升级了 0 个软件包，新安装了 2 个软件包，要卸载 0 个软件包，有 587 个软件包未被升级。
需要下载 2,327 kB 的归档。
解压缩后会消耗 9,982 kB 的额外空间。
您希望继续执行吗？ [Y/n] y

~/Onedrive > onedrive --version                                                                                  
onedrive v2.5.6-1+np1+1.1
```

via: https://github.com/abraunegg/onedrive/blob/master/docs/ubuntu-package-install.md#distribution-ubuntu-2404

## Usage

### Auth

```shell
~/Onedrive > onedrive                                                                                            
WARNING: D-Bus message bus daemon is not available; GUI notifications are disabled

WARNING: Your cURL/libcurl version (8.5.0) has known HTTP/2 bugs that impact the use of this client.
         Please report this to your distribution, requesting an update to a newer cURL version, or consider upgrading it yourself for optimal stability.
         Downgrading all client operations to use HTTP/1.1 to ensure maximum operational stability.
         Please read https://github.com/abraunegg/onedrive/blob/master/docs/usage.md#compatibility-with-curl for more information.

Using IPv4 and IPv6 (if configured) for all network operations
Attempting to contact Microsoft OneDrive Login Service
Successfully reached Microsoft OneDrive Login Service
Configuring Global Azure AD Endpoints
Authorise this application by visiting:

https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=d50c616-12c519384f0c&scope=Files.ReadWrite%20Files.ReadWrite.All%20Sites.ReadWrite.All%20offline_access&response_type=code&prompt=login&redirect_uri=https://login.microsoftonline.com/common/oauth2/nativeclient

Enter the response uri from your browser: https://login.microsoftonline.com/common/oauth2/nativeclient?code=xxx

The application has been successfully authorised, but no extra command options have been specified.

Please use 'onedrive --help' for further assistance in regards to running this application.
```

### Curl Version Problem

```shell
~/Onedrive > onedrive --display-config                                                                           

WARNING: Your cURL/libcurl version (8.5.0) has known HTTP/2 bugs that impact the use of this client.
         Please report this to your distribution, requesting an update to a newer cURL version, or consider upgrading it yourself for optimal stability.
         Downgrading all client operations to use HTTP/1.1 to ensure maximum operational stability.
         Please read https://github.com/abraunegg/onedrive/blob/master/docs/usage.md#compatibility-with-curl for more information.

Application version                          = onedrive v2.5.6-1+np1+1.1
Compiled with                                = LDC 2106
Curl version                                 = libcurl/8.5.0 OpenSSL/3.0.13 zlib/1.3 brotli/1.1.0 zstd/1.5.5 libidn2/2.3.7 libpsl/0.21.2 (+libidn2/2.3.7) libssh/0.10.6/openssl/zlib nghttp2/1.59.0 librtmp/2.3 OpenLDAP/2.6.7
User Application Config path                 = /home/bgzo/.config/onedrive
System Application Config path               = /etc/onedrive
Applicable Application 'config' location     = /home/bgzo/.config/onedrive/config
Configuration file found in config location  = false - using application defaults
Applicable 'sync_list' location              = /home/bgzo/.config/onedrive/sync_list
Applicable 'items.sqlite3' location          = /home/bgzo/.config/onedrive/items.sqlite3
Config option 'drive_id'                     = 
Config option 'sync_dir'                     = ~/OneDrive
Config option 'use_intune_sso'               = false
Config option 'use_device_auth'              = false
Config option 'enable_logging'               = false
Config option 'log_dir'                      = /var/log/onedrive
Config option 'disable_notifications'        = false
Config option 'skip_dir'                     = 
Config option 'skip_dir_strict_match'        = false
Config option 'skip_file'                    = ~*|.~*|*.tmp|*.swp|*.partial
Config option 'skip_dotfiles'                = false
Config option 'skip_symlinks'                = false
Config option 'monitor_interval'             = 300
Config option 'monitor_log_frequency'        = 12
Config option 'monitor_fullscan_frequency'   = 12
Config option 'read_only_auth_scope'         = false
Config option 'dry_run'                      = false
Config option 'upload_only'                  = false
Config option 'download_only'                = false
Config option 'local_first'                  = false
Config option 'check_nosync'                 = false
Config option 'check_nomount'                = false
Config option 'resync'                       = false
Config option 'resync_auth'                  = false
Config option 'cleanup_local_files'          = false
Config option 'disable_permission_set'       = false
Config option 'transfer_order'               = default
Config option 'classify_as_big_delete'       = 1000
Config option 'disable_upload_validation'    = false
Config option 'disable_download_validation'  = false
Config option 'bypass_data_preservation'     = false
Config option 'no_remote_delete'             = false
Config option 'remove_source_files'          = false
Config option 'sync_dir_permissions'         = 700
Config option 'sync_file_permissions'        = 600
Config option 'space_reservation'            = 52428800
Config option 'permanent_delete'             = false
Config option 'write_xattr_data'             = false
Config option 'application_id'               = d50ca740-c83f-4d1b-b616-12c519384f0c
Config option 'azure_ad_endpoint'            = 
Config option 'azure_tenant_id'              = 
Config option 'user_agent'                   = ISV|abraunegg|OneDrive Client for Linux/v2.5.6-1+np1+1.1
Config option 'force_http_11'                = true
Config option 'debug_https'                  = false
Config option 'rate_limit'                   = 0
Config option 'operation_timeout'            = 3600
Config option 'dns_timeout'                  = 60
Config option 'connect_timeout'              = 10
Config option 'data_timeout'                 = 60
Config option 'ip_protocol_version'          = 0
Config option 'threads'                      = 8
Config option 'max_curl_idle'                = 120
Environment var 'XDG_RUNTIME_DIR'            = true
Environment var 'DBUS_SESSION_BUS_ADDRESS'   = true
Config option 'notify_file_actions'          = false
Config option 'use_recycle_bin'              = false
Config option 'recycle_bin_path'             = /home/bgzo/.local/share/Trash/

Selective sync 'sync_list' configured        = false

Config option 'sync_business_shared_items'   = false

Config option 'webhook_enabled'              = false
```

目前什么都没有管

### Config

```shell
~/Onedrive > wget https://raw.githubusercontent.com/abraunegg/onedrive/master/config -O ~/.config/onedrive/config
--2025-07-20 00:00:26--  https://raw.githubusercontent.com/abraunegg/onedrive/master/config
正在连接 127.0.0.1:10800... 已连接。
已发出 Proxy 请求，正在等待回应... 200 OK
长度： 9797 (9.6K) [text/plain]
正在保存至: ‘/home/bgzo/.config/onedrive/config’

/home/bgzo/.config/onedrive/ 100%[============================================>]   9.57K  --.-KB/s    用时 0.008s

2025-07-20 00:00:31 (1.10 MB/s) - 已保存 ‘/home/bgzo/.config/onedrive/config’ [9797/9797])

```

## References

- https://github.com/abraunegg/onedrive/blob/master/docs/usage.md
