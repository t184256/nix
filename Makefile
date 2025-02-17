makefiles = \
  mk/precompiled-headers.mk \
  local.mk \
  src/libutil/local.mk \
  src/libstore/local.mk \
  src/libfetchers/local.mk \
  src/libmain/local.mk \
  src/libexpr/local.mk \
  src/libcmd/local.mk \
  src/nix/local.mk \
  src/resolve-system-dependencies/local.mk \
  scripts/local.mk \
  misc/bash/local.mk \
  misc/fish/local.mk \
  misc/zsh/local.mk \
  misc/systemd/local.mk \
  misc/launchd/local.mk \
  misc/upstart/local.mk \
  doc/manual/local.mk \
  tests/local.mk \
  tests/plugins/local.mk \
  mk/dist.mk

ifeq ($(HAVE_GTEST), 1)
  makefiles += src/libutil/tests/local.mk
  makefiles += src/libstore/tests/local.mk
endif

-include Makefile.config

OPTIMIZE = 1

ifeq ($(OPTIMIZE), 1)
  GLOBAL_CXXFLAGS += -O3
else
  GLOBAL_CXXFLAGS += -O0 -U_FORTIFY_SOURCE
endif

include mk/lib.mk

GLOBAL_CXXFLAGS += -g -Wall -include config.h -std=c++17 -I src
