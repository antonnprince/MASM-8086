DATA SEGMENT
DATA ENDS

CODE SEGMENT
              ASSUME CS:CODE,DS:DATA


PRINT PROC
              MOV    DL,AL
              MOV    AH,02H
              INT    21H
              RET
PRINT ENDP

INPUT PROC

              MOV    AH,01H
              INT    21H
              MOV    BL,AL

              MOV    AH,01H
              INT    21H
              MOV    BH,AL

              MOV    AH,01H
              INT    21H
              MOV    CL,AL

              MOV    AH,01H
              INT    21H
              MOV    CH,AL

              SUB    BL,48
              SUB    BH,48
              SUB    CL,48
              SUB    CH,48

              MOV    AL,10
              MUL    BL
              MOV    BL,AL
              ADD    BL,BH

              MOV    AL,10
              MUL    CL
              MOV    CL,AL
              ADD    CL,AH
              RET
INPUT ENDP

SHOW PROC
              MOV    BH,9
              CMP    BH,BL
              JC     TWO

        ONE:  MOV    AL,BL
              ADD    AL,48
              CALL   PRINT
              JMP    ENDD

        TWO:  
              mov    bh,10
              mov    al,bl
              sub    ah,ah
              div    bh

              mov    bl,al                  ;q
              mov    bh,ah                  ;r

              add    al,48
              call   SHOW
              mov    bh,al
              add    al,48
              call   SHOW

        ENDD: 
              RET

SHOW ENDP
        START:
              MOV    AX,DATA
              MOV    DS,AX

              CALL   INPUT

              ADD    BL,CL

              CALL   SHOW

        STOP: MOV    AX,4C00H
              INT    21H
CODE ENDS
END START
      
