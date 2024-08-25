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
proc Scripts.Getters.ConvertCoords uses eax ebx ecx edi,\
     coords, resAdress
    locals
        multiplierRect    dd  4
    endl
    mov     ebx, [coords]
    mov     edi, [resAdress]
    .rect:
        mov     ecx, [ebx]
        mov     [edi], ecx
        add     ebx, 4
        cmp     ecx, 0
        je      .circle
        add     edi, 4
        .convertRect:
            mov     eax, [ebx]
            stdcall GetXGLfloatCoord, eax
            mov     [edi], eax
            mov     [edi + 8], eax

            mov     eax, [ebx + 8]
            stdcall GetXGLfloatCoord, eax
            mov     [edi + 16], eax
            mov     [edi + 24], eax

            mov     eax, [ebx + 4]
            stdcall GetYGLfloatCoord, eax
            mov     [edi + 4], eax
            mov     [edi + 28], eax

            mov     eax, [ebx + 12]
            stdcall GetYGLfloatCoord, eax
            mov     [edi + 12], eax
            mov     [edi + 20], eax

            add     ebx, 16
            add     edi, 32
            loop    .convertRect
    .circle:
        mov     edi, [resAdress]
        add     edi, 164
        mov     ecx, [ebx]
        mov     [edi], ecx
        cmp     ecx, 0
        je      .exit
        add     ebx, 4
        add     edi, 4
        .convertCircle:
            push    ecx
            ; center
            mov     eax, [ebx]
            stdcall GetXGLfloatCoord, eax
            mov     [edi], eax
            mov     eax, [ebx + 4]
            stdcall GetYGLfloatCoord, eax
            mov     [edi + 4], eax
            add     edi, 8
            ; circle coords
            fldpi
            fadd    st0, st0
            fidiv   dword [degreeCount]
            mov     ecx, [degreeCount]
            inc     ecx
            .drawDot:
                fld     st0
                fimul   [curentDeg]
                fstp    [curentRudDeg]

                ; x
                fld     [curentRudDeg]
                fcos
                fimul   dword [ebx + 8]
                fiadd   dword [ebx]
                fstp    dword [edi]

                ; y
                fld     [curentRudDeg]
                fsin
                fimul   dword [ebx + 8]
                fiadd   dword [ebx + 4]
                fstp    dword [edi + 4]

                ; convert
                mov     eax, [edi]
                stdcall GetXGLfloatCoordFromFloat, eax
                mov     [edi], eax

                mov     eax, [edi + 4]
                stdcall GetYGLfloatCoordFromFloat, eax
                mov     [edi + 4], eax

                add     [curentDeg], 1
                dec     ecx
                add     edi, 8
                cmp     ecx, 0
                jne     .drawDot
            mov     [curentDeg], 0
            pop     ecx
            add     ebx, 12
            dec     ecx
            jne     .convertCircle
    .exit:
        ret
endp
proc GetXGLfloatCoordFromFloat\ ; x/960.0-1.0
     x
    locals
        res                 dd          0x00000000
        floatNum            GLfloat     1.0
        DeviceHalfWidth     GLfloat     960.0
    endl
        fld    dword [x]
        fdiv    [DeviceHalfWidth]
        fsub    [floatNum]
        fstp    [res]
        mov     eax, [res]
    ret
endp
proc GetYGLfloatCoordFromFloat\ ; -(y/540.0-1.0)
     y
    locals
        res                 dd          0x00000000
        floatNum            GLfloat     1.0
        DeviceHalfWidth     GLfloat     540.0
        minus               dd          -1
    endl
        fld    dword [y]
        fdiv    [DeviceHalfWidth]
        fsub    [floatNum]
        fimul   [minus]
        fstp    [res]
        mov     eax, [res]
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