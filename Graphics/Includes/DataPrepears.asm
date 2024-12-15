; 375 44 485 32 86 Генадий Григорьевич
proc Graphics.Draw.CoordsRectPrepears
    ; animation blocks
    stdcall Graphics.Draw.CoordsRectPrepears.ForAnimations
    ; quard obj
    stdcall Scripts.Getters.ConvertWithQuardCoords, settings_btn_subline_coords, settings_btn_subline_design
    stdcall Scripts.Getters.ConvertWithQuardCoords, pp_return_chrest_coords,     pp_return_chrest_design
    stdcall Scripts.Getters.ConvertWithQuardCoords, wp_return_chrest_coords,     wp_return_chrest_design
    stdcall Scripts.Getters.ConvertWithQuardCoords, sp_return_chrest_coords,     sp_return_chrest_design
    stdcall Scripts.Getters.ConvertWithQuardCoords, hp_return_chrest_coords,     hp_return_chrest_design
    ; default
    stdcall Scripts.Getters.ConvertCoords, font_coords,                     font_design
    stdcall Scripts.Getters.ConvertCoords, book_root_coords,                book_root_design
    stdcall Scripts.Getters.ConvertCoords, book_endg_coords,                book_endg_design
    stdcall Scripts.Getters.ConvertCoords, book_brdcrn_coords,              book_brdcrn_design
    stdcall Scripts.Getters.ConvertCoords, book_corner_coords,              book_corner_design
    stdcall Scripts.Getters.ConvertCoords, book_brdfnt_coords,              book_brdfnt_design
    stdcall Scripts.Getters.ConvertCoords, book_brd_coords,                 book_brd_design
    stdcall Scripts.Getters.ConvertCoords, book_flgpl_coords,               book_flgpl_design
    stdcall Scripts.Getters.ConvertCoords, button_exit_coords,              button_exit_design
    stdcall Scripts.Getters.ConvertCoords, mp_gamefont_coords,              mp_gamefont_design
    stdcall Scripts.Getters.ConvertCoords, mg_gamebrdr_coords,              mp_gamebrdr_design
    stdcall Scripts.Getters.ConvertCoords, mp_grbgbrdr_coords,              mp_grbgbrdr_design
    stdcall Scripts.Getters.ConvertCoords, mp_grbgfont_coords,              mp_grbgfont_design
    stdcall Scripts.Getters.ConvertCoords, mp_fntvertln_coords,             mp_fntvertln_design
    stdcall Scripts.Getters.ConvertCoords, mp_fnthortln_coords,             mp_fnthortln_design
    stdcall Scripts.Getters.ConvertCoords, exitbtn_font_coords,             exitbtn_font_design
    stdcall Scripts.Getters.ConvertCoords, lp_bar_brdr1_coords,             lp_bar_brdr1_design
    stdcall Scripts.Getters.ConvertCoords, lp_bar_brdr2_coords,             lp_bar_brdr2_design
    stdcall Scripts.Getters.ConvertCoords, lp_bar_brdr3_coords,             lp_bar_brdr3_design
    stdcall Scripts.Getters.ConvertCoords, lp_bar_main_coords,              lp_bar_main_design
    stdcall Scripts.Getters.ConvertCoords, recovery_btn_fnt_coords,         recovery_btn_fnt_design
    stdcall Scripts.Getters.ConvertCoords, recovery_btn_out_circle_coords,  recovery_btn_out_circle_design
    stdcall Scripts.Getters.ConvertCoords, recovery_btn_in_circle_coords,   recovery_btn_in_circle_design
    stdcall Scripts.Getters.ConvertCoords, recovery_btn_fntblock_coords,    recovery_btn_fntblock_design
    stdcall Scripts.Getters.ConvertCoords, recovery_btn_lftriangle_coords,  recovery_btn_lftriangle_design
    stdcall Scripts.Getters.ConvertCoords, recovery_btn_rgtriangle_coords,  recovery_btn_rgtriangle_design
    stdcall Scripts.Getters.ConvertCoords, settings_btn_fnt_coords,         settings_btn_fnt_design
    stdcall Scripts.Getters.ConvertCoords, pause_btn_fnt_coords,            pause_btn_fnt_design
    stdcall Scripts.Getters.ConvertCoords, pause_btn_lines_coords,          pause_btn_lines_design
    stdcall Scripts.Getters.ConvertCoords, settings_btn_out_circle_coords,  settings_btn_out_circle_design
    stdcall Scripts.Getters.ConvertCoords, settings_btn_in_circle_coords,   settings_btn_in_circle_design
    stdcall Scripts.Getters.ConvertCoords, settings_btn_mainline_coords,    settings_btn_mainline_design
    stdcall Scripts.Getters.ConvertCoords, pp_border_coords,                pp_border_desing
    stdcall Scripts.Getters.ConvertCoords, pp_font_coords,                  pp_font_desing
    stdcall Scripts.Getters.ConvertCoords, pp_return_circle_coords,         pp_return_circle_desing
    stdcall Scripts.Getters.ConvertCoords, pp_esbtn_brdr_coords,            pp_esbtn_brdr_design
    stdcall Scripts.Getters.ConvertCoords, pp_esbtn_font_coords,            pp_esbtn_font_desing
    stdcall Scripts.Getters.ConvertCoords, pp_ebtn_brdr_coords,             pp_ebtn_brdr_design
    stdcall Scripts.Getters.ConvertCoords, pp_ebtn_font_coords,             pp_ebtn_font_desing
    stdcall Scripts.Getters.ConvertCoords, wp_border_coords,                wp_border_design 
    stdcall Scripts.Getters.ConvertCoords, wp_font_coords,                  wp_font_desing
    stdcall Scripts.Getters.ConvertCoords, wp_return_circle_coords,         wp_return_circle_desing
    stdcall Scripts.Getters.ConvertCoords, wp_line_coords,                  wp_line_design
    stdcall Scripts.Getters.ConvertCoords, wp_againbtn_brdr_coords,         wp_againbtn_brdr_design
    stdcall Scripts.Getters.ConvertCoords, wp_againbtn_font_coords,         wp_againbtn_font_design
    stdcall Scripts.Getters.ConvertCoords, wp_exitbtn_brdr_coords,          wp_exitbtn_brdr_design
    stdcall Scripts.Getters.ConvertCoords, wp_exitbtn_font_coords,          wp_exitbtn_font_design
    stdcall Scripts.Getters.ConvertCoords, sp_border_coords,                sp_border_design
    stdcall Scripts.Getters.ConvertCoords, sp_font_coords,                  sp_font_design
    stdcall Scripts.Getters.ConvertCoords, sp_return_circle_coords,         sp_return_circle_design
    stdcall Scripts.Getters.ConvertCoords, sp_lines_coords,                 sp_lines_design
    stdcall Scripts.Getters.ConvertCoords, sp_chhkbrdr_coords,              sp_chhkbrdr_design
    stdcall Scripts.Getters.ConvertCoords, sp_chhkfont_coords,              sp_chhkfont_design
    stdcall Scripts.Getters.ConvertCoords, sp_switch_mbrdr_coords,          sp_switch_mbrdr_design
    stdcall Scripts.Getters.ConvertCoords, sp_switch_mfont_coords,          sp_switch_mfont_design
    stdcall Scripts.Getters.ConvertCoords, sp_switch_vbrdr_coords,          sp_switch_vbrdr_design
    stdcall Scripts.Getters.ConvertCoords, sp_switch_vfont_coords,          sp_switch_vfont_design
    stdcall Scripts.Getters.ConvertCoords, sp_switch_hbrdr_coords,          sp_switch_hbrdr_design
    stdcall Scripts.Getters.ConvertCoords, sp_switch_hfont_coords,          sp_switch_hfont_design
    stdcall Scripts.Getters.ConvertCoords, sp_volume_font_coords,           sp_volume_font_design
    stdcall Scripts.Getters.ConvertCoords, sp_switch_moff_coords,           sp_switch_moff_design
    stdcall Scripts.Getters.ConvertCoords, sp_switch_mon_coords,            sp_switch_mon_design
    stdcall Scripts.Getters.ConvertCoords, sp_switch_voff_coords,           sp_switch_voff_design
    stdcall Scripts.Getters.ConvertCoords, sp_switch_von_coords,            sp_switch_von_design
    stdcall Scripts.Getters.ConvertCoords, sp_switch_hoff_coords,           sp_switch_hoff_design
    stdcall Scripts.Getters.ConvertCoords, sp_switch_hon_coords,            sp_switch_hon_design
    stdcall Scripts.Getters.ConvertCoords, lp_boatsprite_coords,            lp_boatsprite_design
    stdcall Scripts.Getters.ConvertCoords, mp_boatsprite_coords,            mp_boatsprite_design
    stdcall Scripts.Getters.ConvertCoords, hp_border_coords,                hp_border_design
    stdcall Scripts.Getters.ConvertCoords, hp_font_coords,                  hp_font_desing
    stdcall Scripts.Getters.ConvertCoords, hp_return_circle_coords,         hp_return_circle_desing
    stdcall Scripts.Getters.ConvertCoords, hp_playbrdr_coords,              hp_playbrdr_design
    stdcall Scripts.Getters.ConvertCoords, hp_playfont_coords,              hp_playfont_design
    stdcall Scripts.Getters.ConvertCoords, hp_pausebrdr_coords,             hp_pausebrdr_design
    stdcall Scripts.Getters.ConvertCoords, hp_pausefont_coords,             hp_pausefont_design
    stdcall Scripts.Getters.ConvertCoords, hp_aboutbrdr_coords,             hp_aboutbrdr_design
    stdcall Scripts.Getters.ConvertCoords, hp_aboutfont_coords,             hp_aboutfont_design
    stdcall Scripts.Getters.ConvertCoords, hp_exitbrdr_coords,              hp_exitbrdr_design
    stdcall Scripts.Getters.ConvertCoords, hp_exitfont_coords,              hp_exitfont_design
    stdcall Scripts.Getters.ConvertCoords, hp_stngbrdr_coords,              hp_stngbrdr_design
    stdcall Scripts.Getters.ConvertCoords, hp_stngfont_coords,              hp_stngfont_design
    stdcall Scripts.Getters.ConvertCoords, hp_rstrbrdr_coords,              hp_rstrbrdr_design
    stdcall Scripts.Getters.ConvertCoords, hp_rstrfont_coords,              hp_rstrfont_design
    stdcall Scripts.Getters.ConvertCoords, ep_border_coords,                ep_border_design
    stdcall Scripts.Getters.ConvertCoords, ep_font_coords,                  ep_font_desing
    stdcall Scripts.Getters.ConvertCoords, ep_yes_brdr_coords,              ep_yes_brdr_design
    stdcall Scripts.Getters.ConvertCoords, ep_yes_font_coords,              ep_yes_font_design
    stdcall Scripts.Getters.ConvertCoords, ep_no_brdr_coords,               ep_no_brdr_design
    stdcall Scripts.Getters.ConvertCoords, ep_no_font_coords,               ep_no_font_design
    stdcall Scripts.Getters.ConvertCoords, ap_brdr_coords,                  ap_brdr_design
    stdcall Scripts.Getters.ConvertCoords, ap_font_coords,                  ap_font_design
    stdcall Scripts.Getters.ConvertCoords, lgp_border_coords,               lgp_border_desing
    stdcall Scripts.Getters.ConvertCoords, lgp_font_coords,                 lgp_font_desing
    stdcall Scripts.Getters.ConvertCoords, lgp_ebtn_brdr_coords,            lgp_ebtn_brdr_design
    stdcall Scripts.Getters.ConvertCoords, lgp_ebtn_font_coords,            lgp_ebtn_font_design
    stdcall Scripts.Getters.ConvertCoords, lgp_sbtn_brdr_coords,            lgp_sbtn_brdr_design
    stdcall Scripts.Getters.ConvertCoords, lgp_sbtn_font_coords,            lgp_sbtn_font_design
    stdcall Scripts.Getters.ConvertCoords, lgp_lbrdr_coords,                lgp_lbrdr_design
    stdcall Scripts.Getters.ConvertCoords, lgp_lfont_coords,                lgp_lfont_design
    stdcall Scripts.Getters.ConvertCoords, lgp_pbrdr_coords,                lgp_pbrdr_design
    stdcall Scripts.Getters.ConvertCoords, lgp_pfont_coords,                lgp_pfont_design
    stdcall Scripts.Getters.ConvertCoords, lgp_eyeopen_coords,              lgp_eyeopen_design
    stdcall Scripts.Getters.ConvertCoords, lgp_eyeclose_coords,             lgp_eyeclose_design
    ; repeat
    stdcall Scripts.Getters.ConvertRepeatCoords, book_strk_design
    ret
