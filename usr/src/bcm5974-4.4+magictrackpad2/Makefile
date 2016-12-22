KERNEL_VERSION	:= $(shell uname -r)
KERNEL_MODULES	:= /lib/modules/$(KERNEL_VERSION)/build

hid-y := bcm5974.o

obj-m += bcm5974.o

all:
	$(MAKE) -C $(KERNEL_MODULES) M=$(PWD) modules

clean:
	$(MAKE) -C $(KERNEL_MODULES) M=$(PWD) clean
