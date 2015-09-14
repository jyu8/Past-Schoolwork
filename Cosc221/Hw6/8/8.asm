	.ORIG x3000

	LD R6 , LIST		;R6 is input list
 	LD R7 , LIST2		;R7 is list to be stored
	ADD R5 , R5 , #1	;R5 is number of things in the list
	LDR R0 , R6 , #0	
	STR R0 , R7 , #0	;Puts first value into the store list

AA	ADD R5 , R5 , R4
	AND R4 , R4 , #0
	LD R7 , LIST2
	ADD R6 , R6 , #1	;Next on the list into R0
	LDR R0 , R6 , #0		
	ADD R0 , R0 , #1
	BRz END			;Test to see if end list and resets value
	

BB	LDR R0 , R6 , #0
	NOT R0 , R0		
	ADD R0 , R0 , #1
	LDR R1 , R7 , #0	;R1 is comparison from stored list
	ADD R0 , R0 , R1	
	BRz AA			;If the value is a duplicate
	ADD R4 , R4 , #1	;R4 is the number of time looped
	ADD R5 , R5 , #-1
	BRz CC 
	ADD R7 , R7 , #1
	BR BB
	
CC	ADD R5 , R5 , R4	;Restore R5 and clear R4
	AND R4 , R4 , #0	
	LDR R0 , R6 , #0
	STR R0 , R7 , #1
	ADD R5 , R5 , #1
	BR AA

END	HALT

LIST	.FILL x3050
LIST2	.FILL x3070


	.END
