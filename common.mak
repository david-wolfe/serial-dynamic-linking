CFLAGS	= -g
LDFLAGS	= -g -L.

TOPDIR	= $(shell realpath --strip --relative-to=$(shell pwd) $(TOP))
VPATH	= $(TOPDIR)

.PHONY:
