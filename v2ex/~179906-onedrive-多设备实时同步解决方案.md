---
comments: true
created: '2015-03-28T12:37:12'
draft: true
modified: '2015-03-28T12:37:12'
source: https://www.v2ex.com/t/179906
title: onedrive 多设备实时同步解决方案
type: archive-web
---

配置：
1、一个微软账号
2、多设备安装onedrive客户端
3、在PC-A把需要实时同步的文件夹位置，自定义为onedrive本地缓存中的指定文件夹，尽量把同步文件夹设置为脱机可用。
      比如把默认图片存储位置（C:\Users\username\Pictures）更改为（C:\Users\username\OneDrive\图片），设置好onedrive客户端的自动同步设置；在PC-B进行同样设置。
4、设置好hosts，确保onedrive能正常访问网络。

实现：
  ondrive根据数据大小自动判断更新，PC-A发现文件更新自动同步到网盘，PC-B发现网盘文件更新，自动创建本地副本。（更新速度秒数级）

  优势：自动化，多设备无缝链接 --------------- 在桌面新建一个指向C:\Users\username\OneDrive的文件夹，使用时把文件拖入该文件夹，即可在另一设备上实时查看（貌似比其他网盘还要少那么几个步骤）
            实时备份，确保文件安全 --------------- 设置好了的文件夹，内部文件一旦删改，不但可以在回收站获得一次还原机会，onedrive的回收站也会提供额外的一次还原机会
 
  劣势：onedrive自身在国内速度不佳，大文件同步慢；hosts。。。GFW 什么的 不多说