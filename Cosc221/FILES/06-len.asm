        .ORIG   x3000

	AND R0, R0, #0	;0
	AND R3, R3, #0	;Ans
	LEA R1, DATA	;BaseR
	
AA	LDR R2, R1, #0
	ADD R2, R2, R2
	BRz BB

	ADD R3, R3, #1
	ADD R1, R1, #1
	BR AA

BB	ST R3, ANS
	HALT

DATA	.STRINGZ "Hello LC3"
ANS	.BLKW 1

	.END

