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
tg_Mexit        =       30 
tg_title        =       18
tg_cost         =       0
tg_info         =       0
tg_watermark    =       5
tg_return       =       15
tg_hk           =       0
tg_pause        =       18
tg_exit         =       10
tg_saveAexit    =       10
tg_winner       =       18
tg_score        =       5
tg_score_num    =       10
tg_again        =       10
tg_msettings    =       10
tg_chhotkeys    =       7
tg_music        =       10
tg_voice        =       8
tg_hotkeys      =       8
tg_volume       =       8
tg_switch       =       6
tg_HPhotkeys    =       10
tg_wantExit     =       10
tg_yesno        =       7
tg_gamerool     =       10
tg_grtext       =       5

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

; ====== Business models ====== ;
str_headline        db      20, 1, 12, 20, 10, 12, 1, 0 ; 'ТАКТИКА'
str_headline_pos    dd      673, 112
str_headline_bc     db      20, 1, 12, 20, 10, 12, 1, 0 ; 'ТАКТИКА'
str_headline_bc_pos dd      676, 116
str_play            db      10, 4, 18, 1, 20, 30, 0 ; 'ИГРАТЬ'
str_play_pos        dd      1156, 358
str_about           db      16, 2, 44, 10, 4, 18, 6, 0 ; 'ОБ ИГРЕ'
str_about_pos       dd      1150, 528
str_settings        db      15, 1, 19, 20, 18, 16, 11, 12, 10, 0 ; 'НАСТРОЙКИ'
str_settings_pos    dd      1077, 694
str_title           db      13, 6, 15, 10, 15, 4, 18, 1, 5, 0 ; 'ЛЕНИНГРАД'
str_title_pos       dd      411, 871
str_return          db      15, 1, 9, 1, 5, 0 ; '<-'
str_return_pos      dd      55, 1001
str_pause           db      17, 1, 21, 9, 1, 0 ; 'ПАУЗА'
str_pause_pos       dd      882, 444
str_exit            db      3, 29, 11, 20, 10, 0 ; 'ВЫЙТИ'
str_exit_pos        dd      915, 584
str_Mexit_pos       dd      1184, 862
str_saveAexit       db      19, 16, 23, 18, 1, 15, 10, 20, 30, 44, 10, 44, 3, 29, 11, 20, 10, 0 ; 'СОХРАНИТЬ И ВЫЙТИ'
str_saveAexit_pos   dd      802, 523
str_winner          db      17, 16, 2, 6, 5, 1, 0; 'ПОБЕДА'
str_winner_pos      dd      863, 393
str_score           db      19, 25, 7, 20, 0 ; 'СЧЁТ'
str_score_pos       dd      940, 485
str_score_num       db      35, 34, 36, 0 ; '102'
str_score_num_pos   dd      927, 445
str_again           db      9, 1, 15, 16, 3, 16, 0 ; 'ЗАНОВО'
str_again_pos       dd      907, 527
str_wexit_pos       dd      917, 590
str_stats           db      19, 20, 1, 20, 10, 19, 20, 10, 12, 1, 0 ; 'СТАТИСТИКА'
str_stats_pos       dd      867, 648
str_msettings_pos   dd      845, 420
str_chhotkeys       db      19, 14, 6, 15, 1, 44, 4, 16, 18, 33, 25, 10, 23, 44, 12, 13, 1, 3, 10, 26, 0 ; 'СМЕНА ГОРЯЧИХ КЛАВИШ'
str_chhotkeys_pos   dd      817, 637
str_HPhotkeys_pos   dd      698, 414
str_music           db      14, 21, 9, 29, 12, 1, 0 ; 'МУЗЫКА'
str_music_pos       dd      783, 540
str_voice           db      9, 3, 21, 12, 10, 0 ; 'ЗВУКИ'
str_voice_pos       dd      989, 540
str_hotkeys         db      4, 16, 18, 33, 25, 10, 6, 44, 12, 13, 1, 3, 10, 26, 10, 0 ; 'ГОРЯЧИЕ КЛАВИШИ'
str_hotkeys_pos     dd      802, 598
str_volume          db      4, 18, 16, 14, 12, 16, 19, 20, 30, 0 ; 'ГРОМКОСТЬ'
str_volume_pos      dd      754, 506
str_off             db      68, 59, 59, 0 ; 'OFF'
str_moff_pos        dd       922, 545
str_voff_pos        dd      1104, 545
str_hoff_pos        dd      1084, 603
str_on              db      68, 67, 0 ; 'ON'
str_mon_pos         dd       911, 545
str_von_pos         dd      1091, 545
str_hon_pos         dd      1074, 603
str_wantExit        db      3, 29, 44, 23, 16, 20, 10, 20, 6, 44, 3, 29, 11, 20, 10, 47, 0 ; 'ВЫ ХОТИТЕ ВЫЙТИ?'
str_wantExit_pos    dd      762, 485
str_yes             db      5, 1, 0 ; 'ДА'
str_yes_pos         dd      835, 553
str_no              db      15, 6, 20, 0 ; 'НЕТ'
str_no_pos          dd      1034, 552
str_R_hk            db      71, 0 ; 'R'
str_R_hk_pos        dd      1805, 29
str_S_hk            db      72, 0 ; 'S'
str_S_hk_pos        dd      1875, 29
str_P_hk            db      69, 0 ; 'P'
str_P_hk_pos        dd      1736, 29

