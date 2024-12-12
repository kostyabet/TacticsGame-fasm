proc Server.Requests
    invoke CreateThread, 0, 0, Server.GetStartData, 0, 0, 0
    ret
endp

proc Server.GetStartData
    mov     [progressStatus], 0
    stdcall Server.SendRequest.GetBestScores
    mov     [progressStatus], 25
    stdcall Server.SendRequest.PostAddPlayers
    mov     [progressStatus], 50
    stdcall Server.SendRequest.GetIsPlayerExist
    mov     [progressStatus], 75
    stdcall Server.SendRequest.PostAddScores
    stdcall Server.SendRequest.GetAllUserScores
    mov     [progressStatus], 100
    ret
endp