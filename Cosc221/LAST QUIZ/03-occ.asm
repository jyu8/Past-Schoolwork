	.ORIG X3000

	LD R3, ELE
	NOT R3, R3
	ADD R3, R3, #1	;R3<- -ELE

	LEA R2, DATA	;BaseR
AA	LDR R0, R2, #0
	ADD R1, R0, #1
	BRz STOP	;-1 stop
	
	ADD R2, R2 #1
	ADD R1, R0, R3
	BRz BB
	BR AA

BB	LD R0, ANS
	ADD R0, R0, #1
	ST R0, ANS
	BR AA

STOP	HALT

ELE	.FILL 2
ANS	.FILL 0
DATA	.FILL 1
	.FILL 2
	.FILL 2
	.FILL 1
	.FILL 2
	.FILL 2
	.FILL 1
	.FILL -1

	.END