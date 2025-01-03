proc Game.Leave.WithoutSaving
    stdcall Game.RecoveryTicks
    stdcall Page.ChangePage, MainPage
    stdcall Game.Leave
    ret
endp

proc Game.Leave.WithSaving
    stdcall Page.ChangePage, MainPage
    ret
endp

proc Game.Leave.Winner
    stdcall Audio.Victory
    stdcall Page.ChangePage, WinnerPage
    stdcall Game.Leave
    stdcall Game.WinnerPointsRender
    inc     [gameCounter]
    stdcall Server.AddNewScore
    ret
endp

proc Game.Leave.Restart
    stdcall Game.RecoveryTicks
    stdcall Page.ChangePage, GamePage
    stdcall Game.Leave
    ret
endp