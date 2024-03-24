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
num		EQU 	4 ;integer whose factorial has to be found
		AREA |.text|,CODE,READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
Reset_Handler_End
		MOV R0,#num
		MOV R1,R0
fact	
		CMP R1,#1
		BEQ done
		SUBS R1,R1,#1
		MUL R2,R1,R0
		MOV R0,R2
		B fact
done 
		MOV R4,R0  ;the final ans will be obtained here
stop 	B	stop
		END
