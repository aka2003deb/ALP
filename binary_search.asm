PRESERVE8
Stack	EQU 0x00000100
		AREA STACK, NOINIT, READWRITE
StackMem SPACE Stack 			
		AREA RESET, DATA, READONLY
		EXPORT __Vectors
__Vectors
		DCD StackMem
		DCD Reset_Handler
					
		AREA tempData,DATA, READONLY
array 	DCD 	1,2,3,4,5,6,7,8,9,10
len		EQU 	10
		AREA |.text|,CODE,READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
Reset_Handler_End
		LDR R0,=array
		MOV R1,#0
		MOV R2,#(len-1)
		MOV R3,#8
		
binary_search
		ADD R4,R1,R2
		LSR R4,R4,#1
		LDR R5,[R0,R4,LSL #2]
		CMP R3,R5
		BEQ found
		BGT right_search
		BLT left_search		

right_search
		ADD R4,R4,#1
		MOV R1,R4
		B binary_search
left_search
		SUB R4,R4,#1
		MOV R2,R4
		B binary_search
found
		MOV R6,R4
STOP 	B	STOP
		END
