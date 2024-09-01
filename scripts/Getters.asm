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
; ====== Shapes ====== ; eax edx
proc Scripts.Getters.AddOffsetShapeCoords uses ebx ecx,\
     design, repeat, xSum, ySum
    locals
        xOffset     GLfloat     ?
        yOffset     GLfloat     ?
        multipier   dd          4
        res         GLfloat     ?
    endl
    .prepear:
        mov     ebx, [repeat]
        mov     eax, [ebx + 4]
        mov     [xOffset], eax
        mov     eax, [ebx + 8]
        mov     [yOffset], eax
    .start:
        mov     ebx, [design]
    .rect:
        mov     eax, [ebx]
        mul     dword [multipier]
        xchg    ecx, eax
        cmp     ecx, 0
        je      .circle
        add     ebx, 4
        .rectLoop:
            fld     dword [ebx]
            fadd    dword [xOffset]
            fstp    dword [ebx]
            
            fld     dword [ebx + 4]
            fadd    dword [yOffset]
            fstp    dword [ebx + 4]
            
            add     ebx, 8
            dec     ecx
            cmp     ecx, 0
            jne    .rectLoop
    .circle:
        mov     ebx, [design]
        add     ebx, 164
        mov     eax, [ebx]
        mul     dword [multipier]
        xchg    ecx, eax
        cmp     ecx, 0
        je      .exit
        add     ebx, 4
        .circleLoop:
            ; circle coords add ...
            dec     ecx
            cmp     ecx, 0
            jne     .circleLoop
    .exit:
        fld     dword [xSum]
        fadd    dword [xOffset]
        fstp    [res]
        mov     eax, [res]

        fld     dword [ySum]
        fadd    dword [yOffset]
        fstp    [res]
        mov     edx, [res]

        ret
endp
proc Scripts.Getters.SubOffsetShapeCoords uses eax ebx ecx,\
     design, xSum, ySum
    locals
        multipier   dd  4
    endl
    .rectPrepaer:
        mov     ebx, [design]
        mov     eax, [ebx]
        mul     dword [multipier]
        xchg    ecx, eax
        cmp     ecx, 0
        je      .circlePrepear
        add     ebx, 4
    .rectReturn:
        fld     dword [ebx]
        fsub    [xSum]
        fstp    dword [ebx]

        fld     dword [ebx + 4]
        fsub    [ySum]
        fstp    dword [ebx + 4]
        
        add     ebx, 8
        loop    .rectReturn
    .circlePrepear:
        mov     ebx, [design]
        add     ebx, 164
        mov     eax, [ebx]
        mul     dword [multipier]
        xchg    ecx, eax
        cmp     ecx, 0
        je      .exit
        add     ebx, 4
    .circleReturn:
        ; return circle
        loop    .circleReturn
    .exit:
        ret
endp