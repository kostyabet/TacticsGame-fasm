proc File.TicksPosition.Write
    invoke  CreateFile, ticksFilePath, GENERIC_WRITE, 0, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
    mov     [hTicksFile], eax
    cmp     eax, INVALID_HANDLE_VALUE
    jne     @F
        stdcall File.IniFile.Error
        jmp     .exit
    @@:

    ; write settings in file
    stdcall File.IniFile.IntToStr, [garbgeCounter]
    stdcall File.IniFile.WriteRule, GARBAGE_COUNTER_PROMPT, eax
    stdcall File.IniFile.IntToStr, [isGameStart]
    stdcall File.IniFile.WriteRule, IS_GAME_START_PROMPT, eax
    stdcall File.IniFile.IntToStr, [currentScore]
    stdcall File.IniFile.WriteRule, CURRENT_SCORE_PROMPT, eax
    stdcall File.IniFile.ArrIntToStr, TICKS_MATRIX_PROMPT, TicksMatrix, 64

    .exit:
        invoke  CloseHandle, [hTicksFile]
        ret
    ret
endp

proc File.TicksPosition.Read uses eax ebx ecx edx edi
    invoke  CreateFile, ticksFilePath, GENERIC_READ, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0
    mov     [hTicksFile], eax
    cmp     eax, INVALID_HANDLE_VALUE
    jne     @F
        stdcall File.IniFile.Error
        jmp     .exit
    @@:
        ; length
        invoke  HeapAlloc, [hHeap], 8, [bufferLength]
        mov     [readBuffer], eax
        invoke  ReadFile, [hTicksFile], [readBuffer], [bufferLength], bytesRead, 0
; ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ;
; !!!!!!!!!!!!!!!!!!!!!!!!!!! DO NOT TOUCH EDI !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
        mov     edi, [readBuffer]
        stdcall File.IniFIle.ReadString, garbgeCounter, 1
        stdcall File.IniFIle.ReadString, isGameStart, 1
        stdcall File.IniFIle.ReadString, currentScore, 1
        stdcall File.IniFile.StrToArrInt, TicksMatrix, 64
; !!!!!!!!!!!!!!!!!!!!! ALARM DIACTIVATE! GOOD LUCK :) !!!!!!!!!!!!!!!!!!!!!!!! ;
        invoke HeapFree, [hHeap], 0, [readBuffer]
    .exit:
        invoke  CloseHandle, [hTicksFile]
        ret
endp
