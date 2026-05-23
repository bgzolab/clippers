---
comments: true
created: '2026-04-14T17:13:43'
draft: true
modified: '2026-04-14T17:13:43'
source: https://www.v2ex.com/t/1205833
title: Vercel 比 Cloudflare 贵几十倍，为什么你还在用？
type: archive-web
---

最近在做一个基于 Cloudflare 全家桶的 SaaS 模板，技术选型的时候对比了一圈，最后选了 CF Workers + D1 + R2 + KV + Queues + Cron 。免费额度就够跑通早期业务，Worker 每天 10 万次请求不要钱

但我发现一个现象：身边做独立开发的朋友，几乎清一色 Vercel + Supabase 。问他们为什么不用 Cloudflare ，回答基本是"没了解过""感觉是做 CDN 的"

Reddit 上有个创业公司 CTO 分享过，同样的前端应用，Vercel 账单从 $100/月涨到 $800/月，迁到 Cloudflare Workers 之后同样流量不到 $20 ，Lighthouse 分数还涨了
 ![]( https://i.imgur.com/9dbBQJp.png) 
 
Cloudflare 这两年变化确实很大：D1 数据库 GA 了，Queues 、Cron 、R2 基本上 SaaS 需要的基础设施全有了。当然也有问题——D1 单库 10GB 上限（不过大部分业务就存点元数据，瓶颈也不在这）、Workers CPU 时间限制、生态和文档不如 Vercel 成熟。

纯好奇，不是引战。。

---

做独立开发的朋友，或者对模板感兴趣的可以加我 v 一起交流：Z2xpZGVhMTIzCg==