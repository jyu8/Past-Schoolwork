	.ORIG x3000

	LD R0, ANS
	AND R3, R3, 0
	ADD R3, R3, #4	;R3 <- 3

	LEA R1, A	;BaseR
			;ADD R0, R1	;2
	
AA	LDR R2, R1, #0
	ADD R0, R0, R2

	ADD R1, R1, #1
	ADD R3, R3, #-1
	BRz BB
	BR AA

BB	ST R0, ANS
	HALT

A	.FILL 2
	.FILL 3
	.FILL 5
	.FILL 7

ANS	.FILL 0
	.END