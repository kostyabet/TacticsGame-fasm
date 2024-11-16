proc Draw.Page
    stdcall Draw.Pages.DefaultLayout, [CurentPage]
    mov     ebx, [CurentPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    ret
endp

proc Page.ChangePage uses eax,\
    newPage
    mov     eax, [CurentPage]
    mov     [PrevousPage], eax
    mov     eax, [newPage]
    mov     [CurentPage], eax
    ret
endp