endp

proc Graphics.Draw.CoordsRectPrepears.ForAnimations
    stdcall Graphics.Pages.SettingsPage.CheckSwitchDot
    stdcall Scripts.Getters.ConvertCoords, sp_volume_dot_coords, sp_volume_dot_design
    stdcall Scripts.Getters.ConvertCoords, sp_volume_cmpl_coords, sp_volume_cmpl_design

    stdcall Scripts.Getters.ConvertCoords, button_play_coords, button_play_design
    stdcall Scripts.Getters.ConvertCoords, button_about_coords, button_about_design
    stdcall Scripts.Getters.ConvertCoords, button_stngs_coords, button_stngs_design
endp    

proc Graphics.Colors.Prepear
    stdcall Scripts.Getters.Color, [cl_background],   font_color
    stdcall Scripts.Getters.Color, [cl_root],         book_root_color
    stdcall Scripts.Getters.Color, [cl_stroke],       book_strk_color
    stdcall Scripts.Getters.Color, [cl_ending],       book_endg_color
    stdcall Scripts.Getters.Color, [cl_border],       book_ebrd_color
    stdcall Scripts.Getters.Color, [cl_button],       button_color
    stdcall Scripts.Getters.Color, [cl_headline],     headline_color
    stdcall Scripts.Getters.Color, [cl_headline_bc],  headline_bc_color
    stdcall Scripts.Getters.Color, [cl_flgpl],        book_flgpl_color
    stdcall Scripts.Getters.Color, [cl_text_buttom],  btn_text_color
    stdcall Scripts.Getters.Color, [cl_title],        book_title_color
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

    stdcall Colors.Copy, login_color, brown_dark_color
    stdcall Colors.Copy, password_color, brown_dark_color
    ret
