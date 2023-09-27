###########################################################################
## Makefile generated for component 'legolab'. 
## 
## Makefile     : legolab.mk
## Generated on : Wed Sep 27 13:54:57 2023
## Final product: $(RELATIVE_PATH_TO_ANCHOR)/legolab
## Product type : executable
## 
###########################################################################

###########################################################################
## MACROS
###########################################################################

# Macro Descriptions:
# PRODUCT_NAME            Name of the system to build
# MAKEFILE                Name of this makefile

PRODUCT_NAME              = legolab
MAKEFILE                  = legolab.mk
MATLAB_ROOT               = /Applications/AppsAnywhere/MATLAB_R2023a.app
MATLAB_BIN                = /Applications/AppsAnywhere/MATLAB_R2023a.app/bin
MATLAB_ARCH_BIN           = $(MATLAB_BIN)/maci64
START_DIR                 = /Users/eriknymobohne/Documents/Kybernetikk\ og\ Robotikk/1.\ semester/TTK4100_Intro_Cybernetics_and_Robotics/legolab
SOLVER                    = 
SOLVER_OBJ                = 
CLASSIC_INTERFACE         = 0
TGT_FCN_LIB               = None
MODEL_HAS_DYNAMICALLY_LOADED_SFCNS = 0
RELATIVE_PATH_TO_ANCHOR   = ..
C_STANDARD_OPTS           = 
CPP_STANDARD_OPTS         = 

###########################################################################
## TOOLCHAIN SPECIFICATIONS
###########################################################################

# Toolchain Name:          Sourcery G++ Lite v2009q3
# Supported Version(s):    
# ToolchainInfo Version:   2023a
# Specification Revision:  1.0
# 
#-------------------------------------------
# Macros assumed to be defined elsewhere
#-------------------------------------------

# EV3_LMS2012_DIR
# EV3_LMSTYPES_DIR
# EV3_BYTECODES_DIR
# EV3_COMPILER_DIR
# EV3_COMPILER_BIN_DIR
# EV3_COMPILER_LIB_DIR
# EV3_COMPILER_HEADER_DIR
# EV3_COMPILER_HEADER_DIR2
# EV3_COMPILER_HEADER_DIR3
# EV3_SourceryLite


TOOLCHAIN_SRCS = 
TOOLCHAIN_INCS = 
TOOLCHAIN_LIBS = -lm -lm

#------------------------
# BUILD TOOL COMMANDS
#------------------------

# C Compiler: Sourcery G++ Lite v2009q3 C Compiler
CC_PATH = $(EV3_SourceryLite)
CC = "$(CC_PATH)/arm-none-linux-gnueabi-gcc"

# Linker: Sourcery G++ Lite v2009q3 Linker
LD_PATH = $(EV3_SourceryLite)
LD = "$(LD_PATH)/arm-none-linux-gnueabi-gcc"

# C++ Compiler: Sourcery G++ Lite v2009q3 C Compiler
CPP_PATH = $(EV3_SourceryLite)
CPP = "$(CPP_PATH)/arm-none-linux-gnueabi-g++"

# C++ Linker: Sourcery G++ Lite v2009q3 C++ Linker
CPP_LD_PATH = $(EV3_SourceryLite)
CPP_LD = "$(CPP_LD_PATH)/arm-none-linux-gnueabi-gcc"

# Archiver: Sourcery G++ Lite v2009q3 Archiver
AR_PATH = $(EV3_SourceryLite)
AR = "$(AR_PATH)/arm-none-linux-gnueabi-ar"

# MEX Tool: MEX Tool
MEX_PATH = $(MATLAB_ARCH_BIN)
MEX = "$(MEX_PATH)/mex"

# Download: Download
DOWNLOAD =

# Execute: Execute
EXECUTE = $(PRODUCT)

# Builder: GMAKE Utility
MAKE_PATH = %MATLAB%/bin/maci64
MAKE = "$(MAKE_PATH)/gmake"


#-------------------------
# Directives/Utilities
#-------------------------

CDEBUG              = -g
C_OUTPUT_FLAG       = -o
LDDEBUG             = -g
OUTPUT_FLAG         = -o
CPPDEBUG            = -g
CPP_OUTPUT_FLAG     = -o
CPPLDDEBUG          = -g
OUTPUT_FLAG         = -o
ARDEBUG             =
STATICLIB_OUTPUT_FLAG =
MEX_DEBUG           = -g
RM                  = @rm -f
ECHO                = @echo
MV                  = @mv
RUN                 =

