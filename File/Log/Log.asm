proc Log.Create uses edi esi ebx eax
    invoke  AllocConsole
    invoke  GetStdHandle,  STD_OUTPUT_HANDLE
    mov     [hConsole], eax
    stdcall Log.Console, logCreateSignal, logCreateSignal.size
    ret
endp

proc Log.Console uses eax,\
    buffer, length
    invoke  WriteConsole, [hConsole], [buffer], [length], 0, 0
    ret
endp