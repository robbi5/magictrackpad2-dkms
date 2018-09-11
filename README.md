magictrackpad2-dkms
===================

A DKMS module for patching the bcm5974 and hid drivers to support the Apple Magic Trackpad 2.

Tested with Kernel 4.4.0-57-generic on Ubuntu 16.04 LTS.

How to install
--------------

It should be enough to build and install the package:

    sudo apt-get install linux-source dkms libelf-dev ruby
    gem install fpm
    make
    sudo dpkg -i build/magictrackpad2-dkms_x.x.x_all.deb

If it still doesn't work, you may have to copy the kernel modules from
`/lib/modules/4.4.0-57-generic/updates/dkms/` to `/lib/modules/4.4.0-57-generic/kernel/drivers/hid/`

* http://unix.stackexchange.com/questions/240593/kernel-not-recognizing-new-devices-from-dkms-module


How to configure
----------------

Configuration happens in `xorg.conf` at 
`/usr/share/X11/xorg.conf.d/49-synaptics-bcm5974.conf` and with `xinput`.

If your mouse only moves when you press hard, modify the thresholds:

`xinput set-prop "bcm5974" "Synaptics Finger" 0 10 0`


How to update
-------------

Install the current kernel sources: `sudo apt-get install linux-source`

The sources are then available at `/usr/src/linux-source-4.4.0/linux-source-4.4.0.tar.bz2`.

Extract following files to `src/bcm5974...`:
* `/linux-source-4.4.0/drivers/input/mouse/bcm5974.c`

Extract following files to `src/hid...`:
* `/linux-source-4.4.0/drivers/hid/hid-apple.c`
* `/linux-source-4.4.0/drivers/hid/hid-core.c`
* `/linux-source-4.4.0/drivers/hid/hid-debug.c`
* `/linux-source-4.4.0/drivers/hid/hid-ids.h`
* `/linux-source-4.4.0/drivers/hid/hid-input.c`
* `/linux-source-4.4.0/drivers/hid/hidraw.c`

Apply the patches in the same folders.

Build a package with `make`


Thanks:
-------

* https://github.com/robotrovsky/linux/commit/7b50169c3a8948e67a67eb530b91117a7f5d9d5b
* https://github.com/naftulikay/bcm5974-3.19
* https://bbs.archlinux.org/viewtopic.php?id=66397
* https://github.com/SicVolo/hid-apple-4.0.x
* https://github.com/SicVolo/hid-apple-3.19
