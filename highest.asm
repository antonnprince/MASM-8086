data segment
    arr  db 10,20,30,32
data ends

code segment
                assume cs:code,ds:data

    start:      
                mov    ax,data
                mov    ds,ax

                mov    si,1
                mov    ah, arr            ; Initialize ah to the first element of the array
                mov    cx, 3              ; Number of elements in the array (4 - 1)

    compare:    
                mov    al, arr[si]        ; Load the current element into al
                cmp    ah, al             ; Compare with current highest value
                jnc    not_greater        ; Jump if not greater
                mov    ah, al             ; Update highest value if greater

    not_greater:
                inc    si                 ; Move to the next element
                loop   compare            ; Loop through all elements

    stop:       
                mov    ax, 4c00h
                int    21h

code ends
end start