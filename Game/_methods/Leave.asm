proc Game.Leave.WithoutSaving
    stdcall Game.RecoveryTicks
    stdcall Page.ChangePage, MainPage
    stdcall Game.Leave
    ret
endp

proc Game.Leave.WithSaving
    ; stdcall saving function
    stdcall Page.ChangePage, MainPage
    stdcall Game.Leave
    ret
endp

proc Game.Leave.Winner
    stdcall Audio.Victory
    stdcall Page.ChangePage, WinnerPage
    stdcall Game.Leave
    inc     [gameCounter]
    ret
endp

proc Game.Leave.Restart
    stdcall Game.RecoveryTicks
    stdcall Page.ChangePage, GamePage
    stdcall Game.Leave
    ret
endp