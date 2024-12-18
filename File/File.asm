proc File.Read
    stdcall File.IniFile.Read
    stdcall File.TicksPosition.Read
    stdcall File.API.Read
    ret
endp

proc File.Write
    stdcall File.IniFile.Write
    stdcall File.TicksPosition.Write
    stdcall File.API.Write
endp