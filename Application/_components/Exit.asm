proc Application.Exit
    stdcall File.IniFile.Write
    invoke  HeapDestroy, [hHeap]
    invoke  ExitProcess, [msg.wParam]
    ret
endp
