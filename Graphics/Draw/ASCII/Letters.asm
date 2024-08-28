proc Graphics.Draw.ASCII.Letters.LetterPrepear uses ebx,\
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
        add     ebx, 8
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
     result, letter, x, y
    locals
        multiplier  dd  4
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

        mul     dword [multiplier]
        xchg    ecx, eax
        .copy:
            ; x1
            mov     eax, [ebx]
            add     eax, [x]
            mov     [edi], eax
            ; y1
            mov     eax, [ebx + 4]
            add     eax, [y]
            mov     [edi + 4], eax\

            add     ebx, 8
            add     edi, 8
            loop    .copy                 
    .exit:
        stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, [letter]
        ret
endp 

proc Graphics.Draw.ASCII.Letters.GetLetterLen uses ebx,\
     letter
    mov     ebx, [letter]
    mov     eax, [ebx + 4]
    ret
endp