	.ORIG x3000
	
MAIN	LD R0, N
	LD R1, ANS
	JSR MUL		;call sub
	ST R1, ANS
	
	ADD R0, R0, #-1
	ST R0, N
	BRz STOP
	BR MAIN
STOP	HALT
N	.FILL 6
ANS	.FILL 1
;end of main

;being of sub
MUL	ST R0, SavedR0	;restore N for Main
	AND R3, R3, #0	;R3 as ANS*N
		
LOOP	ADD R3, R3, R1
	ADD R0, R0, #-1
	BRz DONE
	BR LOOP
DONE	
	AND R1, R1, #0
	ADD R1, R3, #0	;R1 <- R3
	LD R0, SavedR0	;restore R0
	RET
SavedR0	.BLKW 1
	.END