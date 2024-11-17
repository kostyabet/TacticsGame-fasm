proc Audio.Switch.Music
    stdcall Audio.SwapSwitchStatus, IS_MUSIC_ON
    ret
endp

proc Audio.Switch.Voice
    stdcall Audio.SwapSwitchStatus, IS_VOICE_ON
    ret
endp

proc Audio.Switch.Hotkey
    stdcall Audio.SwapSwitchStatus, IS_HOTKEY_ON
    ret
endp

proc Audio.SwapSwitchStatus uses eax ebx,\
    status
    mov     ebx, [status]
    mov     eax, [ebx]
    cmp     eax, GL_FALSE
    je      .FALSE
    .TRUE:
        mov     eax, GL_FALSE
        mov     dword [ebx], eax
        jmp     @F
    .FALSE:
        mov     eax, GL_TRUE
        mov     dword [ebx], eax
    @@:
    ret
endp