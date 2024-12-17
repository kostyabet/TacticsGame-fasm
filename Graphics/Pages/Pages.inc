LoadingPage     =       0
MainPage        =       4
GamePage        =       8
AboutPage       =       12
SettingsPage    =       16
PausePage       =       20
WinnerPage      =       24
HotkeysPage     =       28
ExitPage        =       32
LoggingPage     =       36
LeadBoardPage   =       40

PrevousPage     dd      MainPage
CurentPage      dd      LoadingPage

PagesList       dd      Draw.Pages.LoadingPage, Draw.Pages.MainPage,\
                        Draw.Pages.GamePage, Draw.Pages.AboutPage,\
                        Draw.Pages.SettingsPage, Draw.Pages.PausePage, Draw.Pages.WinnerPage,\
                        Draw.Pages.HotkeysPage,\
                        Draw.Pages.ExitPage,\
                        Draw.Pages.LoggingPage, Draw.Pages.LeadBoardPage