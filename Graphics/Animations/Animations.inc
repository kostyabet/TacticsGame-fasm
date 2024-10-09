; ==== Animations Type ==== ;
Anim_btn           =   1

; ==== Animation Changes Type ==== ;
Anim_ch_cl         =   1

Anim_MainPage_GameButton    dd  0, 0, 0, 0,\ ; position
                                Anim_ch_cl 

Anim_MainPage   dd  1,\ ; length
                    Anim_btn, Anim_MainPage_GameButton ; type, animation

AnimsList       dd  Anim_MainPage