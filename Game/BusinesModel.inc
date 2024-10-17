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
