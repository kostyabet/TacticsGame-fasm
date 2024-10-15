TicksGameMatrix dd  -1, -1,  1,  1,  1, -1, -1,\
                    -1, -1,  1,  1,  1, -1, -1,\
                     1,  1,  1,  1,  1,  1,  1,\
                     1,  1,  1,  1,  1,  1,  1,\
                     1,  1,  1,  1,  1,  1,  1,\
                    -1, -1,  1,  1,  1, -1, -1,\
                    -1, -1,  1,  1,  1, -1, -1 

TicksGarbageMatrix dd  11 dup(0),\
                       11 dup(0),\
                       11 dup(0)

TicksMatrix         dd  TicksGameMatrix, TicksGarbageMatrix

CurentGarbageSize dd 0

