proc Game.Leave.WithoutSaving
    stdcall Game.RecoveryTicks
    stdcall Page.ChangePage, MainPage
    ret
endp

proc Game.Leave.WithSaving
    ; stdcall saving function
    stdcall Page.ChangePage, MainPage
    ret
endp

proc Game.Leave.Winner
    stdcall Page.ChangePage, WinnerPage
    ret
endp

proc Game.Leave.Restart
    stdcall Game.RecoveryTicks
    stdcall Page.ChangePage, GamePage
    ret
endp