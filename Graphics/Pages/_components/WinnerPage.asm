proc Draw.Pages.WinnerPage
    ; font layout
    stdcall Draw.Pages.DefaultLayout, [PrevousPage]
    mov     ebx, [PrevousPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    ; main pause layout
    stdcall Graphics.Draw.Shapes, font_design, font_dark_color
    stdcall Graphics.Draw.Shapes, wp_border_design, brown_text_color
    stdcall Graphics.Draw.Shapes, wp_font_desing, milk_light_color

    ; return button
    stdcall Graphics.Draw.Shapes, wp_return_circle_desing, retbtn_font_color
    stdcall Graphics.Draw.Shapes, wp_return_chrest_design, retbtn_chrst_color

    ; txt winner
    stdcall Graphics.Draw.Text.Write, txt_winner,    brown_text_color
    stdcall Graphics.Draw.Text.Write, txt_score_num, brown_black_color
    stdcall Graphics.Draw.Text.Write, txt_score,     brown_color
    ret
endp
