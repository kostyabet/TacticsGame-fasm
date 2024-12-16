proc Application.Exit
    stdcall File.Write
    stdcall Application.FreeMamory
    invoke  CloseHandle, hMutex
    invoke  HeapDestroy, [hHeap]
    invoke  ExitProcess, 0
    ret
endp
