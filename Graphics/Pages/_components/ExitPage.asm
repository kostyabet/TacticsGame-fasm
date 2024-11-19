proc Draw.Pages.ExitPage
    ; font layout
    stdcall Draw.Pages.DefaultLayout, [PrevousPage]
    mov     ebx, [PrevousPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    ; main exit layout
    stdcall Graphics.Draw.Shapes, font_design, font_dark_color
    stdcall Graphics.Draw.Shapes, ep_border_design, brown_text_color
    stdcall Graphics.Draw.Shapes, ep_font_desing, milk_light_color
    stdcall Graphics.Draw.Text.Write, txt_wantExit, brown_text_color
    
    ; yes
    stdcall Graphics.Draw.Shapes, ep_yes_brdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, ep_yes_font_design, yes_font_color
    stdcall Graphics.Draw.Text.Write, txt_yes, yes_text_color
    ; no
    stdcall Graphics.Draw.Shapes, ep_no_brdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, ep_no_font_design, no_font_color
    stdcall Graphics.Draw.Text.Write, txt_no, no_text_color

    ret
endp