proc Audio.Victory uses eax ebx ecx edx
    cmp     [IS_VOICE_ON], GL_FALSE
    je      .exit
        invoke  CreateThread, 0, 0, Audio.Victory.Play, 0, 0, 0
    .exit:
        ret
endp

proc Audio.Victory.Play
    mov     [IS_MUSIC_ON], GL_FALSE
    invoke  mciSendStringA, victoryButtonSoundCommand, 0, 0, 0
    invoke  mciSendStringA, victoryButtonSoundPlay, 0, 0, 0
    .waitLoop:
        invoke  mciSendStringA, victoryButtonSoundStatus, statusBuffer, statusBufferLen, 0
        stdcall Status.IsStopped, statusBuffer, stoppedStr
        cmp     eax, 1
        jne     .waitLoop
    invoke  mciSendStringA, victoryButtonSoundClose, 0, 0, 0
    mov     [IS_MUSIC_ON], GL_TRUE
    ret
endp