proc Graphics.Draw.Shapes.Rect uses ebx ecx ,\
     rect, color
    locals
        NULL        GLfloat     0.0
    endl
        ; загрузка цвета в OpenGL
        mov     ebx, [color]
        invoke  glColor4f,\
            [ebx + BackgroundColor.Red],\ 
            [ebx + BackgroundColor.Green],\ 
            [ebx + BackgroundColor.Blue],\ 
            [ebx + BackgroundColor.Alpha]
        ; присваивание указателя на массив координат
        mov     ebx, [rect]
        mov     ecx, [ebx]
        cmp     ecx, 0
        je      @F
        add     ebx, 4
        .blocks:
            push    ecx   
            ; отрисова прямоугольника
            invoke  glBegin, GL_QUADS   
            invoke  glVertex3f,      [ebx],  [ebx + 4], [NULL]
            invoke  glVertex3f,  [ebx + 8], [ebx + 12], [NULL]
            invoke  glVertex3f, [ebx + 16], [ebx + 20], [NULL]
            invoke  glVertex3f, [ebx + 24], [ebx + 28], [NULL]
            invoke  glEnd
            pop     ecx
            add     ebx, 32
            loop    .blocks
    @@:
        ret
endp