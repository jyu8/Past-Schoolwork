; attempt three, clean the rest of data
; with a bug
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

; --- fill rest with -1 then 0s ---
STOP	AND R0, R0, #0
	ADD R0, R0, #-1	;R0 <= -1
	STR R0, R3, #0	;create new end -1

	ADD R0, R0, #1	;R0 <= 0		
	ADD R4, R2, R0	;R4 <= R2
	NOT R4, R4	
	ADD R4, R4, #1	;R4 <= -R2

BB	ADD R1, R3, R4	; test R3==R2
	BRz DONE	; R3==R2 stop	
	STR R0, R3, #0	; BUG
	ADD R3, R3, #1
	BR BB	

DONE	STR R0, R2, #0
	HALT

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