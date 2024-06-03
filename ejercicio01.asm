;   Haga un programa en Ensamblador que realice la división de "27/4". 
;   Guarde el resultado obtenido en la dirección de memoria 0200h y si el resultado es mayor que 4, 
;   entonces vuelva a dividir entre 4 y guarde el nuevo resultado en la siguiente dirección de memoria; 
;   que continúe dividiendo entre 4 hasta que el resultado sea menor que 4. Una vez que se cumpla, entonces 
;   mueva la palabra "FIN" a alguna dirección de memoria.
org 100h

section .text
    global _start

_start:
    call cleaning
    mov ax, 27d             ; Load 27 into ax
    mov bx, 4d              ; Load 4 into bx
    div bx                  ; Divide ax by bx, quotient in al, remainder in ah  
    mov byte[0200h], al     ; Store the result in memory address 0200h
    mov si, 1d              ; Set stack index to 1
    cmp al, 4d              ; Check if the quotient is greater than 4
    jg divide_again         ; If it is, jump to divide_again
    int 20h                 ; Exit the program

divide_again:
    div bx                      ; Divide ax by bx, quotient in al, remainder in ah
    mov byte[0200h+si], al      ; Store the result in memory address 0200h + stack index
    inc si                      ; Increment si
    cmp al, 4d                  ; Check if the quotient is greater than 4
    jg divide_again             ; If it is, jump to divide_again
    mov byte[0200h+si], 'F'     ; Otherwise, store 'F' in memory address 0200h+si
    inc si
    mov byte[0200h+si], 'I'     ; Store 'I' in memory address 0200h+si
    inc si
    mov byte[0200h+si], 'N'     ; Store 'N' in memory address 0200h+si
    ret

cleaning:
    xor ax, ax  ; Clear ax
    xor bx, bx  ; Clear bx
    ret         ; Return to the operating system