#######################################################################
# Sample
#######################################################################

# cd /mnt/c/ChrisGitRepos/elf2uf2
# make all

#######################################################################
# Operating system
#######################################################################

TYP_OS   := $(shell echo %OS%)

ifeq ($(OS),Windows_NT)
TYP_OS   := Windows_NT
else
TYP_OS   := Linux
endif


#######################################################################
# Tool prefixes and suffixes
#######################################################################

ifeq ($(TYP_OS),Windows_NT)

EXEEXT   := .exe
CC_PRE   := $(CURDIR)/../../MyGitRepos/ToolsGeneric/Compilation/PcGeneric/GCC/mingw64/13.2.0/bin/
UTIL_PRE := $(CURDIR)/tools/UnxUtils/usr/local/wbin/

else
EXEEXT   :=
CC_PRE   :=
UTIL_PRE :=

endif

#######################################################################
# Tools
#######################################################################

CC       := $(CC_PRE)g++$(EXEEXT)
GNUECHO  := $(UTIL_PRE)echo$(EXEEXT)
MKDIR    := $(UTIL_PRE)mkdir$(EXEEXT)
RM       := $(UTIL_PRE)rm$(EXEEXT)

CC       := $(subst /,\,$(CC))
GNUECHO  := $(subst /,\,$(GNUECHO))
MKDIR    := $(subst /,\,$(MKDIR))
RM       := $(subst /,\,$(RM))


#######################################################################
# Tool options
#######################################################################

WFLAGS   := -Wall                             \
            -Wextra                           \
            -Wpedantic                        \
            -Wmain                            \
            -Wundef                           \
            -Wconversion                      \
            -Wsign-conversion                 \
            -Wunused-parameter                \
            -Wuninitialized                   \
            -Wshadow                          \
            -Wunreachable-code                \
            -Wswitch-default                  \
            -Wswitch-enum                     \
            -Wcast-align                      \
            -Wmissing-include-dirs            \
            -Winit-self                       \
            -Wfloat-equal                     \
            -Wdouble-promotion                \
            -Wzero-as-null-pointer-constant


C_INC    := -I.


CXXFLAGS := --std=c++20                       \
            -O2                               \
            $(WFLAGS)                         \
            $(C_INC)


#######################################################################
# Make command goals
#######################################################################

all: build


#######################################################################
# Rules
#######################################################################

build: main.cpp
	@-$(GNUECHO) +++ print compiler version
	@-$(CC) -v
	@-$(GNUECHO)
	@-$(GNUECHO) +++ compiling main.cpp and linking to bin/elf2uf2$(EXEEXT)
	@-$(GNUECHO)
	@-$(MKDIR) -p bin
	@-$(RM) -rf bin
	@-$(MKDIR) -p bin
	@-$(CC) $(CXXFLAGS) main.cpp -o bin/elf2uf2$(EXEEXT)
	@-$(GNUECHO)
