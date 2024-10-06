proc Mouse.GetProportion uses ebx,\
     max, cur
    locals
        res     dd      ?
    endl
    fild    dword [cur]
    fidiv   dword [max]
    fstp    [res]
    mov     eax, [res]
    ret
endp