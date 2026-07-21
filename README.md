# Vendor Tree for Infinix Hot 60 Pro Plus (X6886)

Proprietary blobs extracted from stock firmware (X6886-H668L-G2954).

## Contents

| Directory | Size | Description |
|-----------|------|-------------|
| `proprietary/vendor/` | 4,338 files | Vendor partition blobs |
| `proprietary/system_ext/` | 1,233 files | system_ext partition blobs |
| `proprietary/product/` | 893 files | Product partition blobs |
| **Total** | **7,074 files, ~19 GB** | |

## Blob categories

- Audio effects and configs
- Camera HAL and algorithms
- Display and graphics drivers
- Media codecs and firmware
- Modem and RIL libraries
- NFC firmware
- Sensors HAL
- WiFi and Bluetooth firmware
- Thermal management
- MTK-specific services and libs

## Build

```bash
# After repo sync, pull LFS blobs
cd vendor/infinix/x6886
git lfs pull
cd ../../..

# Build
source build/envsetup.sh
lunch lineage_x6886-userdebug
mka bacon -j$(nproc)
```

## Notes

- All blobs tracked with Git LFS (4,112 files, ~6.7 GB)
- Extracted from full firmware dump via `extract-files.py`
- `x6886-vendor.mk` has 7,074 `PRODUCT_COPY_FILES` entries (relative paths)
- Source: stock ROM (Android 15, kernel 5.10.237)

## Credits

- Stock ROM dump by [Il103](https://github.com/Il103)
