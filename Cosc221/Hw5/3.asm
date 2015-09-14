	.ORIG x3000
		
	LEA R0 , A
	LEA R1 , B
	LEA R2, C
	
	NOT R1 , R1			
	ADD R3 , R0 , R1     	;R3 is length of A
	ADD R3 , R3 , #1
	NOT R3 , R3	
	ADD R4 , R2 , R1	;R4 is length of B	
	ADD R4 , R4 , #0
	NOT R4 , R4
	ADD R4 , R4 , #1
	ADD R6 , R3 , R4	;R6 is A - B
	ADD R7 , R6 , #0	; Test to see if R6 is zero
	BRz ZERO
	LD R7 , F
	AND R0 , R6 , R7	;Test with mask for pos values
	BRz POS
	LD R5 , E		;If not zero or pos it is neg
	BR END

ZERO 	LD R5 , C
	BR END

POS	LD R5 , D 
	BR END

END	HALT
		
A	.stringz "Kappaa"
B	.stringz "Keepoooo"
C	.FILL x0001
D	.FILL x0011
E	.FILL x0111
F	.FILL x8000  ;Mask
	.END