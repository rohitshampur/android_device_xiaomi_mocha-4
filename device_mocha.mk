$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/xiaomi/mocha/mocha-vendor.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/xiaomi/mocha/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_mocha
PRODUCT_DEVICE := mocha

# Screen density
PRODUCT_AAPT_CONFIG += xlarge large
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2048
TARGET_SCREEN_WIDTH := 1536

# Platform
PRODUCT_CHARACTERISTICS := tablet
TARGET_TEGRA_VERSION := t124
TARGET_TEGRA_MODEM := icera
TARGET_TEGRA_TOUCH := raydium

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Proprietary vendor files
$(call inherit-product-if-exists, vendor/xiaomi/mocha/mocha-vendor.mk)

# NVIDIA permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.nvidia.graphics.xml:system/etc/permissions/com.nvidia.graphics.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.nvsi.xml:system/etc/permissions/com.nvidia.nvsi.xml \
    $(LOCAL_PATH)/permissions/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    $(LOCAL_PATH)/permissions/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.miracast.xml:system/etc/permissions/com.nvidia.miracast.xml

# Ramdisk files
PRODUCT_PACKAGES += \
    fstab.mocha \
    init.mocha.rc \
    init.t124_emmc.rc \
    init.t124_sata.rc \
    init.cal.rc \
    init.hdcp.rc \
    init.t124.rc \
    init.tlk.rc \
    init.nv_dev_board.usb.rc \
    power.mocha.rc \
    ueventd.mocha.rc

PRODUCT_COPY_FILES += \
    device/xiaomi/mocha/initfiles/etc/init:root/init \
    device/xiaomi/mocha/initfiles/etc/init.rc:root/init.rc \
    device/xiaomi/mocha/initfiles/sbin/healthd:root/sbin/healthd \
    device/xiaomi/mocha/initfiles/sbin/chargeonlymode:root/sbin/chargeonlymode \
    device/xiaomi/mocha/initfiles/sbin/mdbd:root/sbin/mdbd

# Device Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/keylayout/tegra-rt5671_headphone_detect.kl:system/usr/keylayout/tegra-rt5671_headphone_detect.kl \
    $(LOCAL_PATH)/keylayout/atmel-maxtouch.kl:system/usr/keylayout/atmel-maxtouch.kl \
    $(LOCAL_PATH)/keylayout/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/Vendor_0955_Product_7210.kl:system/usr/keylayout/Vendor_0955_Product_7210.kl

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/nvcamera.conf:system/etc/nvcamera.conf \
    $(LOCAL_PATH)/camera/model_frontal.xml:system/etc/model_frontal.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bdaddr:system/etc/bluetooth/bdaddr \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Audio configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audioConfig_qvoice_icera_pc400.xml:system/etc/audioConfig_qvoice_icera_pc400.xml \
    $(LOCAL_PATH)/audio/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    $(LOCAL_PATH)/audio/nvaudio_fx.xml:system/etc/nvaudio_fx.xml

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    device/xiaomi/mocha-common/overlay

# Media configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# WiFi configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant:system/bin/wpa_supplicant \
    $(LOCAL_PATH)/wifi/wpa_supplicant.bin:system/bin/wpa_supplicant.bin \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf
