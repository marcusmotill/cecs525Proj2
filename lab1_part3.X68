*-----------------------------------------------------------
* Title      :  Lab 1 part 1
* Written by :  David Exe
* Date       :  9/8/15
* Description:  Create a simple math application that implements the basic math
*               operations +, -, *, / on integers in a simple command line calc. 
*-----------------------------------------------------------
    ORG    $4C00
    
start         
    lea     calcMenu,a0
    jsr     SENDCHAR         Use Jump subroutine to send to terminal
    
    lea     enter1Msg,a0    Display 'enter 1 first number'
    jsr     SENDCHAR
    MOVE.B  #21,D1
    TRAP    #0
    Move.B  D3,D4
    lea     enter1aMsg,a0    Display 'enter 2 first number'
    jsr     SENDCHAR
    MOVE.B  #21,D1
    TRAP    #0
    MOVE.B  D3,D5
    
    lea     enterOpMsg,a0    Display 'enter operation'
    jsr     SENDCHAR  
    
    jsr     GETCHAR
    subi    #48,d1
    
    cmp.b   #0,d1           if 0 then exit
    beq     end
    
    cmp.b    #1,d1           if 1 goto add
    beq     add
    
    cmp.b     #2,d1           if 2 goto subtract
    beq     sub
    
    cmp.b     #3,d1           if 3 goto multiply 
    beq     mul
    
    cmp.b    #4,d1           if 4 goto divide
    beq     div

    cmp.b    #5,d1           if 4 goto divide
    beq     bkr
    
    lea     error,a0
    jsr     SENDCHAR
    
    bra     start           go to start if not a valid option
    
    
add   MOVE.B  #17,D1
      TRAP    #0
      MOVE.B  #22,D1
      TRAP    #0
      bra     start 

sub   MOVE.B  #18,D1
      TRAP    #0
      MOVE.B  #22,D1
      TRAP    #0
      bra     start 

mul   MOVE.B  #19,D1
      TRAP    #0
      MOVE.B  #23,D1
      TRAP    #0
      bra     start 
    
div   MOVE.B  #20,D1
      TRAP    #0
      MOVE.B  #23,D1
      TRAP    #0
      bra     start 

bkr   TRAP     #14

    
SENDCHAR    MOVE.B      (A0)+,D1        Point to chars in equation and get
            CMP.B       #0,D1           Check for ending of string, null char
            BEQ	        DONE            Branch to return   
OUTCHAR     BTST.B      #TDRE,ACIAC     Test 6850 control reg for readiness to transmit
            BEQ	        OUTCHAR         Loop until 6850 is ready to transmit
            MOVE.B      D1,ACIAD        Transmit equation character out data register
            BRA	        SENDCHAR         Branch back for the next character
DONE        RTS

GETCHAR     BTST.B      #RDRF,ACIAC
            BEQ         GETCHAR        Loop until ready
            CLR.L       D1             Clear out all bits in register
            MOVE.B      ACIAD,D1       Grap the character from terminal
ECHO        BTST.B      #TDRE,ACIAC    send the character back for confirmation of enter
            BEQ         ECHO
            MOVE.B      D1, ACIAD
            RTS
    
end         TRAP    #15          halt simulator
    
CR      EQU     $0D
LF      EQU     $0A
ACIAC   EQU     $8001           Location of the 6850 serial interface control reg.
ACIAD   EQU     ACIAC+2         Location of the 6850 serial interface data reg.
TDRE    EQU     1               Transmit data register empty 
RDRF    EQU     0               Receive data register full

calcMenu    dc.b    CR,LF
    dc.b    '   +he Simpl- C*lcu/ator ',CR,LF
    dc.b    '  _______________________ ',CR,LF
    dc.b    ' |  ___________________  |',CR,LF
    dc.b    ' | |                   | |',CR,LF
    dc.b    ' | | Enter each Number | |',CR,LF
    dc.b    ' | |Then Enter Operator| |',CR,LF
    dc.b    ' | |1(+) 2(-) 3(*) 4(/)| |',CR,LF
    dc.b    ' | |      0(exit)      | |',CR,LF
    dc.b    ' | |___________________| |',CR,LF
    dc.b    ' |   ___ ___ ___   ___   |',CR,LF
    dc.b    ' |  | 7 | 8 | 9 | | + |  |',CR,LF
    dc.b    ' |  |___|___|___| |___|  |',CR,LF
    dc.b    ' |  | 4 | 5 | 6 | | - |  |',CR,LF
    dc.b    ' |  |___|___|___| |___|  |',CR,LF
    dc.b    ' |  | 1 | 2 | 3 | | x |  |',CR,LF
    dc.b    ' |  |___|___|___| |___|  |',CR,LF
    dc.b    ' |  | 0 |   | = | | / |  |',CR,LF
    dc.b    ' |  |___|___|___| |___|  |',CR,LF
    dc.b    ' |_______________________|',CR,LF,CR,LF,0

enter1Msg    dc.b    CR,LF,'Enter First Number: ',0
enter1aMsg    dc.b    CR,LF,'Enter second Number: ',0
enter2Msg    dc.b    CR,LF,'Enter first digit of Second Number: ',0
enter2aMsg   dc.b    CR,LF,'Enter second digit of Second Number: ',0
enterOpMsg   dc.b    CR,LF,'Enter Operator 1(+) 2(-) 3(*) 4(/) 0(exit): ',0
resultMsg    dc.b    CR,LF,'Result: ',0
nextOpMsg    dc.b    CR,LF,'(press enter to continue)',0
holdMsg      dc.b    CR,LF,'',0
remainderMsg dc.b    CR,LF,'Remainder: ',0
error        dc.b    CR,LF,'error',0

    END    START        ; last line of source






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
