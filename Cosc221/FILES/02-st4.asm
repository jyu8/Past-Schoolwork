	.ORIG x3000
	
	AND R0, R0, #0	;R0 <- 0
	AND R3, R3, #0
	ADD R3, R3, #4	;R3 <- 4, counter	
	LEA R2, DATA	;R2 <- address of DATA

AA	ADD R0, R0, #2
	STR R0, R2, #0
	
	ADD R2, R2, #1
	ADD R3, R3, #-1
	BRz BB
	BR AA

BB	HALT

DATA	.BLKW 4
	.END