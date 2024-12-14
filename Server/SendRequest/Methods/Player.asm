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
    stdcall ClearBuffer, [jsonLink]
    ret
endp

proc Server.Methods.Player.NewPlayer uses eax ebx ecx edx
    stdcall Server.Methods.Player.AddNewPlayer
    ret
endp

proc Server.Methods.Player.AddNewPlayer
    locals
        jsonLink    dd  ?
    endl
    stdcall Log.Console, addNewPlayerSignal, addNewPlayerSignal.size
    ; prepear data
    stdcall JSON.SendStrign.Clear, playerJSON.login, JSON_STRING_LENGTH
    stdcall JSON.SendStrign.Clear, playerJSON.password, JSON_STRING_LENGTH
    ; input data in fields
    stdcall JSON.SendStrign.InputString, playerJSON.login, JSON_STRING_LENGTH, Login
    stdcall JSON.SendStrign.InputString, playerJSON.password, JSON_STRING_LENGTH, Password
    ; send response
    stdcall Log.Console, sendString, sendString.size
    stdcall Log.Console, playerJSON.loginStart, sizeof.PlayerJSON
    stdcall Server.SendRequest.PostAddPlayers, playerJSON.loginStart, sizeof.PlayerJSON
    stdcall Log.Console, serverAnswer, serverAnswer.size
    mov     ebx, eax
    stdcall File.IniFile.StrLen, eax
    stdcall Log.Console, ebx, eax
    xchg    eax, ebx
    mov     [jsonLink], eax
    stdcall Server.JSON.IsError, [jsonLink]
    cmp     eax, GL_TRUE
    jne     .Login
        ; error
        jmp     .exit
    .Login:
        ; int3
        stdcall Server.JSON.IsLoginError, [jsonLink]
        cmp     eax, GL_TRUE
        jne     .Password
            ; login error
            jmp     .exit
    .Password:
        stdcall Server.JSON.IsPasswordError, [jsonLink]
        cmp     eax, GL_TRUE
        jne     .correct
            ; password error
            jmp     .exit
    .correct:
        ; stdcall Page.ChangePage, LoadingPage
    .exit:
    stdcall ClearBuffer, [jsonLink]
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
       stdcall StartPassword.Body
    .exit:
    ret
endp

proc StartPassword.Body uses eax ebx ecx
    mov     [IsLogin], GL_FALSE
    mov     [IsPassword], GL_TRUE

    cmp     [PasswordHide], GL_TRUE
    je      .hide
        stdcall ConvertStringToOutputString, Password, outputStrBufPas
        jmp     @F
    .hide:
        stdcall File.IniFile.StrLen, Password
        stdcall CreateHideString, outputStrBufPas, eax
    @@:

    stdcall Server.AutorizationString
    stdcall Colors.Copy, password_color, brown_text_color
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

proc CreateHideString,\
    buffer, length
    mov     ecx, [length]
    mov     ebx, [buffer]
    cmp     [length], 0
    je      .exit
    .loop:
        mov     byte [ebx], 52; code *
        inc     ebx
        loop    .loop
    .exit:
    mov     byte [ebx], 0
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

proc Server.Methods.Player.SwapPaswordHideStatus uses eax ecx
    mov     eax, [PasswordHide]
    cmp     eax, GL_FALSE
    je      .FALSE
    .TRUE:
        mov     [PasswordHide], GL_FALSE
        jmp     @F
    .FALSE:
        mov     [PasswordHide], GL_TRUE
    @@:
    stdcall StartPassword.Body
    ret
endp

proc ClearBuffer,\
    json
    mov     ebx, [json]
    cmp     byte [ebx], 0
    je      .exit
    .mainLoop:
        mov     byte [ebx], 0
        inc     ebx
        cmp     byte [ebx], 0
        jne     .mainLoop
    .exit:
    ret
endp