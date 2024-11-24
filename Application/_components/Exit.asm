proc Application.Exit
    stdcall File.IniFile.Write
    stdcall File.TicksPosition.Write
    invoke  HeapDestroy, [hHeap]
    invoke  ExitProcess, [msg.wParam]
    ret
endp
