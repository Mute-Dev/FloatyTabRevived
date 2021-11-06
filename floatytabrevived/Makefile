TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = floatytabrevived

floatytabrevived_FILES = FTRRootListController.m
floatytabrevived_FRAMEWORKS = UIKit
floatytabrevived_PRIVATE_FRAMEWORKS = Preferences
floatytabrevived_INSTALL_PATH = /Library/PreferenceBundles
floatytabrevived_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
