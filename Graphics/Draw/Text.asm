proc Graphics.Draw.Text.Write uses ebx ecx,\
     string, color
    .start:
        mov     ebx, [string]
        mov     ecx, [ebx]
        add     ebx, 4
        .writeLetter:
            push    ebx ecx
            mov     ecx, [ebx]
            add     ebx, 4
            .drawQUAD:
                stdcall Graphics.Draw.Shapes.Quadrilateral, ebx, [color]
                add     ebx, 32
                dec     ecx
                cmp     ecx, 0
                jnz     .drawQUAD
            pop     ecx ebx
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
            xor     eax, eax
            mov     al, [ebx]
            cmp     eax, 0
            je      .exit
            inc     [counterLen]
        .do:    
            dec     eax
            mul     dword [multiplier]
            push    ebx
            xchg    ebx, eax
            stdcall Graphics.Draw.ASCII.Letters.CreateGLChar, edi, [arr_of_letters + ebx], [x], [y]
            stdcall Graphics.Draw.ASCII.Letters.GetLetterLen, [arr_of_letters + ebx]
            add     eax, [fontGap]
            add     eax, 10
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