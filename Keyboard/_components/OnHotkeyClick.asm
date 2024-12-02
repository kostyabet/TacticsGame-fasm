proc Keyboard.OnHotkeyClick.PauseStop
    switch  [CurentPage]
    case    .mainPage,  MainPage
    case    .gamePage,  GamePage
    case    .pausePage, PausePage
    jmp     .exit

    .mainPage:
        stdcall Page.ChangePage, GamePage
        jmp     .exit
    .gamePage:
        cmp     [isGameStart], GL_TRUE
        jne     @F
            stdcall Page.ChangePage, PausePage
        @@:
        jmp     .exit
    .pausePage:
        stdcall Page.ChangePage, GamePage
    .exit:
    ret
endp

proc Keyboard.OnHotkeyClick.About
    switch  [CurentPage]
    case    .mainPage, MainPage
    jmp     .exit
    .mainPage:
        stdcall Page.ChangePage, AboutPage
        jmp     .exit
    .exit:
        ret
endp

proc Keyboard.OnHotkeyClick.Exit
    switch  [CurentPage]
    case    .exitPage,    ExitPage
    case    .exitCall,    LoadingPage
    case    .mainPage,    MainPage
    case    .gamePage,    GamePage
    case    .aboutPage,   AboutPage
    case    .prevousPage, SettingsPage
    case    .prevousPage, PausePage
    case    .winnerPage,  WinnerPage
    case    .prevousPage, HotkeysPage
    jmp     .exit

    .exitPage:
        stdcall Page.ChangePage, MainPage
        jmp     .exit
    .mainPage:
        stdcall Page.ChangePage, ExitPage
        jmp     .exit
    .exitCall:
        stdcall Application.Exit
        jmp     .exit
    .gamePage:
        switch  [isGameStart]
        case    .true, GL_TRUE
        case    .false, GL_FALSE
        jmp     .exit

        .true:
            stdcall Page.ChangePage, PausePage
            jmp     .exit
        .false:
            stdcall Page.ChangePage, MainPage
            jmp     .exit
    .aboutPage:
        stdcall Page.ChangePage, MainPage
        jmp     .exit
    .prevousPage:
        stdcall Page.ChangePage, [PrevousPage]
        jmp     .exit
    .winnerPage: 
        stdcall Page.ChangePage, MainPage
        jmp     .exit
    .exit:
        ret
endp

proc Keyboard.OnHotkeyClick.Settings
    switch  [CurentPage]
    case    .mainPage, MainPage
    case    .gamePage, GamePage
    jmp     .exit
    
    .mainPage:
        stdcall Page.ChangePage, SettingsPage
        jmp     .exit
    .gamePage:
        stdcall Page.ChangePage, SettingsPage
        jmp     .exit

    .exit:
    ret
endp

proc Keyboard.OnHotkeyClick.Restart
    switch  [CurentPage]
    case    .gamePage, GamePage
    jmp     .exit
    
    .gamePage:
        stdcall Game.RecoveryTicks
        jmp     .exit

    .exit:
    ret
endp