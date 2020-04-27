        org 100h

; -- Ejercicio 1
; Últimos 5 dígitos de mi carnet: 1 2 2 1 7
; Promedio: 2.6, aprox 2 - Comentario: 'Aún se pasa'

section .text 
        MOV di, 0d
        MOV cx, [length]

eje1:   MOV bl, [commentary+di]
        MOV [di+200h], bl
        INC di
        LOOP eje1

section .data
        commentary db  'Aun se pasa' 
        length  equ $-commentary


; -- Ejercicio 2: Bayib Nukele

        MOV ax, 0000h
        MOV bx, 0000h
        MOV cx, 0000h
        MOV cx, 2d
        MOV ax, 4d
        MOV bx, 0h
        MOV [210h], ax

eje:    INC bx
        MUL cx
        MOV [210h+bx], ax
        CMP ax, 0XFF
        JB eje

eje2:   INC bx
        MUL cx
        MOV [210h+bx], ax
        CMP bx, 12d
        JBE eje2


; -- Ejercicio 3: Sucesión de Fibonacci

        MOV dl, 0d
        MOV [220h], dl
        MOV dl, 1d
        MOV [221h], dl
        MOV bx, 1d

eje3:   INC bx
        MOV ax, [220h+bx-1]
        MOV cx, [220h+bx-2]
        ADD ax, cx
        MOV [220h+bx], ax
        CMP bx, 14d
        JB eje3


        int 20h
