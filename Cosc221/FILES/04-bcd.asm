	.ORIG x3000
	
	LEA R2, BCD
	LDR R0, R2, #0	; R0 has ASCII '2'
	
	LDR R1, R2, #1	; R1 has ASCII '5'

	LD R3, NEG48	; ADD R1, R1, #-48 wont' work 
	ADD R1, R1, R3	; R1 has value 5
	ADD R0, R0, R3	; R0 has value 2
	
	ADD R3, R0, R0	; R3 = 2 * R0
	ADD R4, R3, R3	; R4 = 4 * R0
	ADD R4, R4, R4	; R4 = 8 * R0
	ADD R0, R3, R4	; R0 = 10 * R0
	ADD R1, R0, R1	; R1 = 10R0+R1
	
	ST R1, ANS

STOP	HALT

PADDING	.BLKW 9
NEG48	.FILL -48
BCD	.STRINGZ "25"
ANS	.FILL 0
	.END