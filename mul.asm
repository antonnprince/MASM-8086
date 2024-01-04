DATA SEGMENT

DATA ENDS


CODE SEGMENT
             ASSUME CS:CODE,DS:DATA

PRINT PROC:
             MOV    DL,AL
             MOV    AH,02H
             INT    21H
             RET
PRINT ENDP

INPUT PROC
             MOV    AL,01H
             INT    21H
             MOV    BL,AL              ;STORE ALL 2 NUMBERS

             MOV    AL,01H
             INT    21H
             MOV    BH,AL              ;STORE ALL 2 NUMBERS

             MOV    AL,01H
             INT    21H
             MOV    CL,AL              ;STORE ALL 2 NUMBERS

             MOV    AL,01H
             INT    21H
             MOV    CH,AL              ;STORE ALL 2 NUMBERS

             SUB    BL,48
             SUB    BH,48
             SUB    CL,48
             SUB    CH,48

             MOV    AH,0
             MOV    AL,10
             MUL    BL
             MOV    BL,AL
             ADD    BL,BH

             MOV    AL,10
             MUL    CL
             MOV    CL,AL

             RET
INPUT ENDP

DISPLAYY PROC
             MOV    CX,9
             CMP    CX,BX
             JC     TWO

    ONE:     MOV    AX,BX
             ADD    AX,48
             CALL   PRINT
             JMP    END
    
    TWO:     MOV    CL,10              ;8 BIT NUMBER
             MOV    AX,BX
             DIV    CL
		
		
             MOV    CH,AH
             SUB    AH,AH
             MOV    BX,AX
		
             PUSH   CX
             CALL   DISPLAY
             POP    CX
		
             MOV    AL,CH
             ADD    AL,48
             CALL   PRINT
		
    
    END:     
             RET
DISPLAYY ENDP


    START:   
             CALL   INPUT

             MOV    BL,AL
             MUL    CL
             MOV    BX,AX
          
             CALL   DISPLAYY

    STOP:    
             MOV    AX,4C00H
             INT    21H
CODE ENDS

END START