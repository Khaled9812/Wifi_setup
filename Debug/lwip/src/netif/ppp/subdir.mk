################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip/src/netif/ppp/auth.c \
../lwip/src/netif/ppp/ccp.c \
../lwip/src/netif/ppp/chap-md5.c \
../lwip/src/netif/ppp/chap-new.c \
../lwip/src/netif/ppp/chap_ms.c \
../lwip/src/netif/ppp/demand.c \
../lwip/src/netif/ppp/eap.c \
../lwip/src/netif/ppp/ecp.c \
../lwip/src/netif/ppp/eui64.c \
../lwip/src/netif/ppp/fsm.c \
../lwip/src/netif/ppp/ipcp.c \
../lwip/src/netif/ppp/ipv6cp.c \
../lwip/src/netif/ppp/lcp.c \
../lwip/src/netif/ppp/magic.c \
../lwip/src/netif/ppp/mppe.c \
../lwip/src/netif/ppp/multilink.c \
../lwip/src/netif/ppp/ppp.c \
../lwip/src/netif/ppp/pppapi.c \
../lwip/src/netif/ppp/pppcrypt.c \
../lwip/src/netif/ppp/pppoe.c \
../lwip/src/netif/ppp/pppol2tp.c \
../lwip/src/netif/ppp/pppos.c \
../lwip/src/netif/ppp/upap.c \
../lwip/src/netif/ppp/utils.c \
../lwip/src/netif/ppp/vj.c 

C_DEPS += \
./lwip/src/netif/ppp/auth.d \
./lwip/src/netif/ppp/ccp.d \
./lwip/src/netif/ppp/chap-md5.d \
./lwip/src/netif/ppp/chap-new.d \
./lwip/src/netif/ppp/chap_ms.d \
./lwip/src/netif/ppp/demand.d \
./lwip/src/netif/ppp/eap.d \
./lwip/src/netif/ppp/ecp.d \
./lwip/src/netif/ppp/eui64.d \
./lwip/src/netif/ppp/fsm.d \
./lwip/src/netif/ppp/ipcp.d \
./lwip/src/netif/ppp/ipv6cp.d \
./lwip/src/netif/ppp/lcp.d \
./lwip/src/netif/ppp/magic.d \
./lwip/src/netif/ppp/mppe.d \
./lwip/src/netif/ppp/multilink.d \
./lwip/src/netif/ppp/ppp.d \
./lwip/src/netif/ppp/pppapi.d \
./lwip/src/netif/ppp/pppcrypt.d \
./lwip/src/netif/ppp/pppoe.d \
./lwip/src/netif/ppp/pppol2tp.d \
./lwip/src/netif/ppp/pppos.d \
./lwip/src/netif/ppp/upap.d \
./lwip/src/netif/ppp/utils.d \
./lwip/src/netif/ppp/vj.d 

OBJS += \
./lwip/src/netif/ppp/auth.o \
./lwip/src/netif/ppp/ccp.o \
./lwip/src/netif/ppp/chap-md5.o \
./lwip/src/netif/ppp/chap-new.o \
./lwip/src/netif/ppp/chap_ms.o \
./lwip/src/netif/ppp/demand.o \
./lwip/src/netif/ppp/eap.o \
./lwip/src/netif/ppp/ecp.o \
./lwip/src/netif/ppp/eui64.o \
./lwip/src/netif/ppp/fsm.o \
./lwip/src/netif/ppp/ipcp.o \
./lwip/src/netif/ppp/ipv6cp.o \
./lwip/src/netif/ppp/lcp.o \
./lwip/src/netif/ppp/magic.o \
./lwip/src/netif/ppp/mppe.o \
./lwip/src/netif/ppp/multilink.o \
./lwip/src/netif/ppp/ppp.o \
./lwip/src/netif/ppp/pppapi.o \
./lwip/src/netif/ppp/pppcrypt.o \
./lwip/src/netif/ppp/pppoe.o \
./lwip/src/netif/ppp/pppol2tp.o \
./lwip/src/netif/ppp/pppos.o \
./lwip/src/netif/ppp/upap.o \
./lwip/src/netif/ppp/utils.o \
./lwip/src/netif/ppp/vj.o 


