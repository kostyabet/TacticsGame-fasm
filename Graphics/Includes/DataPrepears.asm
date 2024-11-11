proc Graphics.Draw.CoordsRectPrepears
    ; default
    stdcall Scripts.Getters.ConvertCoords, font_coords, font_design
    stdcall Scripts.Getters.ConvertCoords, book_root_coords, book_root_design
    stdcall Scripts.Getters.ConvertCoords, book_endg_coords, book_endg_design
    stdcall Scripts.Getters.ConvertCoords, book_brdcrn_coords, book_brdcrn_design
    stdcall Scripts.Getters.ConvertCoords, book_corner_coords, book_corner_design
    stdcall Scripts.Getters.ConvertCoords, book_brdfnt_coords, book_brdfnt_design
    stdcall Scripts.Getters.ConvertCoords, book_brd_coords, book_brd_design
    stdcall Scripts.Getters.ConvertCoords, book_flgpl_coords, book_flgpl_design

    stdcall Graphics.Draw.CoordsRectPrepears.ForAnimations

    stdcall Scripts.Getters.ConvertCoords, mp_gamefont_coords, mp_gamefont_design
    stdcall Scripts.Getters.ConvertCoords, mg_gamebrdr_coords, mp_gamebrdr_design
    stdcall Scripts.Getters.ConvertCoords, mp_grbgbrdr_coords, mp_grbgbrdr_design
    stdcall Scripts.Getters.ConvertCoords, mp_grbgfont_coords, mp_grbgfont_design
    stdcall Scripts.Getters.ConvertCoords, mp_fntvertln_coords, mp_fntvertln_design
    stdcall Scripts.Getters.ConvertCoords, mp_fnthortln_coords, mp_fnthortln_design
    stdcall Scripts.Getters.ConvertCoords, exitbtn_font_coords, exitbtn_font_design
    
    stdcall Scripts.Getters.ConvertCoords, lp_bar_brdr1_coords, lp_bar_brdr1_design
    stdcall Scripts.Getters.ConvertCoords, lp_bar_brdr2_coords, lp_bar_brdr2_design
    stdcall Scripts.Getters.ConvertCoords, lp_bar_brdr3_coords, lp_bar_brdr3_design
    stdcall Scripts.Getters.ConvertCoords, lp_bar_main_coords,  lp_bar_main_design

    ; repeat
    stdcall Scripts.Getters.ConvertRepeatCoords, book_strk_design
    ret
endp

proc Graphics.Draw.CoordsRectPrepears.ForAnimations
    stdcall Scripts.Getters.ConvertCoords, button_play_coords, button_play_design
    stdcall Scripts.Getters.ConvertCoords, button_about_coords, button_about_design
    stdcall Scripts.Getters.ConvertCoords, button_stngs_coords, button_stngs_design
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
    
    stdcall Scripts.Getters.Color, [cl_milk],         milk_color
    stdcall Scripts.Getters.Color, [cl_milk_light],   milk_light_color
    stdcall Scripts.Getters.Color, [cl_brown],        brown_color
    stdcall Scripts.Getters.Color, [cl_brown_light],  brown_light_color
    stdcall Scripts.Getters.Color, [cl_brown_medium], brown_medium_color
    stdcall Scripts.Getters.Color, [cl_brown_dark],   brown_dark_color
    stdcall Scripts.Getters.Color, [cl_gray],         gray_color
    stdcall Scripts.Getters.Color, [cl_red_light],    red_light_color
    stdcall Scripts.Getters.Color, [cl_red],          red_color
    stdcall Scripts.Getters.Color, [cl_red_black],    red_black_color
    stdcall Scripts.Getters.Color, [cl_vinous],       vinous_color
    stdcall Scripts.Getters.Color, [cl_vinous_black], vinous_black_color
    stdcall Scripts.Getters.Color, [cl_brown_text],   brown_text_color
    
    ret
endp

proc Graphics.Draw.ASCIIPrepear
    stdcall Graphics.Draw.Text.Prepear, txt_headline,    str_headline,    fs_headline,  tg_headline, str_headline_pos
    stdcall Graphics.Draw.Text.Prepear, txt_headline_bc, str_headline_bc, fs_headline,  tg_headline, str_headline_bc_pos 
    stdcall Graphics.Draw.Text.Prepear, txt_play,        str_play,        fs_play,      tg_play,     str_play_pos
    stdcall Graphics.Draw.Text.Prepear, txt_about,       str_about,       fs_about,     tg_about,    str_about_pos
    stdcall Graphics.Draw.Text.Prepear, txt_settings,    str_settings,    fs_settings,  tg_settings, str_settings_pos
    stdcall Graphics.Draw.Text.Prepear, txt_title,       str_title,       fs_title,     tg_title,    str_title_pos
    stdcall Graphics.Draw.Text.Prepear, txt_return,      str_return,      fs_return,    tg_return,   str_return_pos
    ;stdcall Graphics.Draw.Text.Prepear, txt_cost,      str_cost,      fs_cost,      tg_cost
    ;stdcall Graphics.Draw.Text.Prepear, txt_info,      str_info,      fs_info,      tg_info
    ;stdcall Graphics.Draw.Text.Prepear, txt_watermark, str_watermark, fs_watermark, tg_watermark
    ret
endp

proc Game.ModelsPrepear
    stdcall Scripts.ModelsPrepear, TicksFontList_Centers,     TicksFontList_Radiuses,     TicksFontList_Float
    stdcall Scripts.ModelsPrepear, TicksFontDecorate_Centers, TicksFontDecorate_Radiuses, TicksFontDecorate_Float
    ret
endp

proc Game.PrepearTicks
    stdcall Game.CentersPrepear, TicksGameMap, TicksList_Centers, TicksMatrix
    stdcall Scripts.ModelsPrepear, TicksList_Centers, TicksList_Radiuses, TicksList_Float
    
    stdcall Scripts.ModelsPrepear, TicksFontMltDrList_Centers, TicksFontList_Radiuses, TicksFontMltDrList_Float

    ret
endp