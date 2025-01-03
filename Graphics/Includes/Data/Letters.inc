; ==================== Documentation ==================== ;
;                                                         ;
;   fs_:                                                  ;
;      One of the properties of the text,                 ;
;       the value of which is the size of the text        ;
;       in the `pt` dimension:                            ;
;           20pt = 28px                                   ;
;           20pt is the DEFAULT FONT SIZE.                ;
;      DEFAULT FONT SIZE - the basic font size            ;
;       on the basis of which the basic Letters           ;
;       are presented.                                    ;
;      Default font size visualization:                   ;
;                  |      /\                              ;
;             20pt |     /  \                             ;
;             28px |    /____\                            ;
;                  |   /      \                           ;
;                                                         ;
;   ltr_:                                                 ;
;      Visualization of the letters of the alphabet.      ;
;      RU_:                                               ;
;         An abbreviation of the language                 ;
;          to emphasize the localization of letters.      ;
;         Russian letters contain their own serial        ;
;          number, which corresponds to the number        ;
;          of the letter in the Russian alphabet.         ;
;                                                         ;
;      Letter describe:                                   ;
;         Count - number of QUAD in this letter           ;
;             MIN_COUNT: 2    MAX_COUNT: 7                ;
;         LENGTH - Letter length in `px`.                 ;
;         The following Count lines contain 8 coords      ;
;          each in the following format:                  ;
;              x1 y1 x2 y2 x3 y3 x4 y4                    ;
;         QUAD visualizatoin:                             ;
;                   1---------2                           ;
;                    \         \                          ;
;                     4---------3                         ;
;                                                         ;
; ======================================================= ;

; Font Size
fs_headline     =       60
fs_play         =       25
fs_about        =       25
fs_settings     =       25
fs_Mexit        =       25
fs_title        =       20
fs_info         =       20
fs_cost         =       18
fs_watermark    =       10
fs_return       =       10
fs_pause        =       10
fs_exit         =       1
fs_saveAexit    =       -1
fs_hk           =       -5
fs_winner       =       10
fs_again        =       0
fs_msettings    =       10
fs_chhotkeys    =       -5
fs_music        =       -2
fs_hotkeys      =       -2
fs_switch       =       -10
fs_default      =       20
fs_HPhotkeys    =       10
fs_wantExit     =       10
fs_yesno        =       5
fs_gamerool     =       27
fs_grtext       =       0
fs_hktext       =       0
fs_hktextS      =       0
fs_logging      =       10
fs_lgpexit      =       0
fs_logpas       =       -5
fs_error        =       -5
fs_pointstitle  =       -5
fs_winpos       =       5
fs_ldbrdtitle   =       10
fs_local        =       5

include 'Letters/RussianLetters.inc'
include 'Letters/Digits.inc'
include 'Letters/SpecialSymb.inc'
include 'Letters/EnglishLetters.inc'