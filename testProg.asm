		ORG	$4C00		;EXAMPLE PROGRAM
START:     NOP
	FMOVE.L     (A1),FP1
	NOP
	TRAP	#14
	TRAP	#15
		END	START		; last line of source