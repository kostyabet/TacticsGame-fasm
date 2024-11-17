proc Graphics.File.LoadBoat uses eax ebx ecx edx esi edi,\
    filePath
    locals 
        buffer          dd  0 
        BMPBuffer       dd  0
        BMPBufferSize   dd  0
        h               dd  ?
        w               dd  ?
    endl
    stdcall Graphics.File.GetData, [filePath]
    mov     ebx, eax

    mov     eax, [ebx + BMP.biHeight]
    mov     ecx, [ebx + BMP.biWidth]
    mov     [h], eax
    mov     [w], ecx
    xor     edx, edx
    mul     ecx ; площадь

    xor     edx, edx
    mov     ecx, 3
    mul     ecx ; to rgb

    mov     [BMPBufferSize], eax
    malloc  eax

    mov     [BMPBuffer], eax

    mov     eax, [ebx + BMP.bfOffBits]
    add     ebx, eax

    memcpy  [BMPBuffer], ebx, [BMPBufferSize]
    
    mov     [boat_bmp.biAddress], eax
    mov     eax, [h]
    xchg    [boat_bmp.biHeight], eax
    mov     eax, [w]
    xchg    [boat_bmp.biWidth], eax
    ret
endp

proc Graphics.File.GetData uses ebx edi,\
    filePath
    locals
        hFile       dd  ?
        length      dd  ?
        read        dd  ?
        pBuffer     dd  ?
    endl
    xor     ebx, ebx
    invoke  CreateFile, [filePath], GENERIC_READ, ebx, ebx, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, ebx
    mov     [hFile], eax
    invoke  GetFileSize, [hFile], ebx
    inc     eax
    mov     [length], eax
    ;malloc 1, 8
    invoke  HeapAlloc, [hHeap], 8, [length]
    mov     [pBuffer], eax
    lea     edi, [read]
    invoke  ReadFile, [hFile], [pBuffer], [length], edi, ebx
    invoke  CloseHandle, [hFile]
    mov     eax, [pBuffer]
    ret
endp