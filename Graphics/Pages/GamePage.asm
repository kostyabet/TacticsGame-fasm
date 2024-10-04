proc Draw.Pages.GamePage
        stdcall Graphics.Draw.Shapes, font_design,                 font_color
        stdcall Graphics.Draw.Shapes, game_border_design,          game_border_color
        stdcall Graphics.Draw.Shapes, game_tick_c1_design,         game_tick_c1_color
        stdcall Graphics.Draw.Shapes, game_tick_c2_design,         game_tick_c2_color
        stdcall Graphics.Draw.Shapes, game_tick_c3_design,         game_tick_c3_color
        stdcall Graphics.Draw.Shapes, game_tick_c4_design,         game_tick_c4_color
        stdcall Graphics.Draw.Shapes, game_tick_c5_design,         game_tick_c5_color
        stdcall Graphics.Draw.Shapes, game_tickfont_c1_design,     maingame_tick_decup_color
        stdcall Graphics.Draw.Shapes, game_tickfont_c2_design,     maingame_tickfont_up_color
        stdcall Graphics.Draw.Shapes, maingame_font_design,        maingame_font_color
        stdcall Graphics.Draw.Shapes, maingame_font_circle_design, maingame_tick_decup_color
        stdcall Graphics.Draw.Shapes, game_garbage_font_design,    game_garbage_font_color
        stdcall Graphics.Draw.Shapes, game_garbabe_border_design,  game_garbabe_border_color
        stdcall Graphics.Draw.Shapes, maingame_gameborder_design1, maingame_gameborder_color
        stdcall Graphics.Draw.Shapes, maingame_gameborder_design2, maingame_gameborder_color
        stdcall Graphics.Draw.Shapes, maingame_tick_decup_design,  maingame_tick_decup_color
        stdcall Graphics.Draw.Shapes, maingame_tick_decdn_design,  maingame_tick_decdn_color
    ret
endp