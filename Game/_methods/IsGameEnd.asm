proc Game.CheckIsGameEnd uses ebx edi
    locals
        result dd GL_TRUE
    endl
    mov     ebx, TicksMatrix    ; current
    mov     edi, WinnerMatrix   ; winner
    mov     ecx, 33
    .mainLoop:
        mov     eax, [ebx]
        cmp     eax, [edi]
        je      @F
            mov     [result], GL_FALSE
        @@:
        add     ebx, 4
        add     edi, 4
        loop    .mainLoop
    mov     eax, [result]
    ret
endp