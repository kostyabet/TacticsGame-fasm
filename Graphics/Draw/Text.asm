include 'Shapes/Quadrilateral.asm'

proc Graphics.Draw.Text.Write uses ebx ecx,\
     string, color
    .start:
        mov     ebx, [string]
        mov     ecx, [ebx]
        cmp     ecx, 0
        je      .exit
        add     ebx, 4
        .writeLetter:
            push    ebx ecx
            mov     ecx, [ebx]
            cmp     ecx, -1
            je      @F
            add     ebx, 4
            .drawQUAD:
                stdcall Graphics.Draw.Shapes.Quadrilateral, ebx, [color]
                add     ebx, 32
                dec     ecx
                cmp     ecx, 0
                jnz     .drawQUAD
            @@:
                pop     ecx ebx
                add     ebx,  228 ; skip char
                loop    .writeLetter
    .exit:
        ret
endp

proc Graphics.Draw.Text.GetLength uses ebx edx,\
    string
    mov     ebx, [string]
    xor     eax, eax
    xor     edx, edx
    cmp     byte [ebx], 0
    je      .exit
    .mainLoop:
        mov     dl, byte [ebx]
        inc     ebx
        inc     eax
        cmp     dl, 0
        jne     .mainLoop
    dec     eax
    .exit:
    ret
endp

proc Graphics.Draw.Text.Prepear uses eax ebx edi,\
     result, string, fontSize, fontGap, position
    locals
        x               dd      ?
        y               dd      ?  
        multiplier      dd      4
        counterLen      dd      ?     
        fs_multiplier   dd      ?
        startX          dd      ?
        startY          dd      ?
    endl
    ; set font size
    mov     ebx, spl_50
    mov     eax, 28 ; [fontSize]
    mov     dword [ebx + 8], 28
    ; memory creat
    stdcall Graphics.Draw.Text.GetLength, [string]
    mov     [counterLen], eax
    mov     ebx, sizeof.Char ; sizeof Char
    imul    dword ebx ; Char * count
    add     eax, 4 ; main length
    mov     ebx, [result]
    malloc  eax
    mov     [ebx], eax
    cmp     [counterLen], 0
    je      .exit
    .start:
        ; multiplier
        stdcall Scripts.Getters.GetFSMultiplier, fs_default, [fontSize]
        mov     [fs_multiplier], eax

        mov     ebx, [position]
        ; x
        mov     eax, [ebx]
        mov     [x], eax
        mov     [startX], eax
        ; y
        mov     eax, [ebx + 4]
        mov     [y], eax
        mov     [startY], eax
    .main:
        mov     ebx, [string]
        mov     edi, [result]
        mov     edi, [edi]
        add     edi, 4
        .while:
            xor     eax, eax
            mov     al, byte [ebx]
            cmp     eax, 0
            je      .exit
        .do:    
            dec     eax
            mul     dword [multiplier]
            push    ebx
            xchg    ebx, eax
            stdcall Graphics.Draw.ASCII.Letters.CreateGLChar, edi, [arr_of_letters + ebx], [x], [y], [fs_multiplier]
            stdcall Graphics.Draw.ASCII.Letters.GetLetterLen, [arr_of_letters + ebx], [fs_multiplier]
            cmp     ebx, -1
            je      @F
                add     eax, [fontGap]
                add     eax, 10
                add     [x], eax
                jmp     .exitFromWhile
            @@:
                add     [y], eax
                mov     eax, [startX]
                mov     [x], eax
                jmp     .exitFromWhile
            .exitFromWhile:
            pop     ebx
            inc     ebx
            add     edi, 228 ; skip char
            jmp     .while
    .exit:
        mov     ebx, [result]
        mov     ebx, [ebx]
        mov     eax, [counterLen]
        mov     [ebx], eax
        ret
endp