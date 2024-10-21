et_pagebutton   =  $0101
et_windowbutton =  $0102
et_tick         =  $0201

mp_play_btn     dd  1050, 316, 1571, 467
mp_about_btn    dd  1050, 558, 1571, 709
mp_settings_btn dd  1050, 803, 1571, 954
mp_events       dd  3,\
                    et_pagebutton, mp_play_btn,     GamePage,\
                    et_pagebutton, mp_about_btn,    AboutPage,\
                    et_pagebutton, mp_settings_btn, SettingsPage

allp_return_btn dd  25, 989, 240, 1055
gp_events       dd  1,\
                    et_pagebutton, allp_return_btn, MainPage,\
                    et_tick,       33, 17,          TicksGameMap

ap_events       dd  1,\
                    et_pagebutton, allp_return_btn, MainPage

sp_events       dd  1,\
                    et_pagebutton, allp_return_btn, MainPage

EventsList      dd  0, mp_events, gp_events, ap_events, sp_events