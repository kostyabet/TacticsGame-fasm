include 'Draw/Shapes/Rect.asm'
include '../Scripts/Getters.asm'

proc Graphics.DrawRectWithRepeate uses eax ecx edx, \
     pointsLink, borderRadius, bc_color, step, direction, count
    locals
        offsetX  dd  0
        offsetY  dd  0
    endl

    stdcall GetDirectionVal, [direction], [step]
    mov [offsetX], eax
    mov [offsetY], ebx

    .mainBLock:
        mov		ecx, [count]
        mov     ebx, [pointsLink]
        push    dword [ebx] dword [ebx + 4] dword [ebx + 8] dword [ebx + 12]
        .repeate:
            stdcall Graphics.DrawRect, ebx, 0, [bc_color]

            mov 	edx, [offsetY]
            add 	[ebx + 4], edx
            add 	[ebx + 12], edx
            mov 	edx, [offsetX]
            add 	[ebx], edx
            add 	[ebx + 8], edx

            loop	.repeate
        pop		dword [ebx + 12] dword [ebx + 8] dword [ebx + 4] dword [ebx]
    ret
endp    

; return:
;     eax - offsetX
;     ebx - offsetY
proc GetDirectionVal uses ecx,\
     direction, step

    xor     eax, eax
    xor     ebx, ebx
    mov     ecx, [direction]

    cmp     ecx, [REP_DIRECT_LEFT]
    jne     @F
    sub     eax, [step]
    jmp     .exit
@@:
    cmp     ecx, [REP_DIRECT_RIGHT]
    jne     @F
    mov     eax, [step]
    jmp     .exit
@@:
    cmp     ecx, [REP_DIRECT_TOP]
    jne     @F
    sub     ebx, [step]
    jmp     .exit
@@:
    mov     ebx, [step]
.exit:
    ret
endp