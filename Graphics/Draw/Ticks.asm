proc Graphics.Draw.Ticks uses ebx ecx edi,\
    float, colors
    locals
        curColor    dd      ?
        multipier   dd      4
    endl
    mov     ebx, [float]
    mov     ecx, [ebx]
    add     ebx, 4
    .circleDrawLoop:
        ; == color == ;
        push    ecx ebx
        mov     edi, [float]
        mov     eax, [edi]
        sub     eax, ecx
        mul     dword [multipier]
        mov     ebx, eax
        mov     edi, [colors]
        mov     eax, [edi + ebx]
        mov     [curColor], eax
        pop     ebx ecx
        ; == main == ;
        push    ecx ebx
        mov     ebx, [ebx]
        stdcall Graphics.Draw.Shapes.Circle, ebx, [curColor]
        pop     ebx ecx
        add     ebx, 4
        dec     ecx
        cmp     ecx, 0
        ja      .circleDrawLoop
    ret
endp

proc Graphics.Draw.MltTicks uses ebx ecx edi,\
    float, colors
    locals
        multipier   dd      4
    endl
    
    ; ; check what color choose
    ;         mov     eax, 33
    ;         sub     eax, ecx
    ;         cmp     [TicksMoveDirections.MULTI_DIRECTION], 1
    ;         jne     .exitFromCheck
    ;         cmp     [isFontTick], 1
    ;         jne     .exitFromCheck
    ;             cmp     eax, [TicksMoveDirections.TOP.TO]
    ;             jne     @F
    ;               add     ebx, 8
    ;             @@:
    ;             cmp     eax, [TicksMoveDirections.LEFT.TO]
    ;             jne     @F
    ;               add     ebx, 8
    ;             @@:
    ;             cmp     eax, [TicksMoveDirections.RIGHT.TO]
    ;             jne     @F
    ;               add     ebx, 8
    ;             @@:
    ;             cmp     eax, [TicksMoveDirections.BOTTOM.TO]
    ;             jne     .exitFromCheck
    ;               add     ebx, 8
    ;     .exitFromCheck:
    
    ret
endp