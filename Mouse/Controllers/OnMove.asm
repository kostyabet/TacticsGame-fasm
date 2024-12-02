proc Mouse.OnMove uses eax ebx,\
     coords, X, Y
    locals
        maxX    dd      ?
        maxY    dd      ?
        curX    dd      ?
        maxX    dd      ?
        curY    dd      ?
        maxY    dd      ?
    endl
    ; max X
    invoke  GetSystemMetrics, SM_CXSCREEN
    shr     eax, 1
    mov     [maxX], eax
    ; max Y
    invoke  GetSystemMetrics, SM_CYSCREEN
    shr     eax, 1
    mov     [maxY], eax
    ; X
    mov     eax, [coords]   
    and     eax, 0xFFFF
    stdcall GetXGLfloatCoordByWidth, eax, [maxX]
    mov     ebx, [X]
    mov     [ebx], eax
    ; Y
    mov     eax, [coords]   
    shr     eax, 16
    and     eax, 0xFFFF
    stdcall GetYGLfloatCoordByWidth, eax, [maxY]
    mov     ebx, [Y]
    mov     [ebx], eax
    ret
endp

proc Mouse.CheckSwitchOnMove
    locals
        curCoordsX  dd  ?
        fixVal      dd  ?
        result      dd  ?
    endl
    cmp     [isVolumeSwitchClicked], GL_TRUE
    jne     .exit
        ; get X coords
        stdcall GetXDecimalCoord, [XPosition]
        mov     [curCoordsX], eax
        ; check range
        cmp     eax, [switchStartX]
        jae     @F
            mov     eax, 0
            jmp     .convert
        @@:
        cmp     eax, [switchEndX]
        jbe     @F
            mov     eax, [switchLength]
            jmp     .convert
        @@:
        sub     eax, [switchStartX]
        .convert:
        mov     [fixVal], eax
        ; find current VOLUME
        fild    dword [fixVal]
        fidiv   dword [switchLength]
        fimul   dword [switchMaxValue]
        fistp   [result]
        mov     eax, [result]
        mov     [VOLUME], eax
        stdcall Graphics.Draw.CoordsRectPrepears.ForAnimations
        stdcall Audio.GenerateVolume, setVolumeList
    .exit:
        ret
endp