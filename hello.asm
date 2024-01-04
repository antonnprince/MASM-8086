DATA SEGMENT
           MSG DB,"HELLO WORLD","$"
DATA ENDS

CODE SEGMENT
            ASSUME CS: CODE,DS:DATA
        
      START:
            MOV    AX,DATA
            MOV    DS,AX
        
            LEA    DX,MSG
            MOV    AH,09H
            INT    21H
        
      STOP: 
            MOV    AX,4C00H
            INT    21H

    
CODE ENDS
END START