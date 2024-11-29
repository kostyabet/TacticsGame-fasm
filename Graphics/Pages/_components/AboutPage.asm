proc Draw.Pages.AboutPage
    ; draw about block font
    stdcall Graphics.Draw.Shapes, ap_brdr_design, btn_text_color
    stdcall Graphics.Draw.Shapes, ap_font_design, milk_light_color

    ; text
    stdcall Graphics.Draw.Text.Write, [txt_gamerool], btn_text_color
    stdcall Graphics.Draw.Text.Write, [txt_grtext], btn_text_color
    ret
endp