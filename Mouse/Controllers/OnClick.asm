; XPosition   dd      ?
; YPosition   dd      ?
proc Mouse.OnClick uses ebx eax,\
     lparam
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
            add     ebx, 4
            
            cmp     eax, et_pagebutton
            jne     @F
            stdcall Game.OnClick.PageButton, [ebx], [ebx + 4]
        @@:
            cmp     eax, et_tick
            jne     @F
            stdcall Game.OnClick.TickButton, [ebx], [ebx + 4], [ebx + 8]
        @@:
            pop     ebx
            add     ebx, 12
            loop    .mainAnimLoop
    .exitProc:
        ret
endp
; return 
;   eax = 0 - false 
;   eax = 1 - true
proc Game.OnClick.PageButton uses eax ebx,\
     coords, nextPage
        mov     ebx, [coords]
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
            
        mov     eax, [nextPage]
        mov     [CurentPage], eax
    .exit:
        ret
endp
proc Game.OnClick.TickButton ,\
     count, radius, centers
    locals

    endl
    mov     ecx, [count]
    
    ret
endp