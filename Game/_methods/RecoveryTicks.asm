proc Game.RecoveryTicks uses ebx edi ecx eax
    mov     ebx, TicksMatrix
    mov     edi, EtalonMatrix
    mov     ecx, 64 ; 33 + 31
    .mainAlghoritm:
        mov     eax, [edi]
        mov     [ebx], eax
        add     ebx, 4
        add     edi, 4
        loop    .mainAlghoritm 
    
    stdcall Game.ResetDirectionsTick           ; reset direcitons struct
    stdcall Game.ResetDirectionsMltTicksCoords ; reset multi directions coords
    stdcall Game.PrepearTicks
    mov     [garbgeCounter], freeGarbage
    stdcall Game.Leave
    mov     [currentPoints], 0
    stdcall Game.CurrentPointsRender
    ret
endp