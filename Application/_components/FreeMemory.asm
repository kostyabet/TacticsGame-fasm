proc Application.FreeMamory
    stdcall Application.FreeArray, [txts_array]
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