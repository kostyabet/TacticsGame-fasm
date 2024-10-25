proc Graphics.Animation uses eax ebx ecx edx
    locals
        bacColor    BackgroundColor ?
        nextColor   BackgroundColor ?
    endl
        mov     ebx, AnimsList
        add     ebx, [CurentPage]
        mov     ebx, [ebx]
        mov     ecx, [ebx]
        cmp     ecx, 0
        je      .exit
        add     ebx, 4
    .main:
        push    ecx ebx
            mov     eax, [ebx]
            cmp     eax, Anim_static
            je      .animationStatic
            cmp     eax, Anim_btn_cl
            je      .animationButtonCl
            cmp     eax, Anim_btn_mv
            je      .animationButtonMv
            jmp     .exitFromLoop
        .animationStatic:
            mov     ebx, [ebx + 4]
            stdcall ebx
            jmp     .exitFromLoop
        .animationButtonCl:
            mov     ebx, [ebx + 4]
            stdcall Mouse.CheckIsInShape, [ebx]
            add     ebx, 4
            mov     edx, [ebx]
            mov     [bacColor], edx
            cmp     eax, GL_FALSE
            je      .old
            mov     edx, [ebx + 4]
            mov     [nextColor], edx
            jmp     .setColor
            .old:
            mov     edx, [ebx + 8]
            mov     [nextColor], edx
            .setColor:
            mov     ebx, [bacColor]
            mov     edi, [nextColor]
            mov     edx, [edi]
            mov     [ebx], edx
            mov     edx, [edi + 4]
            mov     [ebx + 4], edx
            mov     edx, [edi + 8]
            mov     [ebx + 8], edx
            jmp     .exitFromLoop
        .animationButtonMv:
            ; move block
            mov     ebx, [ebx + 4]
            mov     edi, [ebx] ; coords
            mov     eax, [ebx + 4]
            stdcall Graphics.Draw.CoordsRectPrepears.ForAnimations
            jmp     .exitFromLoop
        .exitFromLoop:
            pop     ebx ecx
            add     ebx, 8
            loop    .main
    .exit:
        ret
endp