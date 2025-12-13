---
comments: true
created: '2023-11-27T08:38:53'
draft: true
modified: '2023-11-27T08:44:21'
source: https://www.v2ex.com/t/995403
title: jdbc 执行批量 update 的效率问题
type: archive-web
---

最近客户要对数据库存储的数据做国密改造，提供了相关的加密 sdk ，原来的数据库表存储的数据要升级成密文。
现在就想用原生的 jdbc 读出数据原文加密后存再进去，但是执行 batchexecute()的方法一次 1000 条，发现巨慢，按我查到都是推荐批量更新，但我这个就是巨慢。然后搞了测试表，结构里的索引什么的都删了还是慢。
数据库情况：postgre ，单表有 100+W 的数据，加密更新四五个字段
代码大致： 

        connection.setAutoCommit(false);
        PreparedStatement preparedStatement = connection.prepareStatement("update users set name = ? where id = ?");

		for(int =i;i<res.length;i<1000){
        	preparedStatement.setString(1, "John");
        	preparedStatement.setInt(2, 1);
        	preparedStatement.batchadd()
        }
        

        preparedStatement.executeBatch();
        connection.commit();
        

这个哪位有好的优化思路吗，或者别的方案