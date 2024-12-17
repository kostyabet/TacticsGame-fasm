proc Server.Methods.Score.Add
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
    ; stdcall Server.SendRequest.GetIsPlayerExist, playerJSON.loginStart, sizeof.PlayerJSON, idResponseBuffer, [idResponseBufferLength]
    ; stdcall Log.Console, serverAnswer, serverAnswer.size
    ; mov     ebx, eax
    ; stdcall File.IniFile.StrLen, eax
    ; stdcall Log.Console, ebx, eax
    ; xchg    eax, ebx
    ret
endp