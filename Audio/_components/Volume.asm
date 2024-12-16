proc Audio.Volume.Change uses ecx
    mov     [isVolumeSwitchClicked], GL_TRUE
    stdcall Mouse.CheckSwitchOnMove
    ret
endp
