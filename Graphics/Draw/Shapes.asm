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
        multiplierDots  dd  8
        multiplierDot   dd  4
    endl
    mov     ebx, [repeat]
    mov     ecx, [ebx]
    .repeat:
        push    ecx
        mov     ebx, [design]
        stdcall Graphics.Draw.Shapes.Rect, ebx, [color]
        add     ebx, 164 ; skip rect
        stdcall Graphics.Draw.Shapes.Circle, ebx, [color]
        pop     ecx
        loop    .repeat
    ret
endp