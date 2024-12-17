proc Draw.Pages.LeadBoardPage
    ; font layout
    stdcall Draw.Pages.DefaultLayout, [PrevousPage]
    mov     ebx, [PrevousPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    ; main layout
    stdcall Graphics.Draw.Shapes, font_design, font_dark_color
    
    ret
endp