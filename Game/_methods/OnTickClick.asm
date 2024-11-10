proc Game.OnTickClick,\
    matrixTick, currentNumber

    ; convert to matrix
    stdcall Game.Convert.ToMatrix, [currentNumber]
    mov     [TicksMoveDirections.FROM], eax

    ; search top, left, right, bottom && check if in range
    stdcall Game.TickWork.SearchTopCoord, [TicksMoveDirections.FROM]
    stdcall Game.Convert.ToBusiness, eax
    stdcall Game.TickWork.SearchIsEmptyTick, [matrixTick], eax
    stdcall Game.Convert.ToMatrix, eax
    mov     [TicksMoveDirections.TOP.TO], eax

    stdcall Game.TickWork.SearchLeftCoord, [TicksMoveDirections.FROM]
    stdcall Game.Convert.ToBusiness, eax
    stdcall Game.TickWork.SearchIsEmptyTick, [matrixTick], eax
    stdcall Game.Convert.ToMatrix, eax
    mov     [TicksMoveDirections.LEFT.TO], eax

    stdcall Game.TickWork.SearchRightCoord, [TicksMoveDirections.FROM]
    stdcall Game.Convert.ToBusiness, eax
    stdcall Game.TickWork.SearchIsEmptyTick, [matrixTick], eax
    stdcall Game.Convert.ToMatrix, eax
    mov     [TicksMoveDirections.RIGHT.TO], eax
    
    stdcall Game.TickWork.SearchBottomCoord, [TicksMoveDirections.FROM]
    stdcall Game.Convert.ToBusiness, eax
    stdcall Game.TickWork.SearchIsEmptyTick, [matrixTick], eax
    stdcall Game.Convert.ToMatrix, eax
    mov     [TicksMoveDirections.BOTTOM.TO], eax

    ; check jump or not
    stdcall Game.TickWork.IsCanJumpTop, [matrixTick], [TicksMoveDirections.TOP.TO]
    mov     [TicksMoveDirections.TOP.BETWEEN], eax
    cmp     eax, -1
    jne     @F
    mov     [TicksMoveDirections.TOP.TO], -1

    @@:    
    stdcall Game.TickWork.IsCanJumpLeft, [matrixTick], [TicksMoveDirections.LEFT.TO]
    mov     [TicksMoveDirections.LEFT.BETWEEN], eax
    cmp     eax, -1
    jne     @F
    mov     [TicksMoveDirections.LEFT.TO], -1

    @@:
    stdcall Game.TickWork.IsCanJumpRight, [matrixTick], [TicksMoveDirections.RIGHT.TO]
    mov     [TicksMoveDirections.RIGHT.BETWEEN], eax
    cmp     eax, -1
    jne     @F
    mov     [TicksMoveDirections.RIGHT.TO], -1

    @@:
    stdcall Game.TickWork.IsCanJumpBottom, [matrixTick], [TicksMoveDirections.BOTTOM.TO]
    mov     [TicksMoveDirections.BOTTOM.BETWEEN], eax
    cmp     eax, -1
    jne     @F
    mov     [TicksMoveDirections.BOTTOM.TO], -1

    @@:
    ; reconvert
    stdcall Game.Convert.ToBusiness, [TicksMoveDirections.TOP.TO]
    mov     [TicksMoveDirections.TOP.TO], eax

    stdcall Game.Convert.ToBusiness, [TicksMoveDirections.LEFT.TO]
    mov     [TicksMoveDirections.LEFT.TO], eax

    stdcall Game.Convert.ToBusiness, [TicksMoveDirections.RIGHT.TO]
    mov     [TicksMoveDirections.RIGHT.TO], eax
    
    stdcall Game.Convert.ToBusiness, [TicksMoveDirections.BOTTOM.TO]
    mov     [TicksMoveDirections.BOTTOM.TO], eax

    ; check posible directions count
    stdcall Game.TickWork.PosibleDirectionsCount,    [TicksMoveDirections.TOP.TO],\
                                                    [TicksMoveDirections.LEFT.TO],\ 
                                                   [TicksMoveDirections.RIGHT.TO],\
                                                  [TicksMoveDirections.BOTTOM.TO]
    mov     [TicksMoveDirections.POSSIBLE], eax
    stdcall Game.Convert.ToBusiness, [TicksMoveDirections.FROM]
    mov     [TicksMoveDirections.FROM], eax
    cmp     [TicksMoveDirections.POSSIBLE], 1
    jne     .notASingle
     cmp     [TicksMoveDirections.TOP.TO], -1
     je      @F
      stdcall Game.MoveTick, [TicksMoveDirections.FROM], [TicksMoveDirections.TOP.BETWEEN], [TicksMoveDirections.TOP.TO]
     @@:
     cmp     [TicksMoveDirections.LEFT.TO], -1
     je      @F
      stdcall Game.MoveTick, [TicksMoveDirections.FROM], [TicksMoveDirections.LEFT.BETWEEN], [TicksMoveDirections.LEFT.TO]
     @@:
     cmp     [TicksMoveDirections.RIGHT.TO], -1
     je      @F
      stdcall Game.MoveTick, [TicksMoveDirections.FROM], [TicksMoveDirections.RIGHT.BETWEEN], [TicksMoveDirections.RIGHT.TO]
     @@:
     cmp     [TicksMoveDirections.BOTTOM.TO], -1
     je      @F
      stdcall Game.MoveTick, [TicksMoveDirections.FROM], [TicksMoveDirections.BOTTOM.BETWEEN], [TicksMoveDirections.BOTTOM.TO]
     @@:
     stdcall Game.ResetDirectionsTick
     jmp     .exit
    .notASingle:
    cmp     [TicksMoveDirections.POSSIBLE], 0
    je      .exit
     ;stdcall Game.Move.SetMultiDirections
    .exit:
        stdcall Game.PrepearTicks
    ret
endp