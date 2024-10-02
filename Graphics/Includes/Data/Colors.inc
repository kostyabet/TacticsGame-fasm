; ====== Interfaces ====== ;
struct BackgroundColor
    Red     GLfloat     ?
    Green   GLfloat     ?
    Blue    GLfloat     ?
ends

; ====== Business models ====== ;
cl_background     dd      0x003A7156
cl_root           dd      0x00964F27
cl_stroke         dd      0x00C88762
cl_ending         dd      0x00A5582D
cl_border         dd      0x00BA6A3D
cl_button         dd      0x00DFB69F
cl_headline       dd      0x00C88762
cl_flgpl          dd      0x005B2E15
cl_text_buttom    dd      0x00773A18
cl_headline_bc    dd      0x00773A18
cl_title          dd      0x005B2E15

cl_gp_border      dd      0x00E5C4B2
cl_ggf            dd      0x00BC957F
cl_gbc            dd      0x009B8071
cl_tick_c1        dd      0x00AD3B3B
cl_tick_c2        dd      0x00983838
cl_tick_c3        dd      0x00803333
cl_tick_c4        dd      0x00532323
cl_tick_c5        dd      0x001D1414
cl_mgf            dd      0x00CDA791

; ====== Program models ====== ;
font_color        BackgroundColor ?
book_root_color   BackgroundColor ?
book_strk_color   BackgroundColor ?
book_endg_color   BackgroundColor ?
book_ebrd_color   BackgroundColor ?
button_color      BackgroundColor ?
headline_color    BackgroundColor ?
headline_bc_color BackgroundColor ?
book_flgpl_color  BackgroundColor ?
btn_text_color    BackgroundColor ?
book_title_color  BackgroundColor ?

game_border_color         BackgroundColor ?
game_garbage_font_color   BackgroundColor ?
game_garbabe_border_color BackgroundColor ?
game_tick_c1_color        BackgroundColor ?
game_tick_c2_color        BackgroundColor ?
game_tick_c3_color        BackgroundColor ?
game_tick_c4_color        BackgroundColor ?
game_tick_c5_color        BackgroundColor ?
maingame_font_color       BackgroundColor ?