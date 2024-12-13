proc Server.Methods.Player.IsExist uses eax ebx
    locals
        jsonLink    dd  ?
    endl
    stdcall Log.Console, playerExistCheck, playerExistCheck.size
    ; prepear data
    stdcall JSON.SendStrign.Clear, playerJSON.login, JSON_STRING_LENGTH
    stdcall JSON.SendStrign.Clear, playerJSON.password, JSON_STRING_LENGTH
    ; ; input data in fields
    stdcall JSON.SendStrign.InputString, playerJSON.login, JSON_STRING_LENGTH, Login
    stdcall JSON.SendStrign.InputString, playerJSON.password, JSON_STRING_LENGTH, Password
    ; send response
    stdcall Log.Console, sendString, sendString.size
    stdcall Log.Console, playerJSON.loginStart, sizeof.PlayerJSON
    stdcall Server.SendRequest.GetIsPlayerExist, playerJSON.loginStart, sizeof.PlayerJSON
    stdcall Log.Console, serverAnswer, serverAnswer.size
    mov     ebx, eax
    stdcall File.IniFile.StrLen, eax
    stdcall Log.Console, ebx, eax
    xchg    eax, ebx
    ; check result
    mov     [jsonLink], eax
    stdcall Server.JSON.IsError, [jsonLink]
    cmp     eax, 1
    jne     @F
        mov     eax, 0
        jmp     .exit
    @@:
    stdcall Server.JSON.GetId, [jsonLink]
    cmp     eax, -1
    jne     @F
        mov     eax, 0
        jmp     .exit
    @@:
    mov     eax, 1
    .exit:
    ret
endp