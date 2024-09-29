proc Graphics.Draw.CoordsRectPrepears
    ; default
    stdcall Scripts.Getters.ConvertCoords, font_coords, font_design
    stdcall Scripts.Getters.ConvertCoords, book_root_coords, book_root_design
    stdcall Scripts.Getters.ConvertCoords, book_endg_coords, book_endg_design
    stdcall Scripts.Getters.ConvertCoords, book_brdcrn_coords, book_brdcrn_design
    stdcall Scripts.Getters.ConvertCoords, book_corner_coords, book_corner_design
    stdcall Scripts.Getters.ConvertCoords, book_brdfnt_coords, book_brdfnt_design
    stdcall Scripts.Getters.ConvertCoords, book_brd_coords, book_brd_design
    stdcall Scripts.Getters.ConvertCoords, button_play_coords, button_play_design
    stdcall Scripts.Getters.ConvertCoords, button_about_coords, button_about_design
    stdcall Scripts.Getters.ConvertCoords, button_stngs_coords, button_stngs_design
    stdcall Scripts.Getters.ConvertCoords, book_flgpl_coords, book_flgpl_design

    ; repeat
    stdcall Scripts.Getters.ConvertRepeatCoords, book_strk_design
    ret
endp

proc Graphics.Colors.Prepear
    stdcall Scripts.Getters.Color, [cl_background],  font_color
    stdcall Scripts.Getters.Color, [cl_root],        book_root_color
    stdcall Scripts.Getters.Color, [cl_stroke],      book_strk_color
    stdcall Scripts.Getters.Color, [cl_ending],      book_endg_color
    stdcall Scripts.Getters.Color, [cl_border],      book_ebrd_color
    stdcall Scripts.Getters.Color, [cl_button],      button_color
    stdcall Scripts.Getters.Color, [cl_headline],    headline_color
    stdcall Scripts.Getters.Color, [cl_headline_bc], headline_bc_color
    stdcall Scripts.Getters.Color, [cl_flgpl],       book_flgpl_color
    stdcall Scripts.Getters.Color, [cl_text_buttom], btn_text_color
    stdcall Scripts.Getters.Color, [cl_title],       book_title_color
    ret
endp

proc Graphics.Draw.ASCIIPrepear
    stdcall Graphics.Draw.Text.Prepear, txt_headline,    str_headline,    fs_headline,  tg_headline, str_headline_pos
    stdcall Graphics.Draw.Text.Prepear, txt_headline_bc, str_headline_bc, fs_headline,  tg_headline, str_headline_bc_pos 
    stdcall Graphics.Draw.Text.Prepear, txt_play,        str_play,        fs_play,      tg_play,     str_play_pos
    stdcall Graphics.Draw.Text.Prepear, txt_about,       str_about,       fs_about,     tg_about,    str_about_pos
    stdcall Graphics.Draw.Text.Prepear, txt_settings,    str_settings,    fs_settings,  tg_settings, str_settings_pos
    stdcall Graphics.Draw.Text.Prepear, txt_title,       str_title,       fs_title,     tg_title,    str_title_pos
    ;stdcall Graphics.Draw.Text.Prepear, txt_cost,      str_cost,      fs_cost,      tg_cost
    ;stdcall Graphics.Draw.Text.Prepear, txt_info,      str_info,      fs_info,      tg_info
    ;stdcall Graphics.Draw.Text.Prepear, txt_watermark, str_watermark, fs_watermark, tg_watermark
    ret
endp