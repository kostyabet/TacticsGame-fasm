proc Draw.Pages.LoggingPage
    ; font layout
    stdcall Draw.Pages.DefaultLayout, [PrevousPage]
    mov     ebx, [PrevousPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    ; main pause layout
    stdcall Graphics.Draw.Shapes, font_design, font_dark_color
    stdcall Graphics.Draw.Shapes, lgp_border_desing, brown_text_color
    stdcall Graphics.Draw.Shapes, lgp_font_desing, milk_light_color

    ; login
    stdcall Graphics.Draw.Shapes, lgp_lbrdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, lgp_lfont_design, milk_color
    stdcall Graphics.Draw.Text.Write, [txt_login], login_color

    ; password
    stdcall Graphics.Draw.Shapes, lgp_pbrdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, lgp_pfont_design, milk_color
    stdcall Graphics.Draw.Text.Write, [txt_password], password_color

    cmp     [PasswordHide], GL_TRUE
    je      .close
        stdcall Graphics.Draw.Sprite, [eyeopen_texture], lgp_eyeopen_design
        jmp     @F
    .close:
        stdcall Graphics.Draw.Sprite, [eyeclose_texture], lgp_eyeclose_design
    @@:

    ; submit
    stdcall Graphics.Draw.Shapes, lgp_sbtn_brdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, lgp_sbtn_font_design, esbtn_font_color
    stdcall Graphics.Draw.Text.Write, [txt_submit], esbtn_text_color

    ; exit
    stdcall Graphics.Draw.Shapes, lgp_ebtn_brdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, lgp_ebtn_font_design, ebtn_font_color
    stdcall Graphics.Draw.Text.Write, [txt_lgpexit], ebtn_text_color

    ; txt_logging
    stdcall Graphics.Draw.Text.Write, [txt_logging], brown_text_color

    ; error
    stdcall Graphics.Draw.Text.Write, [txt_error], red_color
    ret
endp
