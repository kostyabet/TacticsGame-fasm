proc Server.SendRequest.POST,\
    host, port, type, url, data, length
    locals
        result  dd  ?
    endl
    invoke  WinHttpOpen, HttpOpenTitle, WINHTTP_ACCESS_TYPE_NO_PROXY, NULL, NULL, NULL
    mov     [hSession], eax
    test    eax, eax
    jz      .error

    invoke  WinHttpConnect, [hSession], [host], [port], NULL
    mov     [hConnect], eax
    test    eax, eax
    jz      .error

    invoke  WinHttpOpenRequest, [hConnect], [type], [url], NULL, NULL, NULL, NULL
    mov     [hRequest], eax
    test    eax, eax
    jz      .error

    invoke  WinHttpAddRequestHeaders, [hRequest], contentType, -1, WINHTTP_ADD_HEADER_FLAGS
    test    eax, eax
    jz      .error

    invoke  WinHttpSendRequest, [hRequest], NULL, 0, [data], [length], [length], 0
    test    eax, eax
    jz      .error

    invoke  WinHttpReceiveResponse, [hRequest], NULL

    invoke  WinHttpReadData, [hRequest], requestBuffer, [requestBufferLen], 0
    test    eax, eax
    jz      .error

    mov     [result], requestBuffer
    ;invoke MessageBox, 0, eax, ErrorTitle, MB_OK
    
    jmp     .exit
    .error:
        invoke GetLastError
        invoke MessageBox, 0, ErrorMessage, ErrorTitle, MB_OK
    .exit:
        cmp [hRequest], 0
        jz .skipRequest
        invoke WinHttpCloseHandle, [hRequest]
    .skipRequest:

        cmp [hConnect], 0
        jz .skipConnect
        invoke WinHttpCloseHandle, [hConnect]
    .skipConnect:

        cmp [hSession], 0
        jz .skipSession
        invoke WinHttpCloseHandle, [hSession]
    .skipSession:
        mov     eax, [result]
        ret
endp