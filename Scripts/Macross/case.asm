macro case label, [value]
{
    cmp     eax, value
    je      label
}