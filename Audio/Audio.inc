setMusicVolume              db  'setaudio foneMusic volume to ', 5 dup(0)
setClickVolume              db  'setaudio clickButton volume to ', 5 dup(0)
setVictoryVolume            db  'setaudio victorySound volume to ', 5 dup(0)
setTickVolume               db  'setaudio tickButton volume to ', 5 dup(0)
setGameVolume               db  'setaudio gameMusic volume to ', 5 dup(0)
setVolumeList               dd  setMusicVolume, setClickVolume, setVictoryVolume, setTickVolume, setGameVolume, 0
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
; victory
    victoryButtonSoundPath    db  'source/sounds/victory.mp3', 0
    victoryButtonSoundCommand db  'open "source/sounds/victory.mp3" type mpegvideo alias victorySound', 0
    victoryButtonSoundPlay    db  'play victorySound', 0
    victoryButtonSoundClose   db  'close victorySound', 0
    victoryButtonSoundStatus  db  'status victorySound mode', 0
; tick
    tickButtonSoundPath    db  'source/sounds/tick.mp3', 0
    tickButtonSoundCommand db  'open "source/sounds/tick.mp3" type mpegvideo alias tickButton', 0
    tickButtonSoundPlay    db  'play tickButton', 0
    tickButtonSoundClose   db  'close tickButton', 0
    tickButtonSoundStatus  db  'status tickButton mode', 0
; game
    gameMusicPath           db  'source/sounds/game.mp3', 0
    gameMusicCommand        db  'open "source/sounds/game.mp3" type mpegvideo alias gameMusic', 0
    gameMusicPlay           db  'play gameMusic', 0
    gameMusicClose          db  'close gameMusic', 0
    gameMusicStatus         db  'status gameMusic mode', 0
; status check params
    statusBuffer        db  16 dup(0)
    statusBufferLen     dd  16
    stoppedStr          db  'stopped', 0
; button voice types
    btClick     =   0x0001
    btTick      =   0x0002
    btFree      =   0x0000
    btType      dd  btFree