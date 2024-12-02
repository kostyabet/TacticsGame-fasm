proc Game.Leave.WithoutSaving
    stdcall Game.RecoveryTicks
    stdcall Page.ChangePage, MainPage
    mov     [isGameStart], GL_FALSE
    ret
endp

proc Game.Leave.WithSaving
    ; stdcall saving function
    stdcall Page.ChangePage, MainPage
    mov     [isGameStart], GL_FALSE
    ret
endp

proc Game.Leave.Winner
    stdcall Audio.Victory
    stdcall Page.ChangePage, WinnerPage
    mov     [isGameStart], GL_FALSE
    ret
endp

proc Game.Leave.Restart
    stdcall Game.RecoveryTicks
    stdcall Page.ChangePage, GamePage
    mov     [isGameStart], GL_FALSE
    ret
endp