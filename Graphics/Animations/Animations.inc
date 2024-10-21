; ==== Animations Type ==== ;
Anim_btn           =   $0001
Anim_static        =   $0002

; ==== Animation Changes Type ==== ;
Anim_ch_cl         =   1

Anim_MainPage_GameButton    dd  0, 0, 0, 0,\ ; position
                                Anim_ch_cl
Anim_MainPage               dd  1,\
                                Anim_btn, Anim_MainPage_GameButton 

Anim_LoadingPage            dd  1,\
                                Anim_static, Animation.Static.LoadingPage.Bar

Anim_GamePage               dd  0
Anim_AboutPage              dd  0
Anim_SettingsPage           dd  0

AnimsList                   dd  Anim_LoadingPage, Anim_MainPage, Anim_GamePage, Anim_AboutPage, Anim_SettingsPage