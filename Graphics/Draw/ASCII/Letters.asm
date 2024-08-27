proc Graphisc.Draw.ASCII.Letters.Prepear
    ; RU
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_1
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_2
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_3
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_4
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_5
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_6
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_7
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_8
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_9
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_10
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_11
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_12
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_13
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_14
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_15
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_16
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_17
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_18
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_19
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_20
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_21
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_22
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_23
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_24
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_25
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_26
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_27
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_28
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_29
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_30
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_31
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_32
    stdcall Graphics.Draw.ASCII.Letters.LetterPrepear, Ltr_RU_33
    ; ...
    ; en
    ; ...
    ret
endp

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