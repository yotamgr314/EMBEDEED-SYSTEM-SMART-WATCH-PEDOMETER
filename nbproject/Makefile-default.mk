#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/EMBEDEED-SYSTEM-SMART-WATCH-NEW.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/EMBEDEED-SYSTEM-SMART-WATCH-NEW.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=appCFiles/app.c appCFiles/oled_display.c appCFiles/step_counter.c appCFiles/menu_manager.c appCFiles/button_handler.c appCFiles/acceleromete.c appCFiles/display_clock.c appCFiles/timeSetUp.c i2cDriver/i2c1_driver.c oledDriver/oledC.c oledDriver/oledC_shapeHandler.c oledDriver/oledC_shapes.c oledDriver/pin_manager.c spiDriver/spi1_driver.c System/clock.c System/delay.c System/system.c System/traps.c main.c Accel_i2c.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/appCFiles/app.o ${OBJECTDIR}/appCFiles/oled_display.o ${OBJECTDIR}/appCFiles/step_counter.o ${OBJECTDIR}/appCFiles/menu_manager.o ${OBJECTDIR}/appCFiles/button_handler.o ${OBJECTDIR}/appCFiles/acceleromete.o ${OBJECTDIR}/appCFiles/display_clock.o ${OBJECTDIR}/appCFiles/timeSetUp.o ${OBJECTDIR}/i2cDriver/i2c1_driver.o ${OBJECTDIR}/oledDriver/oledC.o ${OBJECTDIR}/oledDriver/oledC_shapeHandler.o ${OBJECTDIR}/oledDriver/oledC_shapes.o ${OBJECTDIR}/oledDriver/pin_manager.o ${OBJECTDIR}/spiDriver/spi1_driver.o ${OBJECTDIR}/System/clock.o ${OBJECTDIR}/System/delay.o ${OBJECTDIR}/System/system.o ${OBJECTDIR}/System/traps.o ${OBJECTDIR}/main.o ${OBJECTDIR}/Accel_i2c.o
POSSIBLE_DEPFILES=${OBJECTDIR}/appCFiles/app.o.d ${OBJECTDIR}/appCFiles/oled_display.o.d ${OBJECTDIR}/appCFiles/step_counter.o.d ${OBJECTDIR}/appCFiles/menu_manager.o.d ${OBJECTDIR}/appCFiles/button_handler.o.d ${OBJECTDIR}/appCFiles/acceleromete.o.d ${OBJECTDIR}/appCFiles/display_clock.o.d ${OBJECTDIR}/appCFiles/timeSetUp.o.d ${OBJECTDIR}/i2cDriver/i2c1_driver.o.d ${OBJECTDIR}/oledDriver/oledC.o.d ${OBJECTDIR}/oledDriver/oledC_shapeHandler.o.d ${OBJECTDIR}/oledDriver/oledC_shapes.o.d ${OBJECTDIR}/oledDriver/pin_manager.o.d ${OBJECTDIR}/spiDriver/spi1_driver.o.d ${OBJECTDIR}/System/clock.o.d ${OBJECTDIR}/System/delay.o.d ${OBJECTDIR}/System/system.o.d ${OBJECTDIR}/System/traps.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/Accel_i2c.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/appCFiles/app.o ${OBJECTDIR}/appCFiles/oled_display.o ${OBJECTDIR}/appCFiles/step_counter.o ${OBJECTDIR}/appCFiles/menu_manager.o ${OBJECTDIR}/appCFiles/button_handler.o ${OBJECTDIR}/appCFiles/acceleromete.o ${OBJECTDIR}/appCFiles/display_clock.o ${OBJECTDIR}/appCFiles/timeSetUp.o ${OBJECTDIR}/i2cDriver/i2c1_driver.o ${OBJECTDIR}/oledDriver/oledC.o ${OBJECTDIR}/oledDriver/oledC_shapeHandler.o ${OBJECTDIR}/oledDriver/oledC_shapes.o ${OBJECTDIR}/oledDriver/pin_manager.o ${OBJECTDIR}/spiDriver/spi1_driver.o ${OBJECTDIR}/System/clock.o ${OBJECTDIR}/System/delay.o ${OBJECTDIR}/System/system.o ${OBJECTDIR}/System/traps.o ${OBJECTDIR}/main.o ${OBJECTDIR}/Accel_i2c.o

