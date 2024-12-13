et_pagebutton   =  $0101
et_prevpage     =  $0102
et_wndbutton    =  $0103
et_tick         =  $0201

lp_events       dd  0

mp_events       dd  4,\
                    et_pagebutton, button_play_design,  GamePage,\
                    et_pagebutton, button_about_design, AboutPage,\
                    et_pagebutton, button_stngs_design, SettingsPage,\
                    et_pagebutton, button_exit_design,  ExitPage

gp_events       dd  5,\
                    et_pagebutton, exitbtn_font_design,     MainPage,\
                    et_tick,       TicksFontList_Float_c1,  TicksMatrix,\
                    et_wndbutton,  recovery_btn_fnt_design, Game.RecoveryTicks,\
                    et_pagebutton, pause_btn_fnt_design,    PausePage,\
                    et_pagebutton, settings_btn_fnt_design, SettingsPage

ap_events       dd  2,\
                    et_pagebutton, settings_btn_fnt_design, SettingsPage,\
                    et_pagebutton, exitbtn_font_design,     MainPage

sp_events       dd  6,\
                    et_wndbutton,  sp_volume_font_design,   Audio.Volume.Change,\
                    et_prevpage,   sp_return_circle_design, PrevousPage,\
                    et_wndbutton,  sp_switch_mbrdr_design,  Audio.Switch.Music,\
                    et_wndbutton,  sp_switch_vbrdr_design,  Audio.Switch.Voice,\
                    et_wndbutton,  sp_switch_hbrdr_design,  Audio.Switch.Hotkey,\
                    et_pagebutton, sp_chhkbrdr_design,      HotkeysPage

pp_events       dd  3,\
                    et_prevpage,  pp_return_circle_desing, PrevousPage,\
                    et_wndbutton, pp_ebtn_brdr_design,     Game.Leave.WithoutSaving,\
                    et_wndbutton, pp_esbtn_brdr_design,    Game.Leave.WithSaving

wp_events       dd  3,\
                    et_wndbutton,  wp_return_circle_desing, Game.Leave.WithoutSaving,\
                    et_wndbutton,  wp_exitbtn_brdr_design,  Game.Leave.WithoutSaving,\
                    et_wndbutton,  wp_againbtn_brdr_design, Game.Leave.Restart

hp_events       dd  1,\
                    et_prevpage, hp_return_circle_desing, PrevousPage

ep_events       dd  2,\
                    et_wndbutton, ep_yes_brdr_design, Application.Exit,\
                    et_prevpage,  ep_no_brdr_design,  PrevousPage

lgp_events      dd  0

EventsList      dd  lp_events, mp_events, gp_events, ap_events, sp_events, pp_events, wp_events, hp_events, ep_events, lgp_events
