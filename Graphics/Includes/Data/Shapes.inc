; ================== Documentation ================== ;
;                                                     ;
;   _design:                                          ;
;      X - count of rects in this design block        ;
;      Next X strings nas coordinates:                ;
;          x1, y1, x2, y2, x3, y3, x4, y4             ;
;      Points visualization:  1----4                  ;
;                             |    |                  ;
;                             2----3                  ;
;      Y - count of circles in this design block      ;
;      Next Y strings has coordinates:                ;
;          x, y, r                                    ;
;      x, y - circle center coordinates.              ;
;      r - circle radius                              ;
;                                                     ;
;   _repinfo:                                         ;
;      Info for shapes repear blocks.                 ;
;      First number is number of repeats.             ;
;      Next two numbers is offset after each          ;
;       drawing. First - X, second - Y. Exemple:      ;
;                                                     ;
;            7px 0px     7px 0px     7px 0px          ;
;            <----->     <----->     <----->          ;
;       -----       -----       -----       -----     ;
;                                                     ;
; =================================================== ;

; ====== Interfaces ====== ;
struct Point 
    x   GLfloat ?
    y   GLfloat ?
ends

struct Rect 
    v1      Point   ?
    v2      Point   ?
    v3      Point   ?
    v4      Point   ?
ends

struct Rects 
    rct1    Rect    ?
    rct2    Rect    ?
    rct3    Rect    ?
    rct4    Rect    ?
    rct5    Rect    ?
    rct6    Rect    ?
    rct7    Rect    ?
ends

struct Circle 
    center   Point   ?
    radius   dd      ?
    dots     dd      2882 dup(?)
ends

struct Circles
    crcl1    Circle ?
    crcl2    Circle ?
    crcl3    Circle ?
    crcl4    Circle ?
ends

struct DrawModel
    rectsCount      dd      ?
    rects           Rects   ?
    circlesCount    dd      ?
    circles         Circles ?
ends

degreeCount         dd  1440
curentDeg           dd  0
curentRudDeg        dd  ?

; ====== Program models ====== ;
font_design                   DrawModel   ?

book_root_design              DrawModel   ?
book_endg_design              DrawModel   ?
book_brdcrn_design            DrawModel   ?
book_corner_design            DrawModel   ?
book_brdfnt_design            DrawModel   ?
book_brd_design               DrawModel   ?
book_flgpl_design             DrawModel   ?

button_play_design            DrawModel   ?
button_about_design           DrawModel   ?
button_stngs_design           DrawModel   ?

game_border_design            DrawModel   ?
game_garbage_font_design      DrawModel   ?
game_garbabe_border_design    DrawModel   ?
game_tick_c1_design           DrawModel   ?
game_tick_c2_design           DrawModel   ?
game_tick_c3_design           DrawModel   ?
game_tick_c4_design           DrawModel   ?
game_tick_c5_design           DrawModel   ?
maingame_font_design          DrawModel   ?
maingame_font_circle_design   DrawModel   ?
maingame_gameborder_design1   DrawModel   ?
maingame_gameborder_design2   DrawModel   ?
maingame_tick_decup_design    DrawModel   ?
maingame_tick_decdn_design    DrawModel   ?
game_tickfont_c1_design       DrawModel   ?
game_tickfont_c2_design       DrawModel   ?

; ====== Business models ====== ;
font_coords         dd  1,\
                        0, 0, 1920, 1080,\
                        0
book_root_coords    dd  1,\
                        350, 300, 370, 968,\
                        0
book_endg_coords    dd  2,\
                        370, 300, 780, 968,\
                        780, 340, 820, 928,\
                        0
book_corner_coords  dd  0,\
                        2,\
                        780, 340, 40,\
                        780, 928, 40
book_brdcrn_coords  dd  0,\
                        2,\
                        780, 340, 32,\
                        780, 928, 32
book_brdfnt_coords  dd  0,\
                        2,\
                        780, 340, 29,\
                        780, 928, 29
book_brd_coords     dd  3,\
                        373, 308, 781, 311,\
                        809, 340, 811, 927,\
                        373, 957, 781, 960,\
                        0
book_flgpl_coords   dd  3,\
                        589, 504, 593, 594,\
                        588, 594, 594, 739,\
                        586, 739, 596, 826,\
                        2,\
                        591, 739, 16,\
                        591, 594, 12
