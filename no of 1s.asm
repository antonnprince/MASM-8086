data segment
    msg1 db 10,13,"Enter number: ","$",
    msg2 db 10,13,"Number of 1s are ","$"
data ends

code segment

             assume cs:code,ds:data
    start:   
             mov    ax,data
             mov    ds,ax

             mov    bl,0

             lea    dx,msg1
             mov    ah,9
             int    21h


             sub    al,30h
             mov    dl,8h

   
    checking:
             rol    al,1
             jnc    no_carry
             inc    bl
    no_carry:
             dec    dl
             jnz    checking

             lea    dx,msg2
             mov    ah,9
             int    21h
             add    bl,30
             mov    dl,bl
             mov    ah,2
             int    21h

             mov    ax,4c00h
             int    21h

code ends
end start