proc Application.Exit
    stdcall File.IniFile.Write
    stdcall File.TicksPosition.Write
    stdcall Application.FreeMamory
    invoke  HeapDestroy, [hHeap]
    invoke  ExitProcess, 0
    ret
endp
