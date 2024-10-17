proc Game.CentersPrepear\
     map, centers, matrix
    locals
        offsetCenters      dd      0
        offsetMap          dd      0
    endl
    mov     ebx, [matrix]
    mov     ecx, 64
    .centersLoop:
        mov     eax, [ebx]
        cmp     eax, TickExist
        jne     .skip
        push    ebx ecx

        mov     edi, [centers]
        add     edi, 4
        add     edi, [offsetCenters]
        mov     ebx, [map]
        add     ebx, [offsetMap]
        ; x
        mov     eax, [ebx]
        mov     [edi], eax
        ; y
        mov     eax, [ebx + 4]
        mov     [edi + 4], eax

        add     [offsetCenters], 8
        pop     ecx ebx
        .skip:
        add     ebx, 4
        add     [offsetMap], 8
        loop    .centersLoop
    ret
endp