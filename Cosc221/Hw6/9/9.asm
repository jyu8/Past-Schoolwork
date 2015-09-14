	.ORIG x3000

	LD R7 , LIST		;R7 Is Location of list
AA	LDR R5 , R7 , #0	;R5 is temp value for counting
	ADD R5 , R5 , #1
	BRz MAINSUB
	ADD R6 , R6 , #1	
	ADD R7 , R7 , #1	;Count the number of numbers in the list in R6
	BR AA
MAINSUB	ADD R5 , R5 , #-1	;Subtract R5 here for code structure
	ADD R4 , R6 , #0	;Copy R6 into R	
	STI R4 , N

MAIN1	ADD R6 , R6 , #-1	;2 LOOPS FOR N^2 WORST CASE COMPLEXITY ASSUMTION
	BRz END
	AND R5 , R5 , #0
	ADD R5 , R5 , #-1
	LDI R4, N

MAIN2	ADD R4 , R4 , #-1
	BRz MAIN1
	LD R7, LIST
	ADD R5 , R5 , #1
	ADD R7 , R5 , R7	;R5 is the position in  list
	LDR R0 , R7 , #0
	LDR R1 , R7 , #1

COMPARE	NOT R2 , R0		;R2 is temp -A
	ADD R2 , R1 , R2	
	BRz MAIN2		;If they are the same, do nothing
	LD R3 , MASK		;R3 is mask
	AND R3 , R2 , R3
	BRz MAIN2		;If its positive B is bigger and do nothing
	BR SWITCH		;If B-A is negative, A is bigger and switch occurs

SWITCH  STR R1 , R7 , #0
	STR R0 , R7 , #1
	BR MAIN2

END	HALT
N	.FILL x4000
MASK 	.FILL x8000
SIXTEEN	.FILL x0010
LIST	.FILL x3050	

	.END