proc Graphics.Draw.Text.Write uses ebx ecx,\
     string, color
    locals

    endl
    .start:
        mov     ebx, [string]
        mov     ecx, [ebx]
        add     ebx, 4
        .writeLetter:
            push    ebx

            mov     ecx, [ebx]
            .drawQUAD:
                stdcall Graphics.Draw.Shapes.Quadrilateral, ebx, [color]
                add     ebx, 36
                dec     ecx
                cmp     ecx, 0
                jnz     .drawQUAD

            pop     ebx
            add     ebx,  228 ; skip char
            loop    .writeLetter
    .exit:
        ret
endp

proc Graphics.Draw.Text.Prepear uses eax ebx edi,\
     result, string, fontSize, fontGap, position
    locals
        x           dd      ?
        y           dd      ?  
        multiplier  dd      4
        counterLen  dd      0      
    endl
    .start:
        mov     ebx, [position]
        ; x
        mov     eax, [ebx]
        mov     [x], eax
        ; y
        mov     eax, [ebx + 4]
        mov     [y], eax
    .main:
        mov     ebx, [string]
        mov     edi, [result]
        add     edi, 4
        .while:
            mov     eax, [ebx]
            cmp     eax, 0
            jne     .exit
            inc     [counterLen]
        .do:    
            sub     eax, 'А'
            mul     dword [multiplier]
            push    ebx
            xchg    ebx, eax
            stdcall Graphics.Draw.ASCII.Letters.CreateGLChar, edi, [arr_of_letters + ebx], [x], [y]
            stdcall Graphics.Draw.ASCII.Letters.GetLetterLen, [arr_of_letters + ebx]
            lea     eax, [eax + fontGap + 10]
            add     [x], eax
            pop     ebx
            inc     ebx
            add     edi, 228 ; skip char
            jmp     .while
    .exit:
        mov     ebx, [result]
        mov     eax, [counterLen]
        mov     [ebx], eax
        ret
endp