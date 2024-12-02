setMusicVolume              db  'setaudio foneMusic volume to ', 5 dup(0)
setClickVolume              db  'setaudio clickButton volume to ', 5 dup(0)
setExitVolume               db  'setaudio exitButton volume to ', 5 dup(0)
setHoverVolume              db  'setaudio hoverButton volume to ', 5 dup(0)
setVictoryVolume            db  'setaudio victorySound volume to ', 5 dup(0)
setVolumeList               dd  setMusicVolume, setClickVolume, setExitVolume, setHoverVolume, setVictoryVolume, 0
; fone music
    foneMusicPath           db  'source/sounds/fone.mp3', 0
    foneMusicCommand        db  'open "source/sounds/fone.mp3" type mpegvideo alias foneMusic', 0
    foneMusicPlay           db  'play foneMusic', 0
    foneMusicClose          db  'close foneMusic', 0
    foneMusicStatus         db  'status foneMusic mode', 0
; click
    clickButtonSoundPath    db  'source/sounds/click.mp3', 0
    clickButtonSoundCommand db  'open "source/sounds/click.mp3" type mpegvideo alias clickButton', 0
    clickButtonSoundPlay    db  'play clickButton', 0
    clickButtonSoundClose   db  'close clickButton', 0
    clickButtonSoundStatus  db  'status clickButton mode', 0
; exit
    exitButtonSoundPath     db  'source/sounds/exit.mp3', 0
    exitButtonSoundCommand  db  'open "source/sounds/exit.mp3" type mpegvideo alias exitButton', 0
    exitButtonSoundPlay     db  'play exitButton', 0
    exitButtonSoundClose    db  'close exitButton', 0
    exitButtonSoundStatus   db  'status exitButton mode', 0
; hover
    hoverButtonSoundPath    db  'source/sounds/hover.mp3', 0
    hoverButtonSoundCommand db  'open "source/sounds/hover.mp3" type mpegvideo alias hoverButton', 0
    hoverButtonSoundPlay    db  'play hoverButton', 0
    hoverButtonSoundClose   db  'close hoverButton', 0
    hoverButtonSoundStatus  db  'status hoverButton mode', 0
; victory
    victoryButtonSoundPath    db  'source/sounds/victory.mp3', 0
    victoryButtonSoundCommand db  'open "source/sounds/victory.mp3" type mpegvideo alias victorySound', 0
    victoryButtonSoundPlay    db  'play victorySound', 0
    victoryButtonSoundClose   db  'close victorySound', 0
    victoryButtonSoundStatus  db  'status victorySound mode', 0
; status check params
    statusBuffer        db  16 dup(0)
    statusBufferLen     dd  16
    stoppedStr          db  'stopped', 0
; button voice types
    btHover     =   0x0001
    btClick     =   0x0002
    btExit      =   0x0004
