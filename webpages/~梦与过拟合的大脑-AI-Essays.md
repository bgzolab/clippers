---
created: 2026-01-03T22:43:56
modified: 2026-01-03T22:43:56
description:
source: "https://ai.farmostwood.net/dream-and-overfitting-brain/"
tags:
type: "archive-web"
---
# 梦与过拟合的大脑 – AI Essays

今天读到了一个非常有趣的 idea。

背景是 Dwarkesh Patel 和 Andrej Karpathy 的一个 [对谈](https://www.dwarkesh.com/p/andrej-karpathy) ，里面提到了一个智能领域的常见问题：不管是人还是 AI，如果局限于自己的经验，用经验指导自己的行为， 又在这个行为的基础上累计经验，如此循环下去，最终总会崩溃（这里的「崩溃」不是心理意义上的，是智能层面上的）。一个健康的心智需要不断通过从不在自己经验范围内的世界（比如同他人的交谈，和与自己行为模式不符的人合作，etc.）获得外部熵来阻止这种崩溃。小孩还没有对生活过拟合，所以不太容易崩溃，而成年人崩溃的风险则越来越大。

以上是背景。下面是那个有趣的 idea，来自2021年的一篇 [paper](https://arxiv.org/abs/2007.09560) 。它的主旨是说：人类做梦是防止这种过度拟合和崩溃的一种方式。做梦之所以具有进化适应性，是因为它会让你置身于与你日常现实截然不同的奇特情境中，从而防止这种过度拟合。

这里有个鸡生蛋蛋生鸡的问题：既然过拟合体现为大脑无法学到分布外的规律，大脑是如何构建出这些分布外的梦境的？Hoel 的解释是梦的构建有一个非智能的 noise injection 步骤，这些随机噪声在白天建立的神经连接中渗透，产生奇异的、扭曲的、不连贯的 corrupted sensory inputs，从而把大脑从过拟合的陷阱中拯救出来。

虽然这只是一个假说（而且是一个非常新的理论），但我越想越觉得它非常精妙。按照这种视角，梦的价值不在于它的逼真，而恰恰在于它的不逼真——梦境与清醒时的经历（训练集）如此不同（但又不是纯粹意义上的噪声），所以才能迫使大脑学习到更具泛化性的表征而不是仅仅记忆真实经历本身。

梦通过不可能存在的反事实体验迫使我们更好地理解世界的本质。

---

参考文献 <sup><a href="https://ai.farmostwood.net/dream-and-overfitting-brain/#f8ef5378-f28a-4f8d-a5d2-01dce5864066">1</a></sup> <sup><a href="https://ai.farmostwood.net/dream-and-overfitting-brain/#d9ca97b8-e124-4156-aeaa-ac893d3a7e6f">2</a></sup> <sup><a href="https://ai.farmostwood.net/dream-and-overfitting-brain/#79c25d0c-6678-4ea4-bb84-5e2c53dd0e52">3</a></sup>

1. [The Overfitted Brain: Dreams evolved to assist generalization](https://arxiv.org/abs/2007.09560)  
	[↩︎](https://ai.farmostwood.net/dream-and-overfitting-brain/#f8ef5378-f28a-4f8d-a5d2-01dce5864066-link)
2. [The overfitted brain hypothesis](https://pubmed.ncbi.nlm.nih.gov/34027504/)  
	[↩︎](https://ai.farmostwood.net/dream-and-overfitting-brain/#d9ca97b8-e124-4156-aeaa-ac893d3a7e6f-link)
3. [Do Agents Dream of Electric Sheep?: Improving Generalization in Reinforcement Learning through Generative Learning](https://arxiv.org/abs/2007.09560)  
	[↩︎](https://ai.farmostwood.net/dream-and-overfitting-brain/#79c25d0c-6678-4ea4-bb84-5e2c53dd0e52-link)
