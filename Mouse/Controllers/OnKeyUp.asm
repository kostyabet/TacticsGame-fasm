proc Mouse.KeyUp,\
    lparam
    stdcall Mouse.OnMove, [lparam], XPosition, YPosition
    cmp     [CurentPage], SettingsPage
    jne     .exit
    cmp     [isVolumeSwitchClicked], GL_TRUE
    jne     .exit
        mov     [isVolumeSwitchClicked], GL_FALSE
    .exit:
    ret
endp