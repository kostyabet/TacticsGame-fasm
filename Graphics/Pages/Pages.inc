LoadingPage     =       0
MainPage        =       4
GamePage        =       8
AboutPage       =       12
SettingsPage    =       16
PausePage       =       20

PrevousPage     dd      ?
CurentPage      dd      GamePage ; LoadingPage

PagesList       dd      Draw.Pages.LoadingPage, Draw.Pages.MainPage, Draw.Pages.GamePage, Draw.Pages.AboutPage, Draw.Pages.SettingsPage, Draw.Pages.PausePage