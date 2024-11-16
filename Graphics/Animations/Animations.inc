; ==== Animations Type ==== ;
Anim_btn_cl        =   $0101
Anim_btn_mv        =   $0102
Anim_static        =   $0201

Anim_MainPage_GameButton_cl     dd  button_play_design,\
                                    play_button_color, milk_light_color, milk_color
Anim_MainPage_AboutButton_cl    dd  button_about_design,\
                                    about_button_color, milk_light_color, milk_color
Anim_MainPage_SettingButton_cl  dd  button_stngs_design,\
                                    settings_button_color, milk_light_color, milk_color
Anim_MainPage_AboutButton_mv    dd  button_about_coords, 0, 5
Anim_MainPage_SettingButton_mv  dd  button_stngs_coords, 0, 5
Anim_MainPage_GameButton_mv     dd  button_play_coords,  0, 5
Anim_MainPage                   dd  6,\
                                    Anim_btn_cl,    Anim_MainPage_GameButton_cl,\
                                    Anim_btn_mv,    Anim_MainPage_GameButton_mv,\
                                    Anim_btn_cl,   Anim_MainPage_AboutButton_cl,\
                                    Anim_btn_mv,   Anim_MainPage_AboutButton_mv,\
                                    Anim_btn_cl, Anim_MainPage_SettingButton_cl,\
                                    Anim_btn_mv, Anim_MainPage_SettingButton_mv

Anim_LoadingPage                dd  1,\
                                    Anim_static, Animation.Static.LoadingPage.Bar

Anim_SubPages_cl                dd  exitbtn_font_design,\ 
                                    exit_button_color, milk_light_color, milk_color
Anim_Recoverybtn_cl             dd  recovery_btn_fnt_design,\ 
                                    recovery_button_color, milk_light_color, milk_color
Anim_Settingsbtn_cl             dd  settings_btn_fnt_design,\ 
                                    settings_button_color, milk_light_color, milk_color
Anim_Pausebtn_cl                dd  pause_btn_fnt_design,\ 
                                    pause_button_color, milk_light_color, milk_color
Anim_GamePage                   dd  4,\
                                    Anim_btn_cl, Anim_SubPages_cl,\
                                    Anim_btn_cl, Anim_Recoverybtn_cl,\
                                    Anim_btn_cl, Anim_Settingsbtn_cl,\
                                    Anim_btn_cl, Anim_Pausebtn_cl

Anim_AboutPage                  dd  1,\
                                    Anim_btn_cl, Anim_SubPages_cl

Anim_SettingsPage               dd  1,\
                                    Anim_btn_cl, Anim_SubPages_cl

Anim_SaveAExitText_cl           dd  pp_esbtn_brdr_design,\
                                    esbtn_text_color, brown_color, brown_text_color
Anim_SaveAExitFont_cl           dd  pp_esbtn_brdr_design,\
                                    esbtn_font_color, brown_text_color, brown_color
Anim_ExitText_cl                dd  pp_ebtn_brdr_design,\
                                    ebtn_text_color, pale_color, brown_text_color
Anim_ExitFont_cl                dd  pp_ebtn_brdr_design,\
                                    ebtn_font_color, brown_text_color, pale_color 
Anim_RetBtnFont_cl              dd  pp_return_circle_desing,\
                                    retbtn_font_color, pale_color, brown_text_color
Anim_RetBtnHrst_cl              dd  pp_return_circle_desing,\
                                    retbtn_chrst_color, brown_text_color, pale_color
Anim_PausePage                  dd  6,\
                                    Anim_btn_cl, Anim_SaveAExitText_cl,\
                                    Anim_btn_cl, Anim_SaveAExitFont_cl,\
                                    Anim_btn_cl, Anim_ExitText_cl,\
                                    Anim_btn_cl, Anim_ExitFont_cl,\
                                    Anim_btn_cl, Anim_RetBtnFont_cl,\
                                    Anim_btn_cl, Anim_RetBtnHrst_cl

AnimsList                       dd  Anim_LoadingPage, Anim_MainPage, Anim_GamePage, Anim_AboutPage, Anim_SettingsPage, Anim_PausePage