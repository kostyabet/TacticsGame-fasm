LocalScoresFolder   =   1
GlobalScoresFolder  =   2

CurrentScoresFolder     dd  1
IsFinishLocal           dd  GL_FALSE
IsFinishGlobal          dd  GL_FALSE

proc BestScores.OnLocalClick uses ecx
    stdcall BestScores.Graphics.MarkLocal
    mov     [CurrentScoresFolder], LocalScoresFolder
    stdcall BestScores.DrawScores, [UserScores]
    ret
endp
proc BestScores.OnGlobalClick uses ecx
    mov     [CurrentScoresFolder], GlobalScoresFolder
    stdcall BestScores.Graphics.MarkGlobal
    stdcall BestScores.DrawScores, [BestScores]
    ret
endp

proc BestScores.DrawScores,\
    object

    ret
endp

proc BestScores.LoadData uses ecx
    invoke CreateThread, 0, 0, BestScores.LoadLocal, 0, 0, 0
    invoke CreateThread, 0, 0, BestScores.LoadGlobal, 0, 0, 0
    ret
endp
proc BestScores.LoadLocal
    mov     [IsFinishLocal], GL_FALSE
    stdcall Server.GetUserScores
    mov     [IsFinishLocal], GL_TRUE
    ret
endp
proc BestScores.LoadGlobal
    mov     [IsFinishGlobal], GL_FALSE
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