# Vendor Tree - Infinix Hot 60 Pro Plus (X6886)

## Device Information

- **Device**: Infinix Hot 60 Pro Plus
- **Codename**: X6886
- **SoC**: MediaTek Helio G200 (MT6789)
- **CPU**: Octa-core (2x2.2 GHz Cortex-A76 + 6x2.0 GHz Cortex-A55)
- **GPU**: ARM Mali-G57 MC2 @1.1GHz
- **RAM**: 6/8GB LPDDR4X
- **Storage**: 128/256GB UFS 2.2
- **Display**: 6.78 AMOLED 1224x2720 @144Hz
- **Battery**: 5160 mAh Li-Polymer, 45W Fast Charging
- **Android**: 15 (LineageOS)

## Directory Structure

```
vendor/infinix/x6886/
├── Android.mk
├── AndroidProducts.mk
├── BoardConfig.mk
├── vendor.mk
├── vendor-blobs.mk
├── vendorsetup.sh
├── README.md
├── proprietary/
│   ├── etc/
│   │   ├── wifi/
│   │   ├── bluetooth/
│   │   ├── gps/
│   │   ├── audio/
│   │   ├── camera/
│   │   ├── thermal/
│   │   └── media/
│   ├── lib/
│   │   ├── hw/
│   │   ├── egl/
│   │   ├── sound/
│   │   ├── camera/
│   │   └── ...
│   ├── lib64/
│   │   ├── hw/
│   │   ├── egl/
│   │   ├── sound/
│   │   ├── camera/
│   │   └── ...
│   ├── bin/
│   └── firmware/
├── config/
│   ├── wpa_supplicant.conf
│   ├── p2p_supplicant.conf
│   ├── thermal_info_config.xml
│   ├── gps.cfg
│   ├── bt_vendor.conf
│   ├── audio_policy_configuration.xml
│   ├── audio_policy_configuration_bluetooth.xml
│   ├── audio_policy_configuration_usb.xml
│   ├── audio_policy_volumes.xml
│   ├── default_volume_tables.xml
│   ├── media_codecs_google_audio.xml
│   ├── media_codecs_google_telephony.xml
│   ├── media_codecs_google_video.xml
│   ├── media_codecs_google_video_le.xml
│   ├── camxoverridesettings.txt
│   └── WMT.cfg
└── sepolicy/
    ├── file_contexts
    └── vendor/
        ├── hal_fingerprint_default.te
        ├── hal_camera_default.te
        ├── hal_gnss_default.te
        ├── hal_power_default.te
        ├── hal_sensors_default.te
        ├── hal_vibrator_default.te
        └── hal_gatekeeper_default.te
```

## Build

```
source build/envsetup.sh
lunch vendor_x6886-userdebug
make -j$(nproc)
```

## Note

You need to extract vendor blobs from your device using:
```
adb pull /vendor/lib /tmp/vendor-lib
adb pull /vendor/lib64 /tmp/vendor-lib64
adb pull /vendor/etc /tmp/vendor-etc
adb pull /vendor/bin /tmp/vendor-bin
adb pull /vendor/firmware /tmp/vendor-firmware
```

Then copy them to `proprietary/` folder.

## Credits

- **MediaTek** - SoC Platform
- **Infinix** - Device Manufacturer
- **LineageOS** - Custom ROM
- **Il103** - Device Tree Development

## License

GNU General Public License v3.0
