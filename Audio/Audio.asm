proc Audio.Start
    stdcall Audio.GenerateVolume, setVolumeList
    stdcall Audio.FoneMusic
    ret
endp

proc Audio.GenerateVolume uses eax ebx,\
    volList
    locals
        busVolum    dd  ?
        commandStr  dd  ?
    endl
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