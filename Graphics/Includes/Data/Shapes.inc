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
ends

struct Circle 
    center   Point   ?
    dots     dd      722 dup(?)
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

degreeCount         dd  360
curentDeg           dd  0
curentRudDeg        dd  ?

; ====== Program models ====== ;
font_design         DrawModel   ?

book_root_design    DrawModel   ?
book_strk_design    DrawModel   ?
book_endg_design    DrawModel   ?
book_brdcrn_design  DrawModel   ?
book_corner_design  DrawModel   ?
book_brdfnt_design  DrawModel   ?
book_brd_design     DrawModel   ?
book_flgpl_design   DrawModel   ?

button_play_design  DrawModel   ?
button_about_design DrawModel   ?
button_stngs_design DrawModel   ?

; ====== Business models ====== ;
font_coords         dd  1,\
                        0, 0, 1920, 1080,\
                        0
book_root_coords    dd  1,\
                        350, 300, 370, 968,\
                        0
book_strk_coords    dd  1,\
                        353, 311, 367, 313,\
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
                        1050, 588, 1570, 679,\
                        4,\
                        1080, 588, 30,\
                        1080, 679, 30,\
                        1540, 588, 30,\
                        1540, 679, 30
button_stngs_coords dd  2,\
                        1080, 800, 1540, 951,\
                        1050, 830, 1570, 921,\
                        4,\
                        1080, 830, 30,\
                        1080, 921, 30,\ ;242 y
                        1540, 830, 30,\
                        1540, 921, 30

; repeat info
book_strk_repinfo   dd  80,\
                        0, 6