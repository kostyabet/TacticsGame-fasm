proc Draw.Pages.LeadBoardPage
    ; font layout
    stdcall Draw.Pages.DefaultLayout, [PrevousPage]
    mov     ebx, [PrevousPage]
    mov     ebx, [PagesList + ebx]
    stdcall ebx
    ; main layout
    stdcall Graphics.Draw.Shapes, font_design, font_dark_color
    stdcall Graphics.Draw.Shapes, lbp_brdr_design, brown_text_color
    stdcall Graphics.Draw.Shapes, lbp_font_design, milk_light_color
    stdcall Graphics.Draw.Text.Write, [txt_ldbrdtitle], brown_text_color

    ; return button
    stdcall Graphics.Draw.Shapes, lbp_return_circle_desing, retbtn_font_color
    stdcall Graphics.Draw.Shapes, lbp_return_chrest_design, retbtn_chrst_color

    ; leaderboard
        ; main blocks
        stdcall Graphics.Draw.Shapes, lbp_localbtn_design,  local_color
        stdcall Graphics.Draw.Shapes, lbp_globbtn_design,   global_color
        stdcall Graphics.Draw.Shapes, lbp_datafont_design,  brown_color
        ; lines
        stdcall Graphics.Draw.Shapes, lbp_horline_design, brown_text_color
        stdcall Graphics.Draw.Shapes, lbp_verline_design, brown_text_color
        ; blocks text
        stdcall Graphics.Draw.Text.Write, [txt_local], brown_text_color
        stdcall Graphics.Draw.Text.Write, [txt_global], brown_text_color


    ; Tabels
    mov     ebx, [Tabels]
    mov     ecx, TABELS_ON_PAGE
    cmp     ecx, 0
    je      .exit
    .drawTabel:
        lea     eax, [sizeof.DrawModel + 4 * 3]
        mov     edi, ebx
        add     ebx, eax
        stdcall Graphics.Draw.Shapes, edi, ebx
        lea     eax, [sizeof.BackgroundColor * 2]
        add     ebx, eax
        loop    .drawTabel
    mov     ebx, [Tabels]
    mov     ecx, TABELS_ON_PAGE
    cmp     ecx, 0
    je      .exit
    .drawTabelText:
        add     ebx, sizeof.DrawModel
        push    ebx
        lea     eax, [4 * 3 + sizeof.BackgroundColor]
        add     ebx, eax
        mov     edi, ebx
        pop     ebx
        stdcall Graphics.Draw.Text.Write, [ebx], edi
        add     ebx, 4
        stdcall Graphics.Draw.Text.Write, [ebx], edi
        add     ebx, 4
        stdcall Graphics.Draw.Text.Write, [ebx], edi
        add     ebx, 4
        add     ebx, sizeof.BackgroundColor
        add     ebx, sizeof.BackgroundColor
        loop    .drawTabelText
    .exit:
    ret
endp