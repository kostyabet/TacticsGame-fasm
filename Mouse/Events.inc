et_pagebutton   =  $0101
et_wndbutton    =  $0102
et_tick         =  $0201

lp_events       dd  0

mp_events       dd  3,\
                    et_pagebutton, button_play_design,  GamePage,\
                    et_pagebutton, button_about_design, AboutPage,\
                    et_pagebutton, button_stngs_design, SettingsPage

gp_events       dd  3,\
                    et_pagebutton, exitbtn_font_design,    MainPage,\
                    et_tick,       TicksFontList_Float_c1, TicksMatrix,\
                    et_wndbutton,  recovery_btn_fnt_design, Game.RecoveryTicks

ap_events       dd  1,\
                    et_pagebutton, exitbtn_font_design, MainPage

sp_events       dd  1,\
                    et_pagebutton, exitbtn_font_design, MainPage

EventsList      dd  lp_events, mp_events, gp_events, ap_events, sp_events