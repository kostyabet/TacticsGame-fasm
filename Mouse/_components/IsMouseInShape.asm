; eax = GLFalse
; eax = GLTrue
proc Mouse.CheckIsInShape uses ecx ebx,\
     shape
    locals
        result  dd      GL_FALSE
    endl
    mov     ebx, [shape]
    mov     ecx, [ebx]
    add     ebx, 4
    cmp     ecx, 0
    je      .circle
    .rect:
        .checkRect: 
            stdcall Mouse.CheckIsInRect, [ebx], [ebx + 4], [ebx + 16], [ebx + 20]
            cmp     eax, GL_TRUE
            jne     @F
            mov     [result], eax
            @@:
            add     ebx, 32
            loop    .checkRect
    .circle:
    mov     ebx, [shape]
    add     ebx, 228
    mov     ecx, [ebx]
    add     ebx, 4
    cmp     ecx, 0
    je      .exit
    .checkCircles:
        stdcall Mouse.CheckIsInCircle, [ebx], [ebx + 4], [ebx + 8]
        cmp     eax, GL_TRUE
        jne     @f
        mov     [result], eax
        @@:
        add     ebx, 2900
        loop    .checkCircles
    .exit:
        mov     eax, [result]
        ret
endp

proc Mouse.CheckIsInRect,\
     x1, y1, x2, y2
    locals
        result  dd      GL_FALSE
    endl
    .leftX:
        fld     dword [x1]
        fcom    dword [XPosition]
        fstp    st0
        fstsw   ax
        sahf
        ja      .exit

    .topY:
        fld     dword [y1]
        fcom    dword [YPosition]
        fstp    st0
        fstsw   ax
        sahf
        jb      .exit

    .rightX:
        fld     dword [x2]
        fcom    dword [XPosition]
        fstp    st0
        fstsw   ax
        sahf
        jb      .exit
            
    .bottomY:
        fld     dword [y2]
        fcom    dword [YPosition]
        fstp    st0
        fstsw   ax
        sahf
        ja      .exit
    .main:
        mov     [result], GL_TRUE

    .exit:
        mov     eax, [result]
        ret
endp
proc Mouse.CheckIsInCircle uses ecx,\
    centerXfl, centerYfl, radius
    locals
        result  dd  GL_FALSE
        centerX dd  ?
        centerY dd  ?
        mouseX  dd  ?
        mouseY  dd  ?
        XLen    dd  ?
        YLen    dd  ?
        hypotenuse dd ?
    endl
    ; reconvert X
    stdcall GetXDecimalCoord, [centerXfl]
    mov     [centerX], eax
    ; reconvert Y
    stdcall GetYDecimalCoord, [centerYfl]
    mov     [centerY], eax
    ; reconvert XMouse
    stdcall GetXDecimalCoord, [XPosition]
    mov     [mouseX], eax
    ; reconvert YMouse
    stdcall GetYDecimalCoord, [YPosition]
    mov     [mouseY], eax
    ; abs(X)
    mov     eax, [centerX]
    sub     eax, [mouseX]
    stdcall Math.Absolute, eax
    mov     [XLen], eax
    ; abs(Y)
    mov     eax, [centerY]
    sub     eax, [mouseY]
    stdcall Math.Absolute, eax
    mov     [YLen], eax
    ; C = sqrt(X^2 + Y^2)
    stdcall Math.Hypotenuse, [XLen], [YLen]
    mov     [hypotenuse], eax

    fld     dword [hypotenuse]
    ficom   dword [radius]
    fstp    st0
    fstsw   ax
    sahf
    ja      .exit
    mov     [result], GL_TRUE
    .exit:
    mov     eax, [result]
    ret
endp