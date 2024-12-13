proc Server.Requests
    invoke CreateThread, 0, 0, Server.GetStartData, 0, 0, 0
    ret
endp

proc Server.GetStartData
    mov     [progressStatus], 0
    stdcall File.Read
    mov     [progressStatus], 50
    stdcall Server.Methods.Player.IsExist
    cmp     eax, 1
    je      @F
        stdcall Page.ChangePage, LoggingPage
    @@:
    ; stdcall Server.SendRequest.GetBestScores
    ; stdcall Server.SendRequest.PostAddPlayers
    ; stdcall Server.SendRequest.PostAddScores
    ; stdcall Server.SendRequest.GetAllUserScores
    mov     [progressStatus], 100
    ret
endp