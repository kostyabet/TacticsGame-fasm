proc Scripts.Getters.Color uses eax ecx,\
     hex, resAdress
    locals
        divider   dd   100
    endl
        mov       ebx, [resAdress]
        mov       eax, [hex]
        and       eax, 0x000000FF
        stdcall   GetGLfloatColor, eax
        mov       [ebx + BackgroundColor.Blue], eax
        mov       eax, [hex]
        and       eax, 0x0000FF00
        shr       eax, 8
        stdcall   GetGLfloatColor, eax
        mov       [ebx + BackgroundColor.Green], eax
        mov       eax, [hex]
        and       eax, 0x00FF0000
        shr       eax, 16
        stdcall   GetGLfloatColor, eax
        mov       [ebx + BackgroundColor.Red], eax     
    ret
endp

proc Scripts.Getters.Rect uses eax ebx,\
     x1, y1, x2, y2, br_r, resAdress
        mov     ebx, [resAdress]
        stdcall GetXGLfloatCoord, [x1]
        mov     [ebx + RectDesign.v1.x], eax
        mov     [ebx + RectDesign.v2.x], eax
        stdcall GetXGLfloatCoord, [x2]
        mov     [ebx + RectDesign.v3.x], eax
        mov     [ebx + RectDesign.v4.x], eax
        stdcall GetYGLfloatCoord, [y1]
        mov     [ebx + RectDesign.v1.y], eax
        mov     [ebx + RectDesign.v4.y], eax
        stdcall GetYGLfloatCoord, [y2]
        mov     [ebx + RectDesign.v2.y], eax
        mov     [ebx + RectDesign.v3.y], eax
        mov     eax, [br_r]
        mov     [ebx + RectDesign.borderRadius], eax
    ret
endp

;=========== private ===========;

;==== for Rect ====
proc GetXGLfloatCoord\ ; x/960.0-1.0
     x
    locals
        res                 dd          ?
        floatNum            GLfloat     1.0
        DeviceHalfWidth     GLfloat     960.0
    endl
        fild    dword [x]
        fdiv    [DeviceHalfWidth]
        fsub    [floatNum]
        fstp    [res]
        mov     eax, [res]
    ret
endp

proc GetYGLfloatCoord\ ; -(y/540.0-1.0)
     y
    locals
        res                 dd          ?
        floatNum            GLfloat     1.0
        DeviceHalfWidth     GLfloat     540.0
        minus               dd          -1
    endl
        fild    dword [y]
        fdiv    [DeviceHalfWidth]
        fsub    [floatNum]
        fimul   [minus]
        fstp    [res]
        mov     eax, [res]
    ret
endp

;==== for color ====
proc GetGLfloatColor\
     num
    locals
        res     dd       ?
        divider GLfloat  256.0
    endl
        fild    dword [num]
        fdiv    [divider]
        fstp    [res]
        mov     eax, [res]
    ret
endp