struct BMP
        bfType          dw          ?
        bfSize          dd          ?
        bfReserved1     dw          ?
        bfReserved2     dw          ?
        bfOffBits       dd          ?
        biSize          dd          ?
        biWidth         dd          ?
        biHeight        dd          ?
        biPlanes        dw          ?
        biBitCount      dw          ?
        biCompression   dd          ?
        biSizeImage     dd          ?
        biXPelsPerMeter dd          ?
        biYPelsPerMeter dd          ?
        biClrUsed       dd          ?
        biClrImportant  dd          ?
        pArray          dd          ?
ends

boat_bmp        BMP     ?
eye_bmp         BMP     ?

textCoords  dd  0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 1.0

boatloading_texture     GLuint  0 
boatbook_texture        GLuint  0 
eyeopen_texture         GLuint  0 
eyeclose_texture        GLuint  0 

; Sprite
lp_boatsprite_design    DrawModel ?
lp_boatsprite_coords    dd      1,\
                                634, 256, 1277, 683,\ 
                                0
mp_boatsprite_design    DrawModel ?
mp_boatsprite_coords    dd      1,\
                                462, 360, 685, 508,\
                                0

lgp_eyeopen_design      DrawModel ?
lgp_eyeopen_coords      dd      1,\
                                1126, 569, 1154, 589,\
                                0
lgp_eyeclose_design     DrawModel ?
lgp_eyeclose_coords     dd      1,\
                                1126, 570, 1154, 587,\
                                0

boatLoaderPath  db      "source/textures/ship/loader.bmp", 0
boatBookPath    db      "source/textures/ship/book.bmp", 0
eyeOpenPath     db      "source/textures/authentification/open.bmp", 0
eyeClosePath    db      "source/textures/authentification/close.bmp", 0