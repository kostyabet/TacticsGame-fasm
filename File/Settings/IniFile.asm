include 'IniFile.inc'

proc File.IniFile.Write uses eax ebx ecx edx
    invoke  CreateFile, iniFilePath, GENERIC_WRITE, 0, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
    mov     [hIniFile], eax
    cmp     eax, INVALID_HANDLE_VALUE
    jne     @F
        stdcall File.IniFile.Error
        jmp     .exit
    @@:

    ; write settings in file
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

proc File.IniFile.Read uses eax ebx ecx edx edi
    invoke  CreateFile, iniFilePath, GENERIC_READ, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0
    mov     [hIniFile], eax
    cmp     eax, INVALID_HANDLE_VALUE
    jne     @F
        stdcall File.IniFile.Error
        jmp     .exit
    @@:
        ; length
        invoke  HeapAlloc, [hHeap], 8, [bufferLength]
        mov     [readBuffer], eax
        invoke  ReadFile, [hIniFile], [readBuffer], [bufferLength], bytesRead, 0
; ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ;
; !!!!!!!!!!!!!!!!!!!!!!!!!!! DO NOT TOUCH EDI !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
        mov     edi, [readBuffer]
        stdcall File.IniFIle.ReadString, IS_MUSIC_ON, 1
        stdcall File.IniFIle.ReadString, IS_VOICE_ON, 1
        stdcall File.IniFIle.ReadString, IS_HOTKEY_ON, 1
        stdcall File.IniFIle.ReadString, VOLUME, 1
        stdcall File.IniFIle.ReadString, HK_PLAY, 0
        stdcall File.IniFIle.ReadString, HK_STOP, 0
        stdcall File.IniFIle.ReadString, HK_ABOUT, 0
        stdcall File.IniFIle.ReadString, HK_EXIT, 0
        stdcall File.IniFIle.ReadString, HK_SETTINGS, 0
        stdcall File.IniFIle.ReadString, HK_RESTART, 0
; !!!!!!!!!!!!!!!!!!!!! ALARM DIACTIVATE! GOOD LUCK :) !!!!!!!!!!!!!!!!!!!!!!!! ;
        invoke HeapFree, [hHeap], 0, [readBuffer]
    .exit:
        invoke  CloseHandle, [hIniFile]
        ret
endp

proc File.IniFIle.ReadString uses eax ebx,\
    resAdress, isInt
    stdcall File.IniFile.ReadRule, edi
    add     edi, ebx
    add     edi, 2 ; 13 10
    cmp     [isInt], 1
    jne     .string
    .int:
        stdcall File.IniFile.StrToInt, eax
        mov     ebx, [resAdress]
        mov     [ebx], eax
        jmp     .exit
    .string:
        stdcall File.IniFile.Copy, eax, [resAdress]
    .exit:
    ret
endp

proc File.IniFile.Copy uses edi ebx eax,\
    from, to
    mov     ebx, [from]
    mov     edi, [to]
    xor     eax, eax
    .mainLoop:
         mov     al, [ebx]
         mov     [edi], al
         inc     ebx
         inc     edi
         cmp     byte [ebx], 0
         jne     .mainLoop
    mov     byte [edi], 0
    ret
endp

proc File.IniFile.ReadRule uses edi,\
    buffer
    mov     ebx, [buffer]
    .roolLoop: 
        inc     ebx
        cmp     byte [ebx], '='
        je      .endString
        jmp     .roolLoop
    .endString:
        inc     ebx
        mov     edi, strBuffer
        .next:
            mov     al, [ebx]
            mov     [edi], al
            inc     ebx
            inc     edi
            cmp     byte [ebx], 13
            jne     .next
    mov     byte [edi], 0
    .exit:
    sub     ebx, [buffer]
    mov     eax, strBuffer
    ret
endp

proc File.IniFile.StrToInt uses ebx edx ecx,\
    string
    locals
        result    dd  0
        discharge dd  1 
    endl
    mov     ebx, [string]
    xor     ecx, ecx
    .counter:
        inc     ecx
        inc     ebx
        cmp     byte [ebx], 0
        jne     .counter
    mov     ebx, [string]
    xor     eax, eax
    mov     edx, 10
    .convert:
        mov     al, [ebx]
        sub     eax, '0'
        ; * 10
        push    ecx
        dec     ecx
        cmp     ecx, 0
        je      @F
        .mult:
            imul    edx
            loop    .mult
        @@:
        pop     ecx
        ; end
        add     [result], eax
        inc     ebx
        loop    .convert
    mov     eax, [result]
    ret
endp

proc File.IniFile.IntToStr uses ecx edx ebx esi,\
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

proc File.IniFile.ArrIntToStr uses eax ebx edx ecx,\
     prompt, arr, size
    stdcall File.IniFile.WriteLine, [prompt]
    mov     ecx, [size]
    mov     ebx, [arr]
    .convertLoop:
        push    ecx
        mov     edx, [ebx]
        stdcall File.IniFile.IntToStr, edx
        stdcall File.IniFile.WriteLine, strBuffer
        pop     ecx
        add     ebx, 4
        loop    .convertLoop
    mov     eax, arrayBuffer
    stdcall File.IniFile.WriteLine, NEXT_LINE
    ret
endp

proc File.IniFile.StrToArrInt uses eax ebx ecx,\
    arr, size
    stdcall File.IniFile.ReadRule, edi
    push    edi
    
    mov     edi, strBuffer
    mov     ecx, [size]
    mov     ebx, [arr]
    .convertLoop:
        xor     eax, eax
        mov     al, byte [edi]
        sub     eax, '0'
        mov     [ebx], eax
        add     ebx, 4
        inc     edi
        loop    .convertLoop
    mov     eax, arrayBuffer
    
    pop     edi
    ret
endp

proc File.IniFile.WriteRule,\
    prompt, status
    stdcall File.IniFile.WriteLine, [prompt]
    stdcall File.IniFile.WriteLine, [status]
    stdcall File.IniFile.WriteLine, NEXT_LINE   
    ret
endp

proc File.IniFile.WriteLine uses eax,\
    message
    locals
        messageLen      dd      ?
    endl
    stdcall File.IniFile.StrLen, [message]
    mov     [messageLen], eax
    invoke  WriteFile, [hIniFile], [message], [messageLen], 0, 0
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