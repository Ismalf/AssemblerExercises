;realizar un programa que convierta  de codigo gray de 8 bits a binario
;se usara el algoritmo correspondidente, el bit mas significativo sera el primer digito del
;codigo binario, los siguientes se formaran con la operzcion xor entre el primer bit del binario y 
;el segundo del codigo gray, el resultado sera el segundo digito del binario y asi sucesivamente
;autores: ismael Martinez-Marco espinoza
;Fecha:2/3/2017
;Arquitectura de computadores

data segment
    
   
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax, data
    mov ds, ax
    mov es, ax

    
            
    mov ah, 01
    int 21h
    sub al, 30h
    mov cx, 0007h 
    mov bl, al
    mov dh, al
    recor:
    shl dh, 1
    loop recor
    int 21h
    sub al, 30h
    xor bl, al
    mov dl, bl
    mov cl, 06h
    recor2:
    shl dl, 1
    loop recor2
    or dh, dl
    int 21h
    sub al, 30h
    xor bl, al
    mov dl, bl
    mov cl, 05h
    recor3:
    shl dl, 1
    loop recor3
    or dh, dl
    int 21h
    sub al, 30h
    xor bl, al
    mov dl, bl
    mov cl, 04h
    recor4:
    shl dl, 1
    loop recor4
    or dh, dl
    int 21h
    sub al, 30h
    xor bl, al
    mov dl, bl
    mov cl, 03h
    recor5:
    shl dl, 1
    loop recor5
    or dh, dl
    int 21h
    sub al, 30h
    xor bl, al
    mov dl, bl
    mov cl, 02h
    recor6:
    shl dl, 1
    loop recor6
    or dh, dl 
    int 21h
    sub al, 30h
    xor bl, al
    mov dl, bl
    mov cl, 01h
    recor7:
    shl dl, 1
    loop recor7
    or dh, dl
    int 21h
    sub al, 30h
    xor bl, al
    mov dl, bl
    or dh, dl
    call imprimir
    terminar:
    mov ah, 4ch
    int 21h
    
;==================================================  
imprimir proc near:
        mov dl, 20h
        mov ah, 2
        int 21h 
        mov bh, dh
        mov cl, 07
        rec: 
        shr bx, 1
        loop rec
        add bh, 30h
        mov dl, bh
        mov ah, 2
        int 21h
        mov cl, 07
        mov bh, dh
        shl bx, 1
        rec2:
        shr bh, 1 
        loop rec2
        add bh, 30h
        mov dl, bh
        mov ah, 2
        int 21h
        mov cl, 07 
        mov bh, dh
        shl bx, 1
        shl bx, 1
        rec3:
        shr bh, 1
        loop rec3 
        add bh, 30h
        mov dl, bh
        mov ah, 2
        int 21h
        mov bh, dh
        mov cl, 07
        shl bx, 1
        shl bx, 1
        shl bx, 1
        rec4:
        shr bh, 1
        loop rec4 
        add bh, 30h
        mov dl, bh
        mov ah, 2
        int 21h
        mov bh, dh
        mov cl, 03
        and bh, 0fh
        rec5:
        shr bh, 1
        loop rec5 
        add bh, 30h
        mov dl, bh
        mov ah, 2
        int 21h
        mov bh, dh
        push dx
        mov cl, 03 
        and bh, 0fh
        shl bh, 1
        and bh, 0fh
        rec6:
        shr bh, 1
        loop rec6 
        add bh, 30h
        mov dl, bh
        mov ah, 2
        int 21h
        mov bh, dh
        mov cl, 03
        and bh, 0fh
        shl bx, 1
        shl bx, 1
        and bh, 0fh
        rec7:
        shr bh, 1
        loop rec7 
        add bh, 30h
        mov dl, bh
        mov ah, 2
        int 21h
        mov bh, dh
        mov cl, 03
        and bh, 0fh
        shl bx, 1
        shl bx, 1
        shl bx, 1
        and bh, 0fh
        rec8:
        shr bh, 1
        loop rec8 
        add bh, 30h
        mov dl, bh
        mov ah, 2
        int 21h
        jmp terminar
        ret
    imprimir  endp

ends

end start 
