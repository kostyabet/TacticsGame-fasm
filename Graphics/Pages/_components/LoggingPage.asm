proc Draw.Pages.LoggingPage
    ; font layout
    stdcall Draw.Pages.DefaultLayout, [PrevousPage]
    mov     ebx, [PrevousPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    
    
    ; main pause layout
    ; stdcall Graphics.Draw.Shapes, font_design, font_dark_color
    ; stdcall Graphics.Draw.Shapes, pp_border_desing, brown_text_color
    ; stdcall Graphics.Draw.Shapes, pp_font_desing, milk_light_color

    ; ; return button
    ; stdcall Graphics.Draw.Shapes, pp_return_circle_desing, retbtn_font_color
    ; stdcall Graphics.Draw.Shapes, pp_return_chrest_design, retbtn_chrst_color
    
    ; ; save & exit
    ; stdcall Graphics.Draw.Shapes, pp_esbtn_brdr_design, brown_text_color
    ; stdcall Graphics.Draw.Shapes, pp_esbtn_font_desing, esbtn_font_color
    ; stdcall Graphics.Draw.Text.Write, [txt_saveAexit], esbtn_text_color

    ; ; exit
    ; stdcall Graphics.Draw.Shapes, pp_ebtn_brdr_design, brown_text_color
    ; stdcall Graphics.Draw.Shapes, pp_ebtn_font_desing, ebtn_font_color
    ; stdcall Graphics.Draw.Text.Write, [txt_exit], ebtn_text_color

    ; ; txt_pause
    ; stdcall Graphics.Draw.Text.Write, [txt_pause], brown_text_color
    ret
endp
