proc JSON.SendStrign.Clear uses ebx ecx,\
    string, length
    mov     ebx, [string]
    mov     ecx, [length]
    .clearLoop:
        mov     byte [ebx], ' '
        inc     ebx
        loop    .clearLoop
    ret
endp

proc JSON.SendStrign.InputString,\
    string, length, data
    mov     edi, [string]
    mov     ebx, [data]
    mov     ecx, [length]
    .copyLoop:
        mov     al, byte [ebx]
        mov     byte [edi], al
        inc     ebx
        inc     edi
        cmp     byte [ebx], 0
        je      .exit
        loop    .copyLoop
    .exit:
    mov     byte [edi], '"'
    ret
endp

proc JSON.SendStrign.InputInteger uses eax ebx ecx,\
    string, length, data
    mov     edi, [string]
    mov     ecx, [length]
    stdcall File.IniFile.IntToStr, [data]
    xchg    ebx, eax
    .copyLoop:
        mov     al, byte [ebx]
        mov     byte [edi], al
        inc     ebx
        inc     edi
        cmp     byte [ebx], 0
        je      .exit
        loop    .copyLoop
    .exit:
    ret
endp