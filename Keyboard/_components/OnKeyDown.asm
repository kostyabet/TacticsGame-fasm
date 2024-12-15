;   0000_0000_0000_0001
proc Keyboard.OnKeyDown,\
    wparam
    cmp     [IS_HOTKEY_ON], GL_TRUE
    jne     .autentic
    cmp     [IsLogin], GL_TRUE
    je      .autentic
    cmp     [IsPassword], GL_TRUE
    je      .autentic
    ; hot keys
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
    ; autentic
    .autentic:
    mov     eax, VK_BACK
    cmp     [wparam], eax
    jne     .input
        cmp     [IsLogin], GL_TRUE
        jne     @F
            stdcall Server.Methods.Player.DeleteSymbol, Login
            stdcall ConvertStringToOutputString, Login, outputStrBufLog
            stdcall Server.AutorizationString
            jmp     .exit
        @@:
            stdcall Server.Methods.Player.DeleteSymbol, Password
            stdcall Server.Methods.Player.StartPassword
            jmp     .exit
    .input:
    stdcall Keyboard.GetCurrentKey, [wparam]
    cmp     eax, -1
    je      .exit
        cmp     [IsLogin], GL_TRUE
        jne     @F
            stdcall Server.Methods.Player.AddSymbolIn, Login, eax
            stdcall ConvertStringToOutputString, Login, outputStrBufLog
            stdcall Server.AutorizationString
            jmp     .exit
        @@:
            stdcall Server.Methods.Player.AddSymbolIn, Password, eax
            stdcall Server.Methods.Player.StartPassword
            jmp     .exit
    .exit:
    ret
endp

proc Keyboard.GetCurrentKey,\
    wparam
    locals
        result  dd  -1
    endl
    mov     ecx, [lettersModelLength]
    mov     ebx, lettersModel
    .mainLoop:
        mov     eax, [ebx]
        cmp     [wparam], eax
        jne      @F
            mov     eax, [ebx]
            mov     [result], eax
            jmp     .exit
        @@:
        add     ebx, 4
        loop    .mainLoop
    .exit:
    mov     eax, [result]
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
        add     ebx, MATRIX_EL_SIZE ; 4
        loop    .mainLoop
    jmp     .false
    .true:
        mov     ebx, [ebx]
        mov     ebx, [ebx]
    .false:
    mov     eax, [result]
    ret
endp