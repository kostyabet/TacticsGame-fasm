; XPosition   dd      ?
; YPosition   dd      ?
proc Mouse.OnClick uses ebx eax,\
     lparam
    locals
        buffer  dd  ?
        curType dd  ?
    endl
    stdcall Mouse.OnMove, [lparam], XPosition, YPosition
    mov     ebx, [CurentPage]
    mov     ebx, [EventsList + ebx]
    mov     ecx, [ebx]
    cmp     ecx, 0
    je      .exitProc
    add     ebx, 4
    .mainAnimLoop:
        .prepear:
            push    ebx
            mov     eax, [ebx]
            mov     [curType], eax
            add     ebx, 4
            mov     ebx, [ebx]
        .main:
            fld     dword [ebx]
            fcom    dword [XPosition]
            fstp    st0
            fstsw   ax
            sahf
            ja      .exit

            fld     dword [ebx + 4]
            fcom    dword [YPosition]
            fstp    st0
            fstsw   ax
            sahf
            ja      .exit
            
            fld     dword [ebx + 8]
            fcom    dword [XPosition]
            fstp    st0
            fstsw   ax
            sahf
            jb      .exit
            
            fld     dword [ebx + 12]
            fcom    dword [YPosition]
            fstp    st0
            fstsw   ax
            sahf
            jb      .exit
            
            pop     ebx
            add     ebx, 8
            mov     eax, [ebx]
            mov     [CurentPage], eax
            sub     ebx, 8
            push    ebx
        .exit:
            pop     ebx
            add     ebx, 12
            loop    .mainAnimLoop
    .exitProc:
        ret
endp