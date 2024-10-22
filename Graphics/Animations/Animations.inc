; ==== Animations Type ==== ;
Anim_btn           =   $0001
Anim_static        =   $0002

Anim_MainPage_GameButton    dd  1050, 316, 1570, 467,\ ; position
                                play_button_color, milk_light_color, milk_color
Anim_MainPage_AboutButton   dd  1050, 558, 1570, 709,\ ; position
                                about_button_color, milk_light_color, milk_color
Anim_MainPage_SettingButton dd  1050, 800, 1570, 951,\ ; position
                                settings_button_color, milk_light_color, milk_color
Anim_MainPage               dd  3,\
                                Anim_btn, Anim_MainPage_GameButton,\
                                Anim_btn, Anim_MainPage_AboutButton,\
                                Anim_btn, Anim_MainPage_SettingButton 

Anim_LoadingPage            dd  1,\
                                Anim_static, Animation.Static.LoadingPage.Bar

Anim_GamePage               dd  0
Anim_AboutPage              dd  0
Anim_SettingsPage           dd  0

AnimsList                   dd  Anim_LoadingPage, Anim_MainPage, Anim_GamePage, Anim_AboutPage, Anim_SettingsPage