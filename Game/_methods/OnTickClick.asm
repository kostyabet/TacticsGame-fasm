proc Game.OnTickClick,\
    floatList, matrixTick, coordsMap, currentNumber
    locals
        number  dd   ?

        top     dd   ?
        left    dd   ?
        right   dd   ?
        bottom  dd   ?
    endl
    ; convert to matrix
    stdcall Game.Convert.ToMatrix, [currentNumber]
    mov     [number], eax
    ; search top, left, right, bottom
    stdcall Game.TickWork.SearchTopCoord, [number]
    stdcall Game.Convert.ToBusiness, eax
    mov     [top], eax
    stdcall Game.TickWork.SearchBottomCoord, [number]
    stdcall Game.Convert.ToBusiness, eax
    mov     [bottom], eax
    stdcall Game.TickWork.SearchLeftCoord, [number]
    stdcall Game.Convert.ToBusiness, eax
    mov     [left], eax
    stdcall Game.TickWork.SearchRightCoord, [number]
    stdcall Game.Convert.ToBusiness, eax
    mov     [right], eax
    ; check if in range
    stdcall Game.TickWork.SearchIsEmptyTick, [matrixTick], [top]
    mov     [top], eax
    stdcall Game.TickWork.SearchIsEmptyTick, [matrixTick], [bottom]
    mov     [bottom], eax
    stdcall Game.TickWork.SearchIsEmptyTick, [matrixTick], [left]
    mov     [left], eax
    stdcall Game.TickWork.SearchIsEmptyTick, [matrixTick], [right]
    mov     [right], eax
    ; check jump or not
    stdcall Game.TickWork.IsCanJumpTop, [matrixTick], [top]
    mov     [top], eax
    stdcall Game.TickWork.IsCanJumpBottom, [matrixTick], [bottom]
    mov     [bottom], eax
    stdcall Game.TickWork.IsCanJumpLeft, [matrixTick], [left]
    mov     [left], eax
    stdcall Game.TickWork.IsCanJumpRight, [matrixTick], [right]
    mov     [right], eax
    ; check posible directions count
    stdcall Game.TickWork.PosibleDirectionsCount, [top], [left], [right], [bottom]
    cmp     eax, 1
    jne     @F
     ; stdcall from to
     ;
     mov    dword [font_color], 0x10
     ;
     jmp    .exit
    @@:
    cmp     eax, 0
    je      .exit
     ; stdcall set posible directions
    .exit:
    ret
endp