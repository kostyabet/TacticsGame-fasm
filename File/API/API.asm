proc File.API.Write
    invoke  CreateFile, apiFilePath, GENERIC_WRITE, 0, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
    mov     [hApiFile], eax
    cmp     eax, INVALID_HANDLE_VALUE
    jne     @F
        stdcall File.IniFile.Error
        jmp     .exit
    @@:

    ; write settings in file
    stdcall File.IniFile.WriteRule, LOGIN_PROMPT, Login
    stdcall File.IniFile.WriteRule, PASSWORD_PROMPT, Password

    .exit:
        invoke  CloseHandle, [hApiFile]
    ret
endp

proc File.API.Read uses eax ebx ecx edx edi
    invoke  CreateFile, ticksFilePath, GENERIC_READ, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0
    mov     [hApiFile], eax
    cmp     eax, INVALID_HANDLE_VALUE
    jne     @F
        stdcall File.IniFile.Error
        jmp     .exit
    @@:
        ; length
        invoke  HeapAlloc, [hHeap], 8, [bufferLength]
        mov     [readBuffer], eax
        invoke  ReadFile, [hApiFile], [readBuffer], [bufferLength], bytesRead, 0
        cmp     [bytesRead], 0
        je      @F
; ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ALARM ;
; !!!!!!!!!!!!!!!!!!!!!!!!!!! DO NOT TOUCH EDI !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
        mov     edi, [readBuffer]
        stdcall File.IniFIle.ReadString, Login, 0
        stdcall File.IniFIle.ReadString, Password, 0
; !!!!!!!!!!!!!!!!!!!!! ALARM DIACTIVATE! GOOD LUCK :) !!!!!!!!!!!!!!!!!!!!!!!! ;
        @@:
            invoke HeapFree, [hHeap], 0, [readBuffer]
    .exit:
        invoke  CloseHandle, [hApiFile]
        ret
endp
