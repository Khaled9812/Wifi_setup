################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../wifi/wifidriver/mlan_11ac.c \
../wifi/wifidriver/mlan_11ax.c \
../wifi/wifidriver/mlan_11d.c \
../wifi/wifidriver/mlan_11h.c \
../wifi/wifidriver/mlan_11k.c \
../wifi/wifidriver/mlan_11n.c \
../wifi/wifidriver/mlan_11n_aggr.c \
../wifi/wifidriver/mlan_11n_rxreorder.c \
../wifi/wifidriver/mlan_11v.c \
../wifi/wifidriver/mlan_action.c \
../wifi/wifidriver/mlan_api.c \
../wifi/wifidriver/mlan_cfp.c \
../wifi/wifidriver/mlan_cmdevt.c \
../wifi/wifidriver/mlan_glue.c \
../wifi/wifidriver/mlan_init.c \
../wifi/wifidriver/mlan_join.c \
../wifi/wifidriver/mlan_mbo.c \
../wifi/wifidriver/mlan_misc.c \
../wifi/wifidriver/mlan_scan.c \
../wifi/wifidriver/mlan_shim.c \
../wifi/wifidriver/mlan_sta_cmd.c \
../wifi/wifidriver/mlan_sta_cmdresp.c \
../wifi/wifidriver/mlan_sta_event.c \
../wifi/wifidriver/mlan_sta_ioctl.c \
../wifi/wifidriver/mlan_sta_rx.c \
../wifi/wifidriver/mlan_txrx.c \
../wifi/wifidriver/mlan_uap_cmdevent.c \
../wifi/wifidriver/mlan_uap_ioctl.c \
../wifi/wifidriver/mlan_wmm.c \
../wifi/wifidriver/sdio.c \
../wifi/wifidriver/wifi-debug.c \
../wifi/wifidriver/wifi-mem.c \
../wifi/wifidriver/wifi-sdio.c \
../wifi/wifidriver/wifi-uap.c \
../wifi/wifidriver/wifi-wps.c \
../wifi/wifidriver/wifi.c \
../wifi/wifidriver/wifi_pwrmgr.c 

C_DEPS += \
./wifi/wifidriver/mlan_11ac.d \
./wifi/wifidriver/mlan_11ax.d \
./wifi/wifidriver/mlan_11d.d \
./wifi/wifidriver/mlan_11h.d \
./wifi/wifidriver/mlan_11k.d \
./wifi/wifidriver/mlan_11n.d \
./wifi/wifidriver/mlan_11n_aggr.d \
./wifi/wifidriver/mlan_11n_rxreorder.d \
./wifi/wifidriver/mlan_11v.d \
./wifi/wifidriver/mlan_action.d \
./wifi/wifidriver/mlan_api.d \
./wifi/wifidriver/mlan_cfp.d \
./wifi/wifidriver/mlan_cmdevt.d \
./wifi/wifidriver/mlan_glue.d \
./wifi/wifidriver/mlan_init.d \
./wifi/wifidriver/mlan_join.d \
./wifi/wifidriver/mlan_mbo.d \
./wifi/wifidriver/mlan_misc.d \
./wifi/wifidriver/mlan_scan.d \
./wifi/wifidriver/mlan_shim.d \
./wifi/wifidriver/mlan_sta_cmd.d \
./wifi/wifidriver/mlan_sta_cmdresp.d \
./wifi/wifidriver/mlan_sta_event.d \
./wifi/wifidriver/mlan_sta_ioctl.d \
./wifi/wifidriver/mlan_sta_rx.d \
./wifi/wifidriver/mlan_txrx.d \
./wifi/wifidriver/mlan_uap_cmdevent.d \
./wifi/wifidriver/mlan_uap_ioctl.d \
./wifi/wifidriver/mlan_wmm.d \
./wifi/wifidriver/sdio.d \
./wifi/wifidriver/wifi-debug.d \
./wifi/wifidriver/wifi-mem.d \
./wifi/wifidriver/wifi-sdio.d \
./wifi/wifidriver/wifi-uap.d \
./wifi/wifidriver/wifi-wps.d \
./wifi/wifidriver/wifi.d \
./wifi/wifidriver/wifi_pwrmgr.d 