button_play_coords  dd  2,\
                        1080, 316, 1540, 467,\
                        1050, 346, 1570, 437,\
                        4,\
                        1080, 346, 30,\
                        1080, 437, 30,\
                        1540, 346, 30,\
                        1540, 437, 30
                        ; 558 - 482 = 130
button_about_coords dd  2,\
                        1080, 482, 1540, 633,\
                        1050, 512, 1570, 603,\
                        4,\
                        1080, 512, 30,\
                        1080, 603, 30,\
                        1540, 512, 30,\
                        1540, 603, 30
button_stngs_coords dd  2,\
                        1080, 648, 1540, 799,\
                        1050, 678, 1570, 769,\
                        4,\
                        1080, 678, 30,\
                        1080, 769, 30,\
                        1540, 678, 30,\
                        1540, 769, 30
button_exit_design DrawModel ?
button_exit_coords dd  2,\
                        1080, 814, 1540, 965,\
                        1050, 844, 1570, 935,\
                        4,\
                        1080, 844, 30,\
                        1080, 935, 30,\
                        1540, 844, 30,\
                        1540, 935, 30
book_strk_design    dd          95,\
                                353, 311, 367, 313, ?, ?, ?, ?,\ ; 1
                                353, 317, 367, 320, ?, ?, ?, ?,\ ; 2
                                353, 324, 367, 327, ?, ?, ?, ?,\ ; 3
                                353, 331, 367, 334, ?, ?, ?, ?,\ ; 4
                                353, 338, 367, 341, ?, ?, ?, ?,\ ; 5
                                353, 345, 367, 347, ?, ?, ?, ?,\ ; 6
                                353, 352, 367, 354, ?, ?, ?, ?,\ ; 7
                                353, 358, 367, 361, ?, ?, ?, ?,\ ; 8
                                353, 365, 367, 368, ?, ?, ?, ?,\ ; 9
                                353, 372, 367, 375, ?, ?, ?, ?,\ ; 10
                                353, 379, 367, 382, ?, ?, ?, ?,\ ; 11
                                353, 386, 367, 388, ?, ?, ?, ?,\ ; 12
                                353, 392, 367, 395, ?, ?, ?, ?,\ ; 13
                                353, 399, 367, 402, ?, ?, ?, ?,\ ; 14
                                353, 406, 367, 408, ?, ?, ?, ?,\ ; 15
                                353, 413, 367, 415, ?, ?, ?, ?,\ ; 16
                                353, 420, 367, 422, ?, ?, ?, ?,\ ; 17
                                353, 426, 367, 429, ?, ?, ?, ?,\ ; 18
                                353, 433, 367, 436, ?, ?, ?, ?,\ ; 19
                                353, 440, 367, 442, ?, ?, ?, ?,\ ; 20
                                353, 447, 367, 449, ?, ?, ?, ?,\ ; 21
                                353, 454, 367, 456, ?, ?, ?, ?,\ ; 22
                                353, 461, 367, 463, ?, ?, ?, ?,\ ; 23
                                353, 467, 367, 470, ?, ?, ?, ?,\ ; 24
                                353, 474, 367, 477, ?, ?, ?, ?,\ ; 25
                                353, 481, 367, 483, ?, ?, ?, ?,\ ; 26
                                353, 488, 367, 490, ?, ?, ?, ?,\ ; 27
                                353, 495, 367, 497, ?, ?, ?, ?,\ ; 28
                                353, 501, 367, 504, ?, ?, ?, ?,\ ; 29
                                353, 508, 367, 511, ?, ?, ?, ?,\ ; 30
                                353, 515, 367, 518, ?, ?, ?, ?,\ ; 31
                                353, 522, 367, 525, ?, ?, ?, ?,\ ; 32
                                353, 529, 367, 531, ?, ?, ?, ?,\ ; 33
                                353, 535, 367, 538, ?, ?, ?, ?,\ ; 34
                                353, 542, 367, 545, ?, ?, ?, ?,\ ; 35
                                353, 549, 367, 552, ?, ?, ?, ?,\ ; 36
                                353, 556, 367, 559, ?, ?, ?, ?,\ ; 37
                                353, 563, 367, 565, ?, ?, ?, ?,\ ; 38
                                353, 569, 367, 572, ?, ?, ?, ?,\ ; 39
                                353, 576, 367, 579, ?, ?, ?, ?,\ ; 40
                                353, 583, 367, 586, ?, ?, ?, ?,\ ; 41
                                353, 590, 367, 593, ?, ?, ?, ?,\ ; 42
                                353, 597, 367, 599, ?, ?, ?, ?,\ ; 43
                                353, 604, 367, 606, ?, ?, ?, ?,\ ; 44
                                353, 610, 367, 613, ?, ?, ?, ?,\ ; 45
                                353, 617, 367, 620, ?, ?, ?, ?,\ ; 46
                                353, 624, 367, 627, ?, ?, ?, ?,\ ; 47
                                353, 631, 367, 633, ?, ?, ?, ?,\ ; 48
                                353, 638, 367, 640, ?, ?, ?, ?,\ ; 49
                                353, 644, 367, 647, ?, ?, ?, ?,\ ; 50
                                353, 651, 367, 654, ?, ?, ?, ?,\ ; 51
                                353, 658, 367, 660, ?, ?, ?, ?,\ ; 52
                                353, 665, 367, 667, ?, ?, ?, ?,\ ; 53
                                353, 672, 367, 674, ?, ?, ?, ?,\ ; 54
                                353, 678, 367, 681, ?, ?, ?, ?,\ ; 55
                                353, 685, 367, 688, ?, ?, ?, ?,\ ; 56
                                353, 692, 367, 695, ?, ?, ?, ?,\ ; 57
                                353, 699, 367, 702, ?, ?, ?, ?,\ ; 58
                                353, 706, 367, 708, ?, ?, ?, ?,\ ; 59
                                353, 712, 367, 715, ?, ?, ?, ?,\ ; 60
                                353, 719, 367, 722, ?, ?, ?, ?,\ ; 61
                                353, 726, 367, 729, ?, ?, ?, ?,\ ; 62
                                353, 733, 367, 736, ?, ?, ?, ?,\ ; 63
                                353, 740, 367, 742, ?, ?, ?, ?,\ ; 64
                                353, 747, 367, 749, ?, ?, ?, ?,\ ; 65
                                353, 753, 367, 756, ?, ?, ?, ?,\ ; 66
                                353, 760, 367, 763, ?, ?, ?, ?,\ ; 67
                                353, 767, 367, 770, ?, ?, ?, ?,\ ; 68
                                353, 774, 367, 776, ?, ?, ?, ?,\ ; 69
                                353, 781, 367, 783, ?, ?, ?, ?,\ ; 70
                                353, 787, 367, 790, ?, ?, ?, ?,\ ; 71
                                353, 794, 367, 797, ?, ?, ?, ?,\ ; 72
                                353, 801, 367, 804, ?, ?, ?, ?,\ ; 73
                                353, 808, 367, 811, ?, ?, ?, ?,\ ; 74
                                353, 814, 367, 817, ?, ?, ?, ?,\ ; 75
                                353, 821, 367, 824, ?, ?, ?, ?,\ ; 76
                                353, 828, 367, 831, ?, ?, ?, ?,\ ; 77
                                353, 835, 367, 838, ?, ?, ?, ?,\ ; 78
                                353, 842, 367, 845, ?, ?, ?, ?,\ ; 79
                                353, 849, 367, 851, ?, ?, ?, ?,\ ; 80
                                353, 855, 367, 858, ?, ?, ?, ?,\ ; 81
                                353, 862, 367, 865, ?, ?, ?, ?,\ ; 82
                                353, 869, 367, 872, ?, ?, ?, ?,\ ; 83
                                353, 876, 367, 879, ?, ?, ?, ?,\ ; 84
                                353, 883, 367, 885, ?, ?, ?, ?,\ ; 85
                                353, 890, 367, 892, ?, ?, ?, ?,\ ; 86
                                353, 896, 367, 899, ?, ?, ?, ?,\ ; 87
                                353, 903, 367, 905, ?, ?, ?, ?,\ ; 88
                                353, 910, 367, 912, ?, ?, ?, ?,\ ; 89
                                353, 917, 367, 919, ?, ?, ?, ?,\ ; 90
                                353, 924, 367, 926, ?, ?, ?, ?,\ ; 91
                                353, 930, 367, 933, ?, ?, ?, ?,\ ; 92
                                353, 937, 367, 940, ?, ?, ?, ?,\ ; 93
                                353, 944, 367, 947, ?, ?, ?, ?,\ ; 94
                                353, 951, 367, 954, ?, ?, ?, ?,\ ; 95
                                0

