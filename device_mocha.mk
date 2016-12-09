$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/xiaomi/mocha/mocha-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/xiaomi/mocha/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/xiaomi/mocha/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

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
