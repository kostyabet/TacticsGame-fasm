proc Game.OnTickClick,\
    floatList, matrixTick, coordsMap
    locals
        number  dd   ?

        top     dd   ?
        left    dd   ?
        right   dd   ?
        bottom  dd   ?
    endl
    mov     edi, [floatList]
    mov     ebx, [edi]
    sub     ebx, ecx
    ; convert to matrix
    stdcall Game.Convert.ToMatrix, ebx
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
    ret
endp