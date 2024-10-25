proc Math.Absolute,\
    value
    mov     eax, [value]
    test    eax, eax    
    jge     .exit        
    neg     eax          
    .exit:
    ret
endp