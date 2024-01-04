.model small
.stack 100h

data segment
       msg1 db "Enter  string1: ",10,13,"$",
       msg2 db "Enter string2: ",10,13,"$",
       str1 db 8,?,8 dup("$")
data ends

code segment

              assume cs:code,ds:data

       start: 
              mov    ax,data
              mov    ds,ax

              lea    dx,msg1
              mov    ah,09h
              int    21h

       ;reading str1ing1
              mov    si, 0
      
       input1:call   read
              cmp    al,13
              je     input2
              mov    str1[si],al
              inc    si
              jmp    input1

       input2:
              lea    dx,msg2
              mov    ah,09h
              int    21h
              call   read
              cmp    al,13
              je     concat
              mov    str1[si],al
              inc    si
              jmp    input2
      
       concat:
              mov    str1[si],"$"
              lea    dx,str1
              mov    ah,09h
              int    21h
      
      
      

       exit:  
              mov    ax,4c00h
              int    21h

       read:  
              mov    al,01h
              int    21h
              ret

code ends

end start