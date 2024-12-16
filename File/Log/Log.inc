hConsole    dd  ?

; log strings
struc LogString [text*] {
    common
    db .size
    . db text
    .size = $-.
}

logCreateSignal      LogString 'Log console was created!', 10
playerExistCheck     LogString 10, '===================================', 10, 'Check is player exist', 10
sendString           LogString 'Send string to method: '
serverAnswer         LogString 10, 'Server request: '
addNewPlayerSignal   LogString 10, '===================================', 10, 'Try to create new user', 10
getScoresCountSignal LogString 10, '===================================', 10, 'Get all user scores', 10