proc Graphics.Animation uses eax ebx ecx
    ;.prepear:
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
            ; button animation logic
            jmp     .exit
    .exit:
        ret
endp