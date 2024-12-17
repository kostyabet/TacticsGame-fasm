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
    ; check result
    ; mov     [CurrentPlayerId], -1
    mov     [jsonLink], eax
    ; stdcall Server.JSON.IsError, [jsonLink]
    ; cmp     eax, 1
    ; jne     @F
    ;     mov     eax, 0
    ;     jmp     .exit
    ; @@:
    ; stdcall Server.JSON.GetId, [jsonLink]
    ; mov     [CurrentPlayerId], eax
    ; cmp     eax, -1
    ; jne     @F
    ;     mov     eax, 0
    ;     jmp     .exit
    ; @@:
    ; mov     eax, 1
    .exit:
    stdcall ClearBuffer, [jsonLink]
    ret
endp