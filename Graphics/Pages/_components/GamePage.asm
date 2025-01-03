proc Draw.Pages.GamePage
    stdcall Graphics.Draw.Shapes, mp_gamebrdr_design, milk_color
    stdcall Graphics.Draw.Shapes, mp_gamefont_design, brown_light_color
    stdcall Graphics.Draw.Shapes, mp_grbgbrdr_design, brown_medium_color
    stdcall Graphics.Draw.Shapes, mp_grbgfont_design, brown_dark_color

    stdcall Graphics.Draw.Shapes, mp_fnthortln_design, milk_color
    stdcall Graphics.Draw.Shapes, mp_fntvertln_design, milk_color
    
    stdcall Graphics.Draw.Ticks, TicksFontList_Float,     TicksFontList_Colors
    stdcall Graphics.Draw.Ticks, TicksFontDecorate_Float, TicksFontDecorate_Colors
    stdcall Graphics.Draw.Ticks, TicksList_Float,         TicksList_Colors
    
    stdcall Graphics.Draw.Ticks, TicksFontMltDrList_Float,  TicksFontList_MltColors

    stdcall Graphics.Draw.Shapes, gp_pointsbar_brdr_design, brown_text_color 
    stdcall Graphics.Draw.Shapes, gp_pointsbar_font_design, milk_color
    stdcall Graphics.Draw.Text.Write, [txt_points], brown_text_color
    ret
endp