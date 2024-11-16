proc Draw.Pages.WinnerPage
    ; font layout
    stdcall Draw.Pages.DefaultLayout, [PrevousPage]
    mov     ebx, [PrevousPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    ; main pause layout
    stdcall Graphics.Draw.Shapes, font_design, font_dark_color
    stdcall Graphics.Draw.Shapes, pp_border_desing, brown_text_color
    stdcall Graphics.Draw.Shapes, pp_font_desing, milk_light_color

    ret
endp
