Login       db  30 dup(0)
Password    db  30 dup(0)

apiFilePath db  'api.ini', 0
hApiFile    dd  ?

LOGIN_PROMPT     db  "LOGIN=", 0
PASSWORD_PROMPT  db  "PASSWORD=", 0