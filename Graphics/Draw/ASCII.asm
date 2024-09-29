include 'ASCII/Letters.asm'

proc Graphics.Draw.ASCII.Letters\
     letterDesign, color
    stdcall Graphics.Draw.Shapes.Quadrilateral, [letterDesign], [color]
    ret
endp