# Source Files
SOURCEFILES=appCFiles/app.c appCFiles/oled_display.c appCFiles/step_counter.c appCFiles/menu_manager.c appCFiles/button_handler.c appCFiles/acceleromete.c appCFiles/display_clock.c appCFiles/timeSetUp.c i2cDriver/i2c1_driver.c oledDriver/oledC.c oledDriver/oledC_shapeHandler.c oledDriver/oledC_shapes.c oledDriver/pin_manager.c spiDriver/spi1_driver.c System/clock.c System/delay.c System/system.c System/traps.c main.c Accel_i2c.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/EMBEDEED-SYSTEM-SMART-WATCH-NEW.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ256GA705
MP_LINKER_FILE_OPTION=,--script=p24FJ256GA705.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/appCFiles/app.o: appCFiles/app.c  .generated_files/flags/default/991c530fb9123206ea37b7e39a39d11d6c749e73 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/app.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/app.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/app.c  -o ${OBJECTDIR}/appCFiles/app.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/app.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/oled_display.o: appCFiles/oled_display.c  .generated_files/flags/default/b2897191e4da3aade5d47919a756fd57f09eb98c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/oled_display.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/oled_display.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/oled_display.c  -o ${OBJECTDIR}/appCFiles/oled_display.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/oled_display.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/step_counter.o: appCFiles/step_counter.c  .generated_files/flags/default/e8628ff9212c87f25deaab1890bf00298b80d24d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/step_counter.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/step_counter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/step_counter.c  -o ${OBJECTDIR}/appCFiles/step_counter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/step_counter.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/menu_manager.o: appCFiles/menu_manager.c  .generated_files/flags/default/db0304a9aed423c8946dca165879f8da06cc234f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/menu_manager.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/menu_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/menu_manager.c  -o ${OBJECTDIR}/appCFiles/menu_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/menu_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/button_handler.o: appCFiles/button_handler.c  .generated_files/flags/default/37d66c34073e45d3055ffcd653ca522ad5cef840 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/button_handler.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/button_handler.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/button_handler.c  -o ${OBJECTDIR}/appCFiles/button_handler.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/button_handler.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/acceleromete.o: appCFiles/acceleromete.c  .generated_files/flags/default/aa99f84bb140127e91f75ee0d4e62bcb3d3d7290 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/acceleromete.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/acceleromete.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/acceleromete.c  -o ${OBJECTDIR}/appCFiles/acceleromete.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/acceleromete.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/display_clock.o: appCFiles/display_clock.c  .generated_files/flags/default/b29fbde81e5211a634533b618d1a0f7ffcdc6b09 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/display_clock.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/display_clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/display_clock.c  -o ${OBJECTDIR}/appCFiles/display_clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/display_clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/timeSetUp.o: appCFiles/timeSetUp.c  .generated_files/flags/default/237885a37dc67943e229de529bad7cc92ba33e8b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/timeSetUp.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/timeSetUp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/timeSetUp.c  -o ${OBJECTDIR}/appCFiles/timeSetUp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/timeSetUp.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/i2cDriver/i2c1_driver.o: i2cDriver/i2c1_driver.c  .generated_files/flags/default/f04ea0efdbe950af22301a8c07fd9e7e83a0fe48 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/i2cDriver" 
	@${RM} ${OBJECTDIR}/i2cDriver/i2c1_driver.o.d 
	@${RM} ${OBJECTDIR}/i2cDriver/i2c1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2cDriver/i2c1_driver.c  -o ${OBJECTDIR}/i2cDriver/i2c1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2cDriver/i2c1_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/oledDriver/oledC.o: oledDriver/oledC.c  .generated_files/flags/default/3daf587b5b888d02f164f434de423e6818a792e8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC.c  -o ${OBJECTDIR}/oledDriver/oledC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/oledDriver/oledC_shapeHandler.o: oledDriver/oledC_shapeHandler.c  .generated_files/flags/default/64bfb017c333ab47a14412e26ef9b11047f5b5b1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapeHandler.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapeHandler.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC_shapeHandler.c  -o ${OBJECTDIR}/oledDriver/oledC_shapeHandler.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC_shapeHandler.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/oledDriver/oledC_shapes.o: oledDriver/oledC_shapes.c  .generated_files/flags/default/da1021f09f26861abe5ad21b4f98828296a72040 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapes.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC_shapes.c  -o ${OBJECTDIR}/oledDriver/oledC_shapes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC_shapes.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/oledDriver/pin_manager.o: oledDriver/pin_manager.c  .generated_files/flags/default/18733b609060d608a6b0b0f56790d3a16b6fb474 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/pin_manager.c  -o ${OBJECTDIR}/oledDriver/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/pin_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/spiDriver/spi1_driver.o: spiDriver/spi1_driver.c  .generated_files/flags/default/66016bcbdcbdccd9b773b555245fe633b099a5aa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/spiDriver" 
	@${RM} ${OBJECTDIR}/spiDriver/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/spiDriver/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spiDriver/spi1_driver.c  -o ${OBJECTDIR}/spiDriver/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spiDriver/spi1_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/System/clock.o: System/clock.c  .generated_files/flags/default/381384c90a6c3825944d5eabfbe69855be6a818b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/clock.o.d 
	@${RM} ${OBJECTDIR}/System/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/clock.c  -o ${OBJECTDIR}/System/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/System/delay.o: System/delay.c  .generated_files/flags/default/910016f8e9ccd1b20ee6f7f891214f7cbb0baa48 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/delay.o.d 
	@${RM} ${OBJECTDIR}/System/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/delay.c  -o ${OBJECTDIR}/System/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/delay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/System/system.o: System/system.c  .generated_files/flags/default/ca02b54618a16b1ed18314ab76accb33fb8f911c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/system.o.d 
	@${RM} ${OBJECTDIR}/System/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/system.c  -o ${OBJECTDIR}/System/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/System/traps.o: System/traps.c  .generated_files/flags/default/3a95bce9e560f27b2ee4562638f83dbf97e62623 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/traps.o.d 
	@${RM} ${OBJECTDIR}/System/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/traps.c  -o ${OBJECTDIR}/System/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/2e6463e1aa45e6118f41cb9ba2f7b941f89ec31d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/Accel_i2c.o: Accel_i2c.c  .generated_files/flags/default/a9107013dfbe128ddb49d38a60fe388ce1c68b98 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Accel_i2c.o.d 
	@${RM} ${OBJECTDIR}/Accel_i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Accel_i2c.c  -o ${OBJECTDIR}/Accel_i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Accel_i2c.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
