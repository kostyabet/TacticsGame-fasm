proc Game.MoveTick uses eax ebx,\
    from, between, to
    ; from
    mov     eax, [from]
    mov     ebx, 4
    imul    ebx
    xchg    ebx, eax
    mov     [TicksMatrix + ebx], TickEmpty
    ; to
    mov     eax, [to]
    mov     ebx, 4
    imul    ebx
    xchg    ebx, eax
    mov     [TicksMatrix + ebx], TickExist
    ; between
    ; reset on board
        mov     eax, [between]
        mov     ebx, 4
        imul    ebx
        xchg    ebx, eax
        mov     [TicksMatrix + ebx], TickEmpty
    ; go to garbage
        mov     eax, [garbgeCounter]
        add     eax, 33
        mov     ebx, 4
        imul    ebx
        xchg    ebx, eax
        mov     [TicksMatrix + ebx], TickExist
        inc     [garbgeCounter]
    ret
endp

proc Game.Move.SetMultiDirections
    ; TicksMoveDirections
    
    ret
endp

proc Game.ResetDirectionsTick
    xor     eax, eax
    mov     [TicksMoveDirections.POSSIBLE], eax
    mov     [TicksMoveDirections.FROM], eax
    mov     [TicksMoveDirections.TOP.BETWEEN], eax
    mov     [TicksMoveDirections.TOP.TO], eax
    mov     [TicksMoveDirections.LEFT.BETWEEN], eax
    mov     [TicksMoveDirections.LEFT.TO], eax
    mov     [TicksMoveDirections.RIGHT.BETWEEN], eax
    mov     [TicksMoveDirections.RIGHT.TO], eax
    mov     [TicksMoveDirections.BOTTOM.BETWEEN], eax
    mov     [TicksMoveDirections.BOTTOM.TO], eax
    ret
endp