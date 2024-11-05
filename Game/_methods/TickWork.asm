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
     sub     eax, 2
     mov     [result], eax
    .exit:
     mov     eax, [result]
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
     add     eax, 2
     mov     [result], eax
    .exit:
     mov     eax, [result]
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