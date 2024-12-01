; fone music
    foneMusicPath           db  'source/fone.mp3', 0
    foneMusicCommand        db  'open "source/fone.mp3" type mpegvideo alias foneMusic', 0
    foneMusicPlay           db  'play foneMusic', 0
    foneMusicClose          db  'close foneMusic', 0
    foneMusicStatus         db  'status foneMusic mode', 0
; click
    clickButtonSoundPath    db  'source/click.mp3', 0
    clickButtonSoundCommand db  'open "source/click.mp3" type mpegvideo alias buttonSound', 0
    clickButtonSoundPlay    db  'play buttonSound', 0
    clickButtonSoundClose   db  'close buttonSound', 0
    clickButtonSoundStatus  db  'status buttonSound mode', 0
; exit
    exitButtonSoundPath     db  'source/exit.mp3', 0
    exitButtonSoundCommand  db  'open "source/exit.mp3" type mpegvideo alias buttonSound', 0
    exitButtonSoundPlay     db  'play buttonSound', 0
    exitButtonSoundClose    db  'close buttonSound', 0
    exitButtonSoundStatus   db  'status buttonSound mode', 0
; hover
    hoverButtonSoundPath    db  'source/hover.mp3', 0
    hoverButtonSoundCommand db  'open "source/hover.mp3" type mpegvideo alias buttonSound', 0
    hoverButtonSoundPlay    db  'play buttonSound', 0
    hoverButtonSoundClose   db  'close buttonSound', 0
    hoverButtonSoundStatus  db  'status buttonSound mode', 0
; status check params
    statusBuffer        db  16 dup(0)
    statusBufferLen     dd  16
    stoppedStr          db  'stopped', 0
; button voice types
    btHover     =   0x0001
    btClick     =   0x0002
    btExit      =   0x0004
