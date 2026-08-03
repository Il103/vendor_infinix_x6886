## Copyright (C) 2024-2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#


# Kernel modules are handled by the kernel tree:
# - Ramdisk modules: kernel/infinix/x6886/ramdisk/*.ko
# - Vendor DLKM modules: kernel/infinix/x6886/vendor_dlkm/*.ko
# - Configured in BoardConfig.mk


# AVB
# NOTE: 'vendor' is also listed in BOARD_AVB_VBMETA_SYSTEM in device BoardConfig.mk.
# A partition must be chained under only ONE vbmeta. Fix in BoardConfig.mk by
# removing 'vendor' from BOARD_AVB_VBMETA_SYSTEM (see FIXES.md).
BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 3

BOARD_AVB_VBMETA_ODM := odm
BOARD_AVB_VBMETA_ODM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_ODM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_ODM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_ODM_ROLLBACK_INDEX_LOCATION := 4


# Partitions
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_ODM := odm


# VINTF
# FIX: ODM_MANIFEST_FILES and DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE are
# already defined in device/infinix/x6886/BoardConfig.mk. Do NOT redefine them
# here. A system_ext manifest.xml must NEVER be added to
# DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE (that var takes a MATRIX, not a
# manifest). Use SYSTEM_EXT_MANIFEST_FILES if a system_ext manifest is needed.
DEVICE_MANIFEST_FILE += vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest.xml
DEVICE_MATRIX_FILE += vendor/infinix/x6886/proprietary/vendor/etc/vintf/compatibility_matrix.xml


# SEPolicy
# FIX: vendor SEPolicy is built from SOURCE in device/infinix/x6886/sepolicy/vendor
# (added via BOARD_VENDOR_SEPOLICY_DIRS in BoardConfig.mk). The PRECOMPILED CIL in
# proprietary/vendor/etc/selinux must NOT be added to BOARD_VENDOR_SEPOLICY_DIRS.


# Properties
TARGET_VENDOR_PROP += vendor/infinix/x6886/proprietary/vendor/build.prop
