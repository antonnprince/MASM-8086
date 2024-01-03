DATA SEGMENT

DATA ENDS

CODE SEGMENT
PRINT PROC
          MOV    DL,AL
          MOV    AH,02H
          INT    21H
          RET
          ENDP

INPUT PROC
          MOV    AL,01H
          INT    21H
          RET
          ENDP

    START:
          ASSUME CS:CODE,DS:DATA

          MOV    AX,DATA
          MOV    DS,AX

          CALL   INPUT
          CALL   PRINT
          MOV    AX,4C00H
          INT    21H

CODE ENDS
END START