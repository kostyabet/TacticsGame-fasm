proc Application.Exit
    stdcall File.IniFile.Write
    stdcall File.TicksPosition.Write
    stdcall File.API.Write
    stdcall Application.FreeMamory
    invoke  CloseHandle, hMutex
    invoke  HeapDestroy, [hHeap]
    invoke  ExitProcess, 0
    ret
endp
