proc Game.CheckIsGameEnd uses ebx edi
    locals
        result dd GL_TRUE
    endl
    mov     ebx, TicksMatrix    ; current
    mov     edi, WinnerMatrix   ; winner
    mov     ecx, GAME_BOARD_SIZE
    .mainLoop:
        mov     eax, [ebx]
        cmp     eax, [edi]
        je      @F
            mov     [result], GL_FALSE
        @@:
        add     ebx, MATRIX_EL_SIZE
        add     edi, MATRIX_EL_SIZE
        loop    .mainLoop
    mov     eax, [result]
    ret
endp