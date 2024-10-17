proc Draw.Page
    stdcall Draw.Pages.DefaultLayout
    mov     ebx, [CurentPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    ret
endp