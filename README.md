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
| **Total** | **5010 files** |

## Blob categories

- 65 HAL services
- 138 HAL libraries
- 1959 camera files
- 430 audio files
- 722 MTK-specific files
- 73 Transsion-specific files
- 119 firmware files
- 53 VINTF manifests
- 128 init scripts

## Build

```bash
cd vendor/infinix/x6886
git lfs pull
cd ../../..

source build/envsetup.sh
lunch lineage_x6886-userdebug
mka bacon -j24
```

## Notes

- All blobs tracked with Git LFS
- `proprietary-files.txt` contains 5010 entries
- `x6886-vendor.mk` has 5010 `PRODUCT_COPY_FILES` entries
- Source: stock ROM (Android 15, kernel 5.10.198)

## Credits

- Stock ROM dump by [Il103](https://github.com/Il103)
