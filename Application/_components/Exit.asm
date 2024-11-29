proc Application.Exit
    stdcall File.IniFile.Write
    stdcall File.TicksPosition.Write
    stdcall Application.FreeMamory
    invoke  HeapDestroy, [hHeap]
    invoke  wglMakeCurrent,0,0
    invoke  wglDeleteContext,[hrc]
    invoke  ReleaseDC,[hwnd],[hdc]
    invoke  PostQuitMessage,0
    ret
endp
