proc Mouse.OnMove uses eax ebx,\
     coords, X, Y
    locals
        curX    dd      ?
        curY    dd      ?
    endl
    invoke  GetSystemMetrics, SM_CXSCREEN
    invoke  GetSystemMetrics, SM_CYSCREEN
    ; X
    mov     eax, [coords]   
    and     eax, 0xFFFF
    mov     ebx, [X]
    mov     [ebx], eax
    ; Y
    mov     eax, [coords]   
    shr     eax, 16
    and     eax, 0xFFFF
    mov     ebx, [Y]
    mov     [ebx], eax        
    ret
endp

;002D0852