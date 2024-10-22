; ==== Animations Type ==== ;
Anim_btn_cl        =   $0101
Anim_btn_mv        =   $0102
Anim_static        =   $0201

Anim_MainPage_GameButton_cl     dd  1050, 316, 1570, 467,\ ; position
                                    play_button_color, milk_light_color, milk_color
Anim_MainPage_AboutButton_cl    dd  1050, 558, 1570, 709,\ ; position
                                    about_button_color, milk_light_color, milk_color
Anim_MainPage_SettingButton_cl  dd  1050, 800, 1570, 951,\ ; position
                                settings_button_color, milk_light_color, milk_color
Anim_MainPage_AboutButton_mv    dd  button_about_coords, 0, 5, Graphics.Draw.CoordsRectPrepears.ForAnimations
Anim_MainPage_SettingButton_mv  dd  button_stngs_coords, 0, 5, Graphics.Draw.CoordsRectPrepears.ForAnimations
Anim_MainPage_GameButton_mv     dd  button_play_coords,  0, 5, Graphics.Draw.CoordsRectPrepears.ForAnimations
Anim_MainPage                   dd  6,\
                                    Anim_btn_cl,    Anim_MainPage_GameButton_cl,\
                                    Anim_btn_mv,    Anim_MainPage_GameButton_mv,\
                                    Anim_btn_cl,   Anim_MainPage_AboutButton_cl,\
                                    Anim_btn_mv,   Anim_MainPage_AboutButton_mv,\
                                    Anim_btn_cl, Anim_MainPage_SettingButton_cl,\ 
                                    Anim_btn_mv, Anim_MainPage_SettingButton_mv

Anim_LoadingPage                dd  1,\
                                    Anim_static, Animation.Static.LoadingPage.Bar

Anim_SubPages_cl                dd  25,  989,  240, 1055,\ 
                                exit_button_color, milk_light_color, milk_color
Anim_GamePage                   dd  1,\
                                    Anim_btn_cl, Anim_SubPages_cl

Anim_AboutPage                  dd  1,\
                                    Anim_btn_cl, Anim_SubPages_cl

Anim_SettingsPage               dd  1,\
                                    Anim_btn_cl, Anim_SubPages_cl

AnimsList                       dd  Anim_LoadingPage, Anim_MainPage, Anim_GamePage, Anim_AboutPage, Anim_SettingsPage