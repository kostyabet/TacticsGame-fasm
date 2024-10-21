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
    .main:
            add     ebx, 4
            mov     eax, [ebx]
            cmp     eax, Anim_static
            je      .animationStatic
            cmp     eax, Anim_btn
            je      .animationButton
            jmp     .exit
        .animationStatic:
            mov     ebx, [ebx + 4]
            stdcall ebx
            jmp     .exit
        .animationButton:
            mov     ebx, [ebx + 4]
            stdcall Game.OnMove.CheckIsInRect, [ebx], [ebx + 4], [ebx + 8], [ebx + 12]
            add     ebx, 16 
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
            jmp     .exit
    .exit:
        ret
endp