################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../sdmmc/osa/fsl_sdmmc_osa.c 

C_DEPS += \
./sdmmc/osa/fsl_sdmmc_osa.d 

OBJS += \
./sdmmc/osa/fsl_sdmmc_osa.o 


# Each subdirectory must supply rules for building sources it contributes
sdmmc/osa/%.o: ../sdmmc/osa/%.c sdmmc/osa/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -DMCUXPRESSO_SDK -DXIP_EXTERNAL_FLASH=1 -DXIP_BOOT_HEADER_ENABLE=1 -DUSE_RTOS=1 -DPRINTF_ADVANCED_ENABLE=1 -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DCPU_MIMXRT1176DVMAA_cm7 -DOSA_USED -DSERIAL_PORT_TYPE_UART=1 -DCONFIG_NXP_WIFI_SOFTAP_SUPPORT=1 -DSDIO_ENABLED=1 -DSDK_OS_FREE_RTOS -DCPU_MIMXRT1176DVMAA -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"D:\work_nxp\monkey_d_wifi_setup_cm7\source" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\xip" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\drivers" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\CMSIS" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\CMSIS\m-profile" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\device" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\device\periph" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\utilities" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\lists" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\utilities\str" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\utilities\debug_console" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\serial_manager" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\gpio" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\uart" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\osa\config" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\osa" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\edgefast_wifi\include" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\wifi_bt_module\AzureWave\tx_pwr_limits" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\wifi_bt_module\Murata\tx_pwr_limits" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\wifi_bt_module\u-blox\tx_pwr_limits" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\wifi_bt_module\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\port\osa" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\port\osa" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\port" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\wifidriver" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifidriver" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifidriver\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\8801" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\IW416" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\8987" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\nw61x" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\iw610" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\firmware_dnld" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\sdio_nxp_abs" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\sdio_nxp_abs\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\fwdnld_intf_abs" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\wlcmgr" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifidriver\wpa_supp_if" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifidriver\wpa_supp_if\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\certs" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\port\net" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\port\net" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\port\net\hooks" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\port" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\src" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\src\include" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\src\include\lwip" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\port\sys_arch\dynamic" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\contrib\apps\ping" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\common" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\osa" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\sdio" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\host\usdhc" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\freertos\freertos-kernel\include" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\freertos\freertos-kernel\portable\GCC\ARM_CM4F" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\board" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\template\usdhc" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\freertos\freertos-kernel\template" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\freertos\freertos-kernel\template\ARM_CM4F_4_priority_bits" -O0 -fno-common -g3 -gdwarf-4 -mthumb -c -ffunction-sections -fdata-sections -fno-builtin -imacros "D:\work_nxp\monkey_d_wifi_setup_cm7\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m7 -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-sdmmc-2f-osa

clean-sdmmc-2f-osa:
	-$(RM) ./sdmmc/osa/fsl_sdmmc_osa.d ./sdmmc/osa/fsl_sdmmc_osa.o

.PHONY: clean-sdmmc-2f-osa

