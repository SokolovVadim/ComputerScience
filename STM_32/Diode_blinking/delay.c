#include <stdio.h>

__attribute__((naked)) static void delay(int time)
{
    asm (".intel_syntax noprefix "
	"push rbp"
	"mov rbp, rsp"
	"xor r9, r9"
    	"mov r9, r0"
    	"sub r9, #1"
    	"cmp r9, #0"
    	"bne delay+0x3"
    	"pop rbp"
	:
	: "r"(time)
	: "r9"
	);
#if defined(FLASH_0LAT_DELAY0LAT) || defined(FLASH_1LAT_DELAY0LAT)
    asm (".word 0x927c00"); //9600000
#else
    asm (".word 0x5b8d80"); //6000000
#endif
}


int main()
{
	printf("Embedded programming is cool!\n");
	return 0;
}



