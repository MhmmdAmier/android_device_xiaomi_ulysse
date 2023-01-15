#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common mithorium-common
include device/xiaomi/mithorium-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/ulysse

# Partitions
BOARD_VENDORIMAGE_PARTITION_SIZE := 536870912

# Asserts
TARGET_OTA_ASSERT_DEVICE := ulysse,ugg,ugglite

# Camera
MI8937_CAM_USE_RENAMED_BLOBS_U := true

# Display
TARGET_SCREEN_DENSITY := 267

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):init_xiaomi_ulysse
TARGET_RECOVERY_DEVICE_MODULES := init_xiaomi_ulysse

# Input
TARGET_USES_HARDWARE_KEYS := true

# Kernel
TARGET_KERNEL_VERSION := 4.9
TARGET_KERNEL_CLANG_PATH := $(shell pwd)/prebuilts/clang/host/linux-x86/clang-r437112
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := ulysse_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/ulysse
TARGET_KERNEL_ADDITIONAL_FLAGS := \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10332634112 # 10332650496 - 16384

# Platform
TARGET_BOARD_PLATFORM := msm8937

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/sys/dev/dt2w"

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Security patch level
VENDOR_SECURITY_PATCH := 2017-04-01

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/biometrics/sepolicy

# Inherit from the proprietary version
include vendor/xiaomi/Mi8937/BoardConfigVendor.mk
