INSTALL_TARGET_PROCESSES = SpringBoard
export ARCHS = arm64 arm64e
export TARGET=iphone:clang:13.3:13.3
export GO_EASY_ON_ME = 1
export THEOS_DEVICE_PORT=22
export THEOS_DEVICE_IP=192.168.0.202


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = JellyLockReborn

JellyLockReborn_FILES = hooks.xm $(wildcard VIEWS/*.m)
JellyLockReborn_PRIVATE_FRAMEWORKS = MediaRemote
JellyLockReborn_EXTRA_FRAMEWORKS += Cephei
JellyLockReborn_LIBRARIES = sparkapplist
JellyLockReborn_CFLAGS = -fobjc-arc


include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += preferences


include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"