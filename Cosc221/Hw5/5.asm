	.ORIG x3000
	
	LD  R1 , NUMBER		;R1 = n
	ADD R2 , R1 , #-1	;R2 = n-1 
	ADD R3 , R2 , #0	;R3 = n-1
	AND R0 , R0 , #0

INNER	ADD R0 , R0 , R1	;Count the number of times R1 has been added     
	ADD R2 , R2 , #-1
	BRz OUTER
	BR  INNER

OUTER	AND R1 , R1 , #0	
	ADD R1 , R1 , R0
	AND R0 , R0 , #0
	ADD R3 , R3 , #-1	;Count interations of outer loop
	ADD R2 , R2 , R3	;Store R3 to R2 to contiune multiplication
	BRz END
	BR  INNER

END	ST R1 , ANS
	HALT

NUMBER	.FILL	x0005
ANS	.BLKW	1

	.END