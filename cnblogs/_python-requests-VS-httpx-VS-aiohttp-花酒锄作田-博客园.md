---
created: '2025-09-03T11:22:49.963'
modified: '2025-09-03T11:22:49.963'
source: https://www.cnblogs.com/XY-Heruo/p/18924647
title: '[python]requests VS httpx VS aiohttp - 花酒锄作田 - 博客园'
type: archive-web
---

## 前言
前段时间想着把一个python服务的接口逐渐改成异步的，其中用到requests的地方就要改成httpx或者aiohttp，有点好奇异步请求相较于同步请求有哪些提升，遂做了点小实验。

首先有个服务A提供接口，这个接口会停顿1秒，模拟数据库操作。服务B去请求服务A的这个接口，并把响应返回给客户端C。服务B提供4个接口，这4个接口分别用requests、httpx同步、httpx异步和aiohttp去请求服务A。

客户端使用wrk做请求测试。

## 实现服务A
服务A使用Go编写，用标准库即可完成

先用wrk直接请求试试，以此作为基准

## 服务B: FastAPI
先用FastAPI做服务B试试

wrk请求结果。httpx不仅同步请求性能不如requests，没想到连异步请求性能也不如requests。而aiohttp以五倍多第二名的性能冠绝群雄。

异步比同步性能还差，着实有点费解，遂找大模型问了下，大模型回复说httpx默认配置参数不高，可以额外指定参数，还需要避免反复创建http client。似乎有点道理，但是同步性能不如开箱即用的requests，异步性能不如开箱即用的aiohttp，我为什么还要折腾httpx呢？

## 服务B: Flask
Flask 2.0 也支持异步接口，但是之前测试性能并不是很好，拉出来一并测试瞧瞧实力。

Flask 版本：3.1.1。因为gunicorn运行异步接口会报错，所以用的flask内置webserver。

测试结果。看来flask还是跟requests更搭，异步还不如同步。

## 服务B: Sanic
再用Sanic测试一遍

可能是我对Sanic了解不多，单就这个测试结果来看，Sanic根本不适合编写同步API。而且使用httpx异步请求的时候有大量报错，wrk结果显示Non-2xx or 3xx responses: 1244

## 服务B: Go
最后再用Go实现下请求

测试结果，和直接请求服务A差别不大。

## 小结
用python编写同步请求还是老老实实用requests，异步接口应该用aiohttp，httpx的性能只能说能用。
