// This program turns the OK/ACT LED of the Raspberry Pi B v1.1 on and off repeatedly.

.section .init // place this code first
.global _start // export _start to the ELF file
_start:

// Load the physical address of the GPIO region into r0.
ldr r0,=0x3F200000

/*
Our register use is as follows:
r0=0x3F200000 the address of the GPIO region.
r1=1 << 21    a number with bits 21-23 set to 001 to put into the GPFSEL4
              function select to enable output to GPIO 47.
then
r1=1 << 15    a number with bit 15 high, so we can communicate with GPIO 47.
r2=0x003F0000 a number that will take a noticeable duration for the processor 
              to decrement to 0, allowing us to create a delay.
*/
mov r1,#1
lsl r1,#21 // GPFSEL4 bit 21 to enable GPIO47 for out

// Set the GPIO function select.
str r1,[r0,#0x10] // GPFSEL4

// Set the 15th bit of r1.
mov r1,#1
lsl r1,#15 // We want 15th bit for GPSET1 and GPCLR0.

// Label the next line loop$ for the infinite looping
loop$: 

// Set GPIO 47 to low, causing the LED to turn on.
str r1,[r0,#0x20] // GPSET1

// To create a delay, busy the processor decrementing the number 0x3F0000 to 0.
mov r2,#0x3F0000
wait1$:
    sub r2,#1
    cmp r2,#0
    bne wait1$

// Set GPIO 47 to high, causing the LED to turn off.
str r1,[r0,#0x2C] // GPCLR1

// Wait once more.
mov r2,#0x3F0000
wait2$:
    sub r2,#1
    cmp r2,#0
    bne wait2$

// Loop over this process forevermore
b loop$
