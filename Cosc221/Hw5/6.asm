	.ORIG x3000
	
	LD R1, B
	NOT R2, R1
	ADD R2, R2, #1	;R2 <- -B

BB	JSR MINUS
	
	BRz EE

	LD R0, A
	LD R1, FLAG
	AND R1, R0, R1
	BRz BB
	BR DD

DD	NOT R2, R2 
	ADD R0 , R0 , R2
	ADD R0 , R0 , #1
	ST R0, ANS

EE	HALT

A	.FILL x0050
B	.FILL x000b
FLAG	.FILL x8000

MINUS	LD R0, A 
	ADD R0, R0, R2
	ST R0, A
	RET

ANS	.BLKW 0

	.END