mp_gamefont_design  DrawModel   ?
mp_gamefont_coords  dd  1,\
                        700, 194, 1220, 714,\
                        0
mp_gamebrdr_design  DrawModel   ?
mg_gamebrdr_coords  dd  2,\
                         692, 176, 1228, 889,\
                         682, 186, 1238, 879,\
                        4,\
                         692, 186, 10,\
                         692, 879, 10,\
                        1228, 186, 10,\
                        1228, 879, 10
mp_grbgbrdr_design  DrawModel   ?
mp_grbgbrdr_coords  dd  1,\
                        691, 731, 1229, 880,\
                        0
mp_grbgfont_design  DrawModel   ?
mp_grbgfont_coords  dd  2,\
                         700, 734, 1220, 876,\
                         695, 739, 1225, 871,\
                        4,\
                         700, 739, 5,\
                         700, 871, 5,\
                        1220, 739, 5,\
                        1220, 871, 5
mp_fntvertln_design DrawModel   ?
mp_fntvertln_coords dd  7,\
                        700, 222, 1220, 218,\
                        805, 301, 1117, 295,\
                        700, 379, 1220, 373,\
                        700, 457, 1220, 451,\
                        700, 535, 1220, 529,\
                        805, 613, 1117, 606,\
                        700, 691, 1220, 685,\
                        0
