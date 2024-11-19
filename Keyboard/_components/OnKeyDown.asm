;   0000_0000_0000_0001
proc Keyboard.OnKeyDown
    stdcall Keyboard.IsHotKeyClick
    cmp     eax, GL_TRUE
    jne     @F
        ; mov     dword [font_color], 0xFF
        ; hotkey
    @@:
    ret
endp

proc Keyboard.IsHotKeyClick uses ebx ecx edx
    locals
        result  dd  GL_FALSE
    endl
    mov     ecx, [HotKeysSize]
    mov     ebx, HotKeysList ;0x41
    xor     edx, edx
    .mainLoop:
        ; search code
        push    ebx
        mov     ebx, [ebx]
        mov     eax, [ebx]
        pop     ebx
        ; check code
        push    ecx edx ebx
        invoke  GetAsyncKeyState, eax
        pop     ebx edx ecx
        cmp     eax, 0
        je      @F
            mov     [result], GL_TRUE
            jmp     .exit
        @@:
        loop    .mainLoop
    .exit:
    mov     eax, [result]
    ret
endp