add_json_str_omitempty = $(if $(strip $(2)),$(call add_json_str, $(1), $(2)))

_contents := $(_contents)    "Omnirom": {$(newline)

# See build/core/soong_config.mk for the add_json_* functions you can use here.
$(call add_json_bool, Healthd_use_battery_info,               $(filter true,$(HEALTHD_USE_BATTERY_INFO)))
$(call add_json_bool, Healthd_enable_op_fastchg,              $(filter true,$(HEALTHD_ENABLE_OP_FASTCHG_CHECK)))
$(call add_json_bool, TargetNeedsHWCOnFirstRef,               $(filter true,$(TARGET_NEEDS_HWC_ONFIRSTREF)))
$(call add_json_bool, Uses_metadata_as_fde_key,               $(filter true,$(TARGET_USES_METADATA_AS_FDE_KEY)))
$(call add_json_bool, Target_use_sdclang,                     $(filter true,$(TARGET_USE_SDCLANG)))
$(call add_json_bool, Target_camera_needs_client_info,        $(filter true,$(TARGET_CAMERA_NEEDS_CLIENT_INFO)))
$(call add_json_bool, Target_motorized_camera,                $(filter true,$(TARGET_MOTORIZED_CAMERA)))
$(call add_json_str_omitempty, Target_init_vendor_lib, $(TARGET_INIT_VENDOR_LIB))

# This causes the build system to strip out the last comma in our nested struct, to keep the JSON valid.
_contents := $(_contents)__SV_END

_contents := $(_contents)    },$(newline)
