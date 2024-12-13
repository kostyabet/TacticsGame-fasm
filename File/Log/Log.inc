hConsole    dd  ?

; log strings
struc LogString [text*] {
    common
    db .size
    . db text
    .size = $-.
}

logCreateSignal     LogString 'Log console was created!', 10
playerExistCheck    LogString 'Check is player exist', 10
sendString          LogString 'Send string to method: '
serverAnswer        LogString 10, 'Server request: '