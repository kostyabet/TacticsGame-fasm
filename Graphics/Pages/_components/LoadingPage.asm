proc Draw.Pages.LoadingPage
    .headline:
    .book:
    .bar:
        stdcall Graphics.Draw.Shapes, lp_bar_brdr1_design, book_title_color
        stdcall Graphics.Draw.Shapes, lp_bar_brdr2_design, brown_color
        stdcall Graphics.Draw.Shapes, lp_bar_brdr3_design, book_endg_color
        stdcall Graphics.Draw.Shapes, lp_bar_main_design,  book_title_color


    ; animation part
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
    .skip:
        ret
endp