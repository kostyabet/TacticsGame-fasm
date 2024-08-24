proc Graphics.Draw.PrepearSteps
    stdcall Scripts.Getters.CovertIntToGLfloat, Book_strk_step
    ret
endp

proc Graphics.Draw.RectPrepears
    stdcall Scripts.Getters.ConvertRect, Font_design
    stdcall Scripts.Getters.ConvertRect, Book_root_design
    stdcall Scripts.Getters.ConvertRect, Book_strk_coords
    stdcall Scripts.Getters.ConvertRect, Book_endg_design
    stdcall Scripts.Getters.ConvertRect, Book_brd
    ret
endp

proc Graphics.Colors.Prepear
    stdcall Scripts.Getters.Color, [cl_background], font_color
    stdcall Scripts.Getters.Color, [cl_root], book_root_color
    stdcall Scripts.Getters.Color, [cl_stroke], book_strk_color
    stdcall Scripts.Getters.Color, [cl_ending], book_endg_color
    stdcall Scripts.Getters.Color, [cl_border], book_ebrd_color
    ret
endp