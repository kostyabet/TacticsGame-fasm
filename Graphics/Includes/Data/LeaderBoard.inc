struct LeadBrdTabel
    font         DrawModel       ?
    txt_position dd              ?
    txt_login    dd              ?
    txt_points   dd              ?
    font_color   BackgroundColor ?
    text_color   BackgroundColor ?
ends

TABELS_ON_PAGE  =   6
Tabels          dd  ?

MAX_UP_HEAD     =   25
MIN_UP_HEAD     =   1
MAX_DOWN_HEAD   =   30
MIN_DOWN_HEAD   =   6

UpHead      dd  MIN_UP_HEAD
DownHead    dd  MIN_DOWN_HEAD

Tabel.font1 dd  2,\
                600, 445, 1320, 495,\
                595, 450, 1325, 490,\
                4,\
                 600, 450, 5,\
                 600, 490, 5,\
                1320, 450, 5,\
                1320, 490, 5
Tabel.font2 dd  2,\
                600, 500, 1320, 550,\
                595, 505, 1325, 545,\
                4,\
                 600, 505, 5,\
                 600, 545, 5,\
                1320, 505, 5,\
                1320, 545, 5
Tabel.font3 dd  2,\
                600, 555, 1320, 605,\
                595, 560, 1325, 600,\
                4,\
                 600, 560, 5,\
                 600, 600, 5,\
                1320, 560, 5,\
                1320, 600, 5
Tabel.font4 dd  2,\
                600, 610, 1320, 660,\
                595, 615, 1325, 655,\
                4,\
                 600, 615, 5,\
                 600, 655, 5,\
                1320, 615, 5,\
                1320, 655, 5
Tabel.font5 dd  2,\
                600, 665, 1320, 715,\
                595, 670, 1325, 710,\
                4,\
                 600, 670, 5,\
                 600, 710, 5,\
                1320, 670, 5,\
                1320, 710, 5
Tabel.font6 dd  2,\
                600, 720, 1320, 770,\
                595, 725, 1325, 765,\
                4,\
                 600, 725, 5,\
                 600, 765, 5,\
                1320, 725, 5,\
                1320, 765, 5
TabelsFonts dd  Tabel.font1, Tabel.font2, Tabel.font3,\
                Tabel.font4, Tabel.font5, Tabel.font6

Tabel.Pos.Pos   dd   603, 457
Tabel.Log.Pos   dd   678, 457
Tabel.Scr.Pos   dd  1244, 457
Tabel.Position  dd  ?, ?
Tabel.PosStep   =   55
tbl_textgap     =   5
tbl_fontsize    =   0

struct TabelText
    buffer   db 0
    position db 3 dup(0)
    login    db 31 dup(0)
    points   db 10 dup(0)
ends

TabelText1  TabelText   ?
TabelText2  TabelText   ?
TabelText3  TabelText   ?
TabelText4  TabelText   ?
TabelText5  TabelText   ?
TabelText6  TabelText   ?
TabelTexts  dd          TabelText1, TabelText2, TabelText3, TabelText4, TabelText5, TabelText6