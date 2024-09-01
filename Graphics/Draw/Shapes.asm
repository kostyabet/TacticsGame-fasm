include 'Shapes/Circle.asm'
include 'Shapes/Quadrilateral.asm'
include 'Shapes/Rect.asm'

proc Graphics.Draw.Shapes uses eax ebx edx,\
     design, color
    locals
        multiplierDots  dd  8
        multiplierDot   dd  4
    endl
    mov     ebx, [design]
    stdcall Graphics.Draw.Shapes.Rect, ebx, [color]
    add     ebx, 164 ; skip rect
    stdcall Graphics.Draw.Shapes.Circle, ebx, [color]
    ret
endp

proc Graphics.Draw.ShapesWithRepeat uses eax ebx edx,\
     design, color, repeat
    locals
        xSum            dd  ?
        ySum            dd  ?
        multiplierDots  dd  8
        multiplierDot   dd  4
    endl
    .prepear:
        mov     edi, [repeat]
        mov     ecx, [edi]
    .repeat:
        push    ecx
        
        mov     ebx, [design]
        stdcall Graphics.Draw.Shapes.Rect, ebx, [color]
        add     ebx, 164 ; skip rect
        stdcall Graphics.Draw.Shapes.Circle, ebx, [color]

        stdcall Scripts.Getters.AddOffsetShapeCoords, [design], [repeat], [xSum], [ySum]
        mov     [xSum], eax
        mov     [ySum], edx

        pop     ecx
        loop    .repeat
    .exit:
        stdcall Scripts.Getters.SubOffsetShapeCoords, [design], [xSum], [ySum]
        ret
endp