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
Anim_MainPage_ExitButton_cl  dd  button_exit_design,\
                                    exit_button_color, milk_light_color, milk_color
Anim_MainPage                   dd  4,\
                                    Anim_btn_cl,    Anim_MainPage_GameButton_cl,\
                                    Anim_btn_cl,   Anim_MainPage_AboutButton_cl,\
                                    Anim_btn_cl, Anim_MainPage_SettingButton_cl,\
                                    Anim_btn_cl, Anim_MainPage_ExitButton_cl

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

Anim_AboutPage                  dd  2,\
                                    Anim_btn_cl, Anim_Settingsbtn_cl,\
                                    Anim_btn_cl, Anim_SubPages_cl

Anim_SReturnFont_cl             dd  sp_return_circle_design,\
                                    retbtn_font_color, pale_color, brown_text_color
Anim_SReturnHrst_cl             dd  sp_return_circle_design,\
                                    retbtn_chrst_color, brown_text_color, pale_color
Anim_SChHKeysFont_cl            dd  sp_chhkbrdr_design,\
                                    chhtkeys_font_color, brown_text_color, pale_color
Anim_SChHKeysText_cl            dd  sp_chhkbrdr_design,\
                                    chhtkeys_text_color, pale_color, brown_text_color
Anim_SettingsPage               dd  4,\
                                    Anim_btn_cl, Anim_SReturnFont_cl,\
                                    Anim_btn_cl, Anim_SReturnHrst_cl,\
                                    Anim_btn_cl, Anim_SChHKeysFont_cl,\
                                    Anim_btn_cl, Anim_SChHKeysText_cl

Anim_PSaveAExitText_cl          dd  pp_esbtn_brdr_design,\
                                    esbtn_text_color, brown_color, brown_text_color
Anim_PSaveAExitFont_cl          dd  pp_esbtn_brdr_design,\
                                    esbtn_font_color, brown_text_color, brown_color
Anim_PExitText_cl               dd  pp_ebtn_brdr_design,\
                                    ebtn_text_color, pale_color, brown_text_color
Anim_PExitFont_cl               dd  pp_ebtn_brdr_design,\
                                    ebtn_font_color, brown_text_color, pale_color 
Anim_PRetBtnFont_cl             dd  pp_return_circle_desing,\
                                    retbtn_font_color, pale_color, brown_text_color
Anim_PRetBtnHrst_cl             dd  pp_return_circle_desing,\
                                    retbtn_chrst_color, brown_text_color, pale_color
Anim_PausePage                  dd  6,\
                                    Anim_btn_cl, Anim_PSaveAExitText_cl,\
                                    Anim_btn_cl, Anim_PSaveAExitFont_cl,\
                                    Anim_btn_cl, Anim_PExitText_cl,\
                                    Anim_btn_cl, Anim_PExitFont_cl,\
                                    Anim_btn_cl, Anim_PRetBtnFont_cl,\
                                    Anim_btn_cl, Anim_PRetBtnHrst_cl

Anim_WRetBtnFont_cl             dd  wp_return_circle_desing,\
                                    retbtn_font_color, pale_color, brown_text_color
Anim_WRetBtnHrst_cl             dd  wp_return_circle_desing,\
                                    retbtn_chrst_color, brown_text_color, pale_color
Anim_WAgainBtnFont_cl           dd  wp_againbtn_brdr_design,\
                                    againbtn_font_color, brown_text_color, pale_color
Anim_WAgainBtnText_cl           dd  wp_againbtn_brdr_design,\
                                    againbtn_text_color, pale_color, brown_text_color
Anim_WExitBtnFont_cl            dd  wp_exitbtn_brdr_design,\
                                    ebtn_font_color, brown_text_color, pale_color
Anim_WExitBtnText_cl            dd  wp_exitbtn_brdr_design,\
                                    ebtn_text_color, pale_color, brown_text_color
Anim_WinnerPage                 dd  8,\
                                    Anim_btn_cl, Anim_WRetBtnFont_cl,\
                                    Anim_btn_cl, Anim_WRetBtnHrst_cl,\
                                    Anim_btn_cl, Anim_WAgainBtnFont_cl,\
                                    Anim_btn_cl, Anim_WAgainBtnText_cl,\
                                    Anim_btn_cl, Anim_WExitBtnFont_cl,\
                                    Anim_btn_cl, Anim_WExitBtnText_cl

Anim_HRetBtnFont_cl             dd  hp_return_circle_desing,\
                                    retbtn_font_color, pale_color, brown_text_color
Anim_HRetBtnHrst_cl             dd  hp_return_circle_desing,\
                                    retbtn_chrst_color, brown_text_color, pale_color
Anim_HotkeysPage                dd  2,\
                                    Anim_btn_cl, Anim_HRetBtnFont_cl,\
                                    Anim_btn_cl, Anim_HRetBtnHrst_cl

Anim_EPYesFont_cl               dd  ep_yes_brdr_design,\
                                    yes_font_color, brown_text_color, brown_color
Anim_EPYesText_cl               dd  ep_yes_brdr_design,\
                                    yes_text_color, brown_color, brown_text_color
Anim_EPNoFont_cl                dd  ep_no_brdr_design,\
                                    no_font_color, brown_text_color, pale_color
Anim_EPNoText_cl                dd  ep_no_brdr_design,\
                                    no_text_color, pale_color, brown_text_color
Anim_ExitPage                   dd  4,\
                                    Anim_btn_cl, Anim_EPYesFont_cl,\
                                    Anim_btn_cl, Anim_EPYesText_cl,\
                                    Anim_btn_cl, Anim_EPNoFont_cl,\
                                    Anim_btn_cl, Anim_EPNoText_cl  

Anim_LoggingPage                dd  0                                  

AnimsList                       dd  Anim_LoadingPage, Anim_MainPage, Anim_GamePage, Anim_AboutPage, Anim_SettingsPage, Anim_PausePage, Anim_WinnerPage, Anim_HotkeysPage, Anim_ExitPage, Anim_LoggingPage