mp_fnthortln_design  DrawModel   ?
mp_fnthortln_coords dd  7,\
                         730, 715,  724, 191,\
                         807, 610,  801, 298,\
                         886, 715,  880, 191,\
                         964, 715,  958, 191,\
                        1042, 715, 1036, 191,\
                        1120, 610, 1114, 298,\
                        1197, 715, 1191, 191,\
                        0                     
                        
exitbtn_font_design DrawModel    ?
exitbtn_font_coords dd  2,\
                          30,  989,  235, 1055,\
                          25,  994,  240, 1050,\ 
                        4,\
                         235,  994, 5,\
                         235, 1050, 5,\  
                          30, 1050, 5,\
                          30,  994, 5

lp_bar_brdr1_design DrawModel   ? 
lp_bar_brdr1_coords dd  1,\
                        631, 776, 1287, 822,\
                        2,\
                         631, 799, 23,\
                        1287, 799, 23
lp_bar_brdr2_design DrawModel   ? 
lp_bar_brdr2_coords dd  1,\
                        631, 779, 1286, 819,\
                        2,\
                         631, 799, 20,\
                        1287, 799, 20
lp_bar_brdr3_design DrawModel   ? 
lp_bar_brdr3_coords dd  1,\
                        632, 781, 1286, 816,\
                        2,\
                         632, 799, 17,\
                        1286, 799, 17
lp_bar_main_design DrawModel   ? 
lp_bar_main_coords dd   1,\
                        632, 781, 632, 816,\ ; from 632 to 1286
                        2,\
                         632, 799, 17,\
                         632, 799, 17


; recovery button
recovery_btn_fnt_design DrawModel   ? 
recovery_btn_fnt_coords dd  2,\
                            1790, 10, 1830, 70,\
                            1780, 20, 1840, 60,\
                            4,\
                            1790, 20, 10,\
                            1790, 60, 10,\
                            1830, 20, 10,\
                            1830, 60, 10
recovery_btn_out_circle_design DrawModel ?
recovery_btn_out_circle_coords dd  0,\
                                   1,\
                                   1810, 40, 21
recovery_btn_in_circle_design  DrawModel ?
recovery_btn_in_circle_coords  dd  0,\
                                   1,\
                                   1810, 40, 16
recovery_btn_fntblock_design   DrawModel ?
recovery_btn_fntblock_coords   dd  1,\
                                   1785, 33, 1833, 46,\
                                   0
recovery_btn_lftriangle_design   DrawModel ?
recovery_btn_lftriangle_coords   dd  4,\
                                     1791, 38, 1793, 40,\
                                     1790, 40, 1794, 42,\
                                     1789, 42, 1795, 44,\
                                     1788, 44, 1796, 46,\
                                     0
