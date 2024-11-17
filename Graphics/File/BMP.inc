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

boat_bmp    BMP     ?


textCoords  dd  0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 1.0

; vertex      dd  -0.4, -0.4,\
;                  0.4, -0.4,\
;                  0.4,  0.4,\
;                 -0.4,  0.4

boatloading_texture     GLuint  0 
boatbook_texture        GLuint  0 

; Sprite
lp_boatsprite_design    DrawModel ?
lp_boatsprite_coords    dd 1,\
                           634, 256, 1277, 683,\ 
                           0
mp_boatsprite_design    DrawModel ?
mp_boatsprite_coords    dd  1,\
                            462, 360, 685, 508,\
                            0