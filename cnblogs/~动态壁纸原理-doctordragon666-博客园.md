---
draft: true
aliases:
  - 动态壁纸原理
  - ~动态壁纸原理 -doctordragon666- 博客园
created: 2025-08-08T09:46:47
modified: 2025-08-30T22:47:28
source: https://www.cnblogs.com/riverstream/p/-/dynamic_paper
title: 动态壁纸原理
type: archive-web
---
# 动态壁纸原理

## 动态壁纸原理揭秘

动态壁纸是一种能够在桌面上显示动画或视频的背景图像，给用户带来更生动的视觉体验。其原理主要涉及以下几个方面：

1. **图像渲染** ：动态壁纸通常使用图形渲染引擎来处理动画效果。这些引擎可以是基于 GPU 的，利用显卡的强大计算能力来实现流畅的动画。
2. **资源管理** ：动态壁纸需要管理大量的图像资源和动画帧。这些资源通常存储在特定的格式中，如视频文件或图像序列。动态壁纸应用会根据需要加载和释放这些资源，以优化性能。
3. **事件处理** ：动态壁纸需要响应用户的交互，如鼠标点击、键盘输入等。通过监听系统事件，动态壁纸可以实现与用户的互动，例如点击某个区域触发特定动画效果。
4. **性能优化** ：为了确保动态壁纸在各种硬件上都能流畅运行，开发者需要进行性能优化。这包括减少资源占用、优化渲染算法、使用合适的分辨率等。
5. **平台兼容性** ：不同操作系统和桌面环境对动态壁纸的支持程度不同。开发者需要考虑跨平台兼容性，确保动态壁纸在不同系统上都能正常工作。

这里我们着重点在于，使用 WindowsAPI+ffmpeg 来实现动态壁纸的原理。

## 原理说明

动态壁纸的实现可以通过将视频播放器窗口嵌入到桌面环境中来完成。具体步骤如下：

1. **创建视频播放器进程** ：使用 `CreateProcess` 函数启动一个视频播放器（如 `ffplay` ），并传入必要的参数，如视频文件路径、窗口位置等。
2. **获取桌面窗口句柄** ：通过 `FindWindow` 函数获取桌面窗口的句柄（通常是 `Progman` 窗口）。
3. **设置视频播放器窗口为桌面子窗口** ：使用 `SetParent` 函数将视频播放器窗口设置为桌面窗口的子窗口，这样视频播放器就可以在桌面上显示。
4. **隐藏其他桌面元素** ：通过枚举桌面窗口并隐藏不需要的窗口（如 `workerw` 窗口），确保视频播放器能够占据整个桌面空间。
5. **发送特殊消息** ：向桌面窗口发送特定消息（ `0x52C` ），以确保桌面环境正确处理视频播放器窗口。

## 具体的代码实现

```cpp
#include <stdio.h>
#include <Windows.h>
#include <string>
#include <iostream>
#include <map>
#include <functional>
#include <algorithm>

BOOL CALLBACK EnumWindowsProc(_In_ HWND hwnd, _In_ LPARAM Lparam) {
    HWND hDefview = FindWindowEx(hwnd, 0, L"SHELLDLL_DefView", 0);
    if (hDefview != 0) {
        //找它的下—个窗口，类名为workerw，隐藏它
        HWND hWorkerw = FindWindowEx(0, hwnd, L"workerw", 0);
        ShowWindow(hWorkerw, SW_HIDE);
        return FALSE;
    }
    return TRUE;
}

int main()
{
    //LPCWSTR lpParameter = L"D:\\Videos\\test.gif -noborder -x 1920 -y 1080 -loop 0";
    int screenWidth = GetSystemMetrics(SM_CXSCREEN);
    int screenHeight = GetSystemMetrics(SM_CYSCREEN);
    std::wstring parameterStr = L" D:\\Videos\\test.gif -noborder -x " + std::to_wstring(screenWidth) + L" -y " + std::to_wstring(screenHeight) + L" -loop 0";
    LPCWSTR lpParameter = parameterStr.c_str();
    STARTUPINFO si{ 0 };
    PROCESS_INFORMATION pi{ 0 };
    if (CreateProcessW(L"ffplay.exe", (LPWSTR)lpParameter, 0, 0, 0, 0, 0, 0, &si, &pi)) {
        Sleep(200);
        // 等待视频播放器启动完成
        HWND hProgman = FindWindow(L"Progman", 0);
        //找到PM窗
        SendMessageTimeout(hProgman, 0x52C, 0, 0, 0, 100, 0); // 给它发特殊消息
        HWND hFfplay = FindWindow(L"SDL_app", 0);
        // 找到视频窗口
        SetParent(hFfplay, hProgman);
        // 将视频窗设置为PM的子窗口
        EnumWindows(EnumWindowsProc, 0);
    }
    return 0;
}
```
