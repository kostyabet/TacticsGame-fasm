proc Server.Requests
    invoke CreateThread, 0, 0, Server.GetStartData, 0, 0, 0
    ret
endp

proc Server.GetStartData
    mov     [progressStatus], 0
    stdcall File.Read
    mov     [progressStatus], 50
    stdcall Server.Methods.Player.IsExist
    cmp     [CurrentPlayerId], -1
    jne     @F
        mov     byte [Login], 0
        mov     byte [Password], 0
        stdcall Page.ChangePage, LoggingPage
    @@:
    mov     [progressStatus], 100
    ret
endp

; stdcall Server.SendRequest.GetBestScores
; stdcall Server.SendRequest.PostAddScores
; stdcall Server.SendRequest.GetAllUserScores