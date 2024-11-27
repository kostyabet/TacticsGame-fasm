proc Graphics.Draw.Components.PauseButton
    stdcall Graphics.Draw.Shapes, pause_btn_fnt_design, pause_button_color
    stdcall Graphics.Draw.Shapes, pause_btn_lines_design, book_title_color
    stdcall Graphics.Draw.Text.Write, [txt_P_hk], book_title_color
    ret
endp