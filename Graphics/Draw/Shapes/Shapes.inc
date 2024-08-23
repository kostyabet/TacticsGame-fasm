    ; == Root == ;
Book_root_design    dd  1,\
                        350, 300, 350, 968, 370, 968, 370, 300
    ; = Stroke = ;
Book_strk_coords    dd  353, 311, 367, 313
Book_strk_brdRud    dd    0,   0,   0,   0
Book_strk_step      dd    8
Book_strk_cnt       dd   81
    ; = Ending = ;
Book_endg_design    dd  1,\
                        370, 300, 370, 968, 820, 968, 820, 300
    ; = Border = ;
Book_brd_top        dd  373, 308, 779, 311
Book_brd_right      dd  809, 345, 811, 925
Book_brd_bottom     dd  373, 957, 779, 960
Book_brd_radius     dd    0,  40,  40,   0

; ============= Font ============= ;
Font_design         dd  1,\
                        0, 0, 1920, 0, 1920, 1080, 0, 1080

; =========== Repeates =========== ;
REP_DIRECT_LEFT     dd  1
REP_DIRECT_TOP      dd  2
REP_DIRECT_RIGHT    dd  3
REP_DIRECT_BOTTOM   dd  4