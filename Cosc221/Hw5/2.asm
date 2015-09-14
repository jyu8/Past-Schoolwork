	.ORIG x3000
		
	ADD R0 , R0 , #8
	ADD R0 , R0 , #8	;R0 = 16	
	LD R2 , NUMBER 		
	LDR R3 , R2 , #0	;R3 is tested number
	ADD R4 , R4 , #1	;R4 = 1
LOOP	AND R5 , R3 , R4	;Logic is test to see if 1st digit is zero  	
	BRz ZERO		;If yes add 1 and double R4
	ADD R4 , R4 , R4	;If not then double R4
	BR MINUS		
	
ZERO	ADD R1 , R1 , #1	
	ADD R4 , R4 , R4
	BR MINUS

MINUS	ADD R0, R0 , #-1
	BRz END
	BR LOOP
	
END	HALT
	
NUMBER	.FILL x3030
	
	.END