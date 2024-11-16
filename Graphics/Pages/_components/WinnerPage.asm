proc Draw.Pages.WinnerPage
    ; font layout
    stdcall Draw.Pages.DefaultLayout, [PrevousPage]
    mov     ebx, [PrevousPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    ; main pause layout
    stdcall Graphics.Draw.Shapes, font_design, font_dark_color
    stdcall Graphics.Draw.Shapes, wp_border_design, brown_text_color
    stdcall Graphics.Draw.Shapes, wp_font_desing, milk_light_color
    stdcall Graphics.Draw.Shapes, wp_line_design, book_ebrd_color

    ; return button
    stdcall Graphics.Draw.Shapes, wp_return_circle_desing, retbtn_font_color
    stdcall Graphics.Draw.Shapes, wp_return_chrest_design, retbtn_chrst_color

    ; txt winner
    stdcall Graphics.Draw.Text.Write, txt_winner,    brown_text_color
    stdcall Graphics.Draw.Text.Write, txt_score_num, brown_black_color
    stdcall Graphics.Draw.Text.Write, txt_score,     brown_color

    ; again button
    stdcall Graphics.Draw.Shapes, wp_againbtn_brdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, wp_againbtn_font_design, againbtn_font_color
    stdcall Graphics.Draw.Text.Write, txt_again, againbtn_text_color

    ; exit button
    stdcall Graphics.Draw.Shapes, wp_exitbtn_brdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, wp_exitbtn_font_design, ebtn_font_color
    stdcall Graphics.Draw.Text.Write, txt_wexit, ebtn_text_color

    ; leaderboard button
    stdcall Graphics.Draw.Shapes, wp_leadbtn_brdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, wp_leadbtn_font_design, lbbtn_font_color
    stdcall Graphics.Draw.Text.Write, txt_stats, lbbtn_text_color

    ret
endp
