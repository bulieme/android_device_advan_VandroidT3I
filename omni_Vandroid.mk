$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Otherwise, If you have 32-bit device, add the below line instead of above line
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)

# Another common config inclusion
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# If you are building from OmniROM's minimal source, Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Replace ${Vandroid} with your Device Name's Value.
# Replace ${alps} with your Brand's / Manufacturer's Value.
PRODUCT_COPY_FILES += device/${alps}/${Vandroid}/prebuilt/kernel:kernel
# Fles under $(LOCAL_PATH)/recovery/root/ gets automatically copied into recovery
# PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/*:root/*

PRODUCT_DEVICE := ${Vandroid}
PRODUCT_NAME := omni_${Vandroid}
PRODUCT_BRAND := ${alps}
PRODUCT_MODEL := ${Vandroid T3i}
PRODUCT_MANUFACTURER := ${MIKI}

# Forcefully add mtp support (adb is already there)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Add fingerprint from Stock ROM build.prop
PRODUCT_BUILD_PROP_OVERRIDES += \
    # These lines are from my device. You MUST Replace yours.
    BUILD_FINGERPRINT="Vandroid_T3i/ICS4.0.4" \
    PRIVATE_BUILD_DESC="Vandroid_T3i_ICS_USER"