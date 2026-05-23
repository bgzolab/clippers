---
created: '2021-09-23T15:24:06'
modified: '2025-10-22T16:36:47'
source: https://www.v2ex.com/t/803669
title: 'Casdoor: 具有 Web UI 界面的开源身份认证、单点登录平台，支持 GitHub、Gitee、QQ、微信、钉钉登录等'
type: archive-web
---

<div><h1>UI 优先的统一身份认证系统 Casdoor</h1>
<h2>Casdoor 是什么？</h2>
<p>Casdoor 是一个基于 OAuth 2.0 / OIDC 的 UI 优先集中认证 / 单点登录 (SSO) 平台，简单点说，就是 Casdoor 可以帮你解决 <strong>用户管理</strong> 的难题，你无需开发用户登录注册等与用户鉴权相关的一系列功能，只需几个步骤，简单配置，与你的主应用配合，便可完全托管你的用户模块，简单省心，功能强大。</p>
<p>仓库地址： <a href="https://github.com/casbin/casdoor" rel="nofollow">https://github.com/casbin/casdoor</a></p>
<p>演示地址： <a href="https://door.casbin.com/" rel="nofollow">https://door.casbin.com/</a></p>
<p>官网文档： <a href="https://casdoor.org/" rel="nofollow">https://casdoor.org/</a></p>
<p>Casdoor 目前作为 Casbin 社区项目统一使用的鉴权平台，项目已开源，希望得到大家的一些建议和 Star~，我们会及时跟进反馈并改正问题哒。</p>
<h2>为什么要用 Casdoor ？</h2>
<p>用户管理一直是项目中非常令人头疼的一个问题，不仅要确保安全性，功能是否完整，方便使用也十分重要。目前大多数应用已从过去单一的账号密码登录，逐渐升级为允许通过第三方平台登录，例如 GitHub 、微信、QQ 等。但是这一套逻辑依然需要开发者去实现，大多数功能偏离了业务。</p>
<p>Casdoor 就是替开发者们解决这个难题，即 <strong>提供一套统一的鉴权平台，只需要简单配置便可完全托管用户模块</strong>。</p>
<p>使用的理由也非常简单，总结概括为三句话：</p>
<ul>
<li>功能完备，操作简单。作为一个需要完全托管用户模块的项目，功能完备必不可少，Casdoor 支持常见用户模块所需要的各种功能。并且配置简单，上手难度低。</li>
<li>开源可控，社区活跃。能否快速得到社区的反馈，解决实际应用中出现的问题也十分重要，否则出了 Bug 没人管岂不是尴尬？ Casdoor 有自己的讨论社区 Casnode，也有 QQ 群，均可及时活跃地解决实际应用中的问题。</li>
<li>性能强大，耦合良好。采用 Golang 开发，并发性支持良好，并且内部模块耦合度低，代码易懂，热插拔性好。</li>
</ul>
<h2>Casdoor 又有哪些特性？</h2>
<ul>
<li>支持普通的账户密码注册登录，也支持各种常见的第三方认证，例如 GitHub 、Facebook 、Google 、Wechat 、QQ 、LinkedIn 等等，截止目前共 9 个平台，并在不断听取用户建议对更多的平台提供支持。</li>
<li>管理方便。Casdoor 内部将模块分为了 5 大类，Organization 、User 、Application 、Token 和 Provider 。可以同时接入多个组织，组织下有不同应用，用户可以通过应用或组织分类，单独管理任何组织、应用或用户的 Token 令牌，轻松管理复杂系统，目前已部署在 Casbin 社区各种系统当作鉴权平台。</li>
<li>自定义程度高。Casdoor 可以随意修改登录方式，例如是否允许密码或第三方登录，自定义应用的注册项数量，是否启用两步验证，以及是否允许各个 Provider 登录、注册等等，高度可插拔。</li>
<li>具备 Swagger API 文档。清晰的 API 介绍，无需阅读源代码即可直接方便调用各个 API 接口，提供定制化功能。</li>
<li>前后端分离架构，部署简单。作为统一认证平台，除了性能，稳定性，新特性之外，易用性也是考量的重要标准，Casdoor 后端使用 Golang 语言开发，前端使用 React.js 框架，使用者只需启动后端服务，并将前端工程文件打包，即可直接使用，操作简单，上手难度低。</li>
<li>...</li>
</ul>
<h2>总结</h2>
<p>我们希望 Casdoor 能帮助广大开发者们解决用户管理的难题，更专注主要业务，提高开发效率。</p>
<p>同时作为一个开源项目，我们也非常希望获得大家的使用建议，帮助我们更好地改善项目质量，从功能、易用性等方面更好地满足大家的需求。</p>
<p>如果使用过程中有任何疑问，欢迎加入社区 QQ 群交流，提 Issues 。当然，提 PR 也是十分欢迎的！</p>
<ul>
<li>
<p>QQ 群：645200447</p>
</li>
</ul>
</div>