recovery_btn_rgtriangle_design   DrawModel ?
recovery_btn_rgtriangle_coords   dd  4,\
                                     1823, 33, 1831, 35,\
                                     1824, 35, 1830, 37,\
                                     1825, 37, 1829, 39,\
                                     1826, 39, 1828, 41,\
                                     0
; settings button
settings_btn_fnt_design DrawModel ?
settings_btn_fnt_coords dd 2,\
                           1860, 10, 1900, 70,\
                           1850, 20, 1910, 60,\
                           4,\
                           1860, 20, 10,\
                           1860, 60, 10,\
                           1900, 20, 10,\
                           1900, 60, 10
settings_btn_out_circle_design  DrawModel   ?
settings_btn_out_circle_coords  dd  0,\
                                    1,\
                                    1880, 40, 19
settings_btn_in_circle_design   DrawModel   ?
settings_btn_in_circle_coords   dd  0,\
                                    1,\
                                    1880, 40, 15
settings_btn_mainline_design    DrawModel   ?
settings_btn_mainline_coords    dd  4,\
                                    1856, 38, 1862, 44,\
                                    1877, 16, 1883, 22,\
                                    1898, 38, 1904, 44,\
                                    1877, 58, 1883, 64,\
                                    0
settings_btn_subline_design     DrawModel   ?
settings_btn_subline_coords     dd  4,\
                                    1861, 55, 1865, 59, 1869, 54, 1865, 50,\
                                    1895, 59, 1899, 55, 1894, 50, 1890, 54,\
                                    1899, 25, 1895, 21, 1890, 25, 1895, 29,\
                                    1865, 29, 1869, 25, 1864, 20, 1860, 24,\
                                    0
; pause button
pause_btn_fnt_design    DrawModel ?
pause_btn_fnt_coords    dd  2,\
                            1720, 10, 1760, 70,\
                            1710, 20, 1770, 60,\
                            4,\
                            1720, 20, 10,\
                            1720, 60, 10,\
                            1760, 20, 10,\
                            1760, 60, 10
pause_btn_lines_design  DrawModel ?
pause_btn_lines_coords  dd  2,\
                            1724, 25, 1730, 54,\
                            1750, 25, 1756, 54,\
                            4,\
                            1727, 25, 3,\
                            1727, 54, 3,\
                            1753, 25, 3,\
                            1753, 54, 3

; pause page
pp_border_desing    DrawModel   ?
pp_border_coords    dd  2,\
                        725, 430, 1195, 640,\ 
                        705, 450, 1215, 620,\
                        4,\
                        725, 450, 20,\
                        725, 620, 20,\
                        1195, 450, 20,\
                        1195, 620, 20
pp_font_desing    DrawModel   ?
pp_font_coords    dd  2,\
                        730, 435, 1190, 635,\ 
                        710, 455, 1210, 615,\
                        4,\
                         727, 452, 17,\
                         727, 618, 17,\
                        1193, 452, 17,\
                        1193, 618, 17
pp_return_circle_desing  DrawModel ?
pp_return_circle_coords  dd   0,\
                              1,\
                              1193, 452, 13
pp_return_chrest_design DrawModel ?
pp_return_chrest_coords dd  2,\
                            1185, 457, 1189, 457, 1201, 445, 1197, 445,\
                            1185, 445, 1189, 445, 1201, 457, 1197, 457,\
                            0
pp_esbtn_brdr_design DrawModel ?
pp_esbtn_brdr_coords dd 2,\
                          790, 510, 1130, 564,\
                          780, 520, 1140, 554,\
                          4,\
                           790, 520, 10,\
                           790, 554, 10,\
                          1130, 520, 10,\
                          1130, 554, 10
pp_esbtn_font_desing DrawModel ?
pp_esbtn_font_coords dd 2,\
                          790, 512, 1130, 561,\
                          782, 520, 1138, 551,\
                          4,\
                           790, 520, 8,\
                           790, 553, 8,\
                          1130, 520, 8,\
                          1130, 553, 8
pp_ebtn_brdr_design DrawModel ?
pp_ebtn_brdr_coords dd 2,\
                       863, 576, 1057, 621,\
                       853, 586, 1067, 611,\
                       4,\
                        863, 586, 10,\
                        863, 611, 10,\
                       1057, 586, 10,\
                       1057, 611, 10
