; ====== Interfaces ====== ;
struct BackgroundColor
    Red     GLfloat     ?
    Green   GLfloat     ?
    Blue    GLfloat     ?
ends

; ====== Business models ====== ;
cl_background   dd      0x003A7156
cl_root         dd      0x00964F27
cl_stroke       dd      0x00C88762
cl_ending       dd      0x00A5582D
cl_border       dd      0x00BA6A3D
cl_button       dd      0x00DFB69F
cl_headline     dd      0x00C88762

; ====== Program models ====== ;
font_color      BackgroundColor ?
book_root_color BackgroundColor ?
book_strk_color BackgroundColor ?
book_endg_color BackgroundColor ?
book_ebrd_color BackgroundColor ?
button_color    BackgroundColor ?
headline_color  BackgroundColor ?
