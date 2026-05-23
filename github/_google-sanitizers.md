---
title: "google/sanitizers"
aliases: sanitizers
released: 2014-09-03T23:49:51Z
modified: 2026-05-23T18:11:52
created: 2026-05-23T18:11:52
description: "AddressSanitizer, ThreadSanitizer, MemorySanitizer"
source: "https://github.com/google/sanitizers"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/google/sanitizers?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/google/sanitizers?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/google/sanitizers?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=google&repo=sanitizers&bg_color=00000000)](https://github.com/google/sanitizers)


# sanitizers

AddressSanitizer, ThreadSanitizer, MemorySanitizer

## README

# sanitizers (Archived)

**This _repository_ has been archived and is no longer actively maintained.**

The Sanitizers _repository_, which includes AddressSanitizer, MemorySanitizer, ThreadSanitizer, LeakSanitizer, and more, is now archived. The core code for these sanitizers resides within the [LLVM](http://llvm.org) repository. This repository will be retained for archival purposes, providing access to historical documentation, bugfixes, and helper code.

**Important:** Please do not file new bug reports in this repository.

**Where to Report Bugs:**

* **LLVM:** For bugs related to the sanitizer runtimes and instrumentation, please report them to the [LLVM Bug Tracker](https://github.com/llvm/llvm-project/issues/).
* **GCC:** For bugs related to the GCC port of the sanitizers, please report them to the [GCC Bugzilla](https://gcc.gnu.org/bugzilla/).
* **Linux Kernel:** For bugs related to Kernel AddressSanitizer (KASAN), Kernel MemorySanitizer (KMSAN), or Kernel ConcurrencySanitizer (KCSAN), please report them through the appropriate Linux kernel bug reporting channels, such as the [Linux kernel mailing list](https://vger.kernel.org/vger-lists.html#linux-kernel).
* **Linux Distributions:** For bugs related to compiler issues in specific Linux distributions that are not reproducible in trunk compilers, please report them to the respective distribution's bug tracker (e.g., Debian Bug Tracking System, Red Hat Bugzilla).
* **Apple and Microsoft:** For bugs related to the compilers provided by Apple (Xcode) or Microsoft (Visual Studio), please report them through the respective vendor's bug reporting channels.
* **Android NDK:** For bugs related to Android, please report them to the [NDK issue tracker](https://github.com/android/ndk).

**Documentation (Archived):**

* [AddressSanitizer](../../wiki/AddressSanitizer) (detects addressability issues) and [LeakSanitizer](../../wiki/AddressSanitizerLeakSanitizer) (detects memory leaks)
* ThreadSanitizer (detects data races and deadlocks) for [C++](../../wiki/ThreadSanitizerCppManual) and [Go](../../wiki/ThreadSanitizerGoManual)
* [MemorySanitizer](../../wiki/MemorySanitizer) (detects use of uninitialized memory)
* [HWASAN](https://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html), or Hardware-assisted AddressSanitizer, a newer variant of AddressSanitizer that consumes much less memory
* [UBSan](https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html), or UndefinedBehaviorSanitizer

**Kernel Sanitizers (Archived Documentation):**

* [KASAN](https://www.kernel.org/doc/html/v4.12/dev-tools/kasan.html)
* [KMSAN](https://github.com/google/kmsan)
* [KCSAN](https://github.com/google/kernel-sanitizers/blob/master/KCSAN.md)

Thank you for your understanding.


## Notes

