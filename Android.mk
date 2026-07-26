#
# Vendor prebuilt overlay apps
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := GoogleTetheringResOverlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/app/GoogleTetheringResOverlay/GoogleTetheringResOverlay.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/app/GoogleTetheringResOverlay
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := InProcessTetheringResOverlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/app/InProcessTetheringResOverlay/InProcessTetheringResOverlay.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/app/InProcessTetheringResOverlay
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := NetworkStackGoogleResOverlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/app/NetworkStackGoogleResOverlay/NetworkStackGoogleResOverlay.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/app/NetworkStackGoogleResOverlay
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := NetworkStackInProcessResOverlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/app/NetworkStackInProcessResOverlay/NetworkStackInProcessResOverlay.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/app/NetworkStackInProcessResOverlay
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := NetworkStackResOverlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/app/NetworkStackResOverlay/NetworkStackResOverlay.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/app/NetworkStackResOverlay
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TetheringResOverlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/app/TetheringResOverlay/TetheringResOverlay.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/app/TetheringResOverlay
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := ConnectivityResOverlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/overlay/ConnectivityResOverlay/ConnectivityResOverlay.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/overlay/ConnectivityResOverlay
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := FrameworkResOverlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/overlay/FrameworkResOverlay/FrameworkResOverlay.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/overlay/FrameworkResOverlay
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := FrameworkResOverlayExt
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/overlay/FrameworkResOverlayExt/FrameworkResOverlayExt.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/overlay/FrameworkResOverlayExt
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := MtkSettingsResOverlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/overlay/MtkSettingsResOverlay/MtkSettingsResOverlay.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/overlay/MtkSettingsResOverlay
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := MtkTelephonyServiceResOverlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/overlay/MtkTelephonyServiceResOverlay/MtkTelephonyServiceResOverlay.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/overlay/MtkTelephonyServiceResOverlay
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := SettingsProviderResOverlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/overlay/SettingsProviderResOverlay/SettingsProviderResOverlay.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/overlay/SettingsProviderResOverlay
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := WifiResMainlineOverlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/overlay/WifiResMainlineOverlay/WifiResMainlineOverlay.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/overlay/WifiResMainlineOverlay
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := WifiResOverlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/vendor/overlay/WifiResOverlay/WifiResOverlay.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/overlay/WifiResOverlay
include $(BUILD_PREBUILT)

PRODUCT_PACKAGES += \
    GoogleTetheringResOverlay \
    InProcessTetheringResOverlay \
    NetworkStackGoogleResOverlay \
    NetworkStackInProcessResOverlay \
    NetworkStackResOverlay \
    TetheringResOverlay \
    ConnectivityResOverlay \
    FrameworkResOverlay \
    FrameworkResOverlayExt \
    MtkSettingsResOverlay \
    MtkTelephonyServiceResOverlay \
    SettingsProviderResOverlay \
    WifiResMainlineOverlay \
    WifiResOverlay
