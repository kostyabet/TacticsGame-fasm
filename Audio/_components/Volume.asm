proc Audio.Volume.Change
    mov     [isVolumeSwitchClicked], GL_TRUE
    stdcall Mouse.CheckSwitchOnMove
    ret
endp
