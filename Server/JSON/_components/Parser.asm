errorMessage    db  '{"error":"Invalid request payload"}', 0
proc Server.JSON.IsError uses ebx edi,\
    jsonLink
    locals
        result dd 0
    endl
    mov     ebx, [jsonLink]
    mov     edi, errorMessage
    .loop:
        mov     al, byte [ebx]
        cmp     byte [edi], al
        jne     .exit
        inc     ebx
        inc     edi
        cmp     byte [ebx], 0
        jne     .next
        cmp     byte [edi], 0
        jne     .next
            mov     [result], 1
        .next:
        jmp     .loop
    .exit:
        mov     eax, [result]
    ret
endp

errorLoginMessageExist db '{"error":"Login already exists"}'
proc Server.JSON.IsLoginErrorExist uses ebx edi,\
    jsonLink
    locals
        result dd 0
    endl
    stdcall File.IniFile.StrLen, [jsonLink]
    mov     ebx, eax
    stdcall File.IniFile.StrLen, errorLoginMessageExist
    cmp     eax, ebx
    jne     .exit
    
    mov     ebx, [jsonLink]
    mov     edi, errorLoginMessageExist
    .loop:
        mov     al, byte [ebx]
        cmp     byte [edi], al
        jne     .exit
        inc     ebx
        inc     edi
        cmp     byte [ebx], 0
        jne     .next
        cmp     byte [edi], 0
        jne     .next
            mov     [result], 1
        .next:
        jmp     .loop
    .exit:
        mov     eax, [result]
    ret
endp
errorLoginMessageError db '{"error":"Login must be at most 3 characters long"}', 0
proc Server.JSON.IsLoginErrorError uses ebx edi,\
    jsonLink
    locals
        result dd 0
    endl
    stdcall File.IniFile.StrLen, [jsonLink]
    mov     ebx, eax
    stdcall File.IniFile.StrLen, errorLoginMessageError
    cmp     eax, ebx
    jne     .exit
    
    mov     ebx, [jsonLink]
    mov     edi, errorLoginMessageError
    .loop:
        mov     al, byte [ebx]
        cmp     byte [edi], al
        jne     .exit
        inc     ebx
        inc     edi
        cmp     byte [ebx], 0
        jne     .next
        cmp     byte [edi], 0
        jne     .next
            mov     [result], 1
        .next:
        jmp     .loop
    .exit:
        mov     eax, [result]
    ret
endp

errorPasswordMessage db '{"error":"Password must be at most 8 characters long"}', 0
proc Server.JSON.IsPasswordError uses ebx edi,\
    jsonLink
    locals
        result dd 0
    endl
    stdcall File.IniFile.StrLen, [jsonLink]
    mov     ebx, eax
    stdcall File.IniFile.StrLen, errorPasswordMessage
    cmp     eax, ebx
    jne     .exit

    mov     ebx, [jsonLink]
    mov     edi, errorPasswordMessage
    .loop:
        mov     al, byte [ebx]
        cmp     byte [edi], al
        jne     .exit
        inc     ebx
        inc     edi
        cmp     byte [ebx], 0
        jne     .next
        cmp     byte [edi], 0
        jne     .next
            mov     [result], 1
        .next:
        jmp     .loop
    .exit:
        mov     eax, [result]
    ret
endp

preIdMessage   db  '{"id":', 0
preIdMesSize   dd   $ - preIdMessage - 2
proc Server.JSON.GetId,\
    jsonLink
    locals
        startPtr    dd  ?
    endl
    mov     ebx, [jsonLink]
    add     ebx, [preIdMesSize]
    mov     [startPtr], ebx
    .loop:
        inc     ebx
        mov     al, byte [ebx]
        cmp     al, '}'
        jne     .loop
    mov     byte [ebx], 0
    mov     ebx, [startPtr]
    cmp     byte [ebx], '-'
    je      @F
        stdcall File.IniFile.StrToInt, [startPtr]
        jmp     .exit
    @@:
        mov     eax, -1
        jmp     .exit
    .exit:
    ret
endp

proc Server.JSON.GetScores
    jsonLink
    
    ret
endp

proc Server.JSON.GetBestScores
    jsonLink
    
    ret
endp