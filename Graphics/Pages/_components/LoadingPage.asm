proc Draw.Pages.LoadingPage
    .headline:
    .book:
    .bar:
        stdcall Graphics.Draw.Shapes, lp_bar_brdr1_design, book_title_color
        stdcall Graphics.Draw.Shapes, lp_bar_brdr2_design, brown_color
        stdcall Graphics.Draw.Shapes, lp_bar_brdr3_design, book_endg_color
        stdcall Graphics.Draw.Shapes, lp_bar_main_design,  book_title_color
    ret
endp