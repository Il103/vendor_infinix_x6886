# Vendor Tree for Infinix Hot 60 Pro Plus (X6886)

Proprietary blobs extracted from stock firmware (X6886-H668L-G2954).

| Info | Value |
| :--- | :--- |
| Branch | `Vendor.Lineage.23.2` |
| Android | 15 (SDK 35) |
| Platform | MT6789 (Helio G200) |
| Firmware | X6886-H668L-G2954 |

## Contents

| Directory | Description |
|-----------|-------------|
| `proprietary/vendor/` | Vendor partition blobs |
| `proprietary/system_ext/` | system_ext partition blobs |
| `proprietary/product/` | Product partition blobs |
| **Total** | **6,439 files (3.0 GB)** |

## Coverage

| Source | In stock | Extracted | Match |
|--------|----------|-----------|-------|
| vendor/ | 4,342 | 5,275 | 100% |
| system_ext/ | 1,234 | 1,234 | 100% |
| proprietary-files.txt | 6,405 entries | — | 99.96% |

## What was included

- All vendor HAL binaries (.so)
- All vendor init .rc scripts (156)
- All kernel modules (208 vendor_dlkm)
- All system_ext apps (Transsion, AiGallery, DebugLogger, EngineerMode, etc.)
- All system_ext libraries (.so)
- All system_ext configs (permissions, sysconfig, vintf, vconfig)
- All vendor config files (thermal, NFC, WiFi, GNSS, audio DTS, etc.)
- VINTF manifest (626 lines, identical to stock)
- FSTAB (172 lines, identical to stock)

## Notes

- `allocator@4.0-service-mediatek` and `v3avpud` are valid ELF binaries extracted from broken stock symlinks
- All kernel modules verified byte-identical to stock
- dtbo.img is a prebuilt identical to stock (MD5: 472d2edcc98fdb16bf14d2000f1ec3bd)

## Build

This tree is used by [android_device_infinix_x6886](https://github.com/Il103/android_device_infinix_x6886) during `setup-makefiles.sh`.
