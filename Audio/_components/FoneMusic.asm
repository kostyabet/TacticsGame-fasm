proc Audio.FoneMusic
    invoke CreateThread, 0, 0, Audio.FoneMusicOn, 0, 0, 0
    ret
endp

proc Audio.FoneMusicOn
    cmp     [IS_MUSIC_ON], GL_FALSE
    je      .stopMusic
    .start:
        invoke mciSendStringA, foneMusicCommand, 0, 0, 0
        invoke mciSendStringA, setMusicVolume, 0, 0, 0
        invoke mciSendStringA, foneMusicPlay, 0, 0, 0
        .waitUntilEnd:
            cmp     [IS_MUSIC_ON], GL_FALSE
            je      .stopMusic
            invoke  mciSendStringA, foneMusicStatus, statusBuffer, statusBufferLen, 0
            stdcall Status.IsStopped, statusBuffer, stoppedStr
            cmp     eax, 1
            jne     .waitUntilEnd
        invoke mciSendStringA, foneMusicClose, 0, 0, 0
        jmp     .start
    .stopMusic:
        invoke mciSendStringA, foneMusicClose, 0, 0, 0
        .waitMusicStart:
            cmp     [IS_MUSIC_ON], GL_FALSE
            je      .waitMusicStart
        jmp     .start
    ret
endp