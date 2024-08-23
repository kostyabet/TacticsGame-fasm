proc Graphics.Draw.Shapes.Rect uses edi ebx ecx ,\
     rectDesign, cl_background
    locals
        NULL        GLfloat     0.0

        x1          dd          ?
        x2          dd          ?
        x3          dd          ?
        x4          dd          ?
        y1          dd          ?
        y2          dd          ?
        y3          dd          ?
        y4          dd          ?
    endl
        ;mov     ebx, [rectDesign]
        ;mov     ecx, [ebx]
        ;add     ebx, 4
        ;.blocks:
        ;    push    ecx   
        ;    invoke  glBegin, GL_QUADS   
        ;    mov     edi, [cl_background]
        ;    invoke  glColor3f, [edi + BackgroundColor.Red], [edi + BackgroundColor.Green], [edi + BackgroundColor.Blue]
        ;    invoke  glVertex3f,      [ebx],  [ebx + 4], [NULL]
        ;    invoke  glVertex3f,  [ebx + 8], [ebx + 12], [NULL]
        ;    invoke  glVertex3f, [ebx + 16], [ebx + 20], [NULL]
        ;    invoke  glVertex3f, [ebx + 24], [ebx + 28], [NULL]    
        ;    invoke  glEnd
        ;    pop     ecx
        ;    add     ebx, 32
        ;    loop    .blocks
        mov     ebx, [rectDesign]
        add     ebx, 4

        mov     eax, [ebx]
        mov     [x1], eax
        add     ebx, 4

        mov     eax, [ebx]
        mov     [y1], eax
        add     ebx, 4

        mov     eax, [ebx]
        mov     [x2], eax
        add     ebx, 4

        mov     eax, [ebx]
        mov     [y2], eax
        add     ebx, 4

        mov     eax, [ebx]
        mov     [x3], eax
        add     ebx, 4

        mov     eax, [ebx]
        mov     [y3], eax
        add     ebx, 4

        mov     eax, [ebx]
        mov     [x4], eax
        add     ebx, 4

        mov     eax, [ebx]
        mov     [y4], eax
        add     ebx, 4


        invoke  glBegin, GL_QUADS
        mov     edi, [cl_background]
        invoke  glColor3f, [edi + BackgroundColor.Red], [edi + BackgroundColor.Green], [edi + BackgroundColor.Blue]
        invoke  glVertex3f, [x1], [y1], [NULL]
        invoke  glVertex3f, [x2], [y2], [NULL]
        invoke  glVertex3f, [x3], [y3], [NULL]
        invoke  glVertex3f, [x4], [y4], [NULL]
        invoke  glEnd
    ret
endp

proc Graphics.Draw.RectPrepears
    stdcall Scripts.Getters.ConvertRect, Book_root_design
    stdcall Scripts.Getters.ConvertRect, Book_endg_design
    stdcall Scripts.Getters.ConvertRect, Font_design
endp