else
${OBJECTDIR}/appCFiles/app.o: appCFiles/app.c  .generated_files/flags/default/ec7beca0506dd2dd55ed0c60ee3b667f68525537 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/app.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/app.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/app.c  -o ${OBJECTDIR}/appCFiles/app.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/app.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/oled_display.o: appCFiles/oled_display.c  .generated_files/flags/default/3e81f36188c93a1e9e31dfe0288988e89f56ef2f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/oled_display.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/oled_display.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/oled_display.c  -o ${OBJECTDIR}/appCFiles/oled_display.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/oled_display.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/step_counter.o: appCFiles/step_counter.c  .generated_files/flags/default/4296a54eb08de0493ea2a2cfdd922df98675029f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/step_counter.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/step_counter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/step_counter.c  -o ${OBJECTDIR}/appCFiles/step_counter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/step_counter.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/menu_manager.o: appCFiles/menu_manager.c  .generated_files/flags/default/fa83bbef4787e78dcff2581415ab4bad716de789 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/menu_manager.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/menu_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/menu_manager.c  -o ${OBJECTDIR}/appCFiles/menu_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/menu_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/button_handler.o: appCFiles/button_handler.c  .generated_files/flags/default/ae66a65389501894d2292568a19e2cf3e6c23c60 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/button_handler.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/button_handler.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/button_handler.c  -o ${OBJECTDIR}/appCFiles/button_handler.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/button_handler.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/acceleromete.o: appCFiles/acceleromete.c  .generated_files/flags/default/a36fa3df24d9622852654de7911c53684587532 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/acceleromete.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/acceleromete.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/acceleromete.c  -o ${OBJECTDIR}/appCFiles/acceleromete.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/acceleromete.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/display_clock.o: appCFiles/display_clock.c  .generated_files/flags/default/79de61e71c0f38dec55b872301aa02a499708ae4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/display_clock.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/display_clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/display_clock.c  -o ${OBJECTDIR}/appCFiles/display_clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/display_clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/appCFiles/timeSetUp.o: appCFiles/timeSetUp.c  .generated_files/flags/default/6e4414b8e75331d0d7f550ae5f89b81280a5eec0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/appCFiles" 
	@${RM} ${OBJECTDIR}/appCFiles/timeSetUp.o.d 
	@${RM} ${OBJECTDIR}/appCFiles/timeSetUp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  appCFiles/timeSetUp.c  -o ${OBJECTDIR}/appCFiles/timeSetUp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/appCFiles/timeSetUp.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/i2cDriver/i2c1_driver.o: i2cDriver/i2c1_driver.c  .generated_files/flags/default/6b3161f7590c04a7e9ea11b29c114a66de117834 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/i2cDriver" 
	@${RM} ${OBJECTDIR}/i2cDriver/i2c1_driver.o.d 
	@${RM} ${OBJECTDIR}/i2cDriver/i2c1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2cDriver/i2c1_driver.c  -o ${OBJECTDIR}/i2cDriver/i2c1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2cDriver/i2c1_driver.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/oledDriver/oledC.o: oledDriver/oledC.c  .generated_files/flags/default/b45fd64c222ef73fef25a2cf80e46df826ed9056 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC.c  -o ${OBJECTDIR}/oledDriver/oledC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/oledDriver/oledC_shapeHandler.o: oledDriver/oledC_shapeHandler.c  .generated_files/flags/default/a68632c824f41d96b6a69e1a411edcd96fffa1e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapeHandler.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapeHandler.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC_shapeHandler.c  -o ${OBJECTDIR}/oledDriver/oledC_shapeHandler.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC_shapeHandler.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/oledDriver/oledC_shapes.o: oledDriver/oledC_shapes.c  .generated_files/flags/default/b1f8f229cf5872826a27458243c6389ec589f7d8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapes.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC_shapes.c  -o ${OBJECTDIR}/oledDriver/oledC_shapes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC_shapes.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/oledDriver/pin_manager.o: oledDriver/pin_manager.c  .generated_files/flags/default/4527c4e6afb8b90ab21947a951846f65dbe82f8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/pin_manager.c  -o ${OBJECTDIR}/oledDriver/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/spiDriver/spi1_driver.o: spiDriver/spi1_driver.c  .generated_files/flags/default/29ef7b0149e01f3404e2f3d701b59430abf724a8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/spiDriver" 
	@${RM} ${OBJECTDIR}/spiDriver/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/spiDriver/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spiDriver/spi1_driver.c  -o ${OBJECTDIR}/spiDriver/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spiDriver/spi1_driver.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/System/clock.o: System/clock.c  .generated_files/flags/default/a9ea441364f6c318cb30db255b7a0ba08fa595e0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/clock.o.d 
	@${RM} ${OBJECTDIR}/System/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/clock.c  -o ${OBJECTDIR}/System/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/System/delay.o: System/delay.c  .generated_files/flags/default/bf669f9de24d0ae61d89a9d70c89aba5d9f4c26f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/delay.o.d 
	@${RM} ${OBJECTDIR}/System/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/delay.c  -o ${OBJECTDIR}/System/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/delay.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/System/system.o: System/system.c  .generated_files/flags/default/a32154b1903c75a715d6c6b766573956ad506809 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/system.o.d 
	@${RM} ${OBJECTDIR}/System/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/system.c  -o ${OBJECTDIR}/System/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/System/traps.o: System/traps.c  .generated_files/flags/default/e62738d8d90fd259fce02ead8b85773e682a7f10 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/traps.o.d 
	@${RM} ${OBJECTDIR}/System/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/traps.c  -o ${OBJECTDIR}/System/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/e1ed9087161df2f95b048c38a4423604ed19843 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/Accel_i2c.o: Accel_i2c.c  .generated_files/flags/default/ba6cdb088fee6d0ad974ff62492d6a641348d788 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Accel_i2c.o.d 
	@${RM} ${OBJECTDIR}/Accel_i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Accel_i2c.c  -o ${OBJECTDIR}/Accel_i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Accel_i2c.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/EMBEDEED-SYSTEM-SMART-WATCH-NEW.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/EMBEDEED-SYSTEM-SMART-WATCH-NEW.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81B -mreserve=data@0x81C:0x81D -mreserve=data@0x81E:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x827 -mreserve=data@0x82A:0x84F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  
	
else
${DISTDIR}/EMBEDEED-SYSTEM-SMART-WATCH-NEW.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/EMBEDEED-SYSTEM-SMART-WATCH-NEW.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/EMBEDEED-SYSTEM-SMART-WATCH-NEW.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
