/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_dalvik_heap.h>
#include <libinit_utils.h>
#include <libinit_variant.h>

#include "vendor_init.h"

#include <android-base/file.h>

static const variant_info_t ugglite_info = {
    .brand = "xiaomi",
    .device = "ugglite",
    .marketname = "",
    .model = "Redmi Note 5A",
    .build_fingerprint = "",
};

static const variant_info_t ugg_info = {
    .brand = "xiaomi",
    .device = "ugg",
    .marketname = "",
    .model = "Redmi Note 5A",
    .build_fingerprint = "",
};

static void determine_device()
{
    std::string fdt_model;

    android::base::ReadFileToString("/sys/firmware/devicetree/base/model", &fdt_model, true);
    if (fdt_model.find("MSM8917") != fdt_model.npos)
        set_variant_props(ugglite_info);
    else if (fdt_model.find("MSM8940") != fdt_model.npos)
        set_variant_props(ugg_info);
}

void vendor_load_properties() {
    determine_device();
    set_dalvik_heap();
}
