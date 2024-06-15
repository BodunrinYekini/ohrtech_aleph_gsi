# Copyright (C) 2019 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# arm64 specific definitions
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi

include device/generic/common/mgsi/BoardConfigMgsiCommon.mk

# Emulator system image is going to be used as GSI and some vendor still hasn't
# cleaned up all device specific directories under root!

# TODO(b/111434759, b/111287060) SoC specific hacks
BOARD_ROOT_EXTRA_SYMLINKS += /vendor/lib/dsp:/dsp
BOARD_ROOT_EXTRA_SYMLINKS += /mnt/vendor/persist:/persist
BOARD_ROOT_EXTRA_SYMLINKS += /vendor/firmware_mnt:/firmware

# TODO(b/36764215): remove this setting when the generic system image
# no longer has QCOM-specific directories under /.
BOARD_SEPOLICY_DIRS += build/make/target/board/generic_arm64/sepolicy

#GKI
include device/generic/common/BoardConfigGkiCommon.mk

BOARD_KERNEL-5.10_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_KERNEL-5.10-ALLSYMS_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_KERNEL-5.10-GZ_BOOTIMAGE_PARTITION_SIZE := 47185920
BOARD_KERNEL-5.10-GZ-ALLSYMS_BOOTIMAGE_PARTITION_SIZE := 47185920
BOARD_KERNEL-5.10-LZ4_BOOTIMAGE_PARTITION_SIZE := 53477376
BOARD_KERNEL-5.10-LZ4-ALLSYMS_BOOTIMAGE_PARTITION_SIZE := 53477376
BOARD_KERNEL-5.15_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_KERNEL-5.15-ALLSYMS_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_KERNEL-5.15-GZ_BOOTIMAGE_PARTITION_SIZE := 47185920
BOARD_KERNEL-5.15-GZ-ALLSYMS_BOOTIMAGE_PARTITION_SIZE := 47185920
BOARD_KERNEL-5.15-LZ4_BOOTIMAGE_PARTITION_SIZE := 53477376
BOARD_KERNEL-5.15-LZ4-ALLSYMS_BOOTIMAGE_PARTITION_SIZE := 53477376

BOARD_KERNEL_BINARIES := \
    kernel-5.10 kernel-5.10-gz kernel-5.10-lz4 \
    kernel-5.15 kernel-5.15-gz kernel-5.15-lz4 \

ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
BOARD_KERNEL_BINARIES += \
    kernel-5.10-allsyms kernel-5.10-gz-allsyms kernel-5.10-lz4-allsyms \
    kernel-5.15-allsyms kernel-5.15-gz-allsyms kernel-5.15-lz4-allsyms \

endif

