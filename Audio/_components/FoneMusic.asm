proc Audio.FoneMusic
    invoke CreateThread, 0, 0, Audio.FoneMusicOn, 0, 0, 0
    invoke CreateThread, 0, 0, Audio.GameMusicOn, 0, 0, 0
    ret
endp

proc Audio.FoneMusicOn
    cmp     [IS_MUSIC_ON], GL_FALSE
    je      .stopMusic
    cmp     [isGameStart], GL_TRUE
    je      .stopMusic
    .start:
        invoke WaitForSingleObject, hMutex, INFINITE
        invoke mciSendStringA, foneMusicCommand, 0, 0, 0
        invoke mciSendStringA, foneMusicPlay, 0, 0, 0
        .waitUntilEnd:
            invoke  mciSendStringA, setMusicVolume, 0, 0, 0
            cmp     [IS_MUSIC_ON], GL_FALSE
            je      .stopMusic
            cmp     [isGameStart], GL_TRUE
            je      .stopMusic
            invoke  mciSendStringA, foneMusicStatus, statusBuffer, statusBufferLen, 0
            stdcall Status.IsStopped, statusBuffer, stoppedStr
            cmp     eax, 1
            jne     .waitUntilEnd
        invoke  mciSendStringA, foneMusicClose, 0, 0, 0
        invoke  ReleaseMutex, hMutex
        jmp    .start
    .stopMusic:
        invoke  mciSendStringA, foneMusicClose, 0, 0, 0
        invoke  ReleaseMutex, hMutex
        .waitMusicStart:
            cmp     [IS_MUSIC_ON], GL_FALSE
            je      .waitMusicStart
            cmp     [isGameStart], GL_TRUE
            je      .waitMusicStart
        jmp     .start
    ret
endp

proc Audio.GameMusicOn
    cmp     [IS_MUSIC_ON], GL_FALSE
    je      .stopMusic
    cmp     [isGameStart], GL_FALSE
    je      .stopMusic
    .start:
        invoke WaitForSingleObject, hMutex, INFINITE
        invoke mciSendStringA, gameMusicCommand, 0, 0, 0
        invoke mciSendStringA, gameMusicPlay, 0, 0, 0
        .waitUntilEnd:
            invoke mciSendStringA, setGameVolume, 0, 0, 0 
            cmp     [IS_MUSIC_ON], GL_FALSE
            je      .stopMusic
            cmp     [isGameStart], GL_FALSE
            je      .stopMusic
            invoke  mciSendStringA, gameMusicStatus, statusBuffer, statusBufferLen, 0
            stdcall Status.IsStopped, statusBuffer, stoppedStr
            cmp     eax, 1
            jne     .waitUntilEnd
        invoke mciSendStringA, gameMusicClose, 0, 0, 0
        invoke  ReleaseMutex, hMutex
        jmp     .start
    .stopMusic:
        invoke mciSendStringA, gameMusicClose, 0, 0, 0
        invoke  ReleaseMutex, hMutex
        .waitMusicStart:
            cmp     [IS_MUSIC_ON], GL_FALSE
            je      .waitMusicStart
            cmp     [isGameStart], GL_FALSE
            je      .waitMusicStart
        jmp     .start
    ret
endp