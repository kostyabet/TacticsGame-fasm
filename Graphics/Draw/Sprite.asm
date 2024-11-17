include 'Shapes/Sprite.asm'

proc Graphics.Draw.Sprite,\
    texture, design
    stdcall Graphics.Draw.Shapes.Sprite, [texture], [design]

    ret
endp