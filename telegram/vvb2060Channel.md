
## 2025-08-18 10:57:32


不错的文章，解释了为什么安全启动和 TPM 2.0 是 Windows11 的基线要求。Apple 设备有 App Attest，Android 设备有 Key Attestation，现在 Windows 也跟上来了。

https://andrewmoore.ca/blog/post/anticheat-secure-boot-tpm/

https://t.me/vvb2060Channel/1033

Published on 2025-08-18 10:57:32. Saved on 2025-08-18 16:40:48

## 2024-05-17 20:56:54


安全警告，Android GKI内核已启用Unicode支持，忽略大小写行为与一般预期不同

[提交1](https://cs.android.com/android/_/android/kernel/common/&#43;/e58b26a26f555a8496d92cb5c9867ae2444ce28e)和[提交2](https://cs.android.com/android/_/android/kernel/common/&#43;/5c0d8663cf2e6086b35b32aacde0fd5c4ae8c368)为内核添加了Unicode支持。人们普遍预期字符串相同是逐字节比较，忽略大小写比较仅处理26个标准字母。
现在如果使用[utf8_系列函数](https://cs.android.com/android/kernel/superproject/&#43;/common-android-mainline:common/fs/unicode/utf8-core.c)，会先执行Unicode规范化，并且去除默认可忽略代码点后再执行Unicode比较，大小写转换也按照Unicode规范执行，与非Unicode有较大行为变化。

/*
 * Two normalization forms are supported:
 * 1) NFDI
 *   - Apply unicode normalization form NFD.
 *   - Remove any Default_Ignorable_Code_Point.
 * 2) NFDICF
 *   - Apply unicode normalization form NFD.
 *   - Remove any Default_Ignorable_Code_Point.
 *   - Apply a full casefold (C &#43; F).
 */

这是内核处理Unicode的两种模式。如果想知道具体的大小写规则、规范化规则以及默认可忽略代码点，请参考相关工具 https://cs.android.com/android/kernel/superproject/&#43;/common-android-mainline:common/fs/unicode/mkutf8data.c;l=1836

以上是内核Unicode介绍，现在回到Android，作为启用ext4和f2fs的casefold特性的最后一步，Android通用内核打开了Unicode支持：https://r.android.com/1167600

之前存储空间忽略大小写由 sdcardfs 通过常规大小写转换实现，现在由底层文件系统 ext4 或 f2fs 的 casefold 功能实现。通过为 /data/media 文件夹添加F属性，存储空间实现了忽略大小写，但它其实是 utf8_casefold，执行上文所述Unicode步骤，而不仅仅是常规的忽略大小写。

Make /data/media case insensitive

Use chattr to apply &#43;F to /data/media
https://r.android.com/1221723

从此，指向存储空间的路径，例如 /storage/emulated/0/Android/data，由于 emulated 是 fuse，其底层是 /data/media，所以从 0 开始 (包括)，可以在任意位置插入默认可忽略代码点，内核自动删除它们。

如果用户空间在比较路径时没有执行与内核相同的步骤，会引入安全问题，导致本应拒绝访问的路径被绕过。需要重点检查FileProvider逻辑，如果它对外提供对共享存储空间文件的访问权限，私有存储不受影响。

https://t.me/vvb2060Channel/855

Published on 2024-05-17 20:56:54. Saved on 2025-08-29 15:21:08
