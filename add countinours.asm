data segment
       arr  db 5 dup(?)
data ends

code segment
                assume cs:code, ds:data

       start:   
                mov    ax, data
                mov    ds, ax

                mov    si, 0
                mov    cx, 5                  ; Set loop counter to 5 for 5 elements

                mov    ax, 0                  ; Initialize AX to hold the sum

       sum_loop:
                add    al, arr[si]            ; Add the value at arr[si] to AL
                inc    si                     ; Move to the next element
                loop   sum_loop               ; Repeat until CX becomes zero

                mov    dl, al                 ; Move the sum to DL for printing
                mov    ah, 2
                int    21h

                mov    ax, 4C00h
                int    21h
code ends
end start
