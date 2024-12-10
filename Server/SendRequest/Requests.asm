proc Server.Requests
    invoke CreateThread, 0, 0, Server.GetStartData, 0, 0, 0
    ret
endp

proc Server.GetStartData
    mov     [progressStatus], 0
    ;stdcall Server.SendRequest.GetPlayers
    ;mov     [progressStatus], 50
    ;stdcall Server.SendRequest.SetPlayers
    ;stdcall Server.SendRequest.AddNewScore
    ;stdcall Server.SendRequest.PrintUserScores
    mov     [progressStatus], 100
    ret
endp