; fone music
    foneMusicPath           db  'source/fone.mp3', 0
    foneMusicCommand        db  'open "source/fone.mp3" type mpegvideo alias foneMusic', 0
    foneMusicPlay           db  'play foneMusic', 0
    foneMusicClose          db  'close foneMusic', 0
    foneMusicStatus         db  'status foneMusic mode', 0
; click
    clickButtonSoundPath    db  'source/click.mp3', 0
    clickButtonSoundCommand db  'open "source/click.mp3" type mpegvideo alias clickButton', 0
    clickButtonSoundPlay    db  'play clickButton', 0
    clickButtonSoundClose   db  'close clickButton', 0
    clickButtonSoundStatus  db  'status clickButton mode', 0
; exit
    exitButtonSoundPath     db  'source/exit.mp3', 0
    exitButtonSoundCommand  db  'open "source/exit.mp3" type mpegvideo alias exitButton', 0
    exitButtonSoundPlay     db  'play exitButton', 0
    exitButtonSoundClose    db  'close exitButton', 0
    exitButtonSoundStatus   db  'status exitButton mode', 0
; hover
    hoverButtonSoundPath    db  'source/hover.mp3', 0
    hoverButtonSoundCommand db  'open "source/hover.mp3" type mpegvideo alias hoverButton', 0
    hoverButtonSoundPlay    db  'play hoverButton', 0
    hoverButtonSoundClose   db  'close hoverButton', 0
    hoverButtonSoundStatus  db  'status hoverButton mode', 0
; status check params
    statusBuffer        db  16 dup(0)
    statusBufferLen     dd  16
    stoppedStr          db  'stopped', 0
; button voice types
    btHover     =   0x0001
    btClick     =   0x0002
    btExit      =   0x0004
