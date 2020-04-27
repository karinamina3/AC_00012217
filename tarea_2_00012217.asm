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
        MOV [210h + bx], ax
        CMP ax, 0XFF
        JB eje

eje2:   INC bx
        INC bx
        MUL cx
        MOV [210h + bx], ax
        CMP bx, 12d
        JBE eje2


        int 20h
