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

    ; volume line
    stdcall Graphics.Draw.Shapes, sp_volume_font_design, brown_color
    stdcall Graphics.Draw.Shapes, sp_volume_cmpl_design, brown_text_color
    stdcall Graphics.Draw.Shapes, sp_volume_dot_design, brown_text_color
    stdcall Graphics.Draw.Text.Write, txt_volume, brown_text_color

    stdcall Draw.DrawSwitch, sp_switch_mbrdr_design, sp_switch_mfont_design, txt_music,\
        sp_switch_moff_design, txt_moff, sp_switch_mon_design, txt_mon, [IS_MUSIC_ON]

    stdcall Draw.DrawSwitch, sp_switch_vbrdr_design, sp_switch_vfont_design, txt_voice,\
        sp_switch_voff_design, txt_voff, sp_switch_von_design, txt_von, [IS_VOICE_ON]

    stdcall Draw.DrawSwitch, sp_switch_hbrdr_design, sp_switch_hfont_design, txt_hotkeys,\
        sp_switch_hoff_design, txt_hoff, sp_switch_hon_design, txt_hon, [IS_HOTKEY_ON]

    ret
endp

proc Draw.DrawSwitch,\
    border, font, txt, off, offtext, on, ontext, IS_ON

    stdcall Graphics.Draw.Shapes, [border], brown_text_color
    stdcall Graphics.Draw.Shapes, [font], body_color
    stdcall Graphics.Draw.Text.Write, [txt], brown_text_color
    cmp     [IS_ON], GL_TRUE
    je      .ON
    .OF:
        stdcall Graphics.Draw.Shapes, [off], brown_text_color
        stdcall Graphics.Draw.Text.Write, [offtext], brown_text_color
        jmp     @F
    .ON:
        stdcall Graphics.Draw.Shapes, [on], brown_text_color
        stdcall Graphics.Draw.Text.Write, [ontext], brown_text_color
    @@:

    ret
endp