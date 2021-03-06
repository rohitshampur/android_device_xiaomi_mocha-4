USE_CAMERA_STUB := true

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15

# Board
TARGET_BOARD_PLATFORM := tegra
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := mocha

# Kernel

BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive androidboot.hardware=mocha
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --dt device/xiaomi/mocha/dt.img --tags_offset 0x00000100

# Partition sizes
#TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 671088640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13742637056
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_KERNEL_SOURCE := kernel/xiaomi/l4t
TARGET_KERNEL_CONFIG := mocha_user_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage

# Device perms
TARGET_SPECIFIC_HEADER_PATH := device/xiaomi/mocha/include

# Recovery
#BOARD_HAS_NO_SELECT_BUTTON := true
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_FSTAB := device/xiaomi/mocha/initfiles/etc/fstab.mocha

# Tegra PowerHAL
TARGET_POWERHAL_VARIANT := tegra

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_mocha
TARGET_LIBINIT_DEFINES_FILE := device/xiaomi/mocha/init/init_mocha.cpp

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORT_NVOICE := true
BOARD_SUPPORT_NVAUDIOFX := true

# Adaptive backlight
BOARD_HARDWARE_CLASS := device/xiaomi/mocha/cmhw/

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/xiaomi/mocha/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/xiaomi/mocha/bluetooth/vnd_mocha.txt

# Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA          := "/etc/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/etc/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"

# Graphics
USE_OPENGL_RENDERER := true

# SELinux
BOARD_SEPOLICY_DIRS += device/xiaomi/mocha/sepolicy
