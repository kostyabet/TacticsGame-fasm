proc Mouse.OnMove uses eax ebx,\
     coords, X, Y
    locals
        maxX    dd      ?
        maxY    dd      ?
        curX    dd      ?
        maxX    dd      ?
        curY    dd      ?
        maxY    dd      ?
    endl
    ; max X
    invoke  GetSystemMetrics, SM_CXSCREEN
    shr     eax, 1
    mov     [maxX], eax
    ; max Y
    invoke  GetSystemMetrics, SM_CYSCREEN
    shr     eax, 1
    mov     [maxY], eax
    ; X
    mov     eax, [coords]   
    and     eax, 0xFFFF
    stdcall GetXGLfloatCoordByWidth, eax, [maxX]
    mov     ebx, [X]
    mov     [ebx], eax
    ; Y
    mov     eax, [coords]   
    shr     eax, 16
    and     eax, 0xFFFF
    stdcall GetYGLfloatCoordByWidth, eax, [maxY]
    mov     ebx, [Y]
    mov     [ebx], eax
    ret
endp

proc Mouse.CheckSwitchOnMove
    cmp     [isVolumeSwitchClicked], GL_TRUE
    jne     .exit

    .exit:
        ret
endp