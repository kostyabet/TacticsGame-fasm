requestURL  dw  '/','p','l','a','y','e','r','s', 0
requestHOST dw  'l','o','c','a','l','h','o','s','t', 0
requestPORT dd  8080
requestTYPE dw  'G', 'E', 'T', 0

NULL    =   0x0000
HttpOpenTitle db 'WinHTTP Example/1.0', 0
WINHTTP_ACCESS_TYPE_DEFAULT_PROXY = 0
WINHTTP_ACCESS_TYPE_NO_PROXY = 1

WINHTTP_OPTION_REDIRECT_POLICY          dd 88
WINHTTP_OPTION_REDIRECT_POLICY_ALWAYS   db 0, 0, 0, 0

ErrorMessage db 'Error!', 0
ErrorTitle  db 'Error', 0

hSession dd ?
hConnect dd ?
hRequest dd ?

requestBuffer   dd 255 dup (0)
requestBufferLen dd 255
responseTitle db 'Response',0

proc Server.SendRequest.GET
    invoke  WinHttpOpen, HttpOpenTitle, WINHTTP_ACCESS_TYPE_NO_PROXY, NULL, NULL, NULL
    mov     [hSession], eax
    test    eax, eax
    jz      .error

    invoke  WinHttpConnect, [hSession], requestHOST, [requestPORT], NULL
    mov     [hConnect], eax
    test    eax, eax
    jz      .error

    invoke  WinHttpOpenRequest, [hConnect], requestTYPE, requestURL, NULL, NULL, NULL, NULL
    mov     [hRequest], eax
    test    eax, eax
    jz      .error

    invoke  WinHttpSendRequest, [hRequest], NULL, 0, NULL, 0, 0, 0
    test    eax, eax
    jz      .error

    invoke  WinHttpReceiveResponse, [hRequest], NULL

    invoke  WinHttpReadData, [hRequest], requestBuffer, [requestBufferLen], 0
    test    eax, eax
    jz      .error
    invoke  MessageBox, 0, requestBuffer, responseTitle, 0

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
        ret
endp