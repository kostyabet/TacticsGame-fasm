proc Graphics.Draw.Shapes.Rect uses ebx ecx ,\
     rect, color
    locals
        NULL        GLfloat     0.0
    endl
        mov     ebx, [color]
        invoke  glColor3f, [ebx + BackgroundColor.Red], [ebx + BackgroundColor.Green], [ebx + BackgroundColor.Blue]    
        mov     ebx, [rect]
        mov     ecx, [ebx]
        add     ebx, 4
        .blocks:
            push    ecx   
            invoke  glBegin, GL_QUADS   
            invoke  glVertex3f,      [ebx],  [ebx + 4], [NULL]
            invoke  glVertex3f,  [ebx + 8], [ebx + 12], [NULL]
            invoke  glVertex3f, [ebx + 16], [ebx + 20], [NULL]
            invoke  glVertex3f, [ebx + 24], [ebx + 28], [NULL]    
            invoke  glEnd
            pop     ecx
            add     ebx, 32
            loop    .blocks
    ret
endp