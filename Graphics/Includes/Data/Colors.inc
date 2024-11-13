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

cl_milk           dd      0x00E5C4B2
cl_milk_light     dd      0x00DFB69F
cl_brown          dd      0x00C88762
cl_brown_light    dd      0x00CDA791
cl_brown_medium   dd      0x00BC957F
cl_brown_dark     dd      0x009B8071
cl_gray           dd      0x00454141
cl_red_light      dd      0x00AD3B3B
cl_red            dd      0x00983838
cl_red_black      dd      0x00803333
cl_vinous         dd      0x00532323
cl_vinous_black   dd      0x001D1414
cl_brown_text     dd      0x00773A18
cl_lime           dd      0x00B8E5B2
cl_body           dd      0x00F5C084
cl_orange         dd      0x00EF9837

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

play_button_color     BackgroundColor ?
about_button_color    BackgroundColor ?
settings_button_color BackgroundColor ?
exit_button_color     BackgroundColor ?

milk_color         BackgroundColor ?
milk_light_color   BackgroundColor ?
brown_color        BackgroundColor ?
brown_light_color  BackgroundColor ?
brown_medium_color BackgroundColor ?
brown_dark_color   BackgroundColor ?
gray_color         BackgroundColor ?
red_light_color    BackgroundColor ? 
red_color          BackgroundColor ?
red_black_color    BackgroundColor ?
vinous_color       BackgroundColor ?
vinous_black_color BackgroundColor ?
brown_text_color   BackgroundColor ?
lime_color         BackgroundColor ?
body_color         BackgroundColor ?
orange_color       BackgroundColor ?

recovery_button_color BackgroundColor ?
pause_button_color    BackgroundColor ?

TicksFontList_Colors     dd  milk_color,   brown_color      ; base
TicksFontList_MltColors  dd  orange_color, body_color       ; for "TO" Ticks
TicksFontDecorate_Colors dd  milk_color,   gray_color
TicksList_Colors         dd  red_light_color, red_color, red_black_color, vinous_color, vinous_black_color
