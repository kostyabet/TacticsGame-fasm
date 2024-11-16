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
fs_score        =       -10
fs_score_num    =       5

fs_default      =       20

include 'Letters/RussianLetters.inc'
include 'Letters/Digits.inc'
include 'Letters/SpecialSymb.inc'
include 'Letters/EnglishLetters.inc'