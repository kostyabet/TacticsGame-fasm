proc Audio.Button uses eax ebx ecx edx,\
    type
    cmp     [IS_VOICE_ON], GL_FALSE
    je      .exit
        switch  [type]
        case    .click,   btClick
        case    .tickBtn, btTick
        jmp     .exit

        .click:
            invoke  CreateThread, 0, 0, Audio.Button.Play.Click, 0, 0, 0
            jmp     .exit
        .tickBtn:
            invoke  CreateThread, 0, 0, Audio.Button.Play.Tick, 0, 0, 0
            jmp     .exit
    .exit:
        ret
endp

proc Audio.Button.Play.Click
    invoke WaitForSingleObject, hMutex, INFINITE
    invoke mciSendStringA, clickButtonSoundCommand, 0, 0, 0
    invoke mciSendStringA, clickButtonSoundPlay, 0, 0, 0
    .waitLoop:
        invoke  mciSendStringA, setClickVolume, 0, 0, 0
        invoke  mciSendStringA, clickButtonSoundStatus, statusBuffer, statusBufferLen, 0
        stdcall Status.IsStopped, statusBuffer, stoppedStr
        cmp     eax, 1
        jne     .waitLoop
    invoke  mciSendStringA, clickButtonSoundClose, 0, 0, 0
    invoke  ReleaseMutex, hMutex
    ret
endp

proc Audio.Button.Play.Tick
    invoke WaitForSingleObject, hMutex, INFINITE
    invoke mciSendStringA, tickButtonSoundCommand, 0, 0, 0
    invoke mciSendStringA, tickButtonSoundPlay, 0, 0, 0
    .waitLoop:
        invoke  mciSendStringA, setTickVolume, 0, 0, 0
        invoke  mciSendStringA, tickButtonSoundStatus, statusBuffer, statusBufferLen, 0
        stdcall Status.IsStopped, statusBuffer, stoppedStr
        cmp     eax, 1
        jne     .waitLoop
    invoke mciSendStringA, tickButtonSoundClose, 0, 0, 0
    invoke  ReleaseMutex, hMutex
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