## Copyright (C) 2024-2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#


# Kernel modules are handled by the kernel tree:
# - Ramdisk modules: kernel/infinix/x6886/ramdisk/*.ko
# - Vendor DLKM modules: kernel/infinix/x6886/vendor_dlkm/*.ko
# - Configured in BoardConfig.mk


# AVB
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
DEVICE_MANIFEST_FILE += vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest.xml
DEVICE_MATRIX_FILE += vendor/infinix/x6886/proprietary/vendor/etc/vintf/compatibility_matrix.xml

ODM_MANIFEST_FILES += \
    vendor/infinix/x6886/proprietary/odm/etc/vintf/manifest_dsds.xml \
    vendor/infinix/x6886/proprietary/odm/etc/vintf/manifest_ss.xml \
    vendor/infinix/x6886/proprietary/odm/etc/vintf/manifest_qsqs.xml \
    vendor/infinix/x6886/proprietary/odm/etc/vintf/manifest_tsts.xml

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    vendor/infinix/x6886/proprietary/system_ext/etc/vintf/manifest.xml


# SEPolicy (precompiled CIL format)
BOARD_VENDOR_SEPOLICY_DIRS += vendor/infinix/x6886/proprietary/vendor/etc/selinux


# Properties
TARGET_VENDOR_PROP += vendor/infinix/x6886/proprietary/vendor/build.prop