OBJS += \
./wifi/wifidriver/mlan_11ac.o \
./wifi/wifidriver/mlan_11ax.o \
./wifi/wifidriver/mlan_11d.o \
./wifi/wifidriver/mlan_11h.o \
./wifi/wifidriver/mlan_11k.o \
./wifi/wifidriver/mlan_11n.o \
./wifi/wifidriver/mlan_11n_aggr.o \
./wifi/wifidriver/mlan_11n_rxreorder.o \
./wifi/wifidriver/mlan_11v.o \
./wifi/wifidriver/mlan_action.o \
./wifi/wifidriver/mlan_api.o \
./wifi/wifidriver/mlan_cfp.o \
./wifi/wifidriver/mlan_cmdevt.o \
./wifi/wifidriver/mlan_glue.o \
./wifi/wifidriver/mlan_init.o \
./wifi/wifidriver/mlan_join.o \
./wifi/wifidriver/mlan_mbo.o \
./wifi/wifidriver/mlan_misc.o \
./wifi/wifidriver/mlan_scan.o \
./wifi/wifidriver/mlan_shim.o \
./wifi/wifidriver/mlan_sta_cmd.o \
./wifi/wifidriver/mlan_sta_cmdresp.o \
./wifi/wifidriver/mlan_sta_event.o \
./wifi/wifidriver/mlan_sta_ioctl.o \
./wifi/wifidriver/mlan_sta_rx.o \
./wifi/wifidriver/mlan_txrx.o \
./wifi/wifidriver/mlan_uap_cmdevent.o \
./wifi/wifidriver/mlan_uap_ioctl.o \
./wifi/wifidriver/mlan_wmm.o \
./wifi/wifidriver/sdio.o \
./wifi/wifidriver/wifi-debug.o \
./wifi/wifidriver/wifi-mem.o \
./wifi/wifidriver/wifi-sdio.o \
./wifi/wifidriver/wifi-uap.o \
./wifi/wifidriver/wifi-wps.o \
./wifi/wifidriver/wifi.o \
./wifi/wifidriver/wifi_pwrmgr.o 


# Each subdirectory must supply rules for building sources it contributes
wifi/wifidriver/%.o: ../wifi/wifidriver/%.c wifi/wifidriver/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -DMCUXPRESSO_SDK -DXIP_EXTERNAL_FLASH=1 -DXIP_BOOT_HEADER_ENABLE=1 -DUSE_RTOS=1 -DPRINTF_ADVANCED_ENABLE=1 -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DCPU_MIMXRT1176DVMAA_cm7 -DOSA_USED -DSERIAL_PORT_TYPE_UART=1 -DCONFIG_NXP_WIFI_SOFTAP_SUPPORT=1 -DSDIO_ENABLED=1 -DSDK_OS_FREE_RTOS -DCPU_MIMXRT1176DVMAA -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"D:\work_nxp\monkey_d_wifi_setup_cm7\source" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\xip" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\drivers" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\CMSIS" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\CMSIS\m-profile" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\device" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\device\periph" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\utilities" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\lists" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\utilities\str" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\utilities\debug_console" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\serial_manager" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\gpio" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\uart" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\osa\config" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\osa" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\edgefast_wifi\include" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\wifi_bt_module\AzureWave\tx_pwr_limits" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\wifi_bt_module\Murata\tx_pwr_limits" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\wifi_bt_module\u-blox\tx_pwr_limits" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\wifi_bt_module\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\port\osa" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\port\osa" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\port" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\wifidriver" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifidriver" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifidriver\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\8801" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\IW416" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\8987" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\nw61x" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\iw610" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\firmware_dnld" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\sdio_nxp_abs" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\sdio_nxp_abs\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\fwdnld_intf_abs" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\wlcmgr" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifidriver\wpa_supp_if" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifidriver\wpa_supp_if\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\certs" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\port\net" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\port\net" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\port\net\hooks" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\port" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\src" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\src\include" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\src\include\lwip" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\port\sys_arch\dynamic" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\contrib\apps\ping" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\common" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\osa" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\sdio" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\host\usdhc" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\freertos\freertos-kernel\include" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\freertos\freertos-kernel\portable\GCC\ARM_CM4F" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\board" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\template\usdhc" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\freertos\freertos-kernel\template" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\freertos\freertos-kernel\template\ARM_CM4F_4_priority_bits" -O0 -fno-common -g3 -gdwarf-4 -mthumb -c -ffunction-sections -fdata-sections -fno-builtin -imacros "D:\work_nxp\monkey_d_wifi_setup_cm7\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m7 -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-wifi-2f-wifidriver

