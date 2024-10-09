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