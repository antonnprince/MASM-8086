DATA SEGMENT
    MSG1 DB 10,13,"ENTER 1ST NUMBER: $"
    MSG2 DB 10,13,"ENTER 2ND NUMBER: $"
DATA ENDS

CODE SEGMENT
             ASSUME CS:CODE,DS:DATA

PRINT PROC
             MOV    AH,02H
             MOV    DL,AL
             INT    21H
PRINT ENDP

INPUT PROC
           

             MOV    AH,01H
             INT    21H
             MOV    BH,AL

             MOV    AH,01H
             INT    21H
             MOV    BL,AL

             LEA    DX,MSG2
             MOV    AH,09H
             INT    21H

             MOV    AH,01H
             INT    21H
             MOV    CH,AL

             MOV    AH,01H
             INT    21H
             MOV    CL,AL

             SUB    CH,48
             SUB    CL,48
             SUB    BH,48
             SUB    BL,48

             MOV    AH,0
             MOV    AL,10
             MUL    BL
             MOV    BL,AL
             ADD    BL,BH

             MOV    AH,0
             MOV    AL,10
             MUL    CL
             MOV    CL,AL
             ADD    CL,CH

             RET
INPUT ENDP

DISPLAYY PROC
             MOV    BH,9
             CMP    BH,BL
             JC     SKIP2

    SKIP1:   
             MOV    AL,BL
             ADD    AL,48
             CALL   PRINT
             JMP    FINISH
    SKIP2:   
             MOV    BH,10
             MOV    AL,BL
             SUB    AH,AH
             DIV    BH

             MOV    BL,AL
             MOV    BH,AH

             PUSH   BX
             CALL   DISPLAYY
             POP    BX
        
             MOV    AL,BH
             ADD    AL,48
             CALL   PRINT
    FINISH:  
             RET
DISPLAYY ENDP

    START:   
             MOV    AX,DATA
             MOV    DS,AX

             LEA    DX,MSG1
             MOV    AH,09H
             INT    21H
             
             CALL   INPUT
             ADD    BL,CL
             CALL   DISPLAYY

    STOP:    
             MOV    AX,4C00H
             INT    21H
CODE ENDS
END START