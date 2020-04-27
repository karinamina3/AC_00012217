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


        int 20h
