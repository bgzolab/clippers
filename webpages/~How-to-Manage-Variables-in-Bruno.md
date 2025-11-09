---
draft: true
aliases:
  - How to Manage Variables in Bruno
created: 2025-07-13T13:44:21
description: "Learn how to effectively manage variables in Bruno — the open-source API client. Master variable scopes like runtime, request, environment."
modified: 2025-07-13T13:44:25
source: "https://blog.usebruno.com/manage-variables"
tags: []
title: How to Manage Variables in Bruno
type: "archive-web"
---
# How to Manage Variables in Bruno

Variables allow values to be stored and reused in Bruno. This is essential from a productivity, workflow, and security perspective. A variable is simply a moniker that represents data which is stored elsewhere. This allows you to abstract the detail (and sensitivity) away from your requests, scripts, headers, authentication, and elsewhere.

变量允许在 Bruno 中存储和重用值。从生产力、工作流程和安全角度来看，这一点至关重要。变量只是一个表示存储在其他地方的数据的别名。这允许您将细节（和敏感性）从请求、脚本、标头、身份验证和其他方面抽象出来。

Understanding the different types of variables available and how to use them can save you a lot of time and effort, and it’s also crucial from a security perspective. In this post, we'll walk through how variables are configured in Bruno, and how to access them. 

了解不同类型的变量以及如何使用它们可以节省您大量的时间和精力，而且从安全角度来看也至关重要。在本文中，我们将介绍如何在 Bruno 中配置变量以及如何访问它们。

## Variable Types 变量类型

Bruno allows you to work with seven different types of variables. Six of these variables are managed directly inside of the Bruno application and one is managed in the underlying file containing the collection.  

Bruno 允许您使用七种不同类型的变量。其中六个变量直接在 Bruno 应用程序内部管理，一个变量在包含集合的底层文件中管理。

Below are the six variables managed through the Bruno application, arranged by both scope and precedence. 

以下是通过 Bruno 应用程序管理的六个变量，按范围和优先级排列。

↑ Higher Precedence  ↑ 更高优先级

↓ Broader Scope  ↓ 更广泛的范围

Runtime Variables  运行时变量

Request Variables  请求变量

Folder Variables  文件夹变量

Environment Variables  环境变量

Collection Variables  集合变量

Global Variables  全局变量

The seventh variable type is  **Process Environment Variables** (.env), which follow the development standard of including a .env file in the root of your collection. This is a developer-centric enhancement and is not a requirement for using Bruno. 

第七种变量类型是**进程环境变量** （.env），它遵循在集合根目录中包含 .env 文件的开发标准。这是一项以开发人员为中心的增强功能，并非使用 Bruno 的必要条件。

All environment types are detailed below: 

所有环境类型详述如下：

### 1\. Runtime Variables 1\. 运行时变量

Runtime variables are mainly used for scripting and manipulating response data. Bruno stores these variables in app memory, and they are available only during runtime.

运行时变量主要用于脚本编写和操作响应数据。Bruno 将这些变量存储在应用程序内存中，并且仅在运行时可用。

Create Runtime Variables:

创建运行时变量：

```shell
bru.setVar(key, value); // Create a runtime variablebru.getVar(key);        // Get the value of the runtime variable
```

You can also debug these variables by using the "EYE" icon in the top-right corner of the Bruno interface.

您还可以使用 Bruno 界面右上角的“EYE”图标来调试这些变量。

### 2\. Request Variables 2\. 请求变量

Request-level variables are essential for API testing, debugging, and troubleshooting errors. These variables are stored in the <`request-name>.bru` file, and you can create them inside Bruno’s **Vars** tab. They are ideal for testing specific requests and capturing parameters or responses.

请求级变量对于 API 测试、调试和错误排查至关重要。这些变量存储在 < `request-name>.bru` 文件中，您可以在 Bruno 的 **“变量”选项**卡中创建它们。它们非常适合测试特定请求并捕获参数或响应。

