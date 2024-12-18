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
    stdcall Log.Console, serverAnswer, serverAnswer.size
    mov     ebx, eax
    stdcall File.IniFile.StrLen, eax
    stdcall Log.Console, ebx, eax
    xchg    eax, ebx
    mov     [jsonLink], eax
    .exit:
    stdcall ClearBuffer, [jsonLink]
    ret
endp

proc Server.Methods.Score.UserScores
    locals
        jsonLink    dd      ?
    endl
    ; stdcall Log.Console, getUserScoreSignal, getUserScoreSignal.size
    ; clear
    ;stdcall JSON.SendStrign.Clear, idJSON.id, JSON_INTEGER_LENGTH
    ; input data in fields
    ;stdcall JSON.SendStrign.InputInteger, idJSON.id, JSON_INTEGER_LENGTH, [CurrentPlayerId]
    ; send response
    ;stdcall Log.Console, sendString, sendString.size
    ;stdcall Log.Console, idJSON.idStart, sizeof.IdJSON
    ;stdcall Server.SendRequest.GetUserScoresCount, idJSON.idStart, sizeof.IdJSON, scoresResponseBuffer, [scoresResponseBufferLength]
    ; stdcall Log.Console, serverAnswer, serverAnswer.size
    ; mov     ebx, eax
    ; stdcall File.IniFile.StrLen, eax
    ; stdcall Log.Console, ebx, eax
    ; xchg    eax, ebx
    ; mov     [jsonLink], eax
    ; stdcall Server.JSON.IsError, [jsonLink]
    ; cmp     eax, GL_TRUE
    ; jne     @F
    ;     mov     eax, 0
    ;     jmp     .exit
    ; @@:
    ; stdcall Server.JSON.IsNULL, [jsonLink]
    ; cmp     eax, GL_TRUE
    ; jne     @F
    ;     mov     eax, 0
    ;     jmp     .exit
    ; @@:
    ;     ; parse result
    ; .exit:
    ;     stdcall ClearBuffer, [jsonLink]
    ret
endp

proc Server.Methods.Score.BestScores
    ret
endp