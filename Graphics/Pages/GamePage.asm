proc Draw.Pages.GamePage
    stdcall Graphics.Draw.Shapes, font_design, font_color

    stdcall Graphics.Draw.Ticks, TicksFontList_Float, TicksFontList_Colors
    
    ret
endp