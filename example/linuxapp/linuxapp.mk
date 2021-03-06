NAME := linuxapp

$(NAME)_SOURCES    := main.c

$(NAME)_COMPONENTS := cli yloop

ifeq ($(LWIP),1)
$(NAME)_COMPONENTS += protocols.net
endif

ifeq ($(BENCHMARKS),1)
$(NAME)_COMPONENTS += benchmarks
GLOBAL_DEFINES     += CONFIG_CMD_BENCHMARKS
endif

ifneq (,${BINS})
GLOBAL_CFLAGS += -DSYSINFO_OS_BINS
endif
CURRENT_TIME = $(shell /bin/date +%Y%m%d.%H%M)
CONFIG_SYSINFO_APP_VERSION = APP-1.0.0-$(CURRENT_TIME)
$(info app_version:${CONFIG_SYSINFO_APP_VERSION})
GLOBAL_CFLAGS += -DSYSINFO_APP_VERSION=\"$(CONFIG_SYSINFO_APP_VERSION)\"
