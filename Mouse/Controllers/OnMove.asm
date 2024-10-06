proc Mouse.OnMove uses eax ebx,\
     coords, X, Y
    locals
        maxX    dd      ?
        maxY    dd      ?
        curX    dd      ?
        curY    dd      ?
    endl
    invoke  GetSystemMetrics, SM_CXSCREEN
    mov     [maxX], eax
    invoke  GetSystemMetrics, SM_CYSCREEN
    mov     [maxY], eax
    ; X
    mov     eax, [coords]   
    and     eax, 0xFFFF
    stdcall Mouse.GetProportion, [maxX], eax
    mov     ebx, [X]
    mov     [ebx], eax
    ; Y
    mov     eax, [coords]   
    shr     eax, 16
    and     eax, 0xFFFF
    stdcall Mouse.GetProportion, [maxY], eax
    mov     ebx, [Y]
    mov     [ebx], eax        
    ret
endp

;002D0852