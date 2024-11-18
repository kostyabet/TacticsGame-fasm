include 'IniFile.inc'

proc File.IniFile.Write
    invoke CreateFile, iniFilePath, GENERIC_WRITE, 0, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
    mov [hIniFile], eax
    cmp eax, INVALID_HANDLE_VALUE
    jne @F
        stdcall File.IniFile.Error
        jmp     .exit
    @@:

    ; Запись настроек в файл
    stdcall File.IniFile.IntToStr, [IS_MUSIC_ON]
    stdcall File.IniFile.WriteRule, IS_MUSIC_ON_PROMPT, eax
    stdcall File.IniFile.IntToStr, [IS_VOICE_ON]
    stdcall File.IniFile.WriteRule, IS_VOICE_ON_PROMPT, eax
    stdcall File.IniFile.IntToStr, [IS_HOTKEY_ON]
    stdcall File.IniFile.WriteRule, IS_HOTKEY_ON_PROMPT, eax
    stdcall File.IniFile.IntToStr, [VOLUME]
    stdcall File.IniFile.WriteRule, VOLUME_PROMPT, eax
    stdcall File.IniFile.WriteRule, HK_PLAY_PROMPT, HK_PLAY
    stdcall File.IniFile.WriteRule, HK_STOP_PROMPT, HK_STOP
    stdcall File.IniFile.WriteRule, HK_ABOUT_PROMPT, HK_ABOUT
    stdcall File.IniFile.WriteRule, HK_EXIT_PROMPT, HK_EXIT
    stdcall File.IniFile.WriteRule, HK_SETTINGS_PROMPT, HK_SETTINGS
    stdcall File.IniFile.WriteRule, HK_RESTART_PROMPT, HK_RESTART

    .exit:
    invoke  CloseHandle, [hIniFile]
    ret
endp

proc File.IniFile.IntToStr uses  ecx edx ebx esi,\
    value
    locals
        divizer     db  10
        length      dd  0
    endl
    xor     ecx, ecx
    xor     edx, edx
    mov     eax, [value]
    mov     ebx, 10
    .readInStack:
        idiv    bx
        push    edx
        inc     ecx
        cmp     eax, 0
        jne     .readInStack
    mov     ebx, strBuffer
    xor     esi, esi
    .buildString:
        pop     eax
        add     eax, '0'
        mov     byte [ebx + esi], al
        inc     esi
        loop    .buildString
    mov     byte [ebx + esi], 0
    mov     eax, strBuffer
    ret
endp

proc File.IniFile.WriteRule,\
    prompt, status
    stdcall File.IniFile.WriteLine, [prompt]
    stdcall File.IniFile.WriteLine, [status]
    stdcall File.IniFile.WriteLine, NEXT_LINE
    ret
endp

proc File.IniFile.WriteLine,\
    message
    locals
        bitesCounter    dd      ?
        messageLen      dd      ?
    endl
    stdcall File.IniFile.StrLen, [message]
    mov     [messageLen], eax
    lea     eax, [bitesCounter]
    invoke  WriteFile, [hIniFile], [message], [messageLen], eax, 0
    ret
endp   

proc File.IniFile.StrLen uses ebx edi,\
    string
    mov     ebx, [string]
    xor     edi, edi

    .next_char:
    cmp     byte [ebx + edi], 0
    je      .exit
    inc     edi
    jmp     .next_char
    .exit:
    mov     eax, edi
    ret
endp

proc File.IniFile.Error
    ; error handler
    ret
endp