![](https://blog.usebruno.com/hs-fs/hubfs/image-png-Apr-14-2025-05-06-50-4863-PM.png?width=671&height=255&name=image-png-Apr-14-2025-05-06-50-4863-PM.png)

### 3\. Folder Variables 3\. 文件夹变量

Folder variables are mainly used to store output from requests or automated scripts. If you need to use the same value across multiple requests within a folder, setting it as a folder-level variable avoids repetitive work. This is particularly useful when you want to avoid passing the same variable manually between requests.

文件夹变量主要用于存储请求或自动化脚本的输出。如果您需要在文件夹中的多个请求中使用相同的值，则将其设置为文件夹级变量可以避免重复工作。当您想避免在请求之间手动传递相同的变量时，这尤其有用。

![](https://blog.usebruno.com/hs-fs/hubfs/image-png-Apr-14-2025-05-05-58-9817-PM.png?width=825&height=242&name=image-png-Apr-14-2025-05-05-58-9817-PM.png)

### 4\. Collection Variables 4\. 集合变量

Collection-level variables work similarly to folder variables but are not limited to a folder. These variables can be accessed throughout the entire collection, including all folders and requests within it.

集合级变量的工作方式与文件夹变量类似，但不限于文件夹。这些变量可以在整个集合中访问，包括其中的所有文件夹和请求。

![](https://blog.usebruno.com/hs-fs/hubfs/image-png-Apr-14-2025-05-03-07-3084-PM.png?width=919&height=234&name=image-png-Apr-14-2025-05-03-07-3084-PM.png)

Once you set a collection variable, you can use it across all folders and requests within the collection. Keep in mind that your request must be within the folder to use specific folder variables.

设置集合变量后，您可以在集合内的所有文件夹和请求中使用它。请记住，您的请求必须在该文件夹内才能使用特定的文件夹变量。

### 5\. Environment Variables 5.环境变量

Environment variables are extremely useful for setting up different environments such as **Prod**, **Dev**, or **Local** environments. In Bruno, you can select specific environment variables for testing setups. You can also use these variables in the Bruno CLI by passing the **\--env** flag, which will pick the environment from the folder created in the Bruno collection root directory.

环境变量对于设置不同的环境（例如 **Prod** 、 **Dev** 或 **Local** ）非常有用。在 Bruno 中，您可以选择特定的环境变量来测试设置。您也可以在 Bruno CLI 中通过传递 **\--env** 标志来使用这些变量，该标志将从 Bruno 集合根目录中创建的文件夹中选择环境。

They are accessed by clicking the drop-down in the top toolbar. By default, this value will be  `No Environment. `When you are actively using an environment, you will see the relevant name displayed there. 

您可以通过点击顶部工具栏中的下拉菜单来访问它们。默认情况下，此值为 `No Environment.` 当您正在使用某个环境时，您将在那里看到相关的名称。

![](https://blog.usebruno.com/hs-fs/hubfs/image-png-Apr-14-2025-05-11-23-6292-PM.png?width=317&height=48&name=image-png-Apr-14-2025-05-11-23-6292-PM.png)

![](https://blog.usebruno.com/hs-fs/hubfs/image-png-Apr-14-2025-05-04-11-9747-PM.png?width=851&height=216&name=image-png-Apr-14-2025-05-04-11-9747-PM.png)

### 6\. Global Environment Variables

6.全局环境变量

Global Environment variables are available throughout the entire collection, folder, and request. You can use them globally by simply adding the variable’s key.  They are accessed by clicking the \`Globe\` icon in the top toolbar. 

全局环境变量适用于整个集合、文件夹和请求。只需添加变量的键即可全局使用它们。点击顶部工具栏中的“地球”图标即可访问它们。

![](https://blog.usebruno.com/hs-fs/hubfs/image-png-Apr-14-2025-05-09-27-6394-PM.png?width=313&height=60&name=image-png-Apr-14-2025-05-09-27-6394-PM.png)

![](https://blog.usebruno.com/hs-fs/hubfs/image-png-Apr-14-2025-05-08-38-8757-PM.png?width=852&height=323&name=image-png-Apr-14-2025-05-08-38-8757-PM.png)

### 7\. Process Environment Variables

7\. 进程环境变量

Process Environment variables (.env) are external variables that you create in a `.env` file inside your Bruno collection. This follows the standard development workflow that you would use with any other code repository.

进程环境变量 (.env) 是您在 Bruno 集合内的 `.env` 文件中创建的外部变量。这遵循您在任何其他代码存储库中使用的标准开发工作流程。

These variables are useful for storing sensitive data like API keys or other secrets. You can reference them directly in your collections like this:

这些变量对于存储 API 密钥或其他机密信息等敏感数据非常有用。您可以像这样直接在集合中引用它们：

![](https://blog.usebruno.com/hs-fs/hubfs/image-png-Apr-15-2025-07-35-13-9609-PM.png?width=843&height=249&name=image-png-Apr-15-2025-07-35-13-9609-PM.png)`   `

Or you can assign these variables as GlobalEnv or Environment variables:

或者您可以将这些变量指定为 GlobalEnv 或环境变量：

![](https://blog.usebruno.com/hs-fs/hubfs/image-png-Apr-15-2025-07-36-14-7727-PM.png?width=849&height=264&name=image-png-Apr-15-2025-07-36-14-7727-PM.png)

It's important to also use a .gitignore file when leveraging these variables to ensure that the contents are not displayed if you chose to commit the collection to Git. 

利用这些变量时，还必须使用 .gitignore 文件，以确保如果您选择将集合提交给 Git，则不会显示内容。

The structure for creating and storing these environments is as follows:

创建和存储这些环境的结构如下：

bruno-collection/
├── api-folder/
├── .gitignore
├── bruno.json
├── package.json
└── .env

## Variable Storage 变量存储

Each variable has it's own storage location either within your collection file or within the app's memory. All storage is local. 

每个变量都有自己的存储位置，要么在你的集合文件中，要么在应用程序的内存中。 所有存储都是本地的。

| Variable Type  变量类型 | Storage Location  存储位置 |
| --- | --- |
| Collection  收藏 | <collection-name>.bru |
| Folder  文件夹 | <folder-name>.bru |
| Request  要求 | <request-name>.bru |
| Environment  环境 | <env-name>.bru |
| Runtime  运行时 | Local storage  本地存储 |
| Global  全球的 | Local storage  本地存储 |
| Process Environment  过程环境 | Separate .env file  单独的 .env 文件 |

## Using Variables 使用变量

You can use these variables in various places such as **auth**, **scripts**, **headers**, **body**, and **request params**. Accessing all these variables through the script is straightforward with a common sytnax.

您可以在各个地方使用这些变量，例如 **auth** 、 **scripts** 、 **headers** 、 **body** 和 **request params** 。使用通用语法，通过脚本访问所有这些变量非常简单。

Syntax:

语法 ：

```shell
bru.set[Type]Var(key, value);  // create a variable
bru.get[Type]Var(key);         // get a variable
```

Where:  在哪里：

- `[Type]` is the variable type (Runtime, Request, Folder, etc.)
	`[Type]` 是变量类型（运行时、请求、文件夹等）
- `key` is the variable name you want to access
	`key` 是要访问的变量名

## Best Practices 最佳实践

1\. Scoping: Always try to limit the scope of your variables according to the context. Avoid creating complex structures with similar variables for the same use case.

1\. 作用域： 始终尝试根据上下文限制变量的作用域。避免为相同的用例创建包含相似变量的复杂结构。

2\. Reusability: For variables that you need to access in multiple locations, consider using **Global Environment Variables.**

2. 可重用性： 对于需要在多个位置访问的变量，请考虑使用**全局环境变量。**

3\. **Troubleshooting & Errors:** Use **Runtime Variables** for debugging and error handling to make your workflow smoother and more controlled. These variables are helpful for capturing values during the execution of requests or scripts, making it easier to track issues as they arise.

3. **故障排除和错误：** 使用**运行时变量**进行调试和错误处理，使您的工作流程更顺畅、更可控。这些变量有助于捕获请求或脚本执行过程中的值，从而更轻松地跟踪出现的问题。

4\. **Variable Naming:** Choose meaningful and pattern-orientated names for your variables. It’s a good practice to use names like basic-url, org-secret-api-key, etc. This will help avoid conflicts and ensure your variables are easily identifiable.

4. **变量命名：** 为变量选择有意义且符合模式的名称。使用类似 basic-url、org-secret-api-key 等名称是一个好习惯。这有助于避免冲突并确保变量易于识别。

## Conclusion 结论

Understanding how to manage and work with variables is crucial for efficient API testing. With Bruno, you can leverage different types of variables to streamline your workflow, enhance reusability, and maintain a clean and organised testing environment. Whether you’re using **Global Environment Variables**, **Collection Variables**, or **Runtime Variables**, Bruno gives you full control over how variables are set, accessed, and reused.

了解如何管理和使用变量对于高效的 API 测试至关重要。借助 Bruno，您可以利用不同类型的变量来简化工作流程、增强可重用性，并维护一个干净整洁的测试环境。无论您使用的是**全局环境变量** 、 **集合变量**还是**运行时变量** ，Bruno 都能让您完全控制变量的设置、访问和重用方式。
