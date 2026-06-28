# vendor-blobs.mk - Vendor Blob Lists for Infinix Hot 60 Pro Plus (X6886)

LOCAL_PATH := vendor/infinix/x6886

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/etc/wifi/WMT.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WMT.cfg \
    $(LOCAL_PATH)/proprietary/etc/wifi/wmt_launcher:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wmt_launcher \
    $(LOCAL_PATH)/proprietary/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/proprietary/etc/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/proprietary/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/etc/bluetooth/bt_vendor.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_vendor.conf

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/etc/gps.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/gps.cfg

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/proprietary/etc/audio_policy_configuration_bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth.xml \
    $(LOCAL_PATH)/proprietary/etc/audio_policy_configuration_usb.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_usb.xml \
    $(LOCAL_PATH)/proprietary/etc/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/proprietary/etc/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/proprietary/etc/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/proprietary/etc/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    $(LOCAL_PATH)/proprietary/etc/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/proprietary/etc/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/etc/camera/camxoverridesettings.txt:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camxoverridesettings.txt \
    $(LOCAL_PATH)/proprietary/etc/camera/imx355_altek_aspherical_lns.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx355_altek_aspherical_lns.cfg \
    $(LOCAL_PATH)/proprietary/etc/camera/imx355_sunny_aspherical_lns.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx355_sunny_aspherical_lns.cfg \
    $(LOCAL_PATH)/proprietary/etc/camera/ov13b10_fujinon_aspherical_lns.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov13b10_fujinon_aspherical_lns.cfg \
    $(LOCAL_PATH)/proprietary/etc/camera/ov13b10_sunny_aspherical_lns.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov13b10_sunny_aspherical_lns.cfg \
    $(LOCAL_PATH)/proprietary/etc/camera/ov50c_altek_aspherical_lns.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov50c_altek_aspherical_lns.cfg \
    $(LOCAL_PATH)/proprietary/etc/camera/ov50c_sunny_aspherical_lns.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov50c_sunny_aspherical_lns.cfg \
    $(LOCAL_PATH)/proprietary/etc/camera/ov50dfw_fujinon_aspherical_lns.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov50dfw_fujinon_aspherical_lns.cfg

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/etc/.tp_settings:$(TARGET_COPY_OUT_VENDOR)/etc/.tp_settings \
    $(LOCAL_PATH)/proprietary/etc/thermal_info_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.xml \
    $(LOCAL_PATH)/proprietary/etc/thermal_policy/thermal_policy_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy/thermal_policy_config.xml

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/etc/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/proprietary/etc/media_profiles_V1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1.xml \
    $(LOCAL_PATH)/proprietary/etc/mediaswcodec/codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mediaswcodec/codecs_performance.xml \
    $(LOCAL_PATH)/proprietary/etc/mediaswcodec/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mediaswcodec/media_codecs.xml \
    $(LOCAL_PATH)/proprietary/etc/mediaswcodec/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mediaswcodec/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/proprietary/etc/mediaswcodec/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mediaswcodec/media_codecs_google_telephony.xml \
    $(LOCAL_PATH)/proprietary/etc/mediaswcodec/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mediaswcodec/media_codecs_google_video.xml \
    $(LOCAL_PATH)/proprietary/etc/mediaswcodec/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mediaswcodec/media_codecs_google_video_le.xml

# System Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.audio.fluence.mode=endfire \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.speaker=true \
    ro.vendor.build.security_patch=2024-05-01 \
    ro.build.display.id=XOS.15.1.0 \
    ro.build.version.sdk=34 \
    ro.build.version.release=15 \
    ro.build.version.security_patch=2024-05-01 \
    ro.product.board=mt6789 \
    ro.hardware=mt6789 \
    ro.vendor.product.device=x6886 \
    ro.vendor.product.model=Infinix_Hot_60_Pro_Plus \
    ro.vendor.product.brand=Infinix \
    ro.vendor.product.name=Infinix_Hot_60_Pro_Plus \
    ro.vendor.product.manufacturer=Infinix

# Vendor Library Paths
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/lib/libmnl.so:$(TARGET_COPY_OUT_VENDOR)/lib/libmnl.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhalwrap.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhalwrap.so \
    $(LOCAL_PATH)/proprietary/lib/libpowergovernor.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowergovernor.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_client.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_client.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_conn.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_conn.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_nswitch.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_nswitch.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_setwrap.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_setwrap.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_ddmf.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_ddmf.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_fmr.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_fmr.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_gemini.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_gemini.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_lmkd.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_lmkd.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_ppm.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_ppm.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_sysperf.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_sysperf.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_thrml_ext.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_thrml_ext.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_uclamp.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_uclamp.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_xgf.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_xgf.so \
    $(LOCAL_PATH)/proprietary/lib/libpowerhal_xpu.so:$(TARGET_COPY_OUT_VENDOR)/lib/libpowerhal_xpu.so

# 64-bit Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/lib64/libmnl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libmnl.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhalwrap.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhalwrap.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowergovernor.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowergovernor.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_client.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_client.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_conn.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_conn.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_nswitch.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_nswitch.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_setwrap.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_setwrap.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_ddmf.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_ddmf.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_fmr.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_fmr.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_gemini.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_gemini.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_lmkd.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_lmkd.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_ppm.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_ppm.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_sysperf.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_sysperf.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_thrml_ext.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_thrml_ext.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_uclamp.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_uclamp.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_xgf.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_xgf.so \
    $(LOCAL_PATH)/proprietary/lib64/libpowerhal_xpu.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpowerhal_xpu.so
