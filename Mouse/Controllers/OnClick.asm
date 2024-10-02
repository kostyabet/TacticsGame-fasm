; XPosition   dd      ?
; YPosition   dd      ?
proc Mouse.OnClick uses ebx eax,\
     lparam
    locals
        buffer  dd  ?
    endl
    stdcall Mouse.OnMove, [lparam], XPosition, YPosition
    mov     ebx, [CurentPage]
    mov     ebx, [EventsList + ebx]
    mov     ecx, [ebx]
    add     ebx, 4
    .mainAnimLoop:
        .prepear:
            push    ebx
        .main:
            mov     ebx, [ebx]
            fld     dword [ebx]
            fcom    dword [XPosition]
            fstp    st0
            fstsw   ax
            sahf
            ja      .exit

            fld     dword [YPosition]
            fld     dword [ebx + 4]
            fcom    dword [YPosition]
            fstp    st0
            fstp    st0
            fstsw   ax
            sahf
            jb      .exit
            
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
            add     ebx, 4
            mov     eax, [ebx]
            mov     [CurentPage], eax
            sub     ebx, 4
            push    ebx
        .exit:
            pop     ebx
            add     ebx, 8
            loop    .mainAnimLoop
    ret
endp