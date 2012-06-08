ifeq ($(KERNELRELEASE), )
	KERNELDIR ?= /lib/modules/`uname -r`/build
 	PWD := $(shell pwd)
all: 
	make -C $(KERNELDIR) M=$(PWD) modules
#modules:
# 	make -C $(KERNELDIR) M=$(PWD) modules
#modules_install:
# 	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
install:
	cp cdc_ether.ko zaurus.ko /lib/modules/`uname -r`/kernel/drivers/net/usb/
clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions *.symvers *.order
.PHONY:modules modules_install clean
else
 	obj-m +=cdc_ether.o
 	obj-m +=zaurus.o
endif

