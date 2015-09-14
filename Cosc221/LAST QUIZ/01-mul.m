b A
c B
d A shift
e tmp of 1
f ans

AAA(0)	load c		4c
	and  e		1e
	jz BBB		7-7

	load d		4d
	add  f		0f
	str  f		5f
	disp f		3f

BBB(7)	shr  d		2d
	shr  e		2e
CCC(9)	jz CCC		7-9

	jmp AAA		6-0
