       section   code
		ORG	$4C00		;EXAMPLE PROGRAM
START:     NOP

         LEA.L     ADDITION,A4
         MOVE.B    #4,D1
	TRAP      #0

         MOVE.B    #2,D1
	TRAP      #0

	LEA.L     FIRSTNUM,A4
         MOVE.B    #4,D1
	TRAP      #0

	MOVE.B    #24,D1
	TRAP      #0
	FMOVE.P   $4000,FP0
	FMOVE.P   $4000,FP1

         FMUL      FP1,FP0
         FMUL      FP1,FP0

         FMOVE.P   #3.14159, FP1
         FMOVE.P   #1.33, FP2
         FMUL      FP1,FP2
         FMUL      FP2,FP0

         FMOVE.P   FP0,$4000
         MOVE.B    #25,D1
	TRAP      #0
	TRAP	  #15


ADDITION   DC.B     'ADDITION: ',0,0
SUBTRACT   DC.B     'SUBTRACTION: ',0,0
FIRSTNUM   DC.B     'FIRST NUMBER: ',0,0
SECONDNUM  DC.B     'SECOND NUMBER: ',0,0
		END	START		; last line of source