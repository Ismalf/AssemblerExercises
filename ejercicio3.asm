;Rezlizar un programa que simule el ingreso con 
;usuario y contrasenia como UNIX
;Se permitiran 3 intentos antes de que se bloquee el sistema
;si ingresa credenciales correctas mostrara un mensaje
;que diga bienvenid@ al sistema
;caso contrario mostrar usuario o contrasenia incorrecta
;autores: Ismael Martinez
;Fecha:2/3/2017
;Arquitectura de computadores

data segment
    
    intento db 0ah, 0dh, "Para ingresar nuevamente sus credenciales presione ENTER$",0ah,0dh
    bloqueado db 0ah, 0dh, "El sistema ha sido bloqueado$",0ah,0dh
    msus db 0ah,0dh,"Por favor ingrese el usuario",0ah,0dh,'$'
    mscon db 0ah,0dh,"Por favor ingrese su clave secreta",0ah,0dh,'$'
    accom db 0ah,0dh,"Bienvenid@ al sistema",0ah,0dh,'$'
    den db 0ah,0dh,"Usuario o clave incorrecta",0ah,0dh,'$'
    usuario label byte 
    maximus db 31
    us db ?
    cadena db 31 dup('$') 
    us1 db 'antonio gomez gomez%a23$'
    us2 db 'luisa aloso lopez%a1sa3$'
    us3 db 'fernando perez minguez%2w45$'
    us4 db 'josea ruiz sanchez%asq12$'
    us5 db 'miguel garcia garcia%1a$'
ends

stack segment
    dw   128  dup(0)
ends

code segment
    
start:

    mov ax, data
    mov ds, ax
    mov es, ax
    mov bl, 3
    prok:
    cmp bl, 0
    je bloq
    mov dx, offset msus 
    mov ah, 09
    int 21h
    mov si, 00 
    leerus:
    mov ax, 0000
    mov ah, 01h
    int 21h
    cmp al, 0dh
    jz bypass    
    mov cadena[si], al
    inc si
    jmp leerus
    bypass:
    mov cadena[si], '%'
    inc si
    mov ah, 09
    mov dx, offset mscon
    int 21h
    leercon:
    mov ax, 0000
    mov ah, 07h
    int 21h
    cmp al, 0dh
    jz bypass2
    push ax
    mov ah, 02
    mov dx, '*'
    int 21h
    pop ax
    mov cadena[si], al
    inc si
    jmp leercon
    bypass2:
    mov cadena[si], '$'
    inc si
    lea di, us1
    ;mov ah, 09
    ;lea dx, cadena
    ;int 21h
    ;int 21h
    ;mov dx, di
    ;int 21h
    mov cx, si
    push cx
    lea si, cadena 
    lea di, us1
    repe cmpsb           
    je exito
    pop cx
    push cx
    lea si, cadena 
    lea di, us2
    repe cmpsb           
    je exito
    pop cx
    push cx
    lea si, cadena 
    lea di, us3
    repe cmpsb           
    je exito
    pop cx
    push cx
    lea si, cadena 
    lea di, us4
    repe cmpsb           
    je exito
    pop cx
    push cx
    lea si, cadena 
    lea di, us5
    repe cmpsb           
    je exito
    pop cx
    
    fallo:
    sub bl, 1
    mov dx, offset den
    mov ah, 09
    int 21h
    mov dx, offset intento
    int 21h
    mov ah, 01
    int 21h
    cmp al, 0dh
    je  prok
    jmp terminar
    exito:
    mov dx, offset accom
    mov ah, 09
    int 21h
    jmp terminar
    bloq:
    mov dx, offset bloqueado
    mov ah, 09
    int 21h
    terminar:
    mov ax, 4c00h 
    int 21h    
ends

end start 
