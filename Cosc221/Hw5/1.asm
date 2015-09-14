	.ORIG x3000
	
	LD R1 , A 		;R1 is the address of A
	LD R2 , B 		;R2 is the address of B
	LDR R3 , R1 , #0	;R3 is the value of A
	LDR R4 , R2 , #0	;R4 is the value of B
	
	NOT R4 , R4		
	ADD R4 , R4 , #-1	
	ADD R5 , R3 , R4     	;R5 is the loop counter (-A + B)
	NOT R5 , R5
	
LOOP	LDR R6 , R3 , #0	;R6 is Mem of R3 +1
	ADD R6 , R6 , #1
	STR R6 , R3 , #0
	ADD R3 , R3 , #1
	
	ADD R5 , R5 , #-1	;Loop for counter
	BRz END
	BR LOOP	

END	HALT
	

A	.FILL x3030     ;Address A
B	.FILL x3031	;Address B
	
	.END