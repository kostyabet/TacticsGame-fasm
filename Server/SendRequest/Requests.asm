proc Server.Requests
    invoke CreateThread, 0, 0, Server.GetStartData, 0, 0, 0
    ret
endp

proc Server.GetStartData
    mov     [progressStatus], 0
    
    ; stdcall File.Read
    ; mov     [progressStatus], 33
    ; stdcall Server.Methods.Player.IsExist
    ; cmp     [CurrentPlayerId], -1
    ; jne     @F
    ;     mov     byte [Login], 0
    ;     mov     byte [Password], 0
    ;     stdcall Page.ChangePage, LoggingPage
    ; @@:
    ; cmp     [CurentPage], LoadingPage
    ; jne     @B
    ; mov     [progressStatus], 66
    ; stdcall Server.Methods.Player.ScoresCount
    ; mov     [gameCounter], eax
    stdcall Page.ChangePage, LeadBoardPage

    mov     [progressStatus], 100
    ret
endp

proc Server.AddNewScore
    invoke CreateThread, 0, 0, Server.Methods.Score.Add, 0, 0, 0
    ret
endp

; stdcall Server.SendRequest.GetBestScores
; stdcall Server.SendRequest.PostAddScores
; stdcall Server.SendRequest.GetAllUserScores