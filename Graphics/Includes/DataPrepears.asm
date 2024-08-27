proc Graphics.Draw.CoordsRectPrepears
    stdcall Scripts.Getters.ConvertCoords, font_coords, font_design
    stdcall Scripts.Getters.ConvertCoords, book_root_coords, book_root_design
    stdcall Scripts.Getters.ConvertCoords, book_strk_coords, book_strk_design
    stdcall Scripts.Getters.ConvertCoords, book_endg_coords, book_endg_design
    stdcall Scripts.Getters.ConvertCoords, book_brdcrn_coords, book_brdcrn_design
    stdcall Scripts.Getters.ConvertCoords, book_corner_coords, book_corner_design
    stdcall Scripts.Getters.ConvertCoords, book_brdfnt_coords, book_brdfnt_design
    stdcall Scripts.Getters.ConvertCoords, book_brd_coords, book_brd_design
    stdcall Scripts.Getters.ConvertCoords, button_play_coords, button_play_design
    stdcall Scripts.Getters.ConvertCoords, button_about_coords, button_about_design
    stdcall Scripts.Getters.ConvertCoords, button_stngs_coords, button_stngs_design
    ret
endp

proc Graphics.Colors.Prepear
    stdcall Scripts.Getters.Color, [cl_background], font_color
    stdcall Scripts.Getters.Color, [cl_root], book_root_color
    stdcall Scripts.Getters.Color, [cl_stroke], book_strk_color
    stdcall Scripts.Getters.Color, [cl_ending], book_endg_color
    stdcall Scripts.Getters.Color, [cl_border], book_ebrd_color
    stdcall Scripts.Getters.Color, [cl_button], button_color
    stdcall Scripts.Getters.Color, [cl_headline], headline_color
    ret
endp

proc Graphics.Draw.ASCIIPrepear
    stdcall Graphisc.Draw.ASCII.Letters.Prepear
    ret
endp