proc Game.MoveTick uses eax ebx,\
    from, between, to
    ; from
    mov     eax, [from]
    mov     ebx, MATRIX_EL_SIZE ; 4
    imul    ebx
    xchg    ebx, eax
    mov     [TicksMatrix + ebx], TickEmpty
    ; to
    mov     eax, [to]
    mov     ebx, MATRIX_EL_SIZE ; 4
    imul    ebx
    xchg    ebx, eax
    mov     [TicksMatrix + ebx], TickExist
    ; between
    ; reset on board
        mov     eax, [between]
        mov     ebx, MATRIX_EL_SIZE ; 4
        imul    ebx
        xchg    ebx, eax
        mov     [TicksMatrix + ebx], TickEmpty
    ; go to garbage
        mov     eax, [garbgeCounter]
        add     eax, GAME_BOARD_SIZE ; 33
        mov     ebx, MATRIX_EL_SIZE ; 4
        imul    ebx
        xchg    ebx, eax
        mov     [TicksMatrix + ebx], TickExist
        inc     [garbgeCounter]
    ret
endp

proc Game.Move.SetMultiTicksCoords uses eax
    locals
        currentOffset dd 0
        multiplier    dd 8
    endl

    mov     eax, [TicksMoveDirections.POSSIBLE]
    mov     [TicksFontMltDrList_Centers], eax

    cmp     [TicksMoveDirections.TOP.TO], -1
    je      @F
        mov     eax, [TicksMoveDirections.TOP.TO]
        imul    dword [multiplier]
        mov     ebx, TicksFontList_Centers
        add     ebx, eax
        add     ebx, 4
        
        mov     eax, [currentOffset]
        imul    dword [multiplier]
        mov     edi, TicksFontMltDrList_Centers
        add     edi, eax
        add     edi, 4

        mov     eax, [ebx]
        mov     [edi], eax
        mov     eax, [ebx + 4]
        mov     [edi + 4], eax

        inc     [currentOffset]
    @@:
    cmp     [TicksMoveDirections.LEFT.TO], -1
    je      @F
        mov     eax, [TicksMoveDirections.LEFT.TO]
        imul    dword [multiplier]
        mov     ebx, TicksFontList_Centers
        add     ebx, eax
        add     ebx, 4
        
        mov     eax, [currentOffset]
        imul    dword [multiplier]
        mov     edi, TicksFontMltDrList_Centers
        add     edi, eax
        add     edi, 4
        
        mov     eax, [ebx]
        mov     [edi], eax
        mov     eax, [ebx + 4]
        mov     [edi + 4], eax

        inc     [currentOffset]
    @@:
    cmp     [TicksMoveDirections.RIGHT.TO], -1
    je      @F
        mov     eax, [TicksMoveDirections.RIGHT.TO]
        imul    dword [multiplier]
        mov     ebx, TicksFontList_Centers
        add     ebx, eax
        add     ebx, 4
        
        mov     eax, [currentOffset]
        imul    dword [multiplier]
        mov     edi, TicksFontMltDrList_Centers
        add     edi, eax
        add     edi, 4
        
        mov     eax, [ebx]
        mov     [edi], eax
        mov     eax, [ebx + 4]
        mov     [edi + 4], eax

        inc     [currentOffset]
    @@:
    cmp     [TicksMoveDirections.BOTTOM.TO], -1
    je      .exit
        mov     eax, [TicksMoveDirections.BOTTOM.TO]
        imul    dword [multiplier]
        mov     ebx, TicksFontList_Centers
        add     ebx, eax
        add     ebx, 4
        
        mov     eax, [currentOffset]
        imul    dword [multiplier]
        mov     edi, TicksFontMltDrList_Centers
        add     edi, eax
        add     edi, 4
        
        mov     eax, [ebx]
        mov     [edi], eax
        mov     eax, [ebx + 4]
        mov     [edi + 4], eax

        inc     [currentOffset]
    .exit:
    ret
endp

proc Game.ResetDirectionsMltTicksCoords uses eax
    mov     [TicksFontMltDrList_Centers], 0
    ret
endp

proc Game.ResetDirectionsTick uses eax
    xor     eax, eax
    mov     [TicksMoveDirections.MULTI_DIRECTION], eax
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

proc Game.Move.CheckDirectionByTo uses eax,\
    number
    mov     eax, [TicksMoveDirections.TOP.TO]
    cmp     eax, [number]
    jne    @F
        mov     [TicksMoveDirections.LEFT.TO], -1
        mov     [TicksMoveDirections.RIGHT.TO], -1
        mov     [TicksMoveDirections.BOTTOM.TO], -1
        jmp     .exit
    @@:
    mov     eax, [TicksMoveDirections.LEFT.TO]
    cmp     eax, [number]
    jne    @F
        mov     [TicksMoveDirections.TOP.TO], -1
        mov     [TicksMoveDirections.RIGHT.TO], -1
        mov     [TicksMoveDirections.BOTTOM.TO], -1
        jmp     .exit
    @@:
    mov     eax, [TicksMoveDirections.RIGHT.TO]
    cmp     eax, [number]
    jne    @F
        mov     [TicksMoveDirections.LEFT.TO], -1
        mov     [TicksMoveDirections.TOP.TO], -1
        mov     [TicksMoveDirections.BOTTOM.TO], -1
        jmp     .exit
    @@:
    mov     eax, [TicksMoveDirections.BOTTOM.TO]
    cmp     eax, [number]
    jne     .exit
        mov     [TicksMoveDirections.LEFT.TO], -1
        mov     [TicksMoveDirections.RIGHT.TO], -1
        mov     [TicksMoveDirections.TOP.TO], -1
    .exit:
    ret
endp