proc Graphics.Draw.Shapes.Sprite uses eax,\
     texture, design
    invoke glEnable, GL_TEXTURE_2D
    invoke glBindTexture, GL_TEXTURE_2D, [texture]

    invoke  glColor3f, 1.0, 1.0, 1.0
    invoke  glEnableClientState, GL_VERTEX_ARRAY 
    invoke  glEnableClientState, GL_TEXTURE_COORD_ARRAY

    mov     eax, [design]
    add     eax, 4
    invoke  glVertexPointer, 2, GL_FLOAT, 0, eax ; vertex
    invoke  glTexCoordPointer, 2, GL_FLOAT, 0, textCoords

    invoke  glDrawArrays, GL_TRIANGLE_FAN, 0, 4

    invoke  glDisableClientState, GL_VERTEX_ARRAY
    invoke  glDisableClientState, GL_TEXTURE_COORD_ARRAY    

    invoke glBindTexture, GL_TEXTURE_2D, 0
    ret
endp