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

    mov     ebx, [count]
    mov     ecx, [ebx]
    cmp     ecx, 0
    je      .exit
    mov     ebx, [object]
    .output:
        ; mov     eax, [ebx]
        
        ; add     ebx, 4
        ; mov     eax, ebx
        
        ; add     ebx, JSON_STRING_LENGTH
        ; mov     eax, [ebx]

        ; add     ebx, 4
        loop    .output
    .exit:
    ret
endp

proc BestScores.LoadData uses ecx
    invoke CreateThread, 0, 0, BestScores.LoadLocalAnGlobal, 0, 0, 0
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