pp_ebtn_font_desing DrawModel ?
pp_ebtn_font_coords dd 2,\
                       863, 578, 1057, 619,\
                       855, 586, 1065, 611,\
                       4,\
                        863, 586, 8,\
                        863, 611, 8,\
                       1057, 586, 8,\
                       1057, 611, 8

; winner page
wp_border_design    DrawModel   ?
wp_border_coords    dd          2,\
                                725, 372, 1195, 707,\
                                705, 392, 1215, 687,\
                                4,\
                                725, 392, 20,\
                                725, 687, 20,\
                                1195, 392, 20,\
                                1195, 687, 20
wp_font_desing      DrawModel   ?
wp_font_coords      dd          2,\
                                727, 377, 1193, 702,\
                                710, 394, 1210, 685,\
                                4,\
                                 727, 394, 17,\
                                 727, 685, 17,\
                                1193, 394, 17,\
                                1193, 685, 17
wp_return_circle_desing  DrawModel ?
wp_return_circle_coords  dd   0,\
                              1,\
                              1193, 394, 14
wp_return_chrest_design DrawModel ?
wp_return_chrest_coords dd  2,\
                            1185, 388, 1189, 388, 1201, 400, 1197, 400,\
                            1185, 400, 1189, 400, 1201, 388, 1197, 388,\
                            0
wp_line_design  DrawModel   ?
wp_line_coords  dd          1,\
                            710, 502, 1210, 504,\
                            0
wp_againbtn_brdr_design DrawModel   ?
wp_againbtn_brdr_coords dd          2,\
                                    851, 520, 1075, 564,\
                                    841, 530, 1085, 554,\
                                    4,\
                                     851, 530, 10,\
                                     851, 554, 10,\
                                    1075, 530, 10,\
                                    1075, 554, 10
wp_againbtn_font_design DrawModel   ?
wp_againbtn_font_coords dd          2,\
                                    851, 522, 1075, 562,\
                                    843, 530, 1083, 554,\
                                    4,\
                                     851, 530, 8,\
                                     851, 554, 8,\
                                    1075, 530, 8,\
                                    1075, 554, 8
wp_exitbtn_brdr_design  DrawModel   ?
wp_exitbtn_brdr_coords  dd          2,\
                                    851, 580, 1075, 624,\
                                    841, 590, 1085, 614,\
                                    4,\
                                     851, 590, 10,\
                                     851, 614, 10,\
                                    1075, 590, 10,\
                                    1075, 614, 10
wp_exitbtn_font_design  DrawModel   ?
wp_exitbtn_font_coords  dd          2,\
                                    851, 582, 1075, 622,\
                                    843, 590, 1083, 614,\
                                    4,\
                                     851, 590, 8,\
                                     851, 614, 8,\
                                    1075, 590, 8,\
                                    1075, 614, 8
wp_leadbtn_brdr_design  DrawModel   ?
wp_leadbtn_brdr_coords  dd          2,\
                                    851, 640, 1075, 684,\
                                    841, 650, 1085, 674,\
                                    4,\
                                     851, 650, 10,\
                                     851, 674, 10,\
                                    1075, 650, 10,\
                                    1075, 674, 10
wp_leadbtn_font_design  DrawModel   ?
wp_leadbtn_font_coords  dd          2,\
                                    851, 642, 1075, 682,\
                                    843, 650, 1083, 674,\
                                    4,\
                                     851, 650, 8,\
                                     851, 674, 8,\
                                    1075, 650, 8,\
                                    1075, 674, 8
; settings page
sp_border_design    DrawModel   ?
sp_border_coords    dd  2,\
                        725, 393, 1195, 687,\ 
                        705, 413, 1215, 667,\
                        4,\
                        725, 413, 20,\
                        725, 667, 20,\
                        1195, 413, 20,\
                        1195, 667, 20
sp_font_design    DrawModel   ?
sp_font_coords    dd  2,\
                        727, 398, 1193, 682,\ 
                        710, 415, 1210, 665,\
                        4,\
                         727, 415, 17,\
                         727, 665, 17,\
                        1193, 415, 17,\
                        1193, 665, 17
