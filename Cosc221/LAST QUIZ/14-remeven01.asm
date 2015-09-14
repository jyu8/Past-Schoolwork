; attempt one, just replace even by 0, go through list
; one at a time
; quick dirty first, then improve

	.ORIG X3000

	LEA R2, DATA	;BaseR

AA	LDR R0, R2, #0
	ADD R1, R0, #1
	BRz STOP	;-1 stop
	
; --- replace even with 0 ---
	
	AND R0, R0, #1	
	BRz EVEN	;even number
	BR ODD	
EVEN	STR R0, R2, #0
	BR NEXT
ODD	BR NEXT
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