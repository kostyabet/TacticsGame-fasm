macro memcpy dest, src, count
{
    mov     esi, src
    mov     edi, dest
    mov     ecx, count
    rep     movsb
}
