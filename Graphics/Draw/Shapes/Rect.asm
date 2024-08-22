proc Graphics.Draw.Shapes.Rect uses edi ebx ecx ,\
     rectDesign, cl_background
    locals
        NULL        GLfloat     0.0
        multiplier  dd          4
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
        invoke  glBegin, GL_QUADS
        mov     edi, [cl_background]
        invoke  glColor3f, [edi + BackgroundColor.Red], [edi + BackgroundColor.Green], [edi + BackgroundColor.Blue]
        invoke  glVertex3f,      [ebx],  [ebx + 4], [NULL]
        invoke  glVertex3f,  [ebx + 8], [ebx + 12], [NULL]
        invoke  glVertex3f, [ebx + 16], [ebx + 20], [NULL]
        invoke  glVertex3f, [ebx + 24], [ebx + 28], [NULL]
        invoke  glEnd
    ret
endp