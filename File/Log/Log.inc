hConsole    dd  ?

; log strings
struc LogString [text*] {
    common
    db .size
    . db text
    .size = $-.
}

logCreateSignal     LogString 'Log console was created!', 13, 10, 0