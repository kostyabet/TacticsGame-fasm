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
    mov     [maxX], eax
    ; max Y
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

; eax = 0 - false;      GLFalse
; eax = 1 - true;       GLTrue
proc Game.OnMove.CheckIsInRect uses ebx,\
     x1, y1, x2, y2
    locals
        result  dd      GL_FALSE
    endl
    fld     dword [XPosition]
    fld     dword [x1]
    fcom    dword [XPosition]
    fstp    st0
    fstp    st0
    fstsw   ax
    sahf
    ja      .exit

    fld     dword [y1]
    fcom    dword [YPosition]
    fstp    st0
    fstsw   ax
    sahf
    ja      .exit
            
    fld     dword [x2]
    fcom    dword [XPosition]
    fstp    st0
    fstsw   ax
    sahf
    jb      .exit
            
    fld     dword [y2]
    fcom    dword [YPosition]
    fstp    st0
    fstsw   ax
    sahf
    jb      .exit

    mov     [result], GL_TRUE

    .exit:
        mov     eax, [result]
        ret
endp