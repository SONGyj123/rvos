GNU ?= riscv64-unknown-elf

COPS += -save-temps=obj -g -O0 -Wall -fno-builtin -nostdlib -Iinclude -mcmodel=medany -mabi=lp64 -march=rv64imafd -fno-PIE -fno-omit-frame-pointer -Wno-builtin-declaration-mismatch

BUILD_ROOT= build
BUILD_DIR = $(BUILD_ROOT)/benos
SRC_DIR = src
LIB_DIR = lib
BUILD_LIB_DIR = $(BUILD_ROOT)/lib
USER_DIR = user

all : clean benos.bin mysbi.bin user fs

# Check if verbosity is ON for build process
CMD_PREFIX_DEFAULT := @
ifeq ($(V), 1)
	CMD_PREFIX :=
else
	CMD_PREFIX := $(CMD_PREFIX_DEFAULT)
endif

clean :
	rm -rf $(BUILD_ROOT)  *.bin  *.map *.elf disassembly.txt
	rm -rf $(USER_DIR)/*.bin  $(USER_DIR)/*.map $(USER_DIR)/*.elf $(USER_DIR)/*.o $(USER_DIR)/*.out $(USER_DIR)/usys.S $(USER_DIR)/usys.s $(USER_DIR)/first_test.i $(USER_DIR)/first_test.s

$(BUILD_DIR)/%_c.o: $(SRC_DIR)/%.c
	$(CMD_PREFIX)mkdir -p $(BUILD_DIR); echo " CC   $@" ; $(GNU)-gcc $(COPS) -c $< -o $@

$(BUILD_DIR)/%_s.o: $(SRC_DIR)/%.S
	$(CMD_PREFIX)mkdir -p $(BUILD_DIR); echo " AS   $@"; $(GNU)-gcc $(COPS) -c $< -o $@

$(BUILD_LIB_DIR)/%_c.o: $(LIB_DIR)/%.c
	$(CMD_PREFIX)mkdir -p $(BUILD_LIB_DIR); echo " CC   $@" ; $(GNU)-gcc $(COPS) -c $< -o $@

C_FILES = $(wildcard $(SRC_DIR)/*.c)
LIB_FILES = $(wildcard $(LIB_DIR)/*.c)
ASM_FILES = $(wildcard $(SRC_DIR)/*.S)

OBJ_FILES = $(C_FILES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%_c.o)
OBJ_FILES += $(ASM_FILES:$(SRC_DIR)/%.S=$(BUILD_DIR)/%_s.o)
OBJ_FILES += $(LIB_FILES:$(LIB_DIR)/%.c=$(BUILD_LIB_DIR)/%_c.o)

DEP_FILES = $(OBJ_FILES:%.o=%.d)
-include $(DEP_FILES)

benos.bin: $(SRC_DIR)/linker.ld $(OBJ_FILES)
	$(CMD_PREFIX)$(GNU)-ld -T $(SRC_DIR)/linker.ld -o $(BUILD_DIR)/benos.elf  $(OBJ_FILES) -Map benos.map; echo " LD $(BUILD_DIR)/benos.elf"
	$(CMD_PREFIX)$(GNU)-objcopy $(BUILD_DIR)/benos.elf -O binary benos.bin; echo " OBJCOPY benos.bin"
	$(CMD_PREFIX)cp $(BUILD_DIR)/benos.elf benos.elf
	$(GNU)-objdump -D benos.elf > disassembly.txt

##############
#  build SBI
##############
SBI_BUILD_DIR = $(BUILD_ROOT)/sbi
SBI_SRC_DIR = sbi
$(SBI_BUILD_DIR)/%_c.o: $(SBI_SRC_DIR)/%.c
	$(CMD_PREFIX)mkdir -p $(SBI_BUILD_DIR); echo " CC   $@" ; $(GNU)-gcc $(COPS) -c $< -o $@

$(SBI_BUILD_DIR)/%_s.o: $(SBI_SRC_DIR)/%.S
	$(CMD_PREFIX)mkdir -p $(SBI_BUILD_DIR); echo " AS   $@"; $(GNU)-gcc $(COPS) -c $< -o $@

SBI_C_FILES = $(wildcard $(SBI_SRC_DIR)/*.c)
SBI_ASM_FILES = $(wildcard $(SBI_SRC_DIR)/*.S)
SBI_OBJ_FILES = $(SBI_C_FILES:$(SBI_SRC_DIR)/%.c=$(SBI_BUILD_DIR)/%_c.o)
SBI_OBJ_FILES += $(SBI_ASM_FILES:$(SBI_SRC_DIR)/%.S=$(SBI_BUILD_DIR)/%_s.o)
SBI_OBJ_FILES += $(LIB_FILES:$(LIB_DIR)/%.c=$(BUILD_LIB_DIR)/%_c.o)

mysbi.bin: $(SBI_SRC_DIR)/sbi_linker.ld $(SBI_OBJ_FILES)
	$(CMD_PREFIX)$(GNU)-ld -T $(SBI_SRC_DIR)/sbi_linker.ld -o $(SBI_BUILD_DIR)/mysbi.elf  $(SBI_OBJ_FILES) -Map mysbi.map; echo " LD $(SBI_BUILD_DIR)/mysbi.elf"
	$(CMD_PREFIX)$(GNU)-objcopy $(SBI_BUILD_DIR)/mysbi.elf -O binary mysbi.bin; echo " OBJCOPY mysbi.bin"
	$(CMD_PREFIX)cp $(SBI_BUILD_DIR)/mysbi.elf mysbi.elf

##############
#   user
##############
user: $(USER_DIR)/first_test.out

$(USER_DIR)/usys.S: $(USER_DIR)/usys.pl
	perl $(USER_DIR)/usys.pl > $(USER_DIR)/usys.S
$(USER_DIR)/usys.o : $(USER_DIR)/usys.S
	$(GNU)-gcc $(COPS) -c -o $(USER_DIR)/usys.o $(USER_DIR)/usys.S
$(USER_DIR)/first_test.o: $(USER_DIR)/first_test.c
	$(GNU)-gcc $(COPS) -c -o $(USER_DIR)/first_test.o $(USER_DIR)/first_test.c
$(USER_DIR)/first_test.out: $(USER_DIR)/first_test.o $(USER_DIR)/usys.o
	$(GNU)-ld -T $(USER_DIR)/user.ld -o $(USER_DIR)/first_test.out $(USER_DIR)/first_test.o $(USER_DIR)/usys.o -Map $(USER_DIR)/first_test.map


##############
#   fs
##############
fs:
	./mkfs/mkfs ./user/mydisk.img ./user/first_test.out ./user/test_rd.txt




##############
#  run qemu
##############
CPUS = 1
QEMU_FLAGS  += -nographic -machine virt -m 128M -smp $(CPUS)
QEMU_BIOS = -bios mysbi.bin  -device loader,file=benos.bin,addr=0x80200000
QEMU_OPTS = -global virtio-mmio.force-legacy=false
QEMU_OPTS += -drive file=/home/songyj/embedded_proj/rvos/user/mydisk.img,if=none,format=raw,id=x0
QEMU_OPTS += -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0
run:
	qemu-system-riscv64 $(QEMU_FLAGS) $(QEMU_BIOS) $(QEMU_OPTS) -kernel benos.elf
debug:
	qemu-system-riscv64 $(QEMU_FLAGS) $(QEMU_BIOS) $(QEMU_OPTS) -kernel benos.elf -S -s
payload:
	qemu-system-riscv64 $(QEMU_FLAGS) -bios none -device loader,file=benos_payload.bin,addr=0x80000000
gdbsbi:
	gdb-multiarch --tui mysbi.elf -x ./gdbinit

initcode:
	$(GNU)-gcc $(COPS) -march=rv64g -nostdinc -I. -Ikernel -c ./user/initcode.S -o ./user/initcode.o
	$(GNU)-ld -N -e start -Ttext 0 -o ./user/initcode.out ./user/initcode.o
	$(GNU)-objcopy -S -O binary ./user/initcode.out ./user/initcode

sleep_test:
	$(GNU)-gcc $(COPS) -march=rv64g -nostdinc -I. -Ikernel -c ./user/sleep_test.S -o ./user/sleep_test.o
	$(GNU)-ld -N -e start -Ttext 0 -o ./user/sleep_test.out ./user/sleep_test.o
	$(GNU)-objcopy -S -O binary ./user/sleep_test.out ./user/sleep_test
