		ORG	$4C00		;EXAMPLE PROGRAM
START:     NOP
	MOVE.B    #24,D1
	TRAP      #0
	FMOVE.P   $4000,FP1
           FADD      FP1,FP0
           FMOVE.P   FP0,$4000
	NOP
	TRAP	#14
	TRAP	#15
		END	START		; last line of source