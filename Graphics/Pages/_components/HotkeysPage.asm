proc Draw.Pages.HotkeysPage
    ; font layout
    stdcall Draw.Pages.DefaultLayout, [PrevousPage]
    mov     ebx, [PrevousPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    ; backgorund 
    stdcall Graphics.Draw.Shapes, font_design, font_dark_color
    stdcall Graphics.Draw.Shapes, hp_border_design, brown_text_color
    stdcall Graphics.Draw.Shapes, hp_font_desing, milk_light_color

    ; return button
    stdcall Graphics.Draw.Shapes, hp_return_circle_desing, retbtn_font_color
    stdcall Graphics.Draw.Shapes, hp_return_chrest_design, retbtn_chrst_color
    ret
endp