endp

proc Colors.Copy uses ebx edi,\
    dest, src
    mov     ebx, [dest]
    mov     edi, [src]
    mov     ecx, 4
    .loop:
        mov     eax, [edi]
        mov     [ebx], eax
        add     ebx, 4
        add     edi, 4
        loop    .loop
    ret
endp

proc Graphics.Draw.ASCIIPrepear
    locals
        address     dd  ?
    endl
    stdcall Graphics.Draw.Text.Prepear, txt_headline,     str_headline,    fs_headline,  tg_headline,  str_headline_pos
    stdcall Graphics.Draw.Text.Prepear, txt_headline_bc,  str_headline_bc, fs_headline,  tg_headline,  str_headline_bc_pos 
    stdcall Graphics.Draw.Text.Prepear, txt_play,         str_play,        fs_play,      tg_play,      str_play_pos
    stdcall Graphics.Draw.Text.Prepear, txt_about,        str_about,       fs_about,     tg_about,     str_about_pos
    stdcall Graphics.Draw.Text.Prepear, txt_settings,     str_settings,    fs_settings,  tg_settings,  str_settings_pos
    stdcall Graphics.Draw.Text.Prepear, txt_Mexit,        str_exit,        fs_Mexit,     tg_Mexit,     str_Mexit_pos
    stdcall Graphics.Draw.Text.Prepear, txt_title,        str_title,       fs_title,     tg_title,     str_title_pos
    stdcall Graphics.Draw.Text.Prepear, txt_return,       str_return,      fs_return,    tg_return,    str_return_pos
    stdcall Graphics.Draw.Text.Prepear, txt_R_hk,         str_R_hk,        fs_hk,        tg_hk,        str_R_hk_pos
    stdcall Graphics.Draw.Text.Prepear, txt_P_hk,         str_P_hk,        fs_hk,        tg_hk,        str_P_hk_pos
    stdcall Graphics.Draw.Text.Prepear, txt_S_hk,         str_S_hk,        fs_hk,        tg_hk,        str_S_hk_pos
    stdcall Graphics.Draw.Text.Prepear, txt_pause,        str_pause,       fs_pause,     tg_pause,     str_pause_pos 
    stdcall Graphics.Draw.Text.Prepear, txt_exit,         str_exit,        fs_exit,      tg_exit,      str_exit_pos
    stdcall Graphics.Draw.Text.Prepear, txt_saveAexit,    str_saveAexit,   fs_saveAexit, tg_saveAexit, str_saveAexit_pos
    stdcall Graphics.Draw.Text.Prepear, txt_winner,       str_winner,      fs_winner,    tg_winner,    str_winner_pos
    stdcall Graphics.Draw.Text.Prepear, txt_again,        str_again,       fs_again,     tg_again,     str_again_pos
    stdcall Graphics.Draw.Text.Prepear, txt_wexit,        str_exit,        fs_again,     tg_again,     str_wexit_pos
    stdcall Graphics.Draw.Text.Prepear, txt_msettings,    str_settings,    fs_msettings, tg_msettings, str_msettings_pos
    stdcall Graphics.Draw.Text.Prepear, txt_chhotkeys,    str_chhotkeys,   fs_chhotkeys, tg_chhotkeys, str_chhotkeys_pos
    stdcall Graphics.Draw.Text.Prepear, txt_music,        str_music,       fs_music,     tg_music,     str_music_pos
    stdcall Graphics.Draw.Text.Prepear, txt_voice,        str_voice,       fs_music,     tg_voice,     str_voice_pos
    stdcall Graphics.Draw.Text.Prepear, txt_hotkeys,      str_hotkeys,     fs_hotkeys,   tg_hotkeys,   str_hotkeys_pos
    stdcall Graphics.Draw.Text.Prepear, txt_volume,       str_volume,      fs_music,     tg_volume,    str_volume_pos
    stdcall Graphics.Draw.Text.Prepear, txt_moff,         str_off,         fs_switch,    tg_switch,    str_moff_pos
    stdcall Graphics.Draw.Text.Prepear, txt_voff,         str_off,         fs_switch,    tg_switch,    str_voff_pos
    stdcall Graphics.Draw.Text.Prepear, txt_hoff,         str_off,         fs_switch,    tg_switch,    str_hoff_pos
    stdcall Graphics.Draw.Text.Prepear, txt_mon,          str_on,          fs_switch,    tg_switch,    str_mon_pos
    stdcall Graphics.Draw.Text.Prepear, txt_von,          str_on,          fs_switch,    tg_switch,    str_von_pos
    stdcall Graphics.Draw.Text.Prepear, txt_hon,          str_on,          fs_switch,    tg_switch,    str_hon_pos
    stdcall Graphics.Draw.Text.Prepear, txt_HPhotkeys,    str_chhotkeys,   fs_HPhotkeys, tg_HPhotkeys, str_HPhotkeys_pos
    stdcall Graphics.Draw.Text.Prepear, txt_wantExit,     str_wantExit,    fs_wantExit,  tg_wantExit,  str_wantExit_pos
    stdcall Graphics.Draw.Text.Prepear, txt_yes,          str_yes,         fs_yesno,     tg_yesno,     str_yes_pos
    stdcall Graphics.Draw.Text.Prepear, txt_no,           str_no,          fs_yesno,     tg_yesno,     str_no_pos
    stdcall Graphics.Draw.Text.Prepear, txt_gamerool,     str_gamerool,    fs_gamerool,  tg_gamerool,  str_gamerool_pos
    stdcall Graphics.Draw.Text.Prepear, txt_grtext,       str_grtext,      fs_grtext,    tg_grtext,    str_grtext_pos
    stdcall Graphics.Draw.Text.Prepear, txt_hkplay,       str_hkplay,      fs_hktext,    tg_hktext,    str_hkplay_pos
    stdcall Graphics.Draw.Text.Prepear, txt_hkabout,      str_hkabout,     fs_hktext,    tg_hktext,    str_hkabout_pos
    stdcall Graphics.Draw.Text.Prepear, txt_hksettings,   str_hksettings,  fs_hktext,    tg_hktext,    str_hksettings_pos
    stdcall Graphics.Draw.Text.Prepear, txt_hkpause,      str_hkpause,     fs_hktext,    tg_hktext,    str_hkpause_pos
    stdcall Graphics.Draw.Text.Prepear, txt_hkexit,       str_hkexit,      fs_hktext,    tg_hktext,    str_hkexit_pos
    stdcall Graphics.Draw.Text.Prepear, txt_hkrestart,    str_hkrestart,   fs_hktext,    tg_hktext,    str_hkrestart_pos
    stdcall Scripts.Convert.FromENtoASCII, [HK_PLAY],     str_hotkey
    stdcall Graphics.Draw.Text.Prepear, txt_hkplayS,      str_hotkey,      fs_hktextS,   tg_hktextS,   str_hkplayS_pos
    stdcall Scripts.Convert.FromENtoASCII, [HK_ABOUT],    str_hotkey
    stdcall Graphics.Draw.Text.Prepear, txt_hkaboutS,     str_hotkey,      fs_hktextS,   tg_hktextS,   str_hkaboutS_pos
    stdcall Scripts.Convert.FromENtoASCII, [HK_SETTINGS], str_hotkey
    stdcall Graphics.Draw.Text.Prepear, txt_hksettingsS,  str_hotkey,      fs_hktextS,   tg_hktextS,   str_hksettingsS_pos
    stdcall Scripts.Convert.FromENtoASCII, [HK_STOP],     str_hotkey
    stdcall Graphics.Draw.Text.Prepear, txt_hkpauseS,     str_hotkey,      fs_hktextS,   tg_hktextS,   str_hkpauseS_pos
    stdcall Scripts.Convert.FromENtoASCII, [HK_EXIT],     str_hotkey
    stdcall Graphics.Draw.Text.Prepear, txt_hkexitS,      str_hotkey,      fs_hktextS,   tg_hktextS,   str_hkexitS_pos
    stdcall Scripts.Convert.FromENtoASCII, [HK_RESTART],  str_hotkey
    stdcall Graphics.Draw.Text.Prepear, txt_hkrestartS,   str_hotkey,      fs_hktextS,   tg_hktextS,   str_hkrestartS_pos
    stdcall Graphics.Draw.Text.Prepear, txt_logging,      str_logging,     fs_logging,   tg_logging,   str_logging_pos
    stdcall Graphics.Draw.Text.Prepear, txt_lgpexit,      str_lgpexit,     fs_lgpexit,   tg_lgpexit,   str_lgpexit_pos
    stdcall Graphics.Draw.Text.Prepear, txt_submit,       str_submit,      fs_lgpexit,   tg_lgpexit,   str_submit_pos
    stdcall Server.ErrorPayloadUpdate
    stdcall Server.AutorizationString
    ret
