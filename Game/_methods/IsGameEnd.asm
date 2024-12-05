proc Game.CheckIsGameEnd uses ebx edi
    locals
        ; инициализация результата положительным значением
        result dd GL_TRUE
    endl
    ; присвание в ebx Основной Матрицы
    mov     ebx, TicksMatrix
    ; присвание в edi Победной Матрицы
    mov     edi, WinnerMatrix
    ; получение размеров матриц
    mov     ecx, GAME_BOARD_SIZE
    .mainLoop:
        ; получение текущих значений матриц
        mov     eax, [ebx]
        ; сравнение значений
        cmp     eax, [edi]
        je      @F
            ; если значения не равны
            mov     [result], GL_FALSE
        @@:
        ; переходим на следующее значение
        add     ebx, MATRIX_EL_SIZE
        add     edi, MATRIX_EL_SIZE
        loop    .mainLoop
    ; присваивание в eax результата
    mov     eax, [result]
    ret
endp