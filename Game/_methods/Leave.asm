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