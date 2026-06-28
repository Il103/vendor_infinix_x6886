# vendor-blobs.mk - Vendor Blob Lists for Infinix Hot 60 Pro Plus (X6886)

LOCAL_PATH := vendor/infinix/x6886

# Include all vendor blobs from proprietary-files.txt
$(call inherit-product, $(LOCAL_PATH)/proprietary-files.txt)
