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
| `proprietary/odm/` | ODM partition blobs |
| **Total** | **5,710 files (375 MB)** |

## Coverage

| Source | In stock | Extracted | Match |
|--------|----------|-----------|-------|
| vendor/ | 4,342 | 4,468 | 100% |
| system_ext/ | 1,234 | 1,234 | 100% |
| proprietary-files.txt | 4,489 entries | — | 99.96% |

## What was included

- All vendor HAL binaries (.so)
- All vendor init .rc scripts (156)
- All system_ext apps (Transsion, AiGallery, DebugLogger, EngineerMode, etc.)
- All system_ext libraries (.so)
- All system_ext configs (permissions, sysconfig, vintf, vconfig)
- All vendor config files (thermal, NFC, WiFi, GNSS, audio DTS, etc.)
- VINTF manifest

## What was removed

- toybox/busybox utilities (184 commands — provided by Android)
- Duplicate camera libraries under `vendor/lib64/mt6789/`
- Duplicate HAL services under `vendor/bin/mt6789/`
- Files at wrong locations (`vendor/odm/` → moved to `odm/`)
- `vendor_dlkm/` (kernel modules — built from kernel source)
- Duplicate `lib/`, `lib64/`, `etc/` at proprietary root
- system_ext audio policy files (provided by Android)
- Broken or placeholder symlinks

## Build

This tree is used by [android_device_infinix_x6886](https://github.com/Il103/android_device_infinix_x6886).
