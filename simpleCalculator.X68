*-----------------------------------------------------------
* Title      : Simple Calculator
* Written by : Marcus Motill
* Date       : 9/2/15
* Description: A simple calculator that takes in two numbers
*              and returns the desired operation
*-----------------------------------------------------------
    ORG    $4C00
START:      
         MOVE.W   #8,D4
         MOVE.W   #10,D5
         MOVE.B   #17,D1
         TRAP     #0
         TRAP     #15
            

CR      EQU     $0D
LF      EQU     $0A
    
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
