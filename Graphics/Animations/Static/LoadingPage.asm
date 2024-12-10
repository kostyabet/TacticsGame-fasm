; progressStatus 0..100
startValue      dd  632
endValue        dd  1286
progressBarLen  dd  654
maxValue        dd  100
minValue        dd  0
proc Animation.Static.LoadingPage.Bar uses eax ebx edx
    locals
        result  dd ?
    endl
    fild    dword [progressStatus]
    fidiv   dword [maxValue]
    fimul    dword [progressBarLen]
    fistp   dword [result]
    mov     eax, [result]
    add     eax, [startValue]

    mov     ebx, lp_bar_main_coords
    add     ebx, 12
    mov     edx, [ebx]
    mov     [ebx], eax
    stdcall Scripts.Getters.ConvertCoords, lp_bar_main_coords,  lp_bar_main_design

    mov     eax, [maxValue]
    cmp     [progressStatus], eax
    jne     .end
    mov     [CurentPage], MainPage
    .end:
        ret
endp