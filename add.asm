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
      ;AFTER INTERRUPT CALLED, VALUE ENTERED IS IN AL. THE VALUE SHOULD BE MOVED TO ANOTHER TEMP REGISTER
              MOV    AL,01
              INT    21H
              MOV    BL,AL
            
              MOV    AL,01
              INT    21H
              MOV    BH,AL
            
              MOV    AL,01
              INT    21H
              MOV    CL,AL
            
              MOV    AL,01
              INT    21H
              MOV    CH,AL

      ;CONVERTING THE ASCII VALUES INTO DECIMAL VALUES
              SUB    BL,48
              SUB    BH,48
              SUB    CL,48
              SUB    CH,48

            
      ;BL*10 + BH
              MOV    AL,10
              MUL    BL
              MOV    BL,AL
              ADD    BL,BH

      ;CL*10 + CH
              MOV    AL,10
              MUL    CL
              MOV    CL,AL
              ADD    CL,CH
              RET
              ENDP

DISPLAY PROC
              MOV    BH,10
              CMP    BH,BL
              JC     TWO

      ONE:    
              MOV    AL,BL
              ADD    AL,48
              CALL   PRINT
              JMP    ENDD
      
      TWO:    
              MOV    BH,10
              MOV    AL,BL
              DIV    BH

              MOV    BH,AH
              MOV    BL,AL

              PUSH   BX
              CALL   DISPLAY
              POP    BX

              MOV    AL,BH
              ADD    AL,48
              CALL   PRINT

      ENDD:   
              RET
              ENDP
      
      
      START:  
              ASSUME CS:CODE,DS:DATA

              MOV    AX,DATA
              MOV    DS,AX

              CALL   INPUT
              ADD    BL,CL
              CALL   DISPLAY
      STOP:   
              MOV    AX,4C00H
              INT    21H

CODE ENDS
END START