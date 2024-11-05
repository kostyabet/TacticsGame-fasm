proc Game.Convert.ToMatrix uses edi ebx,\
     number
      mov    ebx, [number]
      cmp    ebx, 2
     ja     @f
      add   ebx, 2
     @@:
      cmp    ebx, 5
     ja     @f
      add    ebx, 6
     @@:
      cmp    ebx, 26
     ja     @f
      add   ebx, 8
     @@:
      cmp    ebx, 29
     ja     @f
      add   ebx, 10
     @@:
      cmp    ebx, 32
     ja     @f
      add   ebx, 14
     @@:
      mov    eax, ebx
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
            je     .exit
        @@:
        cmp     eax, 11
        ja      @f
            sub    eax, 6
            je     .exit
        @@:
        cmp     eax, 34
        ja      @f
            sub    eax, 8
            je     .exit
        @@:
        cmp     eax, 39
        ja      @f
            sub    eax, 10
            je     .exit
        @@:
        sub    eax, 14
    .exit:
    ret
endp