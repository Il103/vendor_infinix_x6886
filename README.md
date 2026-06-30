# Vendor Tree for Infinix Hot 60 Pro Plus (X6886)

Proprietary blobs extracted from stock ROM dump (Android 15).

| Device | Infinix Hot 60 Pro Plus |
| :--- | :--- |
| Chipset | MediaTek Helio G200 (MT6789) |
| Android | 15 (SDK 35) |
| Branch | lineage-23.2 |
| Blobs | 5273 files |
| Storage | ~=2.0 GB (Git LFS) |

## Contents

- `proprietary/` - All proprietary blobs from stock ROM dump
  - `lib/`, `lib64/` - Shared libraries (vendor partition)
  - `etc/` - Audio, firmware, and media configs
  - `bin/` - Executables and daemons
  - `system_ext/` - system_ext blobs (from stock system_ext)
  - `product/` - Product partition blobs
  - `odm/` - ODM blobs
  - `odm_dlkm/` - ODM DLKM blobs
  - `vendor_dlkm/` - Vendor DLKM blobs
  - `framework/` - Java JAR files
  - `apex/` - APEX packages
- `Android.bp` - 1497 prebuilt shared library and binary modules
- `X6886-vendor.mk` - 5273 PRODUCT_COPY_FILES entries (auto-generated)
- `BoardConfigVendor.mk` - Vendor BoardConfig (kernel modules, properties)
- `proprietary-files.txt` - Complete list of all 5273 blobs
- `extract-files.sh` - Extraction script

## Usage

This vendor tree is designed to work with [device_infinix_x6886](https://github.com/Il103/device_infinix_x6886).

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
