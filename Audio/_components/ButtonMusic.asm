proc Audio.Button,\
    type
    cmp     [IS_VOICE_ON], GL_FALSE
    je      .exit
        switch  [type]
        case    .hover, btHover
        case    .click, btClick
        case    .exitBtn, btExit
        jmp     .exit

        .hover:
           invoke  CreateThread, 0, 0, Audio.Button.Play.Hover, 0, 0, 0
           jmp     .exit
        .click:
            invoke  CreateThread, 0, 0, Audio.Button.Play.Click, 0, 0, 0
            jmp     .exit
        .exitBtn:
            invoke  CreateThread, 0, 0, Audio.Button.Play.Exit, 0, 0, 0
            jmp     .exit
    .exit:
        ret
endp

proc Audio.Button.Play.Hover
    invoke mciSendStringA, hoverButtonSoundCommand, 0, 0, 0
    invoke mciSendStringA, hoverButtonSoundPlay, 0, 0, 0
    .wait:
        invoke  mciSendStringA, hoverButtonSoundStatus, statusBuffer, statusBufferLen, 0
        stdcall Status.IsStopped, statusBuffer, stoppedStr
        cmp     eax, 1
        jne     .wait
    invoke mciSendStringA, hoverButtonSoundClose, 0, 0, 0
    ret
endp

proc Audio.Button.Play.Click
    invoke mciSendStringA, clickButtonSoundCommand, 0, 0, 0
    invoke mciSendStringA, clickButtonSoundPlay, 0, 0, 0
    .wait:
        invoke  mciSendStringA, clickButtonSoundStatus, statusBuffer, statusBufferLen, 0
        stdcall Status.IsStopped, statusBuffer, stoppedStr
        cmp     eax, 1
        jne     .wait
    invoke mciSendStringA, clickButtonSoundClose, 0, 0, 0
    ret
endp

proc Audio.Button.Play.Exit
    invoke mciSendStringA, exitButtonSoundCommand, 0, 0, 0
    invoke mciSendStringA, exitButtonSoundPlay, 0, 0, 0
    .wait:
        invoke  mciSendStringA, exitButtonSoundStatus, statusBuffer, statusBufferLen, 0
        stdcall Status.IsStopped, statusBuffer, stoppedStr
        cmp     eax, 1
        jne     .wait
    invoke mciSendStringA, exitButtonSoundClose, 0, 0, 0
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