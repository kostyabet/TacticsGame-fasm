et_pagebutton   =  $0101
et_windowbutton =  $0102
et_tick         =  $0201

mp_events       dd  3,\
                    et_pagebutton,  button_play_design,     GamePage,\
                    et_pagebutton, button_about_design,    AboutPage,\
                    et_pagebutton, button_stngs_design, SettingsPage

gp_events       dd  1,\
                    et_pagebutton, exitbtn_font_design, MainPage,\
                    et_tick,       33, 17,          TicksGameMap

ap_events       dd  1,\
                    et_pagebutton, exitbtn_font_design, MainPage

sp_events       dd  1,\
                    et_pagebutton, exitbtn_font_design, MainPage

EventsList      dd  0, mp_events, gp_events, ap_events, sp_events