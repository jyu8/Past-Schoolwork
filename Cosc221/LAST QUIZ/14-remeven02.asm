; attempt two, move odd numbers to the beginning
; one at a time
; quick dirty first, then improve

	.ORIG X3000

	LEA R2, DATA	;BaseR
	LEA R3, DATA	;R3 is the pointer for odd fills

AA	LDR R0, R2, #0
	ADD R1, R0, #1
	BRz STOP	;-1 stop
	
; --- move odd to the beginning ---
	
	AND R4, R0, #1	;need R0 value for store	
	BRz EVEN	;even number
	BR ODD	

EVEN	BR NEXT

ODD	STR R0, R3, #0
	ADD R3, R3, #1

NEXT	ADD R2, R2, #1	
	BR AA

STOP	HALT

DATA	.FILL 2		;1
	.FILL 0		;1
	.FILL 1		;5
	.FILL 4		;new end -1 
	.FILL 0		;0	
	.FILL 6		;0
	.FILL 1		;0
	.FILL 5		;0
	.FILL -1	;0

	.END