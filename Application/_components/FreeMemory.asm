proc Application.FreeMamory
    stdcall Application.FreeArray, [txts_array]
    stdcall Application.FreeScores
    stdcall Application.FreeTabels
    ret
endp

proc Application.FreeArray uses eax ebx,\
     array
    mov     ebx, [array]
    .freeLoop:
        invoke HeapFree, [hHeap], 0, [ebx]
        add     ebx, 4
        mov     eax, [ebx]
        cmp     eax, 0
        jne     .freeLoop
    ret
endp

proc Application.FreeScores
    invoke HeapFree, [hHeap], 0, [UserScores]
    invoke HeapFree, [hHeap], 0, [BestScores]
    ret
endp

proc Application.FreeTabels
    invoke HeapFree, [hHeap], 0, [Tabels]
    ret
endp