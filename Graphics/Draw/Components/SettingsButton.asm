proc Graphics.Draw.Components.SettingsButton
    stdcall Graphics.Draw.Shapes, settings_btn_fnt_design, settings_button_color
    stdcall Graphics.Draw.Shapes, settings_btn_out_circle_design, book_title_color
    stdcall Graphics.Draw.Shapes, settings_btn_in_circle_design, settings_button_color
    stdcall Graphics.Draw.Shapes, settings_btn_mainline_design, book_title_color
    stdcall Graphics.Draw.Shapes, settings_btn_subline_design, book_title_color
    stdcall Graphics.Draw.Text.Write, [txt_S_hk], book_title_color
    ret
endp