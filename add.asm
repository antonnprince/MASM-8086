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
            mov    bh,9
            cmp    bh,bl
            jc     two
      
      one:  add    bl,48
            call   print
            jmp    endd

      two:  sub    ah,ah
            mov    al,bl
            mov    bh,10
            div    bh

            mov    bl,al                ;q
            mov    bh,ah
            add    al,48
            call   print
            mov    al,ah
            add    al,48
            call   print                ;r
      endd: ret

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
      
