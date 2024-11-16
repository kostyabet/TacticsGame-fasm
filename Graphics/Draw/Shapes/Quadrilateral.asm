proc Graphics.Draw.Shapes.Quadrilateral uses ebx ecx ,\
     quad, color
    locals
        NULL        GLfloat     0.0
    endl
        mov     ebx, [color]
        invoke  glColor4f,\
            [ebx + BackgroundColor.Red],\ 
            [ebx + BackgroundColor.Green],\ 
            [ebx + BackgroundColor.Blue],\ 
            [ebx + BackgroundColor.Alpha]
        mov     ebx, [quad]
        invoke  glBegin, GL_QUADS   
        invoke  glVertex3f,      [ebx],  [ebx + 4], [NULL]
        invoke  glVertex3f,  [ebx + 8], [ebx + 12], [NULL]
        invoke  glVertex3f, [ebx + 16], [ebx + 20], [NULL]
        invoke  glVertex3f, [ebx + 24], [ebx + 28], [NULL]
        invoke  glEnd
    ret
endp