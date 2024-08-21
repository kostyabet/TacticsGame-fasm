proc Graphics.Draw.Shapes.Rect uses ebx,\
     rectDesign, cl_background
    locals
        NULL    GLfloat     0.0
    endl
        invoke  glBegin, GL_QUADS
        mov     ebx, [cl_background]
        invoke  glColor3f, [ebx], [ebx + 4], [ebx + 8]
        mov     ebx, [rectDesign]
        invoke  glVertex3f, [ebx + RectDesign.v1 + Point.x], [ebx + RectDesign.v1 + Point.y], [NULL]
        invoke  glVertex3f, [ebx + RectDesign.v2 + Point.x], [ebx + RectDesign.v2 + Point.y], [NULL]
        invoke  glVertex3f, [ebx + RectDesign.v3 + Point.x], [ebx + RectDesign.v3 + Point.y], [NULL]
        invoke  glVertex3f, [ebx + RectDesign.v4 + Point.x], [ebx + RectDesign.v4 + Point.y], [NULL]

        invoke  glEnd
    ret
endp