proc Game.Start
    cmp     [isGameStart], GL_TRUE
    je      .start
        mov     [isGameStart], GL_TRUE
        ; start points set
        stdcall Game.StartPointsSearch, [gameCounter]
        mov     [strikeCounter], 0
        mov     [currentPoints], eax
    .start:
        stdcall Game.AddPointsByGoodMove, [currentPoints], [strikeCounter]
        mov     [currentPoints], eax
    .exit:
    inc     [strikeCounter]
    ret
endp

proc Game.MissTick uses eax
    locals
        divider dd  pointsByBadMove ; 1
    endl
    ; culc sub part
    mov     eax, [strikeCounter]
    cmp     eax, [loseStrikeCouner]
    jle     @F
        mov     [loseStrikeCouner], eax
    @@:
    mov     [strikeCounter], 0
    inc     [loseStrikeCouner]
    add     eax, [loseStrikeCouner]
    imul    dword [divider]
    ; sub part  
    cmp     [currentPoints], eax
    jb     @F
        sub     [currentPoints], eax
        jmp     .exit
    @@:
        mov     [currentPoints], 0 
    .exit:
    ret
endp

proc Game.Leave
    mov     [strikeCounter], 0
    mov     [loseStrikeCouner], 0
    mov     [isGameStart], GL_FALSE
    ret
endp

proc Game.StartPointsSearch,\
    gameCounter
    locals
        divider dd  10
    endl
    mov     eax, [gameCounter]
    idiv    dword [divider]
    ret
endp

proc Game.AddPointsByGoodMove uses ebx ecx,\
    current, strike
    locals
        divider dd 4
        res     dw ?
    endl
    mov     eax, [strike]
    mov     ecx, [divider]
    idiv    ecx
    mov     [res], ax
    xor     eax, eax
    mov     ax, [res]
    add     eax, pointsByGoodMove ; 1
    mov     ebx, [current]
    add     ebx, eax
    xchg    eax, ebx
    ret
endp