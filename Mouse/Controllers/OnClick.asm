; XPosition   dd      ?
; YPosition   dd      ?
proc Mouse.OnClick uses ebx eax,\
     lparam
    stdcall Mouse.OnMove, [lparam], XPosition, YPosition
    mov     ebx, [CurentPage]
    mov     ebx, [EventsList + ebx]
    mov     ecx, [ebx]
    cmp     ecx, 0
    je      .exitProc
    add     ebx, 4
    .mainAnimLoop:
        .prepear:
            push    ebx
            mov     eax, [ebx]
            add     ebx, 4
            
            cmp     eax, et_pagebutton
            jne     @F
            stdcall Game.OnClick.PageButton, [ebx], [ebx + 4]
        @@:
            cmp     eax, et_prevpage
            jne     @F
            stdcall Game.OnClick.PageButton, [ebx], [PrevousPage]
        @@:
            cmp     eax, et_tick
            jne     @F
            stdcall Game.OnClick.TickButton, [ebx], [ebx + 4]
        @@:
            cmp     eax, et_wndbutton
            jne     @F
            stdcall Game.OnClick.WindowButton, [ebx], [ebx + 4] 
        @@:
            pop     ebx
            add     ebx, 12
            loop    .mainAnimLoop
    .exitProc:
        ret
endp
proc Game.OnClick.PageButton uses eax ebx,\
     coords, nextPage
    stdcall Mouse.CheckIsInShape, [coords]
    cmp     eax, GL_FALSE
    je      .exit
            
    stdcall Page.ChangePage, [nextPage]
    .exit:
        ret
endp
proc Game.OnClick.TickButton uses eax ebx ecx edi,\
     floatList, matrixTick
    mov     ebx, [floatList]
    mov     ecx, [ebx]
    add     ebx, 4
    cmp     ecx, 0 
    je      .exit
    ; search tick number
    .mainLoop: 
        stdcall Mouse.CheckIsInCircle, [ebx], [ebx + 4], [ebx + 8] ; x y radius
        cmp     eax, GL_TRUE
        jne     .exitFromLoop
         mov     edi, [floatList]
         mov     ebx, [edi]
         sub     ebx, ecx
         stdcall Game.OnTickClick, [matrixTick], ebx
         jmp     .exit
        .exitFromLoop:
         add     ebx, 11540 ; skeep circle
        dec    ecx
        cmp   ecx, 0
        jne   .mainLoop
    .exit:
    ret
endp
proc Game.OnClick.WindowButton uses ebx,\
    coords, callFucntionAddress
    
    stdcall Mouse.CheckIsInShape, [coords]
    cmp     eax, GL_FALSE
    je      .exit
            
    mov     ebx, [callFucntionAddress]
    stdcall ebx
    .exit:
        ret
endp 