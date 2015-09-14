        .ORIG   x3000

	LEA R2, DATA	; R2 used for BaseR
	LDR R0, R2, #0	; R0 has the temp largest

LOOP	ADD R2, R2, #1
	LDR R1, R2, #0	; R1 has the next value
	ADD R3, R1, #1
	BRz STOP	; -1 then halt

	NOT R3, R1
	ADD R3, R3, #1	; R3 <- -R1
	ADD R3, R0, R3	; R3 <- R0 - R1

	LEA R4, FLAG
	LDR R4, R4, #0	; R4 <- x8000
	AND R3, R3, R4 
	
	BRz LOOP	; >0, i.e. R0>R1
	ADD R0, R1, #0	; R0<=R1, then R0 <-R1	
	BR LOOP

STOP	ST R0, ANS
	HALT

DATA	.FILL 4
	.FILL 2
	.FILL 1
	.FILL 5
	.FILL 3
	.FILL -1
FLAG	.FILL x8000
ANS	.BLKW 1

	.END

