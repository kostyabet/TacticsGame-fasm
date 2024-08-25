proc Graphics.Draw.Shapes.Circle uses eax ebx ecx,\
     circle, color
    mov     ebx, [color]
    invoke  glColor3f, [ebx + BackgroundColor.Red], [ebx + BackgroundColor.Green], [ebx + BackgroundColor.Blue]

    mov    ebx, [circle]
    mov    ecx, [ebx]
    cmp    ecx, 0
    je     @F
    add    ebx, 4
    .drawBlock:
        push    ecx
        invoke  glBegin, GL_TRIANGLE_FAN
        mov     eax, [ebx]
        invoke  glVertex3f, [ebx], [ebx + 4], 0.0
        add     ebx, 8
        mov     ecx, [degreeCount]
        inc     ecx
        .drawDot:
            push    ecx
            invoke  glVertex3f, [ebx], [ebx + 4], 0.0
            pop     ecx
            add     ebx, 8
            dec     ecx
            cmp     ecx, 0
            jne     .drawDot
        invoke  glEnd
        pop     ecx
        dec     ecx
        cmp     ecx, 0
        jne     .drawBlock
@@:
    ret
endp