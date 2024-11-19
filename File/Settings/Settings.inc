; ==== Settings ==== ;
; ==== VOICE ==== ;
IS_MUSIC_ON         dd      GL_TRUE
IS_VOICE_ON         dd      GL_TRUE
IS_HOTKEY_ON        dd      GL_TRUE
VOLUME              dd      50
; ==== Hot keys ==== ;
HK_PLAY             dd      'P'
HK_STOP             dd      'P'
HK_ABOUT            dd      'A'
HK_EXIT             dd      'Q'
HK_SETTINGS         dd      'S'
HK_RESTART          dd      'R'

HotKeysSize         dd      6
HotKeysList         dd      HK_PLAY, HK_STOP, HK_ABOUT, HK_EXIT, HK_SETTINGS, HK_RESTART