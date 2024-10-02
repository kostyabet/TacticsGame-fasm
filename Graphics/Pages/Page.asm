proc Draw.Page
    mov     ebx, [CurentPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    ret
endp