proc Audio.Button.Play
    cmp     [IS_MUSIC_ON], GL_TRUE
    je      .waitLoop
    .playSound:
        stdcall Audio.Button
        cmp     [IS_MUSIC_ON], GL_TRUE
        je      .waitLoop
        jmp     .playSound
    .waitLoop:
        cmp     [IS_MUSIC_ON], GL_TRUE
        je      .waitLoop
        jmp     .playSound
    ret
endp

proc Audio.Button uses eax ebx ecx edx
    cmp     [IS_VOICE_ON], GL_FALSE
    je      .exit
        switch  [btType]
        case    .click,   btClick
        case    .tickBtn, btTick
        jmp     .exit

        .click:
            stdcall Audio.Button.Play.Click
            jmp     .exit
        .tickBtn:
            stdcall Audio.Button.Play.Tick
            jmp     .exit
    .exit:
        ret
endp

proc Audio.Button.Play.Click
    invoke  mciSendStringA, clickButtonSoundCommand, 0, 0, 0
    invoke  mciSendStringA, setClickVolume, 0, 0, 0
    invoke  mciSendStringA, clickButtonSoundPlay, 0, 0, 0
    .waitLoop:
        mov     [btType], btFree
        invoke  mciSendStringA, clickButtonSoundStatus, statusBuffer, statusBufferLen, 0
        stdcall Status.IsStopped, statusBuffer, stoppedStr
        cmp     eax, 1
        jne     .waitLoop
    invoke  mciSendStringA, clickButtonSoundClose, 0, 0, 0
    ret
endp

proc Audio.Button.Play.Tick
    invoke  mciSendStringA, tickButtonSoundCommand, 0, 0, 0
    invoke  mciSendStringA, setTickVolume, 0, 0, 0
    invoke  mciSendStringA, tickButtonSoundPlay, 0, 0, 0
    mov     [btType], btFree
    .waitLoop:
        invoke  mciSendStringA, tickButtonSoundStatus, statusBuffer, statusBufferLen, 0
        stdcall Status.IsStopped, statusBuffer, stoppedStr
        cmp     eax, 1
        jne     .waitLoop
    invoke mciSendStringA, tickButtonSoundClose, 0, 0, 0
    ret
endp

proc Status.IsStopped uses ebx edi,\
    buffer, stopped
    locals
        result  dd   0
    endl
    mov     ebx, [buffer]
    mov     edi, [stopped]
    xor     eax, eax
    .cycle:
        mov     al, byte [ebx]
        cmp     al, byte [edi]
        jne     .exit
        inc     edi
        inc     ebx
        cmp     byte [edi], 0
        jne     .cycle
    mov     [result], 1
    .exit:
    mov     eax, [result]
    ret
endp