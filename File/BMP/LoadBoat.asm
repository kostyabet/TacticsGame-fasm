proc Texture.Create,\
    textureRes, textPath
    locals
        temp    dd      0 
        texture GLuint  0  
    endl

    lea    eax, [texture]
    invoke glGenTextures, 1, eax
    invoke glBindTexture, GL_TEXTURE_2D, [texture]
    
    stdcall BMP.LoadFromFile, [textPath]
    mov [temp], eax

        invoke glTexImage2D, GL_TEXTURE_2D, 0, GL_RGB, edx, ecx, 0, GL_BGR, GL_UNSIGNED_BYTE, eax

        invoke glTexParameteri, GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP
        invoke glTexParameteri, GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP
        invoke glTexParameteri, GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST
        invoke glTexParameteri, GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST

        
    
    invoke HeapFree, [hHeap], 0, [temp]
    invoke glBindTexture, GL_TEXTURE_2D, 0
    mov     eax, [texture]
    mov     ebx, [textureRes]
    mov     [ebx], eax
    ret
endp
proc BMP.LoadFromFile uses edi esi ebx,\
            fileName
    locals 
        buffer dd 0 
        BMPBuffer dd 0
        BMPBufferSize dd 0
        h dd ?
        w dd ?
    endl
    
    stdcall File.LoadContent, [fileName]
    mov ebx, eax

    mov eax, [ebx + BMP.biHeight]
    mov ecx, [ebx + BMP.biWidth]
    mov [h], eax
    mov [w], ecx
    xor edx, edx
    mul ecx

    xor edx, edx
    mov ecx, 3
    mul ecx

    mov [BMPBufferSize], eax

    malloc eax

    mov [BMPBuffer], eax

    mov eax, [ebx + BMP.bfOffBits]
    add ebx, eax

    memcpy [BMPBuffer], ebx, [BMPBufferSize]

    mov eax, [BMPBuffer]
    mov ecx, [h]
    mov edx, [w]
    ret
endp

proc File.LoadContent uses edi,\
     fileName;, fileLength

        locals
                hFile   dd      ?
                length  dd      ?
                read    dd      ?
                pBuffer dd      ?
        endl

        invoke  CreateFile, [fileName], GENERIC_READ, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0
        mov     [hFile], eax

        invoke  GetFileSize, [hFile], 0
        inc     eax
        mov     [length], eax
        ;malloc 1, 8
        invoke  HeapAlloc, [hHeap], 8, [length]
        mov     [pBuffer], eax

        lea     edi, [read]
        invoke  ReadFile, [hFile], [pBuffer], [length], edi, 0

        invoke  CloseHandle, [hFile]

        mov     eax, [pBuffer]
       
        ret
endp

testM db '1', 0