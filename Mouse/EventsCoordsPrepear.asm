proc Mouse.EventsCoords.Prepear,\
     coords
    mov     ebx, [coords]
    stdcall Mouse.GetProportion, SCREEN_WIDTH, [ebx]
    mov     [ebx], eax
    add     ebx, 4
    stdcall Mouse.GetProportion, SCREEN_HEIGHT, [ebx]
    mov     [ebx], eax
    add     ebx, 4
    stdcall Mouse.GetProportion, SCREEN_WIDTH, [ebx]
    mov     [ebx], eax
    add     ebx, 4
    stdcall Mouse.GetProportion, SCREEN_HEIGHT, [ebx]
    mov     [ebx], eax
    ret
endp