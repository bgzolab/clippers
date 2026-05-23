---
title: "Dod-o/Statistical-Learning-Method_Code"
aliases: Statistical-Learning-Method_Code
released: 2018-11-15T15:33:17Z
modified: 2026-05-23T18:11:52
created: 2026-05-23T18:11:52
description: "手写实现李航《统计学习方法》书中全部算法"
source: "https://github.com/Dod-o/Statistical-Learning-Method_Code"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/Dod-o/Statistical-Learning-Method_Code?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/Dod-o/Statistical-Learning-Method_Code?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/Dod-o/Statistical-Learning-Method_Code?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=Dod-o&repo=Statistical-Learning-Method_Code&bg_color=00000000)](https://github.com/Dod-o/Statistical-Learning-Method_Code)


# Statistical-Learning-Method_Code

手写实现李航《统计学习方法》书中全部算法

## README

## 【广告位-AI 工具推荐】学术研究必备 - GreatRouter 大模型 API 服务
  正在用 大模型 做研究？论文写作、代码调试、数据分析都需要 AI 辅助？

  [**GreatRouter**](https://www.greatrouter.com/) 提供更实惠的 大模型 API 服务：
  - 🎓 **学术用户专享 8 折**：比官方便宜 20%（需学术认证）
  - 💰 **注册送 $3**：足够测试 Claude 3.5 约 1000 次对话
  - 🛡️ **质量保障**：蜜罐测试，与官方结果不一致赔付 10 倍
  - 💳 **微信支付**：无需信用卡，余额永不过期
  - 🌐 **支持 41+ 模型**：OpenAI、Anthropic、DeepSeek、xAI 等
 
→ [立即试用](https://www.greatrouter.com/)

---
前言
====

力求每行代码都有注释，重要部分注明公式来源。具体会追求下方这样的代码，学习者可以照着公式看程序，让代码有据可查。

![image](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/CodePic.png)

    
如果时间充沛的话，可能会试着给每一章写一篇博客。先放个博客链接吧：[传送门](http://www.pkudodo.com/)。    

##### 注：其中Mnist数据集已转换为csv格式，由于体积为107M超过限制，改为压缩包形式。下载后务必先将Mnist文件内压缩包直接解压。  

### 【Updates】
**书籍出版**：目前已与**人民邮电出版社**签订合同，未来将结合该repo整理出版机器学习实践相关书籍。同时会在book分支中对代码进行重构，欢迎在issue中提建议！同时issue中现有的问题也会考虑进去。（Feb 12 2022）

**线下培训**：女朋友计划近期开办**ML/MLP/CV线下培训班**，地点**北上广深杭**，目标各方向**快速入门**，正在筹备。这里帮她打个广告，可以添加微信15324951814（备注线下培训）。本人也会被拉过去义务评估课程质量。。。（Feb 12 2022）

**无监督部分更新**：部分**无监督**算法已更新！！！ 该部分由[Harold-Ran](https://github.com/Harold-Ran)提供，在此感谢！ 有其他算法补充的同学也欢迎添加我微信并pr！（Jan 27 2021）
       
实现
======

## 监督部分

### 第二章 感知机：
博客：[统计学习方法|感知机原理剖析及实现](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/blogs/%E6%84%9F%E7%9F%A5%E6%9C%BA%E5%8E%9F%E7%90%86%E5%89%96%E6%9E%90%E5%8F%8A%E5%AE%9E%E7%8E%B0.pdf)      
实现：[perceptron/perceptron_dichotomy.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/perceptron/perceptron_dichotomy.py)
      
### 第三章 K近邻：
博客：[统计学习方法|K近邻原理剖析及实现](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/blogs/K%E8%BF%91%E9%82%BB%E5%8E%9F%E7%90%86%E5%89%96%E6%9E%90%E5%8F%8A%E5%AE%9E%E7%8E%B0.pdf)      
实现：[KNN/KNN.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/KNN/KNN.py)
      
### 第四章 朴素贝叶斯：
博客：[统计学习方法|朴素贝叶斯原理剖析及实现](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/blogs/%E6%9C%B4%E7%B4%A0%E8%B4%9D%E5%8F%B6%E6%96%AF%E5%8E%9F%E7%90%86%E5%89%96%E6%9E%90%E5%8F%8A%E5%AE%9E%E7%8E%B0.pdf)      
实现：[NaiveBayes/NaiveBayes.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/NaiveBayes/NaiveBayes.py)    
      
### 第五章 决策树：
博客：[统计学习方法|决策树原理剖析及实现](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/blogs/%E5%86%B3%E7%AD%96%E6%A0%91%E5%8E%9F%E7%90%86%E5%89%96%E6%9E%90%E5%8F%8A%E5%AE%9E%E7%8E%B0.pdf)      
实现：[DecisionTree/DecisionTree.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/DecisionTree/DecisionTree.py)    
      
### 第六章 逻辑斯蒂回归与最大熵模型：       
博客：逻辑斯蒂回归：[统计学习方法|逻辑斯蒂原理剖析及实现](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/blogs/%E9%80%BB%E8%BE%91%E6%96%AF%E8%92%82%E5%8E%9F%E7%90%86%E5%89%96%E6%9E%90%E5%8F%8A%E5%AE%9E%E7%8E%B0.pdf)        
博客：最大熵：[统计学习方法|最大熵原理剖析及实现](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/blogs/%E6%9C%80%E5%A4%A7%E7%86%B5%E5%8E%9F%E7%90%86%E5%89%96%E6%9E%90%E5%8F%8A%E5%AE%9E%E7%8E%B0.pdf)        

实现：逻辑斯蒂回归：[Logistic_and_maximum_entropy_models/logisticRegression.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/Logistic_and_maximum_entropy_models/logisticRegression.py)    
实现：最大熵：[Logistic_and_maximum_entropy_models/maxEntropy.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/Logistic_and_maximum_entropy_models/maxEntropy.py)       
      
### 第七章 支持向量机：    
博客：[统计学习方法|支持向量机(SVM)原理剖析及实现](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/blogs/%E6%94%AF%E6%8C%81%E5%90%91%E9%87%8F%E6%9C%BA(SVM)%E5%8E%9F%E7%90%86%E5%89%96%E6%9E%90%E5%8F%8A%E5%AE%9E%E7%8E%B0.pdf)      
实现：[SVM/SVM.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/SVM/SVM.py)    
      
### 第八章 提升方法：
实现：[AdaBoost/AdaBoost.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/AdaBoost/AdaBoost.py)    
      
### 第九章 EM算法及其推广：
实现：[EM/EM.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/EM/EM.py)    
      
### 第十章 隐马尔可夫模型：
实现：[HMM/HMM.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/HMM/HMM.py)    

## 无监督部分

### 第十四章 聚类方法
实现：[K-means_Clustering.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/Clustering/K-means_Clustering/K-means_Clustering.py)

实现：[Hierachical_Clustering.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/Clustering/Hierachical_Clustering/Hierachical_Clustering.py)

### 第十六章 主成分分析
实现：[PCA.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/PCA/PCA.py)

### 第十七章 潜在语意分析
实现：[LSA.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/LSA/LSA.py)

### 第十八章 概率潜在语意分析
实现：[PLSA.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/PLSA/PLSA.py)

### 第二十章 潜在狄利克雷分配
实现：[LDA.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/LDA/LDA.py)

### 第二十一章 PageRank算法
实现：[Page_Rank.py](https://github.com/Dod-o/Statistical-Learning-Method_Code/blob/master/Page_Rank/Page_Rank.py)


## 许可 / License
本项目内容许可遵循[Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/)。

The content of this project itself is licensed under the [Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

联系
======
欢迎pr，有疑问也可通过issue、微信或邮件联系。      
此外如果有需要**MSRA**实习内推的同学，欢迎骚扰。             
**Wechat:** lvtengchao（备注“blog-学校/单位-姓名”）      
**Email:** lvtengchao@pku.edu.cn      


项目历史
======
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=Dod-o/Statistical-Learning-Method_Code&type=Date&theme=dark" />
  <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=Dod-o/Statistical-Learning-Method_Code&type=Date" />
  <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=Dod-o/Statistical-Learning-Method_Code&type=Date" />
</picture>






## Notes

