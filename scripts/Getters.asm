; =================== Color =================== ;
proc Scripts.Getters.Color uses eax ecx,\
     hex, resAdress
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

; =================== Rect =================== ;
proc Scripts.Getters.ConvertRect uses eax ebx ecx,\
     resAdress
    locals
        multiplier  dd  4
    endl
    mov     ebx, [resAdress]
    mov     eax, [ebx]
    mul     dword [multiplier]
    xchg    ecx, eax
    add     ebx, 4
    .convert:
        mov     eax, [ebx]
        stdcall GetXGLfloatCoord, eax
        mov     [ebx], eax

        mov     eax, [ebx + 4]
        stdcall GetYGLfloatCoord, eax
        mov     [ebx + 4], eax

        add     ebx, 8
        loop    .convert
    ret
endp
proc GetXGLfloatCoord\ ; x/960.0-1.0
     x
    locals
        res                 dd          0x00000000
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
        res                 dd          0x00000000
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

proc Scripts.Getters.CovertIntToGLfloat\
     value
    ; x
    mov     ebx, [value]
    mov     eax, [ebx]
    add     eax, 960
    stdcall GetXGLfloatCoord, eax
    mov     [ebx], eax
    ; y
    add     ebx, 4
    mov     eax, [ebx]
    add     eax, 540
    stdcall GetYGLfloatCoord, eax
    mov     [ebx], eax
    ret
endp