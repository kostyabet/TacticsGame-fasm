proc Animation.Static.LoadingPage.Bar
        mov     ebx, lp_bar_main_coords
        add     ebx, 12
        mov     eax, [ebx]
        cmp     eax, 1286
        je      .skip
        inc     eax
        mov     [ebx], eax
        add     ebx, 24
        mov     [ebx], eax
        stdcall Scripts.Getters.ConvertCoords, lp_bar_main_coords,  lp_bar_main_design
        jmp     .end
    .skip:
        mov     [CurentPage], MainPage
    .end:
        ret
endp