endp

proc Server.ErrorPayloadUpdate
    stdcall Graphics.Draw.Text.Prepear, txt_error,        [str_error],       fs_error,     tg_error,     str_error_pos
    ret
endp

proc Server.AutorizationString uses ebx edi
    mov     ebx, outputStrBufLog
    cmp     byte [ebx], 0
    jne     @F
        cmp     [IsLogin], GL_TRUE
        je      @F
            stdcall Graphics.Draw.Text.Prepear, txt_login, str_login, fs_logpas, tg_logpas, str_login_pos
            jmp     .password
    @@:
        stdcall Graphics.Draw.Text.Prepear, txt_login, outputStrBufLog, fs_logpas, tg_logpas, str_login_pos
    .password:
    mov     edi, outputStrBufPas
    cmp     byte [edi], 0
    jne     @F
        cmp     [IsPassword], GL_TRUE
        je      @F
            stdcall Graphics.Draw.Text.Prepear, txt_password, str_password, fs_logpas, tg_logpas, str_password_pos
            jmp     .exit
    @@:
        stdcall Graphics.Draw.Text.Prepear, txt_password, outputStrBufPas, fs_logpas, tg_logpas, str_password_pos
    .exit:
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
    mov     [font_dark_color.Red], 0.0
    mov     [font_dark_color.Green], 0.0
    mov     [font_dark_color.Blue], 0.0
    mov     [font_dark_color.Alpha], 0.5
    ret
endp

proc Graphics.Texture
    stdcall Texture.Create, boatloading_texture, boatLoaderPath
    stdcall Texture.Create, boatbook_texture,    boatBookPath
    stdcall Texture.Create, eyeopen_texture,     eyeOpenPath
    stdcall Texture.Create, eyeclose_texture,    eyeClosePath
    ret
endp