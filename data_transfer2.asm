;the program given below shows an ALP to transfer a block of data (overlapping) from ROM to RAM followed by data exchange between two sections of RAM
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
rom_array DCD 0x01,0x02,0x03,0x4,0x05,0x06,0x07,0x08
		AREA |.data|,DATA,READWRITE
len 	EQU 0x08
ram_array SPACE 32
non_overlap_offset EQU 0x08
	AREA |.text|,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
Reset_Handler_End
		LDR R1,=rom_array
		LDR R2,=ram_array
		MOV R0,#len
mem_cpy	
		LDR R3,[R1],#4
		STR R3,[R2],#4
		SUBS R0,R0,#1
		BNE mem_cpy
                
		MOV R0,#len
		LDR R1,=ram_array+28
		LDR R2,=ram_array+28+non_overlap_offest
 mem_trans	
		LDR R3,[R1],#-4
		STR R3,[R2],#-4
		SUBS R0,R0,#1
		BNE mem_trans
                               
stop		B   stop
		END
