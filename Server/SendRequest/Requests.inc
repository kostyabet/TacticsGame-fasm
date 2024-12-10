hSession dd ?
hConnect dd ?
hRequest dd ?

NULL            =   0x0000
HttpOpenTitle   db 'WinHTTP Example/1.0', 0

WINHTTP_ACCESS_TYPE_DEFAULT_PROXY   =   0
WINHTTP_ACCESS_TYPE_NO_PROXY        =   1
WINHTTP_ADD_HEADER_FLAGS            =   0

apiHOST dw  'l','o','c','a','l','h','o','s','t', 0
apiPORT dd  8080

requestTpGET    dw  'G', 'E', 'T', 0
requestTpPOST   dw  'P', 'O', 'S', 'T', 0
contentType     dw  'C','o','n','t','e','n','t','-','T','y','p','e',':',' ','a','p','p','l','i','c','a','t','i','o','n','/','j','s','o','n', 0

requestPlayersURL  dw  '/','p','l','a','y','e','r','s', 0

ErrorMessage    db 'Error!', 0
ErrorTitle      db 'Error', 0

requestBuffer    dd 255 dup (0)
requestBufferLen dd $ - requestBuffer

progressStatus  dd 0

postData        db  '{"id":6, "login":"t", "password":"s"}', 0
postDataLength  dd  $ - postData
