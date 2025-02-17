libraries += libmain

libmain_NAME = libnixmain

libmain_DIR := $(d)

libmain_SOURCES := $(wildcard $(d)/*.cc)

libmain_CXXFLAGS += -I src/libutil -I src/libstore

libmain_LIBS = libstore libutil

libmain_LDFLAGS += -ldl

libmain_ALLOW_UNDEFINED = 1

$(eval $(call install-file-in, $(d)/nix-main.pc, $(libdir)/pkgconfig, 0644))
