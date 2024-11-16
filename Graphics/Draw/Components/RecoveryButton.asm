proc Graphics.Draw.Components.RecoveryButton
    stdcall Graphics.Draw.Shapes, recovery_btn_fnt_design, recovery_button_color
    stdcall Graphics.Draw.Shapes, recovery_btn_out_circle_design, book_title_color
    stdcall Graphics.Draw.Shapes, recovery_btn_in_circle_design, recovery_button_color
    stdcall Graphics.Draw.Shapes, recovery_btn_fntblock_design, recovery_button_color
    stdcall Graphics.Draw.Shapes, recovery_btn_lftriangle_design, book_title_color
    stdcall Graphics.Draw.Shapes, recovery_btn_rgtriangle_design, book_title_color
    stdcall Graphics.Draw.Text.Write, txt_R_hk, book_title_color
    ret
endp