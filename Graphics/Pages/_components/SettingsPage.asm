proc Draw.Pages.SettingsPage
    ; font layout
    stdcall Draw.Pages.DefaultLayout, [PrevousPage]
    mov     ebx, [PrevousPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    ; main pause layout
    stdcall Graphics.Draw.Shapes, font_design, font_dark_color
    stdcall Graphics.Draw.Shapes, sp_border_design, brown_text_color
    stdcall Graphics.Draw.Shapes, sp_font_design, milk_light_color
    stdcall Graphics.Draw.Shapes, sp_lines_design, book_ebrd_color
    stdcall Graphics.Draw.Text.Write, txt_msettings, brown_text_color

    ; return button
    stdcall Graphics.Draw.Shapes, sp_return_circle_design, retbtn_font_color
    stdcall Graphics.Draw.Shapes, sp_return_chrest_design, retbtn_chrst_color

    ; change hot keys button
    stdcall Graphics.Draw.Shapes, sp_chhkbrdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, sp_chhkfont_design, chhtkeys_font_color
    stdcall Graphics.Draw.Text.Write, txt_chhotkeys, chhtkeys_text_color
    ret
endp