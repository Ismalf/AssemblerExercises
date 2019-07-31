;Realizar un programa que convierta un numero binario de 8 bits a codigo gray
;tras ingresar el numero se lo desplazara un bit a la derecha y se compara(xor) bit a bit 
;con el original el resultado de la comparacion es el correspondiente codigo gray
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

    
    MOV BH, 00
    MOV CX, 0008 
    lectura:
    push cx
    MOV AH, 1
    INT 21h
    CMP AL, 30
    JZ terminar
    CMP AL, 31
    JZ terminar
    SUB AL, 30h
    MOV DH, AL                                            
    
    
    CALL MOVER
    pop cx
    LOOP lectura 
    grey:
    MOV DL, BH
    SHR DL, 1
    XOR BH, DL 
    MOV AH, 2
    mov dl, 20h
    INT 21h
    call imprimir
    
    terminar:
    MOV AH, 4Ch
    INT 21h       
;==============================================
    MOVER PROC near:
        cmp cx, 1
        jz ot 
        sub cx, 1
        
        rotar:
        SHL DH, 1 
        LOOP rotar  
        
        op:
        OR DH, BH
        MOV BH, DH 
        jmp re
        ot:
        
        jmp op
        re:
        RET
    MOVER ENDP
;============================================    
    imprimir proc near:
        mov dl, bh
        push dx
        mov cl, 07
        rec: 
        shr bx, 1
        loop rec
        add bh, 30h
        mov dl, bh
        mov ah, 2
        int 21h
        mov cl, 07
        pop dx
        mov bh, dl
        mov dl, bh
        push dx
        shl bx, 1
        rec2:
        shr bh, 1 
        loop rec2
        add bh, 30h
        mov dl, bh
        mov ah, 2
        int 21h
        mov cl, 07 
        pop dx
        mov bh, dl
        mov dl, bh
        push dx
        shl bx, 1
        shl bx, 1
        rec3:
        shr bh, 1
        loop rec3 
        add bh, 30h
        mov dl, bh
        mov ah, 2
        int 21h
        pop dx
        mov bh, dl
        mov dl, bh
        push dx
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
        pop dx
        mov bh, dl
        mov dl, bh
        push dx
        mov cl, 03
        
        and bh, 0fh
        rec5:
        shr bh, 1
        loop rec5 
        add bh, 30h
        mov dl, bh
        mov ah, 2
        int 21h
        pop dx
        mov bh, dl
        mov dl, bh
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
        pop dx
        mov bh, dl
        mov dl, bh
        push dx
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
        pop dx
        mov bh, dl
        mov dl, bh
        push dx
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
        pop bx
        
        ret 
     imprimir endp 
;============================================    
    
        
ends

end start 
