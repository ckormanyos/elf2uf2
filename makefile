#######################################################################
# Tools
#######################################################################

CC       := $(CURDIR)/../../MyGitRepos/ToolsGeneric/Compilation/PcGeneric/GCC/mingw64/13.2.0/bin/g++.exe
GNUECHO  := $(CURDIR)/../../MyGitRepos/ToolsGeneric/Utilities/CommonDomain/echo/echo.exe
MKDIR    := $(CURDIR)/../../MyGitRepos/ToolsGeneric/Utilities/CommonDomain/mkdir/mkdir.exe
RM       := $(CURDIR)/../../MyGitRepos/ToolsGeneric/Utilities/CommonDomain/rm/rm.exe

CC       := $(subst /,\,$(CC))
GNUECHO  := $(subst /,\,$(GNUECHO))
MKDIR    := $(subst /,\,$(MKDIR))
RM       := $(subst /,\,$(RM))


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
	@-$(GNUECHO) +++ compiling main.cpp and linking to bin/elf2uf2.exe
	@-$(GNUECHO)
	@-$(MKDIR) -p bin
	@-$(RM) -rf bin
	@-$(MKDIR) -p bin
	@-$(CC) -Wall -Wextra -Wconversion -Wsign-conversion -std=c++20 -O2 -I. main.cpp -o bin/elf2uf2.exe
	@-$(GNUECHO)
