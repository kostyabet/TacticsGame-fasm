Login           db  30 dup(0), 0
Password        db  30 dup(0), 0
CurrentPlayerId dd  0
gameCounter     dd  0

IsLogin         dd GL_FALSE
IsPassword      dd GL_FALSE
PasswordHide    dd GL_TRUE

apiFilePath     db  'api.ini', 0
hApiFile        dd  ?

LOGIN_PROMPT    db  "LOGIN=", 0
PASSWORD_PROMPT db  "PASSWORD=", 0