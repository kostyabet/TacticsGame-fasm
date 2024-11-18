hIniFile     dd  ?
iniFilePath  db 'settings.txt', 0
buffer       db 255, 0
strBuffer    db 256 dup (0)

; ==== prompts ==== ;
NEXT_LINE               db      13, 10, 0
IS_MUSIC_ON_PROMPT      db      'IS_MUSIC_ON=', 0
IS_VOICE_ON_PROMPT      db      'IS_VOICE_ON=', 0
IS_HOTKEY_ON_PROMPT     db      'IS_HOTKEY_ON=', 0
VOLUME_PROMPT           db      'VOLUME=', 0
HK_PLAY_PROMPT          db      'HK_PLAY=', 0
HK_STOP_PROMPT          db      'HK_STOP=', 0
HK_ABOUT_PROMPT         db      'HK_ABOUT=', 0
HK_EXIT_PROMPT          db      'HK_EXIT=', 0
HK_SETTINGS_PROMPT      db      'HK_SETTINGS=', 0
HK_RESTART_PROMPT       db      'HK_RESTART=', 0