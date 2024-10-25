proc Math.Hypotenuse,\
     X, Y
    locals
        XLen    dd  ?
        YLen    dd  ?
        result  dd  ?
    endl
    mov     eax, [X]
    mov     [XLen], eax

    mov     eax, [Y]
    mov     [YLen], eax

    mov     eax, [XLen]
    mul     dword [XLen]
    mov     [XLen], eax
    mov     eax, [YLen]
    mul     dword [YLen]
    mov     [YLen], eax

    fild    [XLen]
    fiadd   dword [YLen]
    fsqrt
    fstp    dword [result]
    mov     eax, [result]
    ret
endp