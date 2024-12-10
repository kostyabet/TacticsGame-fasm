proc Server.Requests
    invoke CreateThread, 0, 0, Server.GetStartData, 0, 0, 0
    ret
endp

proc Server.GetStartData
    mov     [progressStatus], 0
    ;stdcall Server.SendRequest.GetPlayers
    ;mov     [progressStatus], 50
    ;stdcall Server.SendRequest.SetPlayers
    mov     [progressStatus], 100
    ret
endp