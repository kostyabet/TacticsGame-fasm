proc Graphics.Colors.Prepear
    stdcall Scripts.Getters.Color, [cl_background], font_color
    stdcall Scripts.Getters.Color, [cl_root], book_root_color
    stdcall Scripts.Getters.Color, [cl_stroke], book_strk_color
    stdcall Scripts.Getters.Color, [cl_ending], book_endg_color
    stdcall Scripts.Getters.Color, [cl_border], book_ebrd_color
    ret
endp