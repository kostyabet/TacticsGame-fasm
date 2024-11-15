proc Draw.Page
    stdcall Draw.Pages.DefaultLayout, [CurentPage]
    mov     ebx, [CurentPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    ret
endp