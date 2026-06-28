# BoardConfig.mk - Vendor Board Configuration for Infinix Hot 60 Pro Plus (X6886)

DEVICE_PATH := vendor/infinix/x6886

# Platform
TARGET_BOARD_PLATFORM := mt6789

# Use prebuilt vendor image
BOARD_PREBUILT_VENDORIMAGE := $(DEVICE_PATH)/prebuilt/vendor.img

# Vendor partition size
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824

# Vendor file system
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Vendor sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 33
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Use vendor image
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilt/vendor.img:$(TARGET_COPY_OUT_VENDOR)/vendor.img