sp_return_circle_design  DrawModel ?
sp_return_circle_coords  dd   0,\
                              1,\
                              1193, 415, 13
sp_return_chrest_design DrawModel ?
sp_return_chrest_coords dd  2,\
                            1185, 409, 1189, 409, 1201, 421, 1197, 421,\
                            1185, 421, 1189, 421, 1201, 409, 1197, 409,\
                            0
sp_lines_design         DrawModel ?
sp_lines_coords         dd  2,\
                            710, 482, 1210, 484,\
                            710, 582, 1210, 584,\
                            0
sp_chhkbrdr_design      DrawModel ?
sp_chhkbrdr_coords      dd  2,\
                            813, 631, 1107, 665,\
                            808, 636, 1112, 660,\
                            4,\
                             813, 636, 5,\
                             813, 660, 5,\
                            1107, 636, 5,\
                            1107, 660, 5
sp_chhkfont_design      DrawModel ?
sp_chhkfont_coords      dd  2,\
                            813, 633, 1107, 663,\
                            810, 636, 1110, 660,\
                            4,\
                             813, 636, 3,\
                             813, 660, 3,\
                            1107, 636, 3,\
                            1107, 660, 3
sp_switch_mbrdr_design DrawModel ?
sp_switch_mbrdr_coords dd  2,\
                            900, 542, 953, 562,\
                            898, 544, 955, 560,\
                            4,\
                            900, 544, 2,\
                            900, 560, 2,\
                            953, 544, 2,\
                            953, 560, 2
sp_switch_mfont_design DrawModel ?
sp_switch_mfont_coords dd  2,\
                             900, 543, 953, 561,\
                             899, 544, 954, 560,\
                             4,\
                             900, 545, 1,\
                             900, 560, 1,\
                             953, 545, 1,\
                             953, 560, 1
sp_switch_moff_design  DrawModel ?
sp_switch_moff_coords  dd   2,\
                            903, 545, 913, 559,\
                            901, 547, 915, 557,\
                            4,\
                            903, 547, 2,\
                            903, 557, 2,\
                            913, 547, 2,\
                            913, 557, 2
sp_switch_mon_design   DrawModel ?
sp_switch_mon_coords   dd   2,\
                            940, 545, 950, 559,\
                            938, 547, 952, 557,\
                            4,\
                            940, 547, 2,\
                            940, 557, 2,\
                            950, 547, 2,\
                            950, 557, 2
sp_switch_vbrdr_design DrawModel ?
sp_switch_vbrdr_coords dd  2,\
                            1081, 542, 1134, 562,\
                            1079, 544, 1136, 560,\
                            4,\
                            1134, 544, 2,\
                            1134, 560, 2,\
                            1081, 544, 2,\
                            1081, 560, 2
sp_switch_vfont_design DrawModel ?
sp_switch_vfont_coords dd  2,\
                            1081, 543, 1134, 561,\
                            1080, 545, 1135, 560,\
                            4,\
                            1081, 545, 1,\
                            1081, 560, 1,\
                            1134, 545, 1,\
                            1134, 560, 1
sp_switch_voff_design   DrawModel ?
sp_switch_voff_coords   dd  2,\
                            1084, 545, 1094, 559,\
                            1082, 547, 1096, 557,\
                            4,\
                            1084, 547, 2,\
                            1084, 557, 2,\
                            1094, 547, 2,\
                            1094, 557, 2
sp_switch_von_design    DrawModel ?
sp_switch_von_coords    dd  2,\
                            1121, 545, 1130, 559,\
                            1119, 547, 1132, 557,\
                            4,\
                            1121, 547, 2,\
                            1121, 557, 2,\
                            1130, 547, 2,\
                            1130, 557, 2
sp_switch_hbrdr_design DrawModel ?
sp_switch_hbrdr_coords dd  2,\
                            1062, 600, 1115, 620,\
                            1060, 602, 1117, 618,\
                            4,\
                            1062, 602, 2,\
                            1062, 618, 2,\
                            1115, 602, 2,\
                            1115, 618, 2
sp_switch_hfont_design DrawModel ?
sp_switch_hfont_coords dd  2,\
                            1062, 601, 1115, 619,\
                            1061, 602, 1116, 618,\
                            4,\
                            1062, 602, 1,\
                            1062, 618, 1,\
                            1115, 602, 1,\
                            1115, 618, 1
