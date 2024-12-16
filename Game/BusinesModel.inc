TickEmpty       =    0
TickBlock       =   -1
TickExist       =    1

; ======================= ;
;                         ;
;   gameboard:            ;
;                         ;
;         1  1  1         ;
;         1  1  1         ;
;   1  1  1  1  1  1  1   ;
;   1  1  1  0  1  1  1   ;
;   1  1  1  1  1  1  1   ;
;         1  1  1         ;
;         1  1  1         ;
;                         ;
;                         ;
;   garbage:              ;
;                         ;
;  0 0 0 0 0 0 0 0 0 0 0  ;
;  0 0 0 0 0 0 0 0 0 0 0  ;
;  0 0 0 0 0 0 0 0 0      ;
;                         ;
; ======================= ;

WinnerMatrix    dd                        TickEmpty, TickEmpty, TickEmpty,\ ; game
                                          TickEmpty, TickEmpty, TickEmpty,\
                    TickEmpty, TickEmpty, TickEmpty, TickEmpty, TickEmpty, TickEmpty, TickEmpty,\
                    TickEmpty, TickEmpty, TickEmpty, TickExist, TickEmpty, TickEmpty, TickEmpty,\
                    TickEmpty, TickEmpty, TickEmpty, TickEmpty, TickEmpty, TickEmpty, TickEmpty,\
                                          TickEmpty, TickEmpty, TickEmpty,\
                                          TickEmpty, TickEmpty, TickEmpty,\
                    11 dup(TickExist),\ ; garbage
                    11 dup(TickExist),\
                    9  dup(TickExist)
EtalonMatrix    dd                        TickExist, TickExist, TickExist,\ ; game
                                          TickExist, TickExist, TickExist,\
                    TickExist, TickExist, TickExist, TickExist, TickExist, TickExist, TickExist,\
                    TickExist, TickExist, TickExist, TickEmpty, TickExist, TickExist, TickExist,\
                    TickExist, TickExist, TickExist, TickExist, TickExist, TickExist, TickExist,\
                                          TickExist, TickExist, TickExist,\
                                          TickExist, TickExist, TickExist,\
                    11 dup(TickEmpty),\ ; garbage
                    11 dup(TickEmpty),\
                    9  dup(TickEmpty)
TicksMatrix     dd                        TickExist, TickExist, TickExist,\ ; game
                                          TickExist, TickExist, TickExist,\
                    TickExist, TickExist, TickExist, TickExist, TickExist, TickExist, TickExist,\
                    TickExist, TickExist, TickExist, TickEmpty, TickExist, TickExist, TickExist,\
                    TickExist, TickExist, TickExist, TickExist, TickExist, TickExist, TickExist,\
                                          TickExist, TickExist, TickExist,\
                                          TickExist, TickExist, TickExist,\
                    11 dup(TickEmpty),\ ; garbage
                    11 dup(TickEmpty),\
                    9  dup(TickEmpty)

freeGarbage     =   0
garbgeCounter   dd  freeGarbage
isGameStart     dd  GL_FALSE ; for recovery button
currentScore    dd  0
GAME_BOARD_SIZE =   33
MATRIX_EL_SIZE  =   4

pointsByGoodMove    =    1
pointsByBadMove     =    1
currentPoints   dd  0
strikeCounter   dd  0
loseStrikeCouner dd 0

struct TickMoveDirection
    BETWEEN dd  0
    TO      dd  0
ends

struct TicksMoveDirectionsStruct
    MULTI_DIRECTION dd                 0
    POSSIBLE        dd                 0
    FROM            dd                 0
    TOP             TickMoveDirection  ?
    LEFT            TickMoveDirection  ?
    RIGHT           TickMoveDirection  ?
    BOTTOM          TickMoveDirection  ?
ends

TicksMoveDirections TicksMoveDirectionsStruct ?