#----------------------------------------
# "Faster Builds" Build Configuration
#----------------------------------------

ARFLAGS              = -r
CFLAGS               = -c \
                       -MMD -MP -MF"$(@:%.o=%.dep)" -MT"$@"  \
                       -O0
CPPFLAGS             =
CPP_LDFLAGS          =
CPP_SHAREDLIB_LDFLAGS  =
DOWNLOAD_FLAGS       =
EXECUTE_FLAGS        =
LDFLAGS              = -lrt \
                       -lpthread
MEX_CPPFLAGS         =
MEX_CPPLDFLAGS       =
MEX_CFLAGS           =
MEX_LDFLAGS          =
MAKE_FLAGS           = -f $(MAKEFILE)
SHAREDLIB_LDFLAGS    =



###########################################################################
## OUTPUT INFO
###########################################################################

PRODUCT = $(RELATIVE_PATH_TO_ANCHOR)/legolab
PRODUCT_TYPE = "executable"
BUILD_TYPE = "Top-Level Standalone Executable"

###########################################################################
## INCLUDE PATHS
###########################################################################

INCLUDES_BUILDINFO = -I$(START_DIR) -I/Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/include -I$(START_DIR)/legolab_ert_rtw -I$(MATLAB_ROOT)/extern/include -I$(MATLAB_ROOT)/simulink/include -I$(MATLAB_ROOT)/rtw/c/src -I$(MATLAB_ROOT)/rtw/c/src/ext_mode/common -I$(MATLAB_ROOT)/rtw/c/ert -I$(EV3_LMSTYPES_DIR)/.. -I$(EV3_LMS2012_DIR)/.. -I$(EV3_BYTECODES_DIR)/.. -I$(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils -I$(MATLAB_ROOT)/toolbox/target/codertarget/rtos/inc -I/Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src

INCLUDES = $(INCLUDES_BUILDINFO)

###########################################################################
## DEFINES
###########################################################################

DEFINES_ = -D__MW_TARGET_USE_HARDWARE_RESOURCES_H__ -D_RTT_LCD_=6
DEFINES_BUILD_ARGS = -DCLASSIC_INTERFACE=0 -DALLOCATIONFCN=0 -DONESTEPFCN=1 -DTERMFCN=1 -DMULTI_INSTANCE_CODE=0 -DINTEGER_CODE=0 -DMT=0
DEFINES_CUSTOM = 
DEFINES_OPTS = -DTID01EQ=1
DEFINES_SKIPFORSIL = -D__linux__ -DARM_PROJECT -D_USE_TARGET_UDP_ -D_RUNONTARGETHARDWARE_BUILD_ -DSTACK_SIZE=64 -DRT
DEFINES_STANDARD = -DMODEL=legolab -DNUMST=2 -DNCSTATES=3 -DHAVESTDIO -DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=0

DEFINES = $(DEFINES_) $(DEFINES_BUILD_ARGS) $(DEFINES_CUSTOM) $(DEFINES_OPTS) $(DEFINES_SKIPFORSIL) $(DEFINES_STANDARD)

###########################################################################
## SOURCE FILES
###########################################################################

SRCS = $(START_DIR)/legolab_ert_rtw/legolab.c $(START_DIR)/legolab_ert_rtw/legolab_data.c $(START_DIR)/legolab_ert_rtw/rtGetInf.c $(START_DIR)/legolab_ert_rtw/rtGetNaN.c $(START_DIR)/legolab_ert_rtw/rt_nonfinite.c $(MATLAB_ROOT)/toolbox/target/codertarget/rtos/src/linuxinitialize.c /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/driver_ev3_button.c /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/driver_ev3_lcd.c /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/MW_legoev3init.c /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/driver_pixy2_vision_sensor.c /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/driver_ev3_encoder.c /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/driver_ev3_gyro_sensor.c /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/driver_ev3_motor.c

MAIN_SRC = $(START_DIR)/legolab_ert_rtw/ert_main.c

ALL_SRCS = $(SRCS) $(MAIN_SRC)

###########################################################################
## OBJECTS
###########################################################################

OBJS = legolab.o legolab_data.o rtGetInf.o rtGetNaN.o rt_nonfinite.o linuxinitialize.o driver_ev3_button.o driver_ev3_lcd.o MW_legoev3init.o driver_pixy2_vision_sensor.o driver_ev3_encoder.o driver_ev3_gyro_sensor.o driver_ev3_motor.o

MAIN_OBJ = ert_main.o

ALL_OBJS = $(OBJS) $(MAIN_OBJ)

###########################################################################
## PREBUILT OBJECT FILES
###########################################################################

PREBUILT_OBJS = 

###########################################################################
## LIBRARIES
###########################################################################

LIBS = 

###########################################################################
## SYSTEM LIBRARIES
###########################################################################

SYSTEM_LIBS = 

###########################################################################
## ADDITIONAL TOOLCHAIN FLAGS
###########################################################################

#---------------
# C Compiler
#---------------

CFLAGS_SKIPFORSIL = -I$(EV3_COMPILER_HEADER_DIR) -I$(EV3_COMPILER_HEADER_DIR2) -I$(EV3_COMPILER_HEADER_DIR3) -I$(EV3_LMS2012_DIR) -I$(EV3_LMSTYPES_DIR) -I$(EV3_BYTECODES_DIR) -c -nostdinc
CFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CFLAGS += $(CFLAGS_SKIPFORSIL) $(CFLAGS_BASIC)

#-----------------
# C++ Compiler
#-----------------

CPPFLAGS_SKIPFORSIL = -I$(EV3_COMPILER_HEADER_DIR) -I$(EV3_COMPILER_HEADER_DIR2) -I$(EV3_COMPILER_HEADER_DIR3) -I$(EV3_LMS2012_DIR) -I$(EV3_LMSTYPES_DIR) -I$(EV3_BYTECODES_DIR) -c -nostdinc
CPPFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CPPFLAGS += $(CPPFLAGS_SKIPFORSIL) $(CPPFLAGS_BASIC)

#---------------
# C++ Linker
#---------------

CPP_LDFLAGS_SKIPFORSIL = -L$(EV3_COMPILER_LIB_DIR)

CPP_LDFLAGS += $(CPP_LDFLAGS_SKIPFORSIL)

#------------------------------
# C++ Shared Library Linker
#------------------------------

CPP_SHAREDLIB_LDFLAGS_SKIPFORSIL = -L$(EV3_COMPILER_LIB_DIR)

CPP_SHAREDLIB_LDFLAGS += $(CPP_SHAREDLIB_LDFLAGS_SKIPFORSIL)

#-----------
# Linker
#-----------

LDFLAGS_SKIPFORSIL = -L$(EV3_COMPILER_LIB_DIR)

LDFLAGS += $(LDFLAGS_SKIPFORSIL)

#--------------------------
# Shared Library Linker
#--------------------------

SHAREDLIB_LDFLAGS_SKIPFORSIL = -L$(EV3_COMPILER_LIB_DIR)

SHAREDLIB_LDFLAGS += $(SHAREDLIB_LDFLAGS_SKIPFORSIL)

###########################################################################
## INLINED COMMANDS
###########################################################################


DERIVED_SRCS = $(subst .o,.dep,$(OBJS))

build:

%.dep:



-include codertarget_assembly_flags.mk
-include ../codertarget_assembly_flags.mk
-include *.dep


###########################################################################
## PHONY TARGETS
###########################################################################

.PHONY : all build buildobj clean info prebuild download execute


all : build
	@echo "### Successfully generated all binary outputs."


build : prebuild $(PRODUCT)


buildobj : prebuild $(OBJS) $(PREBUILT_OBJS)
	@echo "### Successfully generated all binary outputs."


prebuild : 


download : $(PRODUCT)


execute : download
	@echo "### Invoking postbuild tool "Execute" ..."
	$(EXECUTE) $(EXECUTE_FLAGS)
	@echo "### Done invoking postbuild tool."


###########################################################################
## FINAL TARGET
###########################################################################

#-------------------------------------------
# Create a standalone executable            
#-------------------------------------------

$(PRODUCT) : $(OBJS) $(PREBUILT_OBJS) $(MAIN_OBJ)
	@echo "### Creating standalone executable "$(PRODUCT)" ..."
	$(LD) $(LDFLAGS) -o $(PRODUCT) $(OBJS) $(MAIN_OBJ) $(SYSTEM_LIBS) $(TOOLCHAIN_LIBS)
	@echo "### Created: $(PRODUCT)"


###########################################################################
## INTERMEDIATE TARGETS
###########################################################################

#---------------------
# SOURCE-TO-OBJECT
#---------------------

%.o : %.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : %.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/legolab_ert_rtw/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/legolab_ert_rtw/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/rtw/c/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/simulink/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/simulink/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


ert_main.o : $(START_DIR)/legolab_ert_rtw/ert_main.c
	$(CC) $(CFLAGS) -o "$@" "$<"


legolab.o : $(START_DIR)/legolab_ert_rtw/legolab.c
	$(CC) $(CFLAGS) -o "$@" "$<"


legolab_data.o : $(START_DIR)/legolab_ert_rtw/legolab_data.c
	$(CC) $(CFLAGS) -o "$@" "$<"


rtGetInf.o : $(START_DIR)/legolab_ert_rtw/rtGetInf.c
	$(CC) $(CFLAGS) -o "$@" "$<"


rtGetNaN.o : $(START_DIR)/legolab_ert_rtw/rtGetNaN.c
	$(CC) $(CFLAGS) -o "$@" "$<"


rt_nonfinite.o : $(START_DIR)/legolab_ert_rtw/rt_nonfinite.c
	$(CC) $(CFLAGS) -o "$@" "$<"


linuxinitialize.o : $(MATLAB_ROOT)/toolbox/target/codertarget/rtos/src/linuxinitialize.c
	$(CC) $(CFLAGS) -o "$@" "$<"


driver_ev3_button.o : /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/driver_ev3_button.c
	$(CC) $(CFLAGS) -o "$@" "$<"


driver_ev3_lcd.o : /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/driver_ev3_lcd.c
	$(CC) $(CFLAGS) -o "$@" "$<"


MW_legoev3init.o : /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/MW_legoev3init.c
	$(CC) $(CFLAGS) -o "$@" "$<"


driver_pixy2_vision_sensor.o : /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/driver_pixy2_vision_sensor.c
	$(CC) $(CFLAGS) -o "$@" "$<"


driver_ev3_encoder.o : /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/driver_ev3_encoder.c
	$(CC) $(CFLAGS) -o "$@" "$<"


driver_ev3_gyro_sensor.o : /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/driver_ev3_gyro_sensor.c
	$(CC) $(CFLAGS) -o "$@" "$<"


driver_ev3_motor.o : /Users/eriknymobohne/Documents/MATLAB/SupportPackages/R2023a/toolbox/target/supportpackages/ev3/src/driver_ev3_motor.c
	$(CC) $(CFLAGS) -o "$@" "$<"


###########################################################################
## DEPENDENCIES
###########################################################################

$(ALL_OBJS) : rtw_proj.tmw $(MAKEFILE)


###########################################################################
## MISCELLANEOUS TARGETS
###########################################################################

info : 
	@echo "### PRODUCT = $(PRODUCT)"
	@echo "### PRODUCT_TYPE = $(PRODUCT_TYPE)"
	@echo "### BUILD_TYPE = $(BUILD_TYPE)"
	@echo "### INCLUDES = $(INCLUDES)"
	@echo "### DEFINES = $(DEFINES)"
	@echo "### ALL_SRCS = $(ALL_SRCS)"
	@echo "### ALL_OBJS = $(ALL_OBJS)"
	@echo "### LIBS = $(LIBS)"
	@echo "### MODELREF_LIBS = $(MODELREF_LIBS)"
	@echo "### SYSTEM_LIBS = $(SYSTEM_LIBS)"
	@echo "### TOOLCHAIN_LIBS = $(TOOLCHAIN_LIBS)"
	@echo "### CFLAGS = $(CFLAGS)"
	@echo "### LDFLAGS = $(LDFLAGS)"
	@echo "### SHAREDLIB_LDFLAGS = $(SHAREDLIB_LDFLAGS)"
	@echo "### CPPFLAGS = $(CPPFLAGS)"
	@echo "### CPP_LDFLAGS = $(CPP_LDFLAGS)"
	@echo "### CPP_SHAREDLIB_LDFLAGS = $(CPP_SHAREDLIB_LDFLAGS)"
	@echo "### ARFLAGS = $(ARFLAGS)"
	@echo "### MEX_CFLAGS = $(MEX_CFLAGS)"
	@echo "### MEX_CPPFLAGS = $(MEX_CPPFLAGS)"
	@echo "### MEX_LDFLAGS = $(MEX_LDFLAGS)"
	@echo "### MEX_CPPLDFLAGS = $(MEX_CPPLDFLAGS)"
	@echo "### DOWNLOAD_FLAGS = $(DOWNLOAD_FLAGS)"
	@echo "### EXECUTE_FLAGS = $(EXECUTE_FLAGS)"
	@echo "### MAKE_FLAGS = $(MAKE_FLAGS)"


clean : 
	$(ECHO) "### Deleting all derived files ..."
	$(RM) $(PRODUCT)
	$(RM) $(ALL_OBJS)
	$(RM) *.dep
	$(ECHO) "### Deleted all derived files."


