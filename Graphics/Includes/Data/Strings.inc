; ==================== Documentation ==================== ;
;                                                         ;
;   tg_:                                                  ;
;      One of the properties of the text,                 ;
;       the value of gap betwen letters                   ;
;       in the `%` dimension:                             ;
;           0% = 10px is the DEFAULT FONT GAP.            ;
;           +1% == +1px                                   ;
;      DEFAULT FONT GAP - the basic font gap              ;
;       between basic Letters are presented.              ;
;      Default font gap visualization:                    ;
;                                  ______                 ;
;                  /\             |                       ;
;                 /  \            |______                 ;
;                /____\           |      |                ;
;               /      \   10px   |______|                ;
;                       <-------->                        ;
;                                                         ;
;   txt_:                                                 ;
;     The text to be displayed on the screen.             ;
;     '\0' is the end of the line character.              ;
;     The idea is taken from the implementation           ;
;      of C-strings.                                      ;
;     Next value is Font Sizee (see Letters.inc)          ;
;     Last value is Text Gap.                             ;
;                                                         ;
; ======================================================= ;

; Text Gap
tg_default      =       0
tg_headline     =       30
tg_play         =       30
tg_about        =       30
tg_settings     =       30
tg_title        =       30
tg_cost         =       0
tg_info         =       0
tg_watermark    =       5

; ====== Interfaces ====== ;
struct Points
    p1       Point   ?
    p2       Point   ?
    p3       Point   ?
    p4       Point   ?
ends

struct QUAD
    points   Points  ?
ends

struct Quads
    q1       QUAD    ?
    q2       QUAD    ?
    q3       QUAD    ?
    q4       QUAD    ?
    q5       QUAD    ?
    q6       QUAD    ?
    q7       QUAD    ?
ends

struct Char
    len      dd      ?
    quads    Quads   ?
ends

struct Chars 
    c1       Char    ?
    c2       Char    ?
    c3       Char    ?
    c4       Char    ?
    c5       Char    ?
    c6       Char    ?
    c7       Char    ?
    c8       Char    ?
    c9       Char    ?
    c10      Char    ?
    c11      Char    ?
    c12      Char    ?
    c13      Char    ?
    c14      Char    ?
    c15      Char    ?
    c16      Char    ?
    c17      Char    ?
    c18      Char    ?
    c19      Char    ?
    c20      Char    ?
ends

struct String
    len     dd       0
    chars   Chars    ?
ends

; ====== Business models ====== ;
str_headline        ds      'ТАКТИКА', 0 ; 'ТАКТИКА'
str_headline_pos    dd      683, 112

str_play            db      'ИГРАТЬ', 0
str_about           db      'ОБ ИГРЕ', 0
str_settings        db      'НАСТРОЙКИ', 0
str_title           db      'ЛЕНИНГРАД', 0
str_cost            db      'ЦЕНА 2р.50к.', 0
str_info            db      'СУВЕНИР-ГОЛОВОЛОМКА', 0
str_watermark       db      'АРТ.   С-АГ-1648-А', 0

; ====== Program models ====== ;
txt_headline        String  ?
txt_play            String  ?
txt_about           String  ?
txt_settings        String  ?
txt_title           String  ?
txt_cost            String  ?
txt_info            String  ?
txt_watermark       String  ?

arr_of_letters      dd      ltr_RU_1,  ltr_RU_2,  ltr_RU_3,  ltr_RU_4,  ltr_RU_5,  ltr_RU_6,  ltr_RU_7,\
                            ltr_RU_8,  ltr_RU_9,  ltr_RU_10, ltr_RU_11, ltr_RU_12, ltr_RU_13, ltr_RU_14,\
                            ltr_RU_15, ltr_RU_16, ltr_RU_17, ltr_RU_18, ltr_RU_19, ltr_RU_20, ltr_RU_21,\
                            ltr_RU_22, ltr_RU_23, ltr_RU_24, ltr_RU_25, ltr_RU_26, ltr_RU_27, ltr_RU_28,\
                            ltr_RU_29, ltr_RU_30, ltr_RU_31, ltr_RU_32, ltr_RU_33