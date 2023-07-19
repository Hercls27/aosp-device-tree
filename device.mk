#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Rootdir
PRODUCT_PACKAGES += \
    init.qcom.sh \
    init.nubia.debug.sh \
    init.class_main.sh \
    vendor_modprobe.sh \
    btconfig_shell.sh \
    init.qcom.post_boot.sh \
    init.kernel.post_boot-diwali.sh \
    init.qcom.usb.sh \
    init.qti.touch_boot.sh \
    init.qti.kernel.early_debug.sh \
    btconfig_wdsdaemon.sh \
    init.qti.kernel.sh \
    init.qti.qcv.sh \
    init.qti.write.sh \
    init.kernel.post_boot-taro.sh \
    init.crda.sh \
    init.qti.media.sh \
    init.kernel.post_boot.sh \
    init.qcom.coex.sh \
    init.qti.kernel.debug.sh \
    init.qti.kernel.debug-diwali.sh \
    init.mdm.sh \
    init.qti.display_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.sensors.sh \
    init.qti.ese.strongbox.sh \
    wp_vendor_mdlog_opts.sh \
    init.qcom.class_core.sh \
    qca6234-service.sh \
    init.qcom.early_boot.sh \
    init.qti.kernel.early_debug-taro.sh \
    init.qcom.sdio.sh \
    init.qti.kernel.debug-cape.sh \
    init.qti.kernel.debug-taro.sh \
    bootsound.sh \
    wp_vendor_domain_mv.sh \
    init.nubia.post_boot.sh \
    init.kernel.post_boot-cape.sh \

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.dmapp.rc \
    init.project.rc \
    init.nubia.smartfan.rc \
    init.multicolor.led.rc \
    init.target.rc \
    init.nubia.ltm.rc \
    init.qcom.rc \
    init.nubia.battery.rc \
    init.nubia.haptic.rc \
    init.nubia.stcoem.rc \
    init.nfc.sec.rc \
    init.qti.kernel.rc \
    init.qcom.factory.rc \
    init.nubia.sensors.rc \
    init.nb.rc \
    init.nubia.fingerprint.rc \
    init.nubia.touch.lcd.rc \
    init.nb.core.rc \
    init.nubia.platform.rc \
    init.nubia.Light.rc \
    init.qcom.usb.rc \
    init.qti.ufs.rc \
    init.recovery.qcom.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.qcom

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 32

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/nubia/NX709S/NX709S-vendor.mk)