# Each subdirectory must supply rules for building sources it contributes
lwip/src/netif/ppp/%.o: ../lwip/src/netif/ppp/%.c lwip/src/netif/ppp/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -DMCUXPRESSO_SDK -DXIP_EXTERNAL_FLASH=1 -DXIP_BOOT_HEADER_ENABLE=1 -DUSE_RTOS=1 -DPRINTF_ADVANCED_ENABLE=1 -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DCPU_MIMXRT1176DVMAA_cm7 -DOSA_USED -DSERIAL_PORT_TYPE_UART=1 -DCONFIG_NXP_WIFI_SOFTAP_SUPPORT=1 -DSDIO_ENABLED=1 -DSDK_OS_FREE_RTOS -DCPU_MIMXRT1176DVMAA -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"D:\work_nxp\monkey_d_wifi_setup_cm7\source" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\xip" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\drivers" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\CMSIS" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\CMSIS\m-profile" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\device" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\device\periph" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\utilities" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\lists" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\utilities\str" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\utilities\debug_console" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\serial_manager" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\gpio" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\uart" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\osa\config" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\osa" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\edgefast_wifi\include" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\wifi_bt_module\AzureWave\tx_pwr_limits" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\wifi_bt_module\Murata\tx_pwr_limits" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\wifi_bt_module\u-blox\tx_pwr_limits" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\component\wifi_bt_module\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\port\osa" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\port\osa" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\port" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\wifidriver" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifidriver" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifidriver\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\8801" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\IW416" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\8987" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\nw61x" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifi_bt_firmware\iw610" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\firmware_dnld" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\sdio_nxp_abs" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\sdio_nxp_abs\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\fwdnld_intf_abs" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\wlcmgr" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifidriver\wpa_supp_if" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\wifidriver\wpa_supp_if\incl" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\certs" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\port\net" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\port\net" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\wifi\incl\port\net\hooks" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\port" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\src" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\src\include" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\src\include\lwip" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\port\sys_arch\dynamic" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\lwip\contrib\apps\ping" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\common" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\osa" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\sdio" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\host\usdhc" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\freertos\freertos-kernel\include" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\freertos\freertos-kernel\portable\GCC\ARM_CM4F" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\board" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\sdmmc\template\usdhc" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\freertos\freertos-kernel\template" -I"D:\work_nxp\monkey_d_wifi_setup_cm7\freertos\freertos-kernel\template\ARM_CM4F_4_priority_bits" -O0 -fno-common -g3 -gdwarf-4 -mthumb -c -ffunction-sections -fdata-sections -fno-builtin -imacros "D:\work_nxp\monkey_d_wifi_setup_cm7\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m7 -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-lwip-2f-src-2f-netif-2f-ppp

clean-lwip-2f-src-2f-netif-2f-ppp:
	-$(RM) ./lwip/src/netif/ppp/auth.d ./lwip/src/netif/ppp/auth.o ./lwip/src/netif/ppp/ccp.d ./lwip/src/netif/ppp/ccp.o ./lwip/src/netif/ppp/chap-md5.d ./lwip/src/netif/ppp/chap-md5.o ./lwip/src/netif/ppp/chap-new.d ./lwip/src/netif/ppp/chap-new.o ./lwip/src/netif/ppp/chap_ms.d ./lwip/src/netif/ppp/chap_ms.o ./lwip/src/netif/ppp/demand.d ./lwip/src/netif/ppp/demand.o ./lwip/src/netif/ppp/eap.d ./lwip/src/netif/ppp/eap.o ./lwip/src/netif/ppp/ecp.d ./lwip/src/netif/ppp/ecp.o ./lwip/src/netif/ppp/eui64.d ./lwip/src/netif/ppp/eui64.o ./lwip/src/netif/ppp/fsm.d ./lwip/src/netif/ppp/fsm.o ./lwip/src/netif/ppp/ipcp.d ./lwip/src/netif/ppp/ipcp.o ./lwip/src/netif/ppp/ipv6cp.d ./lwip/src/netif/ppp/ipv6cp.o ./lwip/src/netif/ppp/lcp.d ./lwip/src/netif/ppp/lcp.o ./lwip/src/netif/ppp/magic.d ./lwip/src/netif/ppp/magic.o ./lwip/src/netif/ppp/mppe.d ./lwip/src/netif/ppp/mppe.o ./lwip/src/netif/ppp/multilink.d ./lwip/src/netif/ppp/multilink.o ./lwip/src/netif/ppp/ppp.d ./lwip/src/netif/ppp/ppp.o ./lwip/src/netif/ppp/pppapi.d ./lwip/src/netif/ppp/pppapi.o ./lwip/src/netif/ppp/pppcrypt.d ./lwip/src/netif/ppp/pppcrypt.o ./lwip/src/netif/ppp/pppoe.d ./lwip/src/netif/ppp/pppoe.o ./lwip/src/netif/ppp/pppol2tp.d ./lwip/src/netif/ppp/pppol2tp.o ./lwip/src/netif/ppp/pppos.d ./lwip/src/netif/ppp/pppos.o ./lwip/src/netif/ppp/upap.d ./lwip/src/netif/ppp/upap.o ./lwip/src/netif/ppp/utils.d ./lwip/src/netif/ppp/utils.o ./lwip/src/netif/ppp/vj.d ./lwip/src/netif/ppp/vj.o

.PHONY: clean-lwip-2f-src-2f-netif-2f-ppp

