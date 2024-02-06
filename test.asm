.model small
.stack 100h

data segment
      msg1 db 10,13,"Enter string1: ","$",
      msg2 db 10,13,"Enter string2: ","$",
      str1 db 8,?,8 dup("$")
data ends

code segment
             assume cs:code,ds:data

      start: 
             mov    ax,data
             mov    ds,ax

             mov    dx,offset msg1
             mov    ah,9
             int    21h

             mov    si,0

      read:  
             mov    ah,1h
             int    21H
             ret

      input1:call   read
             cmp    al,13
             je     inp
             mov    str1[si],al
             inc    si
             jmp    input1

             
      
      inp:   
             mov    dx,offset msg2
             mov    ah,9
             int    21h

      input2:
             call   read
             cmp    al,13
             je     concat
             mov    str1[si],al
             inc    si
             jmp    input2

      concat:
             mov    str1[si],"$"
             mov    dx,offset str1
             mov    ah,9
             int    21h

      stop:  
             mov    ax,4c00h
             int    21h
             ret
code ends
end start