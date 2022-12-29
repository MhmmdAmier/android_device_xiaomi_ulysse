#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common msm8937-common
include device/xiaomi/msm8937-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/ulysse

# Asserts
TARGET_OTA_ASSERT_DEVICE := ulysse,ugglite,ugg

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):init_xiaomi_ulysse
TARGET_RECOVERY_DEVICE_MODULES := init_xiaomi_ulysse

# Kernel
BOARD_KERNEL_CMDLINE += earlycon=msm_hsl_uart,0x78b000
TARGET_KERNEL_CONFIG := mi8937_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/msm8937

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10332634112 # 10332650496 - 16384
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_VENDORIMAGE_PARTITION_SIZE := 536870912
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/sys/dev/dt2w"

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Security patch level
VENDOR_SECURITY_PATCH := 2019-08-01

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/biometrics/sepolicy

# Treble
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
PRODUCT_VENDOR_MOVE_ENABLED := true

# Inherit from the proprietary version
include vendor/xiaomi/ulysse/BoardConfigVendor.mk
