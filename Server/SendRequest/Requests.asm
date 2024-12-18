proc Server.Requests
    invoke CreateThread, 0, 0, Server.GetStartData, 0, 0, 0
    ret
endp

proc Server.GetStartData
    mov     [progressStatus], 0
        stdcall File.Read
    mov     [progressStatus], 25
        stdcall Server.Methods.Player.IsExist
        cmp     [CurrentPlayerId], -1
        jne     @F
            mov     byte [Login], 0
            mov     byte [Password], 0
            stdcall Page.ChangePage, LoggingPage
        @@:
        cmp     [CurentPage], LoadingPage
        jne     @B
    mov     [progressStatus], 50
        stdcall Server.Methods.Player.ScoresCount
        mov     [gameCounter], eax
    mov     [progressStatus], 75
        stdcall Server.ScoresDataPrepear
    mov     [progressStatus], 100
    ret
endp

proc Server.AddNewScore
    invoke CreateThread, 0, 0, Server.Methods.Score.Add, 0, 0, 0
    ret
endp

proc Server.GetUserScores
    stdcall Server.Methods.Score.UserScores
    ret
endp

proc Server.GetBestScores
    stdcall Server.Methods.Score.BestScores
    ret
endp

proc Server.ScoresDataPrepear uses eax ebx
    ; len culc
    lea     ebx, [sizeof.Score * MAX_SCORES_COUNT]
    ; userScores
    invoke  HeapAlloc, [hHeap], 8, ebx
    mov     [UserScores], eax
    ; bestScores
    invoke  HeapAlloc, [hHeap], 8, ebx
    mov     [BestScores], eax
    ret
endp

; stdcall Server.SendRequest.GetBestScores
; stdcall Server.SendRequest.GetAllUserScores