//the program given below shows an ALP to transfer a block of data(non overlapping) from ROM to RAM followed by data exchange between two sections of RAM
PRESERVE8
Stack	EQU 0x00000100
		AREA STACK, NOINIT, READWRITE
StackMem SPACE Stack 			
		AREA RESET, DATA, READONLY
		EXPORT __Vectors
__Vectors
		DCD StackMem
		DCD Reset_Handler
		AREA tempdata,DATA,READONLY
rom_array1 DCD 0x01,0x02,0x03,0x4,0x05,0x06,0x07,0x08
rom_array2 DCD 0x09,0x10,0x11,0x12,0x13,0x14,0x15,0x16
		AREA |.data|,DATA,READWRITE
len EQU 0x08
ram_array1 SPACE 32
ram_array2 SPACE 32
		AREA |.text|,CODE,READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
Reset_Handler_End
		LDR R1,=rom_array1
		LDR R2,=ram_array1
		MOV R0,#0x10
mem_cpy	
		LDR R3,[R1],#4
		STR R3,[R2],#4
		SUBS R0,R0,#1
		BNE mem_cpy
		
		MOV R0,#len
		LDR R1,=ram_array1
		LDR R2,=ram_array2
		
mem_ex	LDR R3,[R1]
		LDR R4,[R2]
		STR R3,[R2],#4
		STR R4,[R1],#4
		SUBS R0,R0,#1
		BNE mem_ex
stop	B   stop
		END
