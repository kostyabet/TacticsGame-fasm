proc File.Read
    stdcall File.IniFile.Read
    stdcall File.TicksPosition.Read
    stdcall File.API.Read
    ret
endp