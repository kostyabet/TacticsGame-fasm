proc Game.Convert.ToMatrix,\
     number
      mov    eax, [number]
      cmp    eax, 2
     ja     @f
      add   eax, 2
      jmp   .exit
     @@:
      cmp    eax, 5
     ja     @f
      add    eax, 6
      jmp   .exit
     @@:
      cmp    eax, 26
     ja     @f
      add   eax, 8
      jmp   .exit
     @@:
      cmp    eax, 29
     ja     @f
      add   eax, 10
      jmp   .exit
     @@:
      cmp    eax, 32
     ja     .exit
      add   eax, 14
    .exit:
    ret
endp

proc Game.Convert.ToBusiness,\
     number
    mov     eax, [number]
    cmp     eax, -1
    je      .exit
        cmp     eax, 4
        ja      @f
    sub    eax, 2
    jmp    .exit
    @@:
        cmp     eax, 11
        ja      @f
    sub    eax, 6
    jmp    .exit
    @@:
        cmp     eax, 34
        ja      @f
    sub    eax, 8
    jmp     .exit
    @@:
        cmp     eax, 39
        ja      @f
    sub    eax, 10
    jmp    .exit
    @@:
        sub    eax, 14
    .exit:
    ret
endp