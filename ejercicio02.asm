; org 100h

; section .data
;     ; Declare your data variables here

; section .text
;     global _start

; _start:
;     ; Your code starts here

;     ; Exit the program
;     mov eax, 1
;     xor ebx, ebx
;     int 20h

org 100h

section .data
    result db 0
    end_msg db "FIN", 0

section .text
    global _start

_start:
    ; Perform the division of 27 / 4
    mov eax, 27
    cdq ; Sign extend eax into edx
    mov ebx, 4
    idiv ebx ; Divide edx:eax by ebx, quotient in eax, remainder in edx

    ; Check if the quotient is greater than 4
    cmp eax, 4
    jg divide_again

    ; Store the result in memory address 0200h
    mov byte [0200h], al

    ; Move the end message to a memory address
    mov esi, end_msg
    mov edi, 0300h
    mov ecx, 3
    rep movsb

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 20h

divide_again:
    ; Store the result in the next memory address
    mov byte [0200h], al

    ; Divide the result by 4 again
    mov eax, edx
    xor edx, edx
    idiv ebx

    ; Jump back to check if the new quotient is greater than 4
    jmp _start