clean-wifi-2f-wifidriver:
	-$(RM) ./wifi/wifidriver/mlan_11ac.d ./wifi/wifidriver/mlan_11ac.o ./wifi/wifidriver/mlan_11ax.d ./wifi/wifidriver/mlan_11ax.o ./wifi/wifidriver/mlan_11d.d ./wifi/wifidriver/mlan_11d.o ./wifi/wifidriver/mlan_11h.d ./wifi/wifidriver/mlan_11h.o ./wifi/wifidriver/mlan_11k.d ./wifi/wifidriver/mlan_11k.o ./wifi/wifidriver/mlan_11n.d ./wifi/wifidriver/mlan_11n.o ./wifi/wifidriver/mlan_11n_aggr.d ./wifi/wifidriver/mlan_11n_aggr.o ./wifi/wifidriver/mlan_11n_rxreorder.d ./wifi/wifidriver/mlan_11n_rxreorder.o ./wifi/wifidriver/mlan_11v.d ./wifi/wifidriver/mlan_11v.o ./wifi/wifidriver/mlan_action.d ./wifi/wifidriver/mlan_action.o ./wifi/wifidriver/mlan_api.d ./wifi/wifidriver/mlan_api.o ./wifi/wifidriver/mlan_cfp.d ./wifi/wifidriver/mlan_cfp.o ./wifi/wifidriver/mlan_cmdevt.d ./wifi/wifidriver/mlan_cmdevt.o ./wifi/wifidriver/mlan_glue.d ./wifi/wifidriver/mlan_glue.o ./wifi/wifidriver/mlan_init.d ./wifi/wifidriver/mlan_init.o ./wifi/wifidriver/mlan_join.d ./wifi/wifidriver/mlan_join.o ./wifi/wifidriver/mlan_mbo.d ./wifi/wifidriver/mlan_mbo.o ./wifi/wifidriver/mlan_misc.d ./wifi/wifidriver/mlan_misc.o ./wifi/wifidriver/mlan_scan.d ./wifi/wifidriver/mlan_scan.o ./wifi/wifidriver/mlan_shim.d ./wifi/wifidriver/mlan_shim.o ./wifi/wifidriver/mlan_sta_cmd.d ./wifi/wifidriver/mlan_sta_cmd.o ./wifi/wifidriver/mlan_sta_cmdresp.d ./wifi/wifidriver/mlan_sta_cmdresp.o ./wifi/wifidriver/mlan_sta_event.d ./wifi/wifidriver/mlan_sta_event.o ./wifi/wifidriver/mlan_sta_ioctl.d ./wifi/wifidriver/mlan_sta_ioctl.o ./wifi/wifidriver/mlan_sta_rx.d ./wifi/wifidriver/mlan_sta_rx.o ./wifi/wifidriver/mlan_txrx.d ./wifi/wifidriver/mlan_txrx.o ./wifi/wifidriver/mlan_uap_cmdevent.d ./wifi/wifidriver/mlan_uap_cmdevent.o ./wifi/wifidriver/mlan_uap_ioctl.d ./wifi/wifidriver/mlan_uap_ioctl.o ./wifi/wifidriver/mlan_wmm.d ./wifi/wifidriver/mlan_wmm.o ./wifi/wifidriver/sdio.d ./wifi/wifidriver/sdio.o ./wifi/wifidriver/wifi-debug.d ./wifi/wifidriver/wifi-debug.o ./wifi/wifidriver/wifi-mem.d ./wifi/wifidriver/wifi-mem.o ./wifi/wifidriver/wifi-sdio.d ./wifi/wifidriver/wifi-sdio.o ./wifi/wifidriver/wifi-uap.d ./wifi/wifidriver/wifi-uap.o ./wifi/wifidriver/wifi-wps.d ./wifi/wifidriver/wifi-wps.o ./wifi/wifidriver/wifi.d ./wifi/wifidriver/wifi.o ./wifi/wifidriver/wifi_pwrmgr.d ./wifi/wifidriver/wifi_pwrmgr.o

.PHONY: clean-wifi-2f-wifidriver

