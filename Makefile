ARCH ?= aarch64
KERNEL := build/kernel-$(ARCH).elf
CPU := cortex-a72
MEM := 1024

CC := aarch64-elf-gcc
CFLAGS := -ffreestanding -O2 -Wall -Wextra

LINKER_SCRIPT := src/arch/$(ARCH)/linker.ld

LD := aarch64-elf-ld
LDFLAGS := -nostdlib -T $(LINKER_SCRIPT)

AS := aarch64-elf-as

ASSEMBLY_SOURCE_FILES := $(wildcard src/arch/$(ARCH)/*.S)
ASSEMBLY_OBJECT_FILES := $(patsubst src/arch/$(ARCH)/%.S, build/arch/$(arch)/%.o, $(ASSEMBLY_SOURCE_FILES))

C_SOURCE_FILES := $(wildcard src/*.c)
C_OBJECT_FILES := $(patsubst src/%.c, build/%.o, $(C_SOURCE_FILES))

.PHONY: all clean run

all: $(KERNEL)

clean:
	@rm -r build

run: $(KERNEL)
	@qemu-system-aarch64 -M virt -kernel $(KERNEL) -cpu $(CPU) -nographic -m $(MEM)

$(KERNEL): $(ASSEMBLY_OBJECT_FILES) $(LINKER_SCRIPT) $(C_OBJECT_FILES)
	@$(LD) $(LDFLAGS) $(ASSEMBLY_OBJECT_FILES) $(C_OBJECT_FILES) -o $(KERNEL)

build/arch/$(arch)/%.o: src/arch/$(ARCH)/%.S
	@mkdir -p $(shell dirname $@)
	@$(AS) $< -o $@

build/%.o: src/%.c
	@mkdir -p $(shell dirname $@)
	@$(CC) $(CFLAGS) -c $< -o $@
