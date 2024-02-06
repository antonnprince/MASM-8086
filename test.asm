data SEGMENT
data ends

code segment

              assume cs:code,ds:data

print proc
              mov    dl,al
              mov    ah,02h
              int    21h
              ret
print endp

input proc
              MOV    AL,01H
              INT    21H
              MOV    BL,AL                ;STORE ALL 2 NUMBERS

              MOV    AL,01H
              INT    21H
              MOV    BH,AL                ;STORE ALL 2 NUMBERS

              MOV    AL,01H
              INT    21H
              MOV    CL,AL                ;STORE ALL 2 NUMBERS

              MOV    AL,01H
              INT    21H
              MOV    CH,AL
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
              add    cl,ch
              RET
INPUT ENDP

display proc
              mov    cx,9
              cmp    cx,bx
              jc     two

      one:    
              mov    bx,ax
              add    ax,48
              call   print
              jmp    endd

      two:    
              mov    cl,10
              mov    ax,bx
              div    cl

              mov    bx,ax
              add    al,48
              call   print
              add    bh,48
              mov    al,bh
              call   print


      endd:   
              ret
display endp
      start:  
              mov    ax,data
              mov    ds,ax
              call   input
              mov    al,bl
              mul    cl
              mov    bx,ax
              call   display

              mov    ax,4C00H
              int    21H
              

code ends
end start