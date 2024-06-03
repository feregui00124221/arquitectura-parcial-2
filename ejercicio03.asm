org 100h

section .text
    global _start

_start:
    ; Set video mode to text mode
    mov ah, 00h
    mov al, 03h
    int 10h

    ; Set font color to blue and background color to magenta
    mov ah, 09h
    mov al, 0001 ; Blue font color
    mov bl, 0101 ; Magenta background color
    mov cx, 07h ; Attribute byte (font color + background color)
    int 10h

    ; Print "Hello" at the top of the screen
    mov ah, 0x09
    mov dx, "h"
    int 0x21

    ; ; Print "Name" in the center of the screen
    ; mov ah, 0x02
    ; mov dl, 0x40 ; Column position (center of the screen)
    ; mov dh, 0x0B ; Row position (11th row)
    ; mov edx, name
    ; int 0x21

    ; ; Print "Last name" at the bottom of the screen
    ; mov ah, 0x02
    ; mov dl, 0x00 ; Column position (leftmost column)
    ; mov dh, 0x18 ; Row position (24th row)
    ; mov edx, last_name
    ; int 0x21

    ; Exit the program
    int 20h