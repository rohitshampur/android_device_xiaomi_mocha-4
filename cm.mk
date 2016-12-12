# Release name
PRODUCT_RELEASE_NAME := mocha

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/xiaomi/mocha/device_mocha.mk)

$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mocha
PRODUCT_NAME := cm_mocha
PRODUCT_BRAND := xiaomi
PRODUCT_MODEL := mocha
PRODUCT_MANUFACTURER := xiaomi

# Build.prop overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="mocha" \
    PRODUCT_NAME="mocha" \
    BUILD_FINGERPRINT="Xiaomi/mocha/mocha:4.4.4/KTU84P/6.12.8:user/release-keys" \
    PRIVATE_BUILD_DESC="mocha-user 4.4.4 KTU84P 6.12.8 release-keys"