str_gamerool        db      17, 18, 1, 3, 10, 13, 1, 44, 10, 4, 18, 29, 0; 'ПРАВИЛА ИГРЫ'
str_gamerool_pos    dd      728, 273

str_grtext          db      44, 44,\
                            18, 1, 9, 14, 6, 19, 20, 10, 3, 44,\
                            26, 1, 26, 12, 10, 44,\
                            10, 4, 18, 16, 12, 44, 0;,\
                            ; 5, 6, 13, 1, 20, 44,\
                            ; 17, 6, 18, 3, 29, 4, 10, 3, 1, 44,\
                            ; 16, 5, 15, 16, 11, 44,\
                            ; 10, 9, 44,\
                            ; 1, 44,\ 
                            ; 26, 1, 26, 12, 44,\ 
                            ; 19, 0
str_grtext_pos      dd      174, 362
; ====== Program models ====== ;
txt_headline        dd      ?
txt_headline_bc     dd      ?
txt_play            dd      ?
txt_about           dd      ?
txt_settings        dd      ?
txt_Mexit           dd      ?
txt_title           dd      ?
txt_cost            dd      ?
txt_info            dd      ?
txt_watermark       dd      ?
txt_return          dd      ?
txt_R_hk            dd      ?
txt_P_hk            dd      ?
txt_S_hk            dd      ?
txt_pause           dd      ?
txt_exit            dd      ?
txt_saveAexit       dd      ?
txt_winner          dd      ?
txt_score           dd      ?
txt_score_num       dd      ?
txt_again           dd      ?
txt_wexit           dd      ?
txt_stats           dd      ?
txt_msettings       dd      ?
txt_chhotkeys       dd      ?
txt_music           dd      ?
txt_voice           dd      ?
txt_hotkeys         dd      ?
txt_HPhotkeys       dd      ?
txt_volume          dd      ?
txt_moff            dd      ?
txt_voff            dd      ?
txt_hoff            dd      ?
txt_mon             dd      ?
txt_von             dd      ?
txt_hon             dd      ?
txt_wantExit        dd      ?
txt_yes             dd      ?
txt_no              dd      ?
txt_gamerool        dd      ?
txt_grtext          dd      ?

arr_of_letters      dd      ltr_RU_1,  ltr_RU_2,  ltr_RU_3,  ltr_RU_4,  ltr_RU_5,  ltr_RU_6,  ltr_RU_7,\ ; RU
                            ltr_RU_8,  ltr_RU_9,  ltr_RU_10, ltr_RU_11, ltr_RU_12, ltr_RU_13, ltr_RU_14,\
                            ltr_RU_15, ltr_RU_16, ltr_RU_17, ltr_RU_18, ltr_RU_19, ltr_RU_20, ltr_RU_21,\
                            ltr_RU_22, ltr_RU_23, ltr_RU_24, ltr_RU_25, ltr_RU_26, ltr_RU_27, ltr_RU_28,\
                            ltr_RU_29, ltr_RU_30, ltr_RU_31, ltr_RU_32, ltr_RU_33,\ 
                            dgt_34,    dgt_35,    dgt_36,    dgt_37,    dgt_38,    dgt_39,    dgt_40, dgt_41, dgt_42, dgt_43,\ ; digit
                            spl_44,    spl_45,    spl_46,    spl_47,    spl_48,    spl_49,    spl_50, spl_51, spl_52, spl_53,\ ; spl
                            ltr_EN_54, ltr_EN_55, ltr_EN_56, ltr_EN_57, ltr_EN_58, ltr_EN_59, ltr_EN_60,\ ; EN
                            ltr_EN_61, ltr_EN_62, ltr_EN_63, ltr_EN_64, ltr_EN_65, ltr_EN_66, ltr_EN_67,\
                            ltr_EN_68, ltr_EN_69, ltr_EN_70, ltr_EN_71, ltr_EN_72, ltr_EN_73, ltr_EN_74,\
                            ltr_EN_75, ltr_EN_76, ltr_EN_77, ltr_EN_78, ltr_EN_79