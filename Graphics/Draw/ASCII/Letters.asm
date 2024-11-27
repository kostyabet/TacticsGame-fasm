proc Graphics.Draw.ASCII.Letters.LetterPrepear uses eax ebx,\
     letter
    locals
        multipier   dd  4
    endl
    .start: 
        mov     ebx, [letter]
        mov     eax, [ebx]
        mul     dword [multipier]
        xchg    ecx, eax
        cmp     ecx, 0
        je      .exit
        add     ebx, 4
    .convertPoint:
        ; x
        mov     eax, [ebx]
        stdcall GetXGLfloatCoord, eax
        mov     [ebx], eax
        ; y
        mov     eax, [ebx + 4]
        stdcall GetYGLfloatCoord, eax
        mov     [ebx + 4], eax
        ; end
        add     ebx, 8
        loop    .convertPoint
    .exit:
        ret
endp

proc Graphics.Draw.ASCII.Letters.CreateGLChar uses eax ecx ebx edi,\
     result, letter, x, y, fs_multiplier
    locals
        itrtn_multiplier  dd  4
    endl
    .start:
        ; QUAD count copy
        mov     ebx, [letter]
        mov     eax, [ebx]
        mov     ebx, [result]
        mov     [ebx], eax
        
        add     ebx, 4
        mov     edi, [letter]
        add     edi, 8

        cmp     eax, -1
        je      .exit 

        mul     dword [itrtn_multiplier]
        xchg    ecx, eax
        .copy:
            ; x1
            stdcall Scripts.Getters.GetIMULNumber, [edi], [fs_multiplier]
            add     eax, [edi]
            add     eax, [x]
            mov     [ebx], eax
            ; y1
            stdcall Scripts.Getters.GetIMULNumber, [edi + 4], [fs_multiplier]
            add     eax, [edi + 4]
            add     eax, [y]
            mov     [ebx + 4], eax

            add     ebx, 8
            add     edi, 8
            loop    .copy                 
        stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, [result]
    .exit:
        ret
endp

proc Graphics.Draw.ASCII.Letters.GetLetterLen,\
     letter, multiplier
    mov     ebx, [letter]
    cmp     dword [ebx + 4], -1
    je      @F
        stdcall Scripts.Getters.GetIMULNumber, [ebx + 4], [multiplier]
        mov     ebx, 1
        jmp     .exit
    @@:
        stdcall Scripts.Getters.GetIMULNumber, [ebx + 8], [multiplier]
        mov     ebx, -1
    .exit:
        ret
endp