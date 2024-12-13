errorMessage    db  '{"error":"Invalid request payload"}', 0
proc Server.JSON.IsError,\
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
        inc     edx
        cmp     byte [ebx], 0
        jne     .next
        cmp     byte [edx], 0
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