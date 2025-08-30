---
aliases:
  - Linux 系统如何设置开机自动运行脚本？
  - ~Linux 系统如何设置开机自动运行脚本 - 良许 Linux- 博客园
created: 2025-07-21T10:12:54
modified: 2025-08-30T22:47:27
source: https://www.cnblogs.com/yychuyu/p/13095732.html
title: Linux 系统如何设置开机自动运行脚本？
type: archive-web
---

# Linux 系统如何设置开机自动运行脚本？

[![](https://img2024.cnblogs.com/blog/35695/202508/35695-20250830122018806-1574270965.jpg)](https://developer.huawei.com/consumer/cn/activity/digixActivity/digixcmsdetail/101750143863263087?ha_source=BKYQ3&ha_sourceId=89000408)

大家好，我是良许。

在工作中，我们经常有个需求，那就是在系统启动之后，自动启动某个脚本或服务。在 Windows 下，我们有很多方法可以设置开机启动，但在 Linux 系统下我们需要如何操作呢？

Linux 下同样可以设置开机启动，但可能需要我们敲一些命令（可能也有 UI 界面的设置方法，但我不熟，我更多是玩命令）。下面我们就介绍三种简单但可行的开机启动设置方法。

## 方法一：修改 /etc/rc.d/rc.local 文件

`/etc/rc.d/rc.local` 文件会在 Linux 系统各项服务都启动完毕之后再被运行。所以你想要自己的脚本在开机后被运行的话，可以将自己脚本路径加到该文件里。

但是，首先需要确认你有运行这个文件的权限。

```shell
$ chmod +x /etc/rc.d/rc.local
```

为了演示，我们创建了一个脚本，当它被执行之后，将在家目录下写入有特定信息的文件。

```bash
$ vim auto_run_script.sh

#!/bin/bash
date >> /home/alvin/output.txt
hostname >> /home/alvin/output.txt
```

保存退出后，再给它赋予可执行权限：

```shell
$ chmod +x auto_run_script.sh
```

然后，我们再将脚本添加到 `/etc/rc.d/rc.local` 文件最后一行：

```bash
$ vim /etc/rc.d/rc.local

/home/alvin/auto_run_script.sh
```

接下来，我们就可以试试效果了。直接重启系统就可以了：

```ruby
$ sudo reboot
```

重启之后，就会在家目录下看到脚本执行的结果了。

![](https://img2020.cnblogs.com/other/1218435/202006/1218435-20200611200127576-847844743.jpg)

## 方法二：使用 Crontab

大家知道，crontab 是 Linux 下的计划任务，当时间达到我们设定的时间时，可以自动触发某些脚本的运行。

我们可以自己设置计划任务时间，然后编写对应的脚本。但是，有个特殊的任务，叫作 `@reboot` ，我们其实也可以直接从它的字面意义看出来，这个任务就是在系统重启之后自动运行某个脚本。

那它将运行的是什么脚本呢？我们如何去设置这个脚本呢？我们可以通过 `crontab -e` 来设置。

```ruby
$ crontab -e

@reboot /home/alvin/auto_run_script.sh
```

然后，直接重启即可。运行的效果跟上面类似。

## 方法三：使用 Systemd 服务

以上介绍的两种方法，在任何 Linux 系统上都可以使用。但本方法仅适用于 systemd 系统。如何区分是不是 systemd 系统？很简单，只需运行 `ps aux` 命令，查看 pid 为 1 的进程是不是 systemd 。

![](https://img2020.cnblogs.com/other/1218435/202006/1218435-20200611200127764-130976795.jpg)

为了实现目的，我们需要创建一个 systemd 启动服务，并把它放置在 `/etc/systemd/system/` 目录下。

我们创建的 systemd 启动服务如下。请注意，这时后缀是 `.service` ，而不是 `.sh` 。

```csharp
$ vim auto_run_script.service

[Unit]
Description=Run a Custom Script at Startup
After=default.target

[Service]
ExecStart=/home/alvin/auto_run_script.sh

[Install]
WantedBy=default.target
```

从服务的内容可以看出来，我们最终还是会调用 /home/alvin/auto\_run\_script.sh 这个脚本。

然后，我们再把这个脚本放置在 `/etc/systemd/systerm/` 目录下，之后我们再运行下面两条命令来更新 systemd 配置文件，并启动服务。

```shell
$ systemctl daemon-reload
$ systemctl enable auto_run_script.service
```

万事俱备之后，我们就可以重启系统啦。

```ruby
$ reboot
```
