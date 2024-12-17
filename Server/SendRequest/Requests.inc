hSession dd ?
hConnect dd ?
hRequest dd ?

NULL            =   0x0000
HttpOpenTitle   db 'WinHTTP Example/1.0', 0

WINHTTP_ACCESS_TYPE_DEFAULT_PROXY   =   0
WINHTTP_ACCESS_TYPE_NO_PROXY        =   1
WINHTTP_ADD_HEADER_FLAGS            =   0


apiHOST dw  't','a','c','t','i','c','s','.','t','w','1','.','s','u', 0
apiPORT dd  80

requestTpGET    dw  'G', 'E', 'T', 0
requestTpPOST   dw  'P', 'O', 'S', 'T', 0
contentType     dw  'C','o','n','t','e','n','t','-','T','y','p','e',':',' ','a','p','p','l','i','c','a','t','i','o','n','/','j','s','o','n', 0

requestPlayersURL       dw  '/','p','l','a','y','e','r','s', 0
requestScoresURL        dw  '/','s','c','o','r','e','s', 0
requestBestScoresURL    dw  '/','b','e','s','t','s','c','o','r','e','s', 0
requestScoresCountURL   dw  '/','s','c','o','r','e','s','c','o','u','n','t', 0

ErrorMessage    db 'Error!', 0
ErrorTitle      db 'Error', 0

requestBuffer    dd 255 dup (0)
requestBufferLen dd $ - requestBuffer

progressStatus  dd 0

JSON_STRING_LENGTH  = 31
JSON_INTEGER_LENGTH = 10

struct ScoreJSON
    buffer          db  ' '
    pointsStart     db  '{"points":'
    points          db  10 dup(' ')
    playerIdStart   db  ',"player_id":'
    playerId        db  10 dup(' ')
    endStrc         db  '}', 0
ends

struct PlayerJSON
    buffer          db  ' '
    loginStart      db  '{"login":"'
    login           db  31 dup(' ')
    passwordStart   db  ',"password":"'
    password        db  31 dup(' ')
    endStrc         db  '}', 0
ends

struct IdJSON
    buffer          db  ' '
    idStart         db  '{"id":'
    id              db  10 dup(' ')
    endStrc         db  '}', 0
ends

scoreJSON   ScoreJSON   ? ; '{"points":100,"player_id":1}', 0
playerJSON  PlayerJSON  ? ; '{"login":"testlogin","password":"testpassword"}', 0
idJSON      IdJSON      ? ; '{"id":1}'


testData        db  ' {"login":"test"                         ,"password":"test"                         } ', 0
testDataLength  dd  $ - testData


idResponseBuffer        db  100 dup(0)
idResponseBufferLength  dd  $ - idResponseBuffer

scoresResponseBuffer        db  1000 dup(0)
scoresResponseBufferLength  dd  $ - idResponseBuffer