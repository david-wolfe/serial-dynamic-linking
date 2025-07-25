export TOP		= $(shell pwd)
export MAKEFILES	= $(TOP)/common.mak

define HELP
Demonstrate different ways of ELF linking

Targets:
  ldd (default) : Describe dynamic linking of each executable.
  apps          : Compile and link each method.
  clean         : Remove compiled objects.
  help          : This message
  run           : Run each application and print its exit code.
endef
export HELP

DIRS	= static parallel serial

ldd:	$(patsubst %,%/ldd,$(DIRS))
apps:	$(patsubst %,%/aa,$(DIRS))
run:	$(patsubst %,%/run,$(DIRS))
clean:	$(patsubst %,%/clean,$(DIRS))

help: .PHONY
	@echo "$$HELP"

%/aa %/ldd %/run %/clean:
	$(MAKE) -C $(dir $@) $(notdir $@)

.PHONY:
