proc Game.TickWork.SearchTopCoord,\
     matrixNumber
    locals
        result  dd  -1
    endl
    mov     eax, [matrixNumber]
    sub     eax, 14
    stdcall Game.TickWork.CheckCoordMatrixRange, eax
    ret
endp

proc Game.TickWork.SearchLeftCoord uses ecx edx,\
     matrixNumber
    locals
        result  dd  -1
    endl
    mov     eax, [matrixNumber]
    mov     ecx, 7
    idiv    ecx
    cmp     edx, 2
    jb      .exit
     mov     eax, [matrixNumber]
     sub     eax, 2
     mov     [result], eax
    .exit:
     mov     eax, [result]
     stdcall Game.TickWork.CheckCoordMatrixRange, eax
     ret
endp

proc Game.TickWork.SearchRightCoord,\
     matrixNumber
    locals
        result  dd  -1
    endl
    mov     eax, [matrixNumber]
    mov     ecx, 7
    idiv    ecx
    cmp     edx, 4
    ja      .exit
     mov     eax, [matrixNumber]
     add     eax, 2
     mov     [result], eax
    .exit:
     mov     eax, [result]
     stdcall Game.TickWork.CheckCoordMatrixRange, eax
     ret
endp

proc Game.TickWork.SearchBottomCoord,\
     matrixNumber
    locals
        result  dd  -1
    endl
    mov     eax, [matrixNumber]
    add     eax, 14
    stdcall Game.TickWork.CheckCoordMatrixRange, eax
    ret
endp

proc Game.TickWork.SearchIsEmptyTick uses ebx edx,\
     matrix, number
    locals
        result  dd  -1
        multiplier dd  4
    endl
    mov     eax, [number]
    cmp     eax, [result]
    je     .exit
        ; check if empty
        imul    eax, [multiplier]
        mov     ebx, [matrix]
        add     ebx, eax
        mov     edx, [ebx]
        cmp     edx, TickEmpty
        jne     .exit
        mov     eax, [number]
        mov     [result], eax
    .exit:
    mov     eax, [result]
    ret
endp

proc Game.TickWork.SearchIsExistTick uses ebx edx,\
     matrix, number 
    locals
        result  dd  -1
        multiplier dd  4
    endl
    mov     eax, [number]
    cmp     eax, [result]
    je     .exit
        ; check if empty
        imul    eax, [multiplier]
        mov     ebx, [matrix]
        add     ebx, eax
        mov     edx, [ebx]
        cmp     edx, TickExist
        jne     .exit
        mov     eax, [number]
        mov     [result], eax
    .exit:
    mov     eax, [result]
    ret
endp

proc Game.TickWork.CheckCoordMatrixRange,\
     number
    locals
        result  dd  -1
    endl
    mov     eax, [number]
    ; eax < 2
    cmp     eax, 2
    jb      .exit
    ; eax > 46
    cmp     eax, 46
    ja      .exit
    ; 4 > eax < 9
    cmp     eax, 9
    jnb     @F
    cmp     eax, 4
    ja      .exit
    @@:
    ; 11 > eax < 14
    cmp     eax, 14
    jnb     @F
    cmp     eax, 11
    ja      .exit
    @@:
    ; 34 > eax < 37
    cmp     eax, 37
    jnb     @F
    cmp     eax, 34
    ja      .exit
    @@:
    ; 39 > eax < 44
    cmp     eax, 44
    jnb     @F
    cmp     eax, 39
    ja      .exit
    @@:
        ; correct result
        mov     [result], eax
    .exit:
        mov     eax, [result]
        ret
endp

proc Game.TickWork.IsCanJumpTop,\
     matrix, top
    locals
        result     dd -1
        multiplier dd  4
    endl
    mov     eax, [top]
    cmp     eax, -1
    je      .exit
        add     eax, 7
        stdcall Game.TickWork.CheckCoordMatrixRange, eax
        stdcall Game.Convert.ToBusiness, eax
        cmp     eax, -1
        je      .exit
            mov     [result], eax
            imul    dword [multiplier]
            mov     ebx, [matrix]
            add     ebx, eax
            mov     eax, [ebx]
            cmp     eax, TickExist
            je      .exit
            mov     [result], -1
    .exit:
    mov     eax, [result]
    ret
endp

proc Game.TickWork.IsCanJumpLeft,\
     matrix, left
    locals
        result      dd -1
        multiplier  dd  4
    endl
    mov     eax, [left]
    cmp     eax, -1
    je      .exit
        add     eax, 1
        stdcall Game.TickWork.CheckCoordMatrixRange, eax
        stdcall Game.Convert.ToBusiness, eax
        cmp     eax, -1
        je      .exit
            mov     [result], eax
            imul    dword [multiplier]
            mov     ebx, [matrix]
            add     ebx, eax
            mov     eax, [ebx]
            cmp     eax, TickExist
            je      .exit
            mov     [result], -1
    .exit:
    mov     eax, [result]
    ret
endp

proc Game.TickWork.IsCanJumpRight,\
     matrix, right
    locals
        result      dd -1
        multiplier  dd  4
    endl
    mov     eax, [right]
    cmp     eax, -1
    je      .exit
        sub     eax, 1
        stdcall Game.TickWork.CheckCoordMatrixRange, eax
        stdcall Game.Convert.ToBusiness, eax
        cmp     eax, -1
        je      .exit
            mov     [result], eax
            imul    dword [multiplier]
            mov     ebx, [matrix]
            add     ebx, eax
            mov     eax, [ebx]
            cmp     eax, TickExist
            je      .exit
            mov     [result], -1
    .exit:
    mov     eax, [result]
    ret
endp

proc Game.TickWork.IsCanJumpBottom,\
     matrix, bottom
    locals
        result      dd -1
        multiplier  dd  4
    endl
    mov     eax, [bottom]
    cmp     eax, -1
    je      .exit
        sub     eax, 7
        stdcall Game.TickWork.CheckCoordMatrixRange, eax
        stdcall Game.Convert.ToBusiness, eax
        cmp     eax, -1
        je      .exit
            mov     [result], eax
            imul    dword [multiplier]
            mov     ebx, [matrix]
            add     ebx, eax
            mov     eax, [ebx]
            cmp     eax, TickExist
            je      .exit
            mov     [result], -1
    .exit:
    mov     eax, [result]
    ret
endp

proc Game.TickWork.PosibleDirectionsCount,\
     top, left, right, bottom
    locals
        result  dd  0
    endl
    cmp     [top], -1
    je      @F
     inc     [result]
    @@:
    cmp     [left], -1
    je      @F
     inc    [result]
    @@:
    cmp     [right], -1
    je      @F
     inc    [result]
    @@:
    cmp     [bottom], -1
    je      @F
     inc    [result]
    @@:
    mov     eax, [result]
    ret 
endp

proc Game.CheckIsFromEqualTo,\ 
    number
    locals
        result dd GL_FALSE
    endl

    mov     eax, [TicksMoveDirections.TOP.TO]
    cmp     eax, [number]
    jne     @F
        mov     [result], GL_TRUE
        jmp     .exit
    @@:
    mov     eax, [TicksMoveDirections.LEFT.TO]
    cmp     eax, [number]
    jne     @F
        mov     [result], GL_TRUE
        jmp     .exit
    @@:
    mov     eax, [TicksMoveDirections.RIGHT.TO]
    cmp     eax, [number]
    jne     @F
        mov     [result], GL_TRUE
        jmp     .exit
    @@:
    mov     eax, [TicksMoveDirections.BOTTOM.TO]
    cmp     eax, [number]
    jne     .exit
        mov     [result], GL_TRUE
    .exit:
    mov     eax, [result]
    ret
endp