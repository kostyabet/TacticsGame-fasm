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

    stdcall Scripts.Getters.ConvertCoords, recovery_btn_fnt_coords, recovery_btn_fnt_design
    stdcall Scripts.Getters.ConvertCoords, recovery_btn_out_circle_coords, recovery_btn_out_circle_design
    stdcall Scripts.Getters.ConvertCoords, recovery_btn_in_circle_coords, recovery_btn_in_circle_design
    stdcall Scripts.Getters.ConvertCoords, recovery_btn_fntblock_coords, recovery_btn_fntblock_design
    stdcall Scripts.Getters.ConvertCoords, recovery_btn_lftriangle_coords, recovery_btn_lftriangle_design
    stdcall Scripts.Getters.ConvertCoords, recovery_btn_rgtriangle_coords, recovery_btn_rgtriangle_design

    stdcall Scripts.Getters.ConvertCoords, settings_btn_fnt_coords, settings_btn_fnt_design

    stdcall Scripts.Getters.ConvertCoords, pause_btn_fnt_coords, pause_btn_fnt_design
    stdcall Scripts.Getters.ConvertCoords, pause_btn_lines_coords, pause_btn_lines_design
    stdcall Scripts.Getters.ConvertCoords, settings_btn_out_circle_coords, settings_btn_out_circle_design
    stdcall Scripts.Getters.ConvertCoords, settings_btn_in_circle_coords, settings_btn_in_circle_design
    stdcall Scripts.Getters.ConvertCoords, settings_btn_mainline_coords, settings_btn_mainline_design
    stdcall Scripts.Getters.ConvertCoords, settings_btn_subline_coords, settings_btn_subline_design

    stdcall Scripts.Getters.ConvertCoords, pp_border_coords, pp_border_desing
    stdcall Scripts.Getters.ConvertCoords, pp_font_coords, pp_font_desing
    stdcall Scripts.Getters.ConvertCoords, pp_return_circle_coords, pp_return_circle_desing
    stdcall Scripts.Getters.ConvertCoords, pp_esbtn_brdr_coords, pp_esbtn_brdr_design
    stdcall Scripts.Getters.ConvertCoords, pp_esbtn_font_coords, pp_esbtn_font_desing
    stdcall Scripts.Getters.ConvertCoords, pp_ebtn_brdr_coords, pp_ebtn_brdr_design
    stdcall Scripts.Getters.ConvertCoords, pp_ebtn_font_coords, pp_ebtn_font_desing
    stdcall Scripts.Getters.ConvertWithQuardCoords, pp_return_chrest_coords, pp_return_chrest_design

    stdcall Scripts.Getters.ConvertCoords, wp_border_coords, wp_border_design 
    stdcall Scripts.Getters.ConvertCoords, wp_font_coords, wp_font_desing
    stdcall Scripts.Getters.ConvertCoords, wp_return_circle_coords, wp_return_circle_desing
    stdcall Scripts.Getters.ConvertWithQuardCoords, wp_return_chrest_coords, wp_return_chrest_design
    stdcall Scripts.Getters.ConvertCoords, wp_line_coords, wp_line_design
    stdcall Scripts.Getters.ConvertCoords, wp_againbtn_brdr_coords, wp_againbtn_brdr_design
    stdcall Scripts.Getters.ConvertCoords, wp_againbtn_font_coords, wp_againbtn_font_design
    stdcall Scripts.Getters.ConvertCoords, wp_exitbtn_brdr_coords, wp_exitbtn_brdr_design
    stdcall Scripts.Getters.ConvertCoords, wp_exitbtn_font_coords, wp_exitbtn_font_design
    stdcall Scripts.Getters.ConvertCoords, wp_leadbtn_brdr_coords, wp_leadbtn_brdr_design
    stdcall Scripts.Getters.ConvertCoords, wp_leadbtn_font_coords, wp_leadbtn_font_design

; 375 44 485 32 86 Генадий Григорьевич
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
    stdcall Scripts.Getters.Color, [cl_lime],         lime_color
    stdcall Scripts.Getters.Color, [cl_body],         body_color
    stdcall Scripts.Getters.Color, [cl_orange],       orange_color
    stdcall Scripts.Getters.Color, [cl_pale],         pale_color
    stdcall Scripts.Getters.Color, [cl_brow_black],   brown_black_color
    
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

    stdcall Graphics.Draw.Text.Prepear, txt_R_hk, str_R_hk, fs_hk, tg_hk, str_R_hk_pos
    stdcall Graphics.Draw.Text.Prepear, txt_P_hk, str_P_hk, fs_hk, tg_hk, str_P_hk_pos
    stdcall Graphics.Draw.Text.Prepear, txt_S_hk, str_S_hk, fs_hk, tg_hk, str_S_hk_pos

    stdcall Graphics.Draw.Text.Prepear, txt_pause,     str_pause,     fs_pause,     tg_pause,     str_pause_pos 
    stdcall Graphics.Draw.Text.Prepear, txt_exit,      str_exit,      fs_exit,      tg_exit,      str_exit_pos
    stdcall Graphics.Draw.Text.Prepear, txt_saveAexit, str_saveAexit, fs_saveAexit, tg_saveAexit, str_saveAexit_pos
    stdcall Graphics.Draw.Text.Prepear, txt_winner,    str_winner,    fs_winner,    tg_winner,    str_winner_pos
    stdcall Graphics.Draw.Text.Prepear, txt_score,     str_score,     fs_score,     tg_score,     str_score_pos
    stdcall Graphics.Draw.Text.Prepear, txt_score_num, str_score_num, fs_score_num, tg_score_num, str_score_num_pos
    stdcall Graphics.Draw.Text.Prepear, txt_again,     str_again,     fs_again,     tg_again,     str_again_pos
    stdcall Graphics.Draw.Text.Prepear, txt_wexit,     str_exit,      fs_again,     tg_again,     str_wexit_pos
    stdcall Graphics.Draw.Text.Prepear, txt_stats,     str_stats,     fs_again,     tg_again,     str_stats_pos

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

proc Graphics.Colors.PrepearWithAlpha
    ; stdcall Script.Colors.CopyColor, font_dark_color, font_color
    mov     [font_dark_color.Red], 0.0
    mov     [font_dark_color.Green], 0.0
    mov     [font_dark_color.Blue], 0.0
    
    mov     [font_dark_color.Alpha], 0.5
    ret
endp