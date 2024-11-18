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
    cmp     eax, HotkeysPage
    jne     @F
        mov     [CurentPage], SettingsPage
        jmp     .exit
    @@:
        cmp     eax, SettingsPage
        je      @F
            mov     [PrevousPage], eax
        @@:
        mov     eax, [newPage]
        mov     [CurentPage], eax
    .exit:
        ret
endp