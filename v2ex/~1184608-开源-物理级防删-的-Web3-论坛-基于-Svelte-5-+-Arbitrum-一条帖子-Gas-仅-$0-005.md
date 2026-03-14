---
comments: true
created: '2026-01-11T13:21:29'
draft: true
modified: '2026-01-11T13:29:45'
source: https://www.v2ex.com/t/1184608
title: '[开源] “物理级防删”的 Web3 论坛，基于 Svelte 5 + Arbitrum，一条帖子 Gas 仅 $0.005'
type: archive-web
---

这是继半年前 [StoneText]( https://www.v2ex.com/t/966838) 之后的又一次 Web3 实验。
这次不仅仅是刻字，而是构建了一个**极度极简**的去中心化论坛 —— **Chain Talk**。

### 核心特性
Chain Talk 没有任何传统后端，也没有数据库。
所有的帖子内容、回复关系，全部存储在 Arbitrum One 链上。

这意味着：
1.  **物理级防删**：没有 `delete` 接口。只要交易打包上链，这行字就永远刻在那里，神仙也删不掉（我也删不掉）。
2.  **零门槛围观**：为了解决 Web3 的交互门槛，我做了**Web 只读模式**，路人无需钱包、无需登录即可围观所有内容。
3.  **极低成本**：得益于 Arbitrum L2 ，目前发一条帖子的 Gas 约 $0.005 (400 个字符)，这让“永存”变得稍微没那么奢侈。

### ⚡ 技术栈

*   **Frontend**: **Svelte 5 (Runes Mode)** - 彻底抛弃了 store ，全用 runes 做状态管理，开发体验极其丝滑，推荐前端同学看看。
*   **Build**: Vite + **TailwindCSS 4**
*   **Contract**: Solidity 0.8.30 + UUPS Proxy 。
*   **Interaction**: Ethers.js v6 。

### 为什么做这个？
我们在这个“404 时代”失去了太多东西。
我想看看，用不到 500 行的核心代码，能不能构建一个“永不塌陷”的避难所。

关于大家可能关心的 **Spam/广告问题**：
这确实是去中心化社交最大的挑战。目前的防线只有 Gas 费。前端我会做一些基础的过滤（比如折叠明显的垃圾号），但链上数据是无法抹除的。这本身也是实验的一部分：在一个绝对自由且低成本的广场上，内容质量会如何演化？

### 传送门

👉 **Demo**: https://chain-talk.netlify.app/

👉 **Source Code**: https://github.com/picasso250/chain-talk

👉 **Contract**: [`0xb9A8...6380`]( https://arbiscan.io/address/0xb9A8A83c8e599E19ad2E3E1C66721A63d2076380)

---
*P.S. 目前合约保留了 Admin 升级权限以修复 Bug （毕竟钱还是要在意的），稳定后会销毁 Key 。欢迎来挖坟，或者留下你的第一条“永恒”记录。*