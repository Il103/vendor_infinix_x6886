# vendor.mk - Vendor Configuration for Infinix Hot 60 Pro Plus (X6886)

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Device identifier
PRODUCT_DEVICE := x6886
PRODUCT_NAME := vendor_x6886
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix Hot 60 Pro Plus
PRODUCT_MANUFACTURER := Infinix Mobility Limited

# Screen
PRODUCT_CHARACTERISTICS := phone

# Vendor overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Vendor Proprietary Files
$(call inherit-product, vendor/infinix/x6886/vendor-blobs.mk)

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="Infinix_Hot_60_Pro_Plus-v15-2024-07-01"

BUILD_FINGERPRINT := Infinix/Infinix_Hot_60_Pro_Plus/X6886:15/UP1A.231005.007/1719849270:user/release-keys
