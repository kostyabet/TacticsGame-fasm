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
        biAddress       dd          ? 
ends

boat_bmp    BMP     ?
