proc Draw.Pages.GamePage
    stdcall Graphics.Draw.Shapes, font_design, font_color

    stdcall Graphics.Draw.Shapes, mp_gamebrdr_design, milk_color
    stdcall Graphics.Draw.Shapes, mp_gamefont_design, brown_light_color
    stdcall Graphics.Draw.Shapes, mp_grbgbrdr_design, brown_medium_color
    stdcall Graphics.Draw.Shapes, mp_grbgfont_design, brown_dark_color

    stdcall Graphics.Draw.Shapes, mp_fnthortln_design, milk_color
    stdcall Graphics.Draw.Shapes, mp_fntvertln_design, milk_color
    
    stdcall Graphics.Draw.Ticks, TicksFontList_Float,     TicksFontList_Colors
    stdcall Graphics.Draw.Ticks, TicksFontDecorate_Float, TicksFontDecorate_Colors
    stdcall Graphics.Draw.Ticks, TicksList_Float, TicksList_Colors
    ret
endp