################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include xip/subdir.mk
-include wifi/wlcmgr/subdir.mk
-include wifi/wifidriver/wpa_supp_if/subdir.mk
-include wifi/wifidriver/subdir.mk
-include wifi/wifi_bt_firmware/nw61x/subdir.mk
-include wifi/wifi_bt_firmware/iw610/subdir.mk
-include wifi/wifi_bt_firmware/IW416/subdir.mk
-include wifi/wifi_bt_firmware/8987/subdir.mk
-include wifi/wifi_bt_firmware/8801/subdir.mk
-include wifi/sdio_nxp_abs/subdir.mk
-include wifi/port/osa/subdir.mk
-include wifi/port/net/subdir.mk
-include wifi/fwdnld_intf_abs/subdir.mk
-include wifi/firmware_dnld/subdir.mk
-include wifi/dhcpd/subdir.mk
-include utilities/str/subdir.mk
-include utilities/debug_console/subdir.mk
-include utilities/subdir.mk
-include startup/subdir.mk
-include source/subdir.mk
-include sdmmc/sdio/subdir.mk
-include sdmmc/osa/subdir.mk
-include sdmmc/host/usdhc/non_blocking/subdir.mk
-include sdmmc/common/subdir.mk
-include lwip/src/netif/ppp/subdir.mk
-include lwip/src/netif/subdir.mk
-include lwip/src/core/ipv6/subdir.mk
-include lwip/src/core/ipv4/subdir.mk
-include lwip/src/core/subdir.mk
-include lwip/src/api/subdir.mk
-include lwip/port/sys_arch/dynamic/subdir.mk
-include lwip/contrib/apps/ping/subdir.mk
-include freertos/freertos-kernel/portable/MemMang/subdir.mk
-include freertos/freertos-kernel/portable/GCC/ARM_CM4F/subdir.mk
-include freertos/freertos-kernel/subdir.mk
-include edgefast_wifi/source/subdir.mk
-include drivers/subdir.mk
-include device/subdir.mk
-include component/uart/subdir.mk
-include component/serial_manager/subdir.mk
-include component/osa/subdir.mk
-include component/lists/subdir.mk
-include component/gpio/subdir.mk
-include board/subdir.mk
ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := monkey_d_wifi_setup_cm7
BUILD_ARTIFACT_EXTENSION := axf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all:
	+@$(MAKE) --no-print-directory main-build && $(MAKE) --no-print-directory post-build

# Main-build Target
main-build: monkey_d_wifi_setup_cm7.axf

# Tool invocations
monkey_d_wifi_setup_cm7.axf: $(OBJS) $(USER_OBJS) makefile $(OPTIONAL_TOOL_DEPS)
	@echo 'Building target: $@'
	@echo 'Invoking: MCU Linker'
	arm-none-eabi-gcc -nostdlib -Xlinker -no-warn-rwx-segments -Xlinker -Map="monkey_d_wifi_setup_cm7.map" -Xlinker --gc-sections -Xlinker -print-memory-usage -Xlinker --sort-section=alignment -Xlinker --cref -mcpu=cortex-m7 -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -T monkey_d_wifi_setup_cm7_Debug.ld -o "monkey_d_wifi_setup_cm7.axf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) monkey_d_wifi_setup_cm7.axf
	-@echo ' '

post-build:
	-@echo 'Performing post-build steps'
	-arm-none-eabi-size "monkey_d_wifi_setup_cm7.axf"; # arm-none-eabi-objcopy -v -O binary "monkey_d_wifi_setup_cm7.axf" "monkey_d_wifi_setup_cm7.bin" ; # checksum -p MIMXRT1176xxxxx -d "monkey_d_wifi_setup_cm7.bin";
	-@echo ' '

.PHONY: all clean dependents main-build post-build

-include ../makefile.targets
