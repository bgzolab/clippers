---
draft: true
title: torne/Tiny-Tiny-RSS
aliases: Tiny-Tiny-RSS
created: 2024-05-24
modified: 2025-04-04T10:11:58
description: A PHP and Ajax feed reader
source: https://github.com/torne/Tiny-Tiny-RSS
tags:
  - github/star
type: tool
document:
status: tool/deprecated
---

![](https://img.shields.io/github/stars/torne/Tiny-Tiny-RSS?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/torne/Tiny-Tiny-RSS?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/torne/Tiny-Tiny-RSS?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=torne&repo=Tiny-Tiny-RSS&bg_color=00000000)](https://github.com/torne/Tiny-Tiny-RSS)

## Notes


## Why
## How
  - Using [[docker]] install and run
```shell
      $ sudo dockerd
      $ docker run -d --name ttrssdb nornagon/postgres
      $ docker run -d --link ttrssdb:db -p <port>:80 -e SELF_URL_PATH=http://<ttrss_domain>:<port> fischerman/docker-ttrss
      # again start docker
      $ sudo docker start ttrssdb
      $ sudo docker run -d --link ttrssdb:db -p 4040:80 -e SELF_URL_PATH=http://127.0.0.1:4040 fischerman/docker-ttrss
      #---
      $ sudo docker-compose --env .env up -d
```
      - `<ttrss_domain>`: 主机上给 ttrss 服务的预设地址
      - `<port>`: 对外的服务端口
      - `--env` is environment each we deploy. mainly to replace `${HTTP_PROXY}` in ` docker-compose.yml`
```yaml
          environment:
            ...
            - HTTP_PROXY=${HTTP_PROXY}
```
      - we see `.env` file like this, each I open the terminal proxy I will refreah this file using zsh. (cause wsl2's Ip is not fixed.
```she
          $ cat .env
          HTTP_PROXY=172.27.176.1:7890
```
        - via: https://dockerdocs.cn/compose/environment-variables/
      - BTW, _SICK BAIDU SOURCE_ !!! when I pull some image from them but it unexpectedly is stucked?!!!
    - 换源
      - via: https://cloud.tencent.com/developer/article/1769231
```shell
        $ sudo vim /etc/docker/daemon.json
        {
        "registry-mirrors": [
            "https://ustc-edu-cn.mirror.aliyuncs.com/"
        ]
        }
        $ service docker restart
```
    - Debug
```shell
        #When Deploy is error, stop it and redeploy it!
        $ docker-compose down
        $ docker-compose rm # 删除已停止的 Docker 容器 ???
        $ docker-compose up -d
```
    - 备份恢复
      - `docker save` 将指定镜像保存成 tar 归档文件。
```shell
        docker save [OPTIONS] IMAGE [IMAGE...]
        docker save -o /root/mycentos7.tar mycentos:7
```
        `-o`:镜像打包后的归档文件输出的目录
      - `docker load` 导入 docker save 命令导出的镜像归档文件。
```shell
        docker load [OPTIONS]
        docker load -i mycentos7.tar
```
        `--input, -i`: 指定导入的文件;
        `--quiet, -q`: 精简输出信息。
    - 代理
```shell
        openProxy(){
            host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
            export ALL_PROXY="http://$host_ip:7890"
            echo "{
        "proxies":
        {
           "default":
           {
             "httpProxy": "http://$host_ip:7890",
             "httpsProxy": "http://$host_ip:7890",
             "noProxy": "localhost"
           }
        }
        }" > .docker/config.json
            echo "HTTP Proxy on"
        }
```
    - Bug
      - deploy in [[wsl]]
        - Fucking ___VM Network___!!! So you cannot visit using LAN IP, which you just only use it on your PC(using 127.0.0.1)!!! So next you should set ___port forwarding___ on win10.  The startup see more deatails on [here-csdn](https://blog.csdn.net/cf313995/article/details/108871531). Shortly like following:
```shell
          # on wsl
          ip addr show eth0
          # get v4ip likely: 192.168.97.228/20 ->  192.168.97.228, then switch windows ps
          sudo netsh interface portproxy add v4tov4 listenport=4040 listenaddress=0.0.0.0 connectport=4040 connectaddress=192.168.97.228 protocol=tcp
          # or -> sudo netsh interface portproxy add v4tov4 listenport=4040 listenaddress=* connectport=4040 connectaddress=192.168.97.228 protocol=tcp
          # check what you set
          netsh interface portproxy show all
```
        - Then if everything work well, you'll be able to visit your PC LAN IP to visit TTRSS. But on my machine it still not work. That's really wired... Open `firewall & network protection` -> `advanced settings` -> `inbound rules `-> `new rules`: `port`  -> `TCP&&4040` -> `defalut`...
        - Then everything work well for me. Nice🍻
  - [ ] 怎么删除多出来文件, 自己练手的几个 docker 啊...  
  - [ ] windows 安装了 docker, 如何迁移自己的数据啊  
    - [ ] [🎯 备份和迁移数据 - Docker 快速入门 - 易文档](https://docker.easydoc.net/doc/81170005/cCewZWoN/XQEqNjiu)  
  - [ ] `build` vs `run` vs `up`  
  - [ ] how to use https://github.com/HobaiRiku/wsl2-auto-portproxy  
  - [ ] dockerd vs containerd  
  - [ ] log in `/var/www/log`  
  - [ ] `localhost` vs `127.0.0.1` vs `0.0.0.0`  
    localhost其實是域名，一般windows系統默認將localhost指向127.0.0.1，但是localhost並不等於127.0.0.1，localhost指向的IP地址是可以配置的
    凡是以127開頭的IP地址，都是迴環地址（Loop back address），其所在的迴環接口一般被理解爲虛擬網卡，並不是真正的路由器接口; 所謂的迴環地址，通俗的講，就是我們在主機上發送給127開頭的IP地址的數據包會被髮送的主機自己接收，根本傳不出去，外部設備也無法通過迴環地址訪問到本機。
    0.0.0.0是不能被ping通的。在服務器中，0.0.0.0並不是一個真實的的IP地址，它表示本機中所有的IPV4地址。監聽0.0.0.0的端口，就是監聽本機中所有IP的端口
  - [ ] 老毛子的去广告等等设置, 怎么开命令行, 怎么最大化利用路由...  
```
    sudo docker-compose --env .env up -d
    sudo docker ps
    sudo docker exec -it 8889c3fc75e9 sh
```
  - [ ] wsl `df -TH` 挂载的那四个东西是什么...  
  - [ ] [老毛子AdGuardhome密码修改后登陆不了 - Padavan - 恩山无线论坛 - Powered by Discuz!](https://www.right.com.cn/forum/thread-1528262-1-1.html)  
## What
## Reference
  - [Install Docker Compose | Docker Documentation](https://docs.docker.com/compose/install/)
    - [Docker 1小时快速上手教程，无废话纯干货_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV11L411g7U1)
  - [Awesome-TTRSS · HenryQW/Awesome-TTRSS](https://github.com/HenryQW/Awesome-TTRSS/blob/main/docs/zh/README.md)
    - also thx [Tiny Tiny RSS：最速部署私有 RSS 服务器 - Spencer's Blog](https://spencerwoo.com/blog/tiny-tiny-rss#an-zhuang-docker-compose)
    - [如何在局域网的其他主机上中访问本机的WSL2 - 知乎](https://zhuanlan.zhihu.com/p/425312804)
    - [Docker的三种网络代理配置 · 零壹軒·笔记](https://note.qidong.name/2020/05/docker-proxy/)
  - [ubuntu - Docker System has not been booted with systemd as init system - Stack Overflow](https://stackoverflow.com/questions/59466250/docker-system-has-not-been-booted-with-systemd-as-init-system)
  - [Tiny tiny Rss的安装和使用 - 魔芋红茶's blog](https://blog.icexmoon.xyz/archives/135.html)
  - [Install Docker Compose | Docker Documentation](https://docs.docker.com/compose/install/)
  - [docker 容器内使用宿主机的代理配置 | Zach Ke's Notes](https://kebingzao.com/2019/02/22/docker-container-proxy/)
-