sp_switch_hoff_design   DrawModel ?
sp_switch_hoff_coords   dd  2,\
                            1065, 603, 1075, 617,\
                            1063, 605, 1077, 615,\
                            4,\
                            1065, 605, 2,\
                            1065, 615, 2,\
                            1075, 605, 2,\
                            1075, 615, 2
sp_switch_hon_design    DrawModel ?
sp_switch_hon_coords    dd  2,\
                            1102, 603, 1112, 617,\
                            1100, 605, 1114, 615,\
                            4,\
                            1102, 605, 2,\
                            1102, 615, 2,\
                            1112, 605, 2,\
                            1112, 615, 2
sp_volume_font_design   DrawModel ?
sp_volume_font_coords   dd  2,\
                            918, 514, 1164, 520,\
                            916, 516, 1166, 518,\
                            4,\
                            918, 516, 2,\
                            918, 518, 2,\
                            1164, 516, 2,\
                            1164, 518, 2
sp_volume_cmpl_design   DrawModel ?
sp_volume_cmpl_coords   dd  2,\
                            918, 514, 976, 520,\
                            916, 516, 978, 518,\
                            4,\
                            918, 516, 2,\
                            918, 518, 2,\
                            976, 516, 2,\
                            976, 518, 2
sp_volume_dot_design    DrawModel  ?
sp_volume_dot_coords    dd  0,\
                            1,\
                            977, 517, 7
; hotkeys page
hp_border_design    DrawModel   ?
hp_border_coords    dd          2,\
                                667, 393, 1253, 686,\
                                647, 413, 1273, 666,\
                                4,\
                                 667, 413, 20,\
                                 667, 666, 20,\
                                1253, 413, 20,\
                                1253, 666, 20
hp_font_desing      DrawModel   ?
hp_font_coords      dd          2,\
                                669, 398, 1251, 681,\
                                652, 415, 1268, 664,\
                                4,\
                                 669, 415, 17,\
                                 669, 664, 17,\
                                1251, 415, 17,\
                                1251, 664, 17
hp_return_circle_desing  DrawModel ?
hp_return_circle_coords  dd   0,\
                              1,\
                              1251, 414, 13
hp_return_chrest_design DrawModel ?
hp_return_chrest_coords dd  2,\
                            1244, 408, 1248, 408, 1260, 420, 1256, 420,\
                            1244, 420, 1248, 420, 1260, 408, 1256, 408,\
                            0
; exit page
ep_border_design    DrawModel   ?
ep_border_coords    dd          2,\
                                745, 450, 1175, 630,\
                                725, 470, 1195, 610,\
                                4,\
                                 745, 470, 20,\
                                 745, 610, 20,\
                                1175, 470, 20,\
                                1175, 610, 20
ep_font_desing      DrawModel   ?
ep_font_coords      dd          2,\
                                747, 455, 1173, 625,\
                                730, 472, 1190, 608,\
                                4,\
                                 747, 472, 17,\
                                 747, 608, 17,\
                                1173, 472, 17,\
                                1173, 608, 17
ep_yes_brdr_design  DrawModel   ?
ep_yes_brdr_coords  dd          2,\
                                767, 543, 947, 597,\
                                757, 553, 957, 587,\
                                4,\
                                767, 553, 10,\
                                767, 587, 10,\
                                947, 553, 10,\
                                947, 587, 10
ep_yes_font_design  DrawModel   ?
ep_yes_font_coords  dd          2,\
                                767, 545, 946, 595,\ 
                                759, 553, 954, 587,\ 
                                4,\
                                767, 553, 8,\
                                767, 587, 8,\
                                946, 553, 8,\
                                946, 587, 8
ep_no_brdr_design   DrawModel   ?
ep_no_brdr_coords   dd          2,\
                                972, 543, 1152, 597,\
                                962, 553, 1162, 587,\
                                4,\
                                972, 553, 10,\
                                972, 587, 10,\
                                1152, 553, 10,\
                                1152, 587, 10                              
ep_no_font_design   DrawModel   ?
ep_no_font_coords   dd          2,\
                                972, 545, 1152, 595,\
                                964, 553, 1160, 587,\
                                4,\
                                972, 553, 8,\
                                972, 587, 8,\
                                1152, 553, 8,\
                                1152, 587, 8
