;   Haga un programa en ensamblador donde el usuario ingrese 2 números para almacenarlos 
;   en una dirección de memoria para cada uno, además en otra dirección de memoria se debe 
;   guardar un número que puede ser 1.0 o 2.0. Si el usuario ingresa 1.0 se realizará: 
;   división del primer número/ segundo número y el resultado se debe almacenar a partir de la 
;   dirección 230h. Pero si el usuario ingresa 2.0 se realizará la suma de ambos números y el 
;   resultado se almacenará a partir de la dirección 240h. Si el usuario ingresa un número 
;   diferente de 1 o 2 entonces que coloque en la dirección de memoria 250 en adelante el mensaje 
;   opción incorrecta.

ORG 100H 

section .text
    global _start

_start:
    ; AVISO: IMPORTANTE LEER
    ; Para ingresar los números, debe ingresar los siguientes comandos, y cuando se le presente la 
    ; pantalla de ingreso, debe digitar los números y presionar la tecla ENTER:
    ; Numero 1: "e200"
    ; Numero 2: "e210"
    ; Numero 3 (solamente 1.0 o 2.0 deben ser ingresados): "e220"
    ; Para verificar el ingreso correcto de sus numeros, puede imprimirlos con el comando "d200".

    CMP byte [0220h], 1d
    JE division
    CMP byte [0220h], 2d
    JE suma
    CALL otherwise
    
    INT 20H

division:
    FLD dword [0200h]
    FLD dword [0210h]
    FDIV
    FSTP dword [0230h]
    INT 20H

suma:
    FLD dword [0200h]
    FLD dword [0210h]
    FADD
    FSTP dword [0240h]
    INT 20H

otherwise:
    mov si, 0d
    mov byte [si + 0250h], 'O'
    inc si
    mov byte [si + 0250h], 'p'
    inc si
    mov byte [si + 0250h], 'c'
    inc si
    mov byte [si + 0250h], 'i'
    inc si
    mov byte [si + 0250h], 'o'
    inc si
    mov byte [si + 0250h], 'n'
    inc si
    mov byte [si + 0250h], ' '
    inc si
    mov byte [si + 0250h], 'i'
    inc si
    mov byte [si + 0250h], 'n'
    inc si
    mov byte [si + 0250h], 'c'
    inc si
    mov byte [si + 0250h], 'o'
    inc si
    mov byte [si + 0250h], 'r'
    inc si
    mov byte [si + 0250h], 'r'
    inc si
    mov byte [si + 0250h], 'e'
    inc si
    mov byte [si + 0250h], 'c'
    inc si
    mov byte [si + 0250h], 't'
    inc si
    mov byte [si + 0250h], 'a'
    int 20h