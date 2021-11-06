TARGET := iphone:clang:latest:latest
INSTALL_TARGET_PROCESSES = SpringBoard

ARCHS = arm64 arm64e
THEOS_DEVICE_IP=192.168.1.12


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = floatytabrevived

floatytabrevived_FILES = Tweak.x
floatytabrevived_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += floatytabrevived
include $(THEOS_MAKE_PATH)/aggregate.mk