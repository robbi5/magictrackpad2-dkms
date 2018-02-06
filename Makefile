#!/usr/bin/make -f

PKG_NAME=magictrackpad2-dkms
PKG_VERSION=1.1.0
PKG_DESCRIPTION="Patched BCM-5974 and hid-apple modules from kernel 4.13 for including Magic Trackpad 2 support."

MAINTAINER="robbi5 <robbi5@robbi5.de>"
HOMEPAGE="https://github.com/robbi5/magictrackpad2-dkms"

all:
	test -d build || mkdir build
	fpm -f -s dir -t deb -n $(PKG_NAME) -v $(PKG_VERSION) -a all -p build/ \
		-d dkms -d build-essential -d linux-headers-generic \
		-m $(MAINTAINER) --vendor robbi5 --license GPLv2 --description $(PKG_DESCRIPTION) \
		--url $(HOMEPAGE) --deb-changelog CHANGELOG \
		--post-install scripts/post-install.sh --pre-uninstall scripts/pre-uninstall.sh \
		--exclude '.git*' usr/

clean:
	rm -f build/$(PKG_NAME)_$(PKG_VERSION)_all.deb
