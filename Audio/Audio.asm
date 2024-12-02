proc Audio.Start
    stdcall Audio.GenerateVolume, setVolumeList
    stdcall Audio.FoneMusic
    ret
endp

proc Audio.ClearStringsForVolume,\
    volList 
    locals
        space   dd    ?
    endl
    mov     ebx, [volList]
    xor     eax, eax
    .convert:
        cmp     dword [ebx], 0
        je      .exit
        push    ebx
        mov     ebx, [ebx]
        push    ebx
        xor     eax, eax
        mov     [space], -1
        .curStr:
            cmp     byte [ebx], 0
            je      .exitStr
            cmp     byte [ebx], ' '
            jne     @F
            mov     [space], eax
            @@:
            inc     eax
            inc     ebx
            jmp     .curStr
        .exitStr:
            cmp     [space], -1
            je      .exitCurStr
            pop     ebx
            add     ebx, [space]
            inc     ebx
            mov     dword [ebx], 0
        .exitCurStr:
        pop     ebx
        add     ebx, 4
        jmp     .convert
    .exit:
    ret
endp

proc Audio.GenerateVolume uses eax ebx,\
    volList
    locals
        busVolum    dd  ?
        commandStr  dd  ?
    endl
    stdcall Audio.ClearStringsForVolume, [volList]
    ; busConvert
    mov     eax, [VOLUME]
    mov     ebx, 10
    imul    bx
    stdcall File.IniFile.IntToStr, eax
    mov     [busVolum], eax
    ; convert
    mov     ebx, [volList]
    .convert:
        cmp     dword [ebx], 0
        je      .exit
        stdcall Volume.GenerateVolume, [ebx], [busVolum]
        add     ebx, 4
        jmp     .convert
    .exit:
        ret
endp

proc Volume.GenerateVolume,\
    command, volume
    stdcall Volume.CopyInEnd, [command], [volume]
    ret
endp

proc Volume.CopyInEnd uses ebx edi,\
    their, who
    mov     ebx, [their]
    mov     edi, [who]
    cmp     byte [ebx], 0
    je      .copy
    .waitZero:
        inc     ebx
        cmp     byte [ebx], 0
        jne     .waitZero
    .copy:
        mov     eax, [edi]
        mov     [ebx], eax
    ret
endp