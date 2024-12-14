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

proc Server.Methods.Player.StartLogin uses eax ecx
    mov     [IsLogin], GL_TRUE
    mov     [IsPassword], GL_FALSE
    stdcall ConvertStringToOutputString, Login, outputStrBufLog
    stdcall Server.AutorizationString
    stdcall Colors.Copy, login_color, brown_text_color
    ret
endp

proc Server.Methods.Player.StartPassword uses eax ecx
    stdcall Mouse.CheckIsInShape, lgp_eyeclose_design
    cmp     eax, GL_TRUE
    je      .exit
        mov     [IsLogin], GL_FALSE
        mov     [IsPassword], GL_TRUE
        stdcall ConvertStringToOutputString, Password, outputStrBufPas
        stdcall Server.AutorizationString
        stdcall Colors.Copy, password_color, brown_text_color
    .exit:
    ret
endp

proc Server.Methods.Player.DeactivateAunt uses eax ecx
    stdcall Mouse.CheckIsInShape, lgp_pbrdr_design
    cmp     eax, GL_FALSE
    jne     .exit
    stdcall Mouse.CheckIsInShape, lgp_lbrdr_design
    cmp     eax, GL_FALSE
    jne     .exit

    mov     [IsLogin], GL_FALSE
    mov     [IsPassword], GL_FALSE
    stdcall Server.AutorizationString

    .exit:
    ret
endp

outputStrBufLog   db     30 dup(0), 0
outputStrBufPas   db     30 dup(0), 0
proc ConvertStringToOutputString uses ebx edi,\
    string, buffer
    mov     ebx, [string]
    mov     edi, [buffer]
    cmp     byte [ebx], 0
    je      .exit
    .loop:
        mov     al, byte [ebx]
        sub     al, 'A'
        add     al, 54
        mov     byte [edi], al
        inc     ebx
        inc     edi
        cmp     byte [ebx], 0
        jne     .loop
    .exit:
    mov     byte [edi], 0
    mov     eax, [buffer]
    ret
endp

proc Server.Methods.Player.AddSymbolIn,\
    string, symbol
    mov     ebx, [string]
    stdcall File.IniFile.StrLen, ebx
    cmp     eax, JSON_STRING_LENGTH
    je      .exit
        cmp     byte [ebx], 0
        je      .endOfString
        .loop:
            inc     ebx
            cmp     byte [ebx], 0
            jne     .loop
        .endOfString:
            mov     eax, [symbol]
            mov     byte [ebx], al
            mov     byte [ebx + 1], 0
    .exit:
    ret
endp

proc Server.Methods.Player.SwapPaswordHideStatus uses eax
    mov     eax, [PasswordHide]
    cmp     eax, GL_FALSE
    je      .FALSE
    .TRUE:
        mov     [PasswordHide], GL_FALSE
        jmp     @F
    .FALSE:
        mov     [PasswordHide], GL_TRUE
    @@:
    ret
endp