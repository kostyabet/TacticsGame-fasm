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
    dots     dd      5762 dup(?)
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

degreeCount         dd  2880
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
button_about_coords dd  2,\
                        1080, 558, 1540, 709,\
                        1050, 588, 1570, 683,\
                        4,\
                        1080, 588, 30,\
                        1080, 679, 30,\
                        1540, 588, 30,\
                        1540, 679, 30
button_stngs_coords dd  2,\
                        1080, 800, 1540, 951,\
                        1050, 830, 1570, 925,\
                        4,\
                        1080, 830, 30,\
                        1080, 921, 30,\
                        1540, 830, 30,\
                        1540, 921, 30
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

game_border_coords    dd        2,\
                                682, 185, 1236, 879,\
                                692, 175, 1226, 888,\
                                4,\
                                 692, 185, 10,\
                                1226, 185, 10,\
                                 692, 878, 10,\
                                1226, 878, 10 
game_garbage_font_coords    dd  1,\
                                691, 731, 1229, 880,\
                                0
game_garbabe_border_coords  dd  2,\
                                700, 735, 1221, 876,\
                                695, 740, 1226, 871,\
                                4,\
                                 700, 740, 5,\
                                1221, 740, 5,\
                                 700, 871, 5,\
                                1221, 871, 5
maingame_font_coords        dd  1,\
                                700, 194, 1220, 714,\
                                0
maingame_font_circle_coords dd  0,\
                                4,\
                                 709, 194, 111,\
                                 709, 714, 111,\
                                1210, 194, 111,\
                                1210, 714, 111
maingame_gameborder_coords1 dd  7,\
                                700, 223, 1220, 217,\
                                805, 301, 1117, 295,\
                                700, 379, 1220, 373,\ 
                                700, 457, 1220, 451,\
                                700, 535, 1220, 529,\
                                805, 613, 1117, 606,\
                                700, 691, 1220, 685,\
                                0
maingame_gameborder_coords2 dd  7,\
                                 730, 714,  724, 193,\
                                 807, 610,  801, 298,\
                                 886, 714,  880, 193,\
                                 964, 714,  958, 193,\
                                1042, 714, 1036, 193,\
                                1120, 610, 1112, 298,\
                                1197, 714, 1191, 193,\
                                0
maingame_tick_decup_coords  dd  0,\
                                4,\
                                 805, 298, 15,\
                                1117, 298, 15,\
                                 805, 610, 15,\
                                1117, 610, 15
maingame_tick_decdn_coords  dd  0,\
                                4,\
                                 805, 298, 5,\
                                1117, 298, 5,\
                                 805, 610, 5,\
                                1117, 610, 5


game_tick_c1_coords         dd  0,\
                                1,\
                                17, 17, 17
game_tick_c2_coords         dd  0,\
                                1,\
                                17, 17, 15
game_tick_c3_coords         dd  0,\
                                1,\
                                17, 17, 12
game_tick_c4_coords         dd  0,\
                                1,\
                                17, 17, 7
game_tick_c5_coords         dd  0,\
                                1,\
                                17, 17, 2
game_tick_coords            dd  game_tick_c1_coords,\
                                game_tick_c2_coords,\ 
                                game_tick_c3_coords,\
                                game_tick_c4_coords,\
                                game_tick_c5_coords
game_tickfont_c1_coords     dd  0,\
                                1,\
                                17, 17, 17
game_tickfont_c2_coords     dd  0,\
                                1,\
                                17, 17, 13
game_tickfont_coords        dd  game_tickfont_c1_coords,\
                                game_tickfont_c2_coords