LocalScoresFolder   =   1
GlobalScoresFolder  =   2

CurrentScoresFolder     dd  1
IsFinishLocal           dd  GL_FALSE
IsFinishGlobal          dd  GL_FALSE

proc BestScores.OnLocalClick
    mov     [IsFinishLocal], GL_FALSE
    stdcall Server.GetUserScores
    stdcall BestScores.Graphics.MarkLocal
    mov     [CurrentScoresFolder], LocalScoresFolder
    ret
endp

proc BestScores.OnGlobalClick
    mov     [IsFinishGlobal], GL_FALSE
    stdcall Server.GetBestScores
    stdcall BestScores.Graphics.MarkGlobal
    mov     [CurrentScoresFolder], GlobalScoresFolder
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