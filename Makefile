PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
TARGET := iphone:clang:latest:7.0
ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = SpringBoard
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TOOL_NAME = pbcopy pbpaste

pbcopy_FILES = pbcopy.m
pbcopy_CFLAGS = -fobjc-arc
pbcopy_CODESIGN_FLAGS = -Sentitlements.plist
pbcopy_INSTALL_PATH = /usr/bin

pbpaste_FILES = pbpaste.m
pbpaste_CFLAGS = -fobjc-arc
pbpaste_CODESIGN_FLAGS = -Sentitlements.plist
pbpaste_INSTALL_PATH = /usr/bin

include $(THEOS_MAKE_PATH)/tool.mk
