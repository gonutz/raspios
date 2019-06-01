gcc\bin\arm-none-eabi-as -o main.o main.s
gcc\bin\arm-none-eabi-ld --no-undefined main.o -Map kernel.map -o output.elf -T kernel.ld
gcc\bin\arm-none-eabi-objcopy output.elf -O binary kernel.img
