DATA SEGMENT

DATA ENDS

CODE SEGMENT
                 ASSUME CS:CODE,DS:DATA
        ;ASSUMING I HAVE TO PRINT CONTENT IN AL
PRINT PROC
		
                 MOV    DL,AL
                 MOV    AH,02H
                 INT    21H
                 RET
PRINT ENDP
	
        ;STORE ALL 2 NUMBERS
INPUT PROC
		
                 MOV    AL,01H
                 INT    21H
                 MOV    BL,AL
		
                 MOV    AL,01H
                 INT    21H
                 MOV    BH,AL
		
                 MOV    AL,01H
                 INT    21H
                 MOV    CL,AL
		
                 MOV    AL,01H
                 INT    21H
                 MOV    CH,AL
		
		
                 SUB    BL,48
                 SUB    BH,48
                 SUB    CL,48
                 SUB    CH,48
		
        ;BL*10+BH
		
                 MOV    AH,0
                 MOV    AL,10
                 MUL    BL
                 MOV    BL,AL
                 ADD    BL,BH
		

        ;CL*10+CH
		
                 MOV    AH,0
                 MOV    AL,10
                 MUL    CL
                 MOV    CL,AL
                 ADD    CL,CH
		
        ;NOW WE HAVE NUMBERS IN BL AND CL
                 RET
		
INPUT ENDP
	
	
        ;SO WE NEED TO GET THE DIGITS OF BL
	
DISPLAYY PROC
        ;THE NUMBER IS IN BL
		
                 MOV    BH,9
                 CMP    BH,BL
                 JC     TWO
		
        ONE:     MOV    AL,BL
                 ADD    AL,48
                 CALL   PRINT
                 JMP    ENDD
		
        TWO:     MOV    BH,10
                 MOV    AL,BL
                 SUB    AH,AH
                 DIV    BH
		
                 MOV    BL,AL
                 MOV    BH,AH
		
                 PUSH   BX
                 CALL   DISPLAY
                 POP    BX

                 MOV    AL,BH
                 ADD    AL,48
                 CALL   PRINT
		
		
		
        ENDD:    
                 RET
DISPLAYY ENDP
	
        START:   
                 MOV    AX,DATA
                 MOV    DS,AX
		
        ;MAIN PROGRAM
	
                 CALL   INPUT
	
        ;ADDING TWO NUMBERS AND STORING IN BL
                 ADD    BL,CL
	
	
                 CALL   DISPLAY
	
        STOP:    
                 MOV    AX,4C00H
                 INT    21H
CODE ENDS
END START