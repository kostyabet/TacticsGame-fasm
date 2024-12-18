LocalScoresFolder   =   1
GlobalScoresFolder  =   2

CurrentScoresFolder     dd  1
IsFinishLocal           dd  GL_FALSE
IsFinishGlobal          dd  GL_FALSE

proc BestScores.OnLocalClick uses ecx
    stdcall BestScores.Graphics.MarkLocal
    mov     [CurrentScoresFolder], LocalScoresFolder
    stdcall BestScores.DrawScores, [UserScores], UserScoresLen, IsFinishLocal
    ret
endp
proc BestScores.OnGlobalClick uses ecx
    mov     [CurrentScoresFolder], GlobalScoresFolder
    stdcall BestScores.Graphics.MarkGlobal
    stdcall BestScores.DrawScores, [BestScores], BestScoresLen, IsFinishGlobal
    ret
endp

proc BestScores.DrawScores uses eax ecx ebx,\
    object, count, status
    mov     ebx, [status]
    .wait:
        cmp     dword [ebx], GL_FALSE
        je      .wait

    mov     [UpHead], MIN_UP_HEAD
    mov     [DownHead], MIN_DOWN_HEAD
    mov     edi, TabelTexts
    mov     ebx, [count]
    mov     ecx, [ebx]
    cmp     ecx, 0
    je      .clearLoop
    cmp     ecx, TABELS_ON_PAGE
    jbe     @F
        mov     ecx, TABELS_ON_PAGE
    @@:
    mov     ebx, [object]
    .saveData:
        push    edi
        mov     edi, [edi]
        inc     edi
        stdcall File.IniFile.IntToStr, [ebx]
        stdcall ConvertStringToOutputString, eax, edi
        add     ebx, 4
        add     edi, 3
        stdcall ConvertStringToOutputString, ebx, edi
        add     edi, 31
        add     ebx, JSON_STRING_LENGTH
        stdcall File.IniFile.IntToStr, [ebx]
        stdcall ConvertStringToOutputString, eax, edi
        add     ebx, 4
        pop     edi
        add     edi, 4
        loop    .saveData
    mov     ebx, [count]
    mov     ecx, [ebx]
    cmp     ecx, TABELS_ON_PAGE
    jae     .exit
    mov     eax, TABELS_ON_PAGE
    sub     eax, ecx
    xchg    ecx, eax
    .clearLoop:
        push    edi
        mov     edi, [edi]
        inc     edi
        stdcall ConvertStringToOutputString, str_nullerror, edi
        add     edi, 3
        stdcall ConvertStringToOutputString, str_nullerror, edi
        add     edi, 31
        stdcall ConvertStringToOutputString, str_nullerror, edi
        pop     edi
        add     edi, 4
        loop    .clearLoop
    .exit:
    stdcall BestScores.DataPrepears
    ret
endp

proc BestScores.LoadData uses ecx
    invoke  CreateThread, 0, 0, BestScores.LoadLocalAnGlobal, 0, 0, 0
    ret
endp
proc BestScores.LoadLocalAnGlobal
    mov     [IsFinishLocal], GL_FALSE
    mov     [IsFinishGlobal], GL_FALSE
    
    stdcall Server.GetUserScores
    mov     [IsFinishLocal], GL_TRUE
    
    stdcall Server.GetBestScores
    mov     [IsFinishGlobal], GL_TRUE
    ret
endp

proc BestScores.ColorInit
    cmp     [CurrentScoresFolder], LocalScoresFolder
    stdcall BestScores.Graphics.MarkGlobal
endp
proc BestScores.Graphics.MarkLocal
    stdcall Colors.Copy, local_color, brown_color
    stdcall Colors.Copy, global_color, book_ebrd_color
    ret
endp
proc BestScores.Graphics.MarkGlobal
    stdcall Colors.Copy, local_color, book_ebrd_color
    stdcall Colors.Copy, global_color, brown_color
    ret
endp

proc BestScores.TabelGen
    stdcall BestScores.TablesMemoryGen
    stdcall BestScores.DataPrepears
    ret
endp
proc BestScores.TablesMemoryGen uses eax ebx
    ; == tabel design == ;
    lea     ebx, [sizeof.LeadBrdTabel * TABELS_ON_PAGE]
    invoke  HeapAlloc, [hHeap], 8, ebx
    mov     [Tabels], eax
    ; == tabel text == ;
    ; lea     ebx, [sizeof.TabelText * TABELS_ON_PAGE]
    ; invoke  HeapAlloc, [hHeap], 8, ebx
    ; mov     [TabelTexts], eax
    ret
endp
proc BestScores.DataPrepears uses eax ebx edi ecx
    locals
        pos.y       dd  ?
        textPtr     dd  ?
    endl
    mov     eax, [Tabel.Pos.Pos + 4]
    mov     [pos.y], eax
    
    mov     [textPtr], TabelTexts

    mov     ebx, [Tabels]
    mov     edi, TabelsFonts
    mov     ecx, TABELS_ON_PAGE
    .convertLoop:
        push    ecx
        
        stdcall Scripts.Getters.ConvertCoords, [edi], ebx
        add     edi, 4
        add     ebx, sizeof.DrawModel
        push    edi 
            mov     edi, Tabel.Position
            mov     eax, [pos.y]
            mov     [edi + 4], eax
            mov     eax, [Tabel.Pos.Pos]
            mov     [edi], eax
            
            mov     eax, [textPtr]
            mov     eax, [eax]
            add     eax, 1
            stdcall Graphics.Draw.Text.Prepear, ebx, eax, tbl_fontsize, tbl_textgap, edi
            add     ebx, 4

            mov     eax, [Tabel.Log.Pos]
            mov     [edi], eax

            mov     eax, [textPtr]
            mov     eax, [eax]
            add     eax, 4
            stdcall Graphics.Draw.Text.Prepear, ebx, eax, tbl_fontsize, tbl_textgap, edi
            add     ebx, 4

            mov     eax, [Tabel.Scr.Pos]
            mov     [edi], eax

            mov     eax, [textPtr]
            mov     eax, [eax]
            add     eax, 35
            stdcall Graphics.Draw.Text.Prepear, ebx, eax, tbl_fontsize, tbl_textgap, edi
            add     ebx, 4

            add     [textPtr], 4
            add     [pos.y], Tabel.PosStep
        pop     edi
        stdcall Scripts.Getters.Color, [cl_milk_light],   milk_light_color
        stdcall Colors.Copy, ebx, milk_light_color
        add     ebx, sizeof.BackgroundColor
        stdcall Scripts.Getters.Color, [cl_brown_text],   brown_text_color
        stdcall Colors.Copy, ebx, brown_text_color
        add     ebx, sizeof.BackgroundColor

        pop     ecx
        dec     ecx
        cmp     ecx, 0
        ja      .convertLoop
    ret
endp