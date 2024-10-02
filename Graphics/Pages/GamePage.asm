proc Draw.Pages.GamePage
        stdcall Graphics.Draw.Shapes, font_design,                font_color
        stdcall Graphics.Draw.Shapes, game_border_design,         game_border_color
        stdcall Graphics.Draw.Shapes, game_garbage_font_design,   game_garbage_font_color
        stdcall Graphics.Draw.Shapes, game_garbabe_border_design, game_garbabe_border_color
        stdcall Graphics.Draw.Shapes, game_tick_c1_design,        game_tick_c1_color
        stdcall Graphics.Draw.Shapes, game_tick_c2_design,        game_tick_c2_color
        stdcall Graphics.Draw.Shapes, game_tick_c3_design,        game_tick_c3_color
        stdcall Graphics.Draw.Shapes, game_tick_c4_design,        game_tick_c4_color
        stdcall Graphics.Draw.Shapes, game_tick_c5_design,        game_tick_c5_color
        stdcall Graphics.Draw.Shapes, maingame_font_design,       maingame_font_color
    ret
endp