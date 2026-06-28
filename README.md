# Vendor Tree for Infinix Hot 60 Pro Plus (X6886)

Proprietary blobs extracted from stock ROM dump (Android 15).

| Device | Infinix Hot 60 Pro Plus |
| :--- | :--- |
| Chipset | MediaTek Helio G200 (MT6789) |
| Android | 15 (SDK 35) |
| Branch | lineage-23.2 |
| Blobs | 5168 files |
| Storage | 2.0 GB (Git LFS) |

## Contents

- `proprietary/vendor/` - All proprietary blobs from stock ROM dump
- `Android.bp` - 1487 prebuilt shared library modules
- `X6886-vendor.mk` - 2286 PRODUCT_COPY_FILES entries
- `BoardConfigVendor.mk` - Kernel modules (211 .ko files)
- `proprietary-files.txt` - Complete list of blobs
- `extract-files.sh` - Extraction script

## Usage

This vendor tree is designed to work with [android_device_infinix_x6886](https://github.com/Il103/android_device_infinix_x6886).

Place in your LineageOS source tree:

```
vendor/infinix/X6886/
```

## Git LFS

Large binary files (.so, .ko, .bin, .img, .jar, .apk) are tracked with Git LFS.

```bash
git lfs pull
```

## Credits

- Stock ROM dump by [Il103](https://github.com/Il103)
- Generated from dump at GitLab
