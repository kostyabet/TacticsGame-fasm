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

errorNullMessage    db  'null', 0
proc Server.JSON.IsNULL uses ebx edi,\
    jsonLink
    locals
        result dd 0
    endl
    mov     ebx, [jsonLink]
    mov     edi, errorNullMessage
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
errorLoginMessageError db '{"error":"Login must be at least 3 characters long"}', 0
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

errorPasswordMessage db '{"error":"Password must be at least 8 characters long"}', 0
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
preIdMesSize   dd   $ - preIdMessage - 1
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

preScoresData   db  '{"total_scores":', 0
preScrDataLen   dd  $ - preScoresData - 1
proc Server.JSON.GetScoresCount,\
    jsonLink
    locals
        startPtr    dd  ?
    endl
    mov     ebx, [jsonLink]
    add     ebx, [preScrDataLen]
    mov     [startPtr], ebx
    .loop:
        inc     ebx
        mov     al, byte [ebx]
        cmp     al, '}'
        jne     .loop
    mov     byte [ebx], 0
    stdcall File.IniFile.StrToInt, [startPtr]
    ret
endp

pointsString db ',"points":', 0
pointsStringLen dd $ - pointsString - 1
scoreIdString db '{"score_id":', 0
scoreIdStringLen dd $ - scoreIdString - 1
proc Server.JSON.ParseUserScore uses eax ebx edi,\
    jsonLink, object
    locals
        scoresCount  dd  0
    endl
    mov     ebx, [jsonLink] ; [{"score_id":4,"points":136},{"score_id":3,"points":11656},{"score_id":2,"points":136},{"score_id":1,"points":136}]
    mov     edi, [object]   ; place | login | points
    .currentObject:
        inc     ebx     ; [ - skip
        add     ebx, [scoreIdStringLen]
        .skeepNum:
            inc     ebx
            cmp     byte [ebx], ','
            jne     .skeepNum
        add     ebx, [pointsStringLen]
        push    ebx ; push current number
        .findEnd:
            inc     ebx
            cmp     byte [ebx], '}'
            jne     .findEnd
        mov     byte [ebx], 0
        pop     eax ; pop number
        push    ebx ; push end
        xchg    ebx, eax
            push    edi

            inc     [scoresCount]
            mov     eax, [scoresCount]
            mov     [edi], eax
            
            add     edi, 4
            stdcall File.IniFile.StrCpy, edi, Login

            add     edi, JSON_STRING_LENGTH
            stdcall File.IniFile.StrToInt, ebx
            mov     [edi], eax

            pop     edi
        pop     ebx
        inc     ebx
        add     edi, sizeof.Score
        cmp     byte [ebx], ']' ; ]- check end
        jne     .currentObject
    mov     eax, [scoresCount] ; length of object
    ret
endp

proc Server.JSON.ParseBestScore,\
    jsonLink, object
    locals
        scoresCount  dd  0
    endl
    mov     ebx, [jsonLink] ; [{"score_id":3,"points":11656,"pl_login":"QWERTY"}]
    mov     edi, [object]   ; place | login | points

    mov     eax, [scoresCount] ; length of object
    ret
endp