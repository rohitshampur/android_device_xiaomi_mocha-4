USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/xiaomi/mocha/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := mocha

BOARD_KERNEL_CMDLINE := "androidboot.selinux=permissive"
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --dt device/xiaomi/mocha/dt.img --tags_offset 0x00000100

# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 671088640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13742637056
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_FLASH_BLOCK_SIZE := 131072

# Device perms
TARGET_SPECIFIC_HEADER_PATH := device/xiaomi/mocha/include

# Kernel
TARGET_KERNEL_SOURCE := kernel/xiaomi/mocha
TARGET_KERNEL_CONFIG := mocha_user_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/xiaomi/mocha/recovery/recovery.fstab
PRODUCT_COPY_FILES += device/xiaomi/mocha/recovery/recovery.fstab:recovery/root/etc/recovery.fstab
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"

# Tegra PowerHAL
TARGET_POWERHAL_VARIANT := tegra

# Init
TARGET_INIT_VENDOR_LIB := libinit_mocha

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
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/xiaomi/mocha/bluetooth
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
BOARD_SEPOLICY_UNION += \
	te_macros \
	app.te \
	bluetooth.te \
	bootanim.te \
	cvc.te \
	device.te \
	domain.te \
	drmserver.te \
	file_contexts \
	file.te \
	genfs_contexts \
	gpload.te \
	gpsd.te \
	hostapd.te \
	installd.te \
	mediaserver.te \
	netd.te \
	platform_app.te \
	property_contexts \
	property.te \
	raydium.te \
	recovery.te \
	service.te \
	service_contexts \
	set_hwui.te \
	shell.te \
	surfaceflinger.te \
	system_app.te \
	system_server.te \
	tee.te \
	ueventd.te \
	untrusted_app.te \
	usb.te \
	ussrd.te \
	ussr_setup.te \
	vold.te \
	wifi_loader.te \
	wpa.te \
	zygote.te \
	healthd.te
