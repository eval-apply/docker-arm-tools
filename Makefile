GCC_FILE=gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2
REMOTE_PATH=https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/6_1-2017q1

.PHONY: all
all: gcc-deps build-image

gcc-deps:
ifeq (,$(wildcard $(GCC_FILE)))
	$(info Downloading gcc-arm.....)
	$(shell	curl -sS -O $(REMOTE_PATH)/$(GCC_FILE);>/dev/null)
endif

build-image:
	$(info Building image...)
	docker build -t arm-tools .

.PHONY: clean
clean: rm $GCC_FILE
