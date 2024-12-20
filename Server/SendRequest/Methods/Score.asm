proc Server.Methods.Score.Add
    locals
        jsonLink    dd  ?
    endl
    stdcall Log.Console, addNewScoreSignal, addNewScoreSignal.size
    ; prepear data
    stdcall JSON.SendStrign.Clear, scoreJSON.points, JSON_INTEGER_LENGTH
    stdcall JSON.SendStrign.Clear, scoreJSON.playerId, JSON_INTEGER_LENGTH
    ; input data in fields
    stdcall JSON.SendStrign.InputInteger, scoreJSON.points, JSON_INTEGER_LENGTH, [currentPoints]
    stdcall JSON.SendStrign.InputInteger, scoreJSON.playerId, JSON_INTEGER_LENGTH, [CurrentPlayerId]
    ; send response
    stdcall Log.Console, sendString, sendString.size
    stdcall Log.Console, scoreJSON.pointsStart, sizeof.ScoreJSON
    stdcall Server.SendRequest.PostAddScores, scoreJSON.pointsStart, sizeof.ScoreJSON, idResponseBuffer, [idResponseBufferLength]
    cmp     eax, -1
    je      .serverError
    stdcall Log.Console, serverAnswer, serverAnswer.size
    mov     ebx, eax
    stdcall File.IniFile.StrLen, eax
    stdcall Log.Console, ebx, eax
    xchg    eax, ebx
    mov     [jsonLink], eax
    jmp     .exit
    .serverError:
        stdcall Log.Console, errorSignal, errorSignal.size
        ; process error
    .exit:
    stdcall ClearBuffer, [jsonLink]
    ret
endp

proc Server.Methods.Score.UserScores
    locals
        jsonLink    dd      ?
    endl
    stdcall Log.Console, getUserScoreSignal, getUserScoreSignal.size
    ; clear
    stdcall JSON.SendStrign.Clear, idJSON.id, JSON_INTEGER_LENGTH
    ; input data in fields
    stdcall JSON.SendStrign.InputInteger, idJSON.id, JSON_INTEGER_LENGTH, [CurrentPlayerId]
    ; send response
    stdcall Log.Console, sendString, sendString.size
    stdcall Log.Console, idJSON.idStart, sizeof.IdJSON
    stdcall Server.SendRequest.GetAllUserScores, idJSON.idStart, sizeof.IdJSON, scoresUserRespBuffer, [scoresUserRespBufferLength]
    cmp     eax, -1
    je      .serverError
    stdcall Log.Console, serverAnswer, serverAnswer.size
    mov     ebx, eax
    stdcall File.IniFile.StrLen, eax
    stdcall Log.Console, ebx, eax
    xchg    eax, ebx
    mov     [jsonLink], eax
    stdcall Server.JSON.IsNULL, [jsonLink]
    cmp     eax, GL_TRUE
    jne     @F
        mov     eax, 0
        mov     [UserScoresLen], 0
        jmp     .exit
    @@:
    stdcall Server.JSON.IsError, [jsonLink]
    cmp     eax, GL_TRUE
    jne     @F
        mov     eax, 0
        mov     [UserScoresLen], 0
        jmp     .exit
    @@:
        stdcall Server.JSON.ParseUserScore, [jsonLink], [UserScores]
        mov     [UserScoresLen], eax
        jmp     .exit
    .serverError:
        stdcall Log.Console, errorSignal, errorSignal.size
        ; process error
    .exit:
        stdcall ClearBuffer, [jsonLink]
    ret
endp

proc Server.Methods.Score.BestScores
    locals
        jsonLink    dd      ?
    endl
    stdcall Log.Console, getBestScoreSignal, getBestScoreSignal.size
    stdcall Log.Console, sendString, sendString.size
    stdcall Server.SendRequest.GetBestScores, 0, 0, scoresGlobRespBuffer, [scoresGlobRespBufferLength]
    cmp     eax, -1
    je      .serverError
    stdcall Log.Console, serverAnswer, serverAnswer.size
    mov     ebx, eax
    stdcall File.IniFile.StrLen, eax
    stdcall Log.Console, ebx, eax
    xchg    eax, ebx
    mov     [jsonLink], eax
    stdcall Server.JSON.IsNULL, [jsonLink]
    cmp     eax, GL_TRUE
    jne     @F
        mov     eax, 0
        mov     [BestScoresLen], 0
        jmp     .exit
    @@:
    stdcall Server.JSON.IsError, [jsonLink]
    cmp     eax, GL_TRUE
    jne     @F
        mov     eax, 0
        jmp     .exit
    @@:
        stdcall Server.JSON.ParseBestScore, [jsonLink], [BestScores]
        mov     [BestScoresLen], eax
        jmp     .exit
    .serverError:
        stdcall Log.Console, errorSignal, errorSignal.size        
        ; process error
    .exit:
        stdcall ClearBuffer, [jsonLink]
    ret
endp