
SYSBUILD	:=	$(shell dirname $(PWD))/sysBuild

JAIL = $(SYSBUILD)/jail_$(ARCH)

CLFS = $(SYSBUILD)/clfs_$(ARCH)

CHROOT = fakechroot -s chroot $(JAIL)

getUrl = scripts/getPackage.sh
CACHE = $(CLFS)/var/cache/elfs
pkgDir = $(CLFS)/var/cache/
iPackage = $(shell ls $(CACHE) )
include	makefiles/_includes.mk



