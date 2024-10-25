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
        add     edi, 228
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
            mov     eax, [ebx + 8]
            mov     [edi + 8], eax
            add     edi, 12
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
        fld     dword [x]
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
        fld     dword [y]
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

; ======= Text Font Size ====== ;
proc Scripts.Getters.GetFSMultiplier,\
     base, curent
    locals
        res    dd   ?
    endl
    fild    dword [curent]
    fidiv   dword [base]
    fstp    [res]
    mov     eax, [res]
    ret
endp
proc Scripts.Getters.GetIMULNumber\
     num, multipier
    locals
        res dd  ?
    endl
    fild    dword [num]
    fmul    dword [multipier]
    fistp   [res]
    mov     eax, [res]
    ret
endp
; ====== Work With Numbers ====== ;
proc Scripts.Getters.ConvertOffset uses eax ebx,\
     repInfo
    mov     ebx, [repInfo]
    ; x
    mov     eax, [ebx + 4]
    add     eax, 960
    stdcall GetXGLfloatCoord, eax
    mov     [ebx + 4], eax
    ; y
    mov     eax, [ebx + 8]
    add     eax, 540
    stdcall GetYGLfloatCoord, eax
    mov     [ebx + 8], eax
    ret
endp
; ====== Repeat Shapes ====== ;
proc Scripts.Getters.ConvertRepeatCoords uses eax ebx ecx,\
     coords
    locals
        multiplierRect    dd  4
        x                 dd  ?
        y                 dd  ?
    endl
    .start:
        mov     ebx, [coords]
    .rect:
        mov     ecx, [ebx]
        cmp     ecx, 0
        je      .exit
        add     ebx, 4
        .rectLoop:
            ; x2
            mov     eax, [ebx + 8]
            stdcall GetXGLfloatCoord, eax
            mov     [ebx + 8], eax
            mov     [ebx + 16], eax
            mov     [ebx + 24], eax
            ; y2
            mov     eax, [ebx + 12]
            stdcall GetYGLfloatCoord, eax
            mov     [ebx + 12], eax
            mov     [ebx + 20], eax
            ; x1
            mov     eax, [ebx]
            stdcall GetXGLfloatCoord, eax
            mov     [ebx], eax
            mov     [ebx + 8], eax
            ; y1
            mov     eax, [ebx + 4]
            stdcall GetYGLfloatCoord, eax
            mov     [ebx + 4], eax
            mov     [ebx + 28], eax
            ; exit
            add     ebx, 32
            dec     ecx
            cmp     ecx, 0
            jne     .rectLoop
    .exit:
        ret
endp
; ==== Tiks work ==== ;
proc Scripts.ModelsPrepear uses eax ecx ebx edx edi,\
     decimal, radiuses, float
    locals
        curRadius   dd      ?
        multipier   dd      4
    endl
    mov     edi, [float]
    mov     ecx, [edi]
    add     edi, 4
    .cConvert:
        ; set curent Radius
        push    ebx ecx edi 
        mov     edi, [float]
        mov     eax, [edi]
        sub     eax, ecx
        mul     dword [multipier]
        mov     edi, [radiuses]
        mov     ebx, eax
        mov     eax, [edi + ebx]
        mov     [curRadius], eax
        pop     edi ecx ebx
        ; main block
        push    ecx edi
        mov     edi, [edi]
        mov     ebx, [decimal]
        mov     ecx, [ebx]
        mov     [edi], ecx
        cmp     ecx, 0
        je      .exitFromLoop
        add     ebx, 4
        add     edi, 4
        .circleConvert:
            push    ecx
            ; center
            mov     eax, [ebx]
            stdcall GetXGLfloatCoord, eax
            mov     [edi], eax
            mov     eax, [ebx + 4]
            stdcall GetYGLfloatCoord, eax
            mov     [edi + 4], eax
            mov     eax, [ebx + 8]
            mov     [edi + 8], eax
            add     edi, 12
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
                fimul   dword [curRadius] ; radius
                fiadd   dword [ebx]
                fstp    dword [edi]

                ; y
                fld     [curentRudDeg]
                fsin
                fimul   dword [curRadius] ; radius
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
            add     ebx, 8
            dec     ecx
            jne     .circleConvert
        .exitFromLoop:
        pop     edi ecx
        add     edi, 4
        dec     ecx
        cmp     ecx, 0
        ja     .cConvert
    ret
endp

proc GetXGLfloatCoordByWidth\ ; x/960.0-1.0
     x, halfWidth
    locals
        res                 dd          0x00000000
        floatNum            GLfloat     1.0
    endl
        fild    dword [x]
        fidiv   [halfWidth]
        fsub    [floatNum]
        fstp    [res]
        mov     eax, [res]
    ret
endp
proc GetYGLfloatCoordByWidth\ ; -(y/540.0-1.0)
     y, halfWidth
    locals
        res                 dd          0x00000000
        floatNum            GLfloat     1.0
        minus               dd          -1
    endl
        fild    dword [y]
        fidiv   [halfWidth]
        fsub    [floatNum]
        fimul   [minus]
        fstp    [res]
        mov     eax, [res]
    ret
endp

proc GetXDecimalCoord\ ;  x = (GLfloat + 1) * 960.0
     x
    locals
        res                 dd          0x00000000
        floatNum            GLfloat     1.0
        DeviceHalfWidth     GLfloat     960.0
    endl
        fld     dword [x]
        fadd    [floatNum]
        fmul    [DeviceHalfWidth]
        fistp   [res]
        mov     eax, [res]
    ret
endp
proc GetYDecimalCoord\ ; y = (1 - GLFloat) * 540.0
     y
    locals
        res                 dd          0x00000000
        floatNum            GLfloat     1.0
        DeviceHalfWidth     GLfloat     540.0
    endl
        fld     [floatNum]
        fsub    dword [y]
        fmul    [DeviceHalfWidth]
        fistp   [res]
        mov     eax, [res]
    ret
endp