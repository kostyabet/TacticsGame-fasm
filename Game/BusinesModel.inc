TickEmpty       =    0
TickBlock       =   -1
TickExist       =    1

TickFrom        =    2
TickToTop       =    3
TickToLeft      =    4
TickToRight     =    5
TickToBottom    =    6

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

garbgeCounter   dd  0

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