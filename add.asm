data SEGMENT
data ends

code segment
            assume cs:code, ds:data

print proc
            mov    dl, al
            mov    ah, 02H
            int    21h
            ret
print endp

input proc
            mov    ah, 1
            int    21h
            mov    bl, al

            mov    ah, 1
            int    21h
            mov    bh, al

            mov    ah, 1
            int    21h
            mov    cl, al

            mov    ah, 1
            int    21h
            mov    ch, al

            sub    bl, 48
            sub    bh, 48
            sub    cl, 48
            sub    ch, 48

            mov    al, 10
            mul    bl
            mov    bl, al
            add    bl, bh

            mov    al, 10
            mul    cl
            mov    cl, al
            add    cl, ch
            ret
input endp

dis proc
            mov    cl, 9
            cmp    bl, cl
            jbe    one

            mov    ah, 0                 ; Preserve AH
            mov    al, bl
            mov    bl, 10
            div    bl

            add    al, 48
            call   print
            add    ah, 48
            mov    al, ah
            call   print
            ret

      one:  
            add    al, 48
            call   print
            ret

dis endp

      START:
            mov    ax, data
            mov    ds, ax

            call   input
            add    bl, cl
            call   dis

            mov    ax, 4C00H
            int    21h

code ends
end start
