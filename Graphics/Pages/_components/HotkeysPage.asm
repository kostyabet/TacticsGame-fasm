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
    stdcall Graphics.Draw.Text.Write, txt_HPhotkeys, brown_text_color

    ; return button
    stdcall Graphics.Draw.Shapes, hp_return_circle_desing, retbtn_font_color
    stdcall Graphics.Draw.Shapes, hp_return_chrest_design, retbtn_chrst_color

    ; PLAY
    stdcall Graphics.Draw.Shapes, hp_playbrdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, hp_playfont_design, body_color

    ; PAUSE
    stdcall Graphics.Draw.Shapes, hp_pausebrdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, hp_pausefont_design, body_color

    ; ABOUT
    stdcall Graphics.Draw.Shapes, hp_aboutbrdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, hp_aboutfont_design, body_color

    ; EXIT
    stdcall Graphics.Draw.Shapes, hp_exitbrdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, hp_exitfont_design, body_color

    ; SETINGS
    stdcall Graphics.Draw.Shapes, hp_stngbrdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, hp_stngfont_design, body_color
    
    ; RESTART
    stdcall Graphics.Draw.Shapes, hp_rstrbrdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, hp_rstrfont_design, body_color

    ret
endp