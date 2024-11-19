;   0000_0000_0000_0001
proc Keyboard.OnKeyDown
    stdcall Keyboard.IsHotKeyClick
    cmp     eax, GL_TRUE
    jne     .exit
        switch  ebx
        case    .hkPlay,     [HK_PLAY]
        case    .hkStop,     [HK_STOP]
        case    .hkAbout,    [HK_ABOUT]
        case    .hkExit,     [HK_EXIT]
        case    .hkSettings, [HK_SETTINGS]
        case    .hkRestart,  [HK_RESTART]
        jmp     .exit

        .hkPlay:
            stdcall Keyboard.OnHotkeyClick.PauseStop
            jmp     .exit
        .hkStop:
            stdcall Keyboard.OnHotkeyClick.PauseStop
            jmp     .exit
        .hkAbout:
            stdcall Keyboard.OnHotkeyClick.About
            jmp     .exit
        .hkExit:
            stdcall Keyboard.OnHotkeyClick.Exit
            jmp     .exit
        .hkSettings:
            stdcall Keyboard.OnHotkeyClick.Settings
            jmp     .exit
        .hkRestart:
            stdcall Keyboard.OnHotkeyClick.Restart
            jmp     .exit

    .exit:
    ret
endp

proc Keyboard.IsHotKeyClick uses ecx edx
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
            jmp     .true
        @@:
        add     ebx, 4
        loop    .mainLoop
    jmp     .false
    .true:
        mov     ebx, [ebx]
        mov     ebx, [ebx]
    .false:
    mov     eax, [result]
    ret
endp