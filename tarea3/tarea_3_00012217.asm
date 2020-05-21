	org 	100h

; ------------- MAIN
section .text
	call 	texto
	call 	cursor
	call 	phrase
	call	kbwait

	int 	20h


texto:	mov 	ah, 00h		; INT 10h / 00h: Iniciar modo
	mov	al, 03h		; Modo texto: 80 columnas x 25 filas, 16 colores, 8 páginas
	int 	10h
	ret


cursor: mov	ah, 01h		; INT 10h / 01h: Forma del cursor
	mov 	ch, 00000000b   ; Cursor superior IRGB
	mov 	cl, 00001110b   ; Cursor inferior IRGB
	int 	10h
	ret


w_char:	mov 	ah, 09h		; INT 10h / 09h: Escribir un carácter
	mov 	al, cl		; Carácter
	mov 	bh, 0h		; Número de página (0 hasta 7)
	mov 	bl, 00001111b	; Atributo
	mov 	cx, 1h		; Número de veces
	int 	10h
	ret


kbwait: mov 	ax, 0000h	; Detener programa
	int 	16h
	ret


m_cursr:mov 	ah, 02h		; INT 10h / 02h: Establecer la posición del cursor
	mov 	dx, di		; Columna
	add     dl, al		; Offset
	mov 	dh, bh		; Fila
	mov 	bh, 0h		; Número de página (0 hasta 7)
	int 	10h
	ret


phrase:	
	mov 	di, 0d		
lupi1:	mov 	cl, [msg1+di]	; Carácter
	mov 	al, 35d		; Columna
	mov     bh, 5d		; Fila
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	lupi1

	mov 	di, 0d
lupi2:	mov 	cl, [msg2+di]	; Carácter
	mov 	al, 25d		; Columna
	mov     bh, 10d		; Fila
        call    m_cursr
        call 	w_char
        inc	di
        cmp 	di, len2
        jb	lupi2
        
        mov 	di, 0d
lupi3:	mov 	cl, [msg3+di]	; Carácter
	mov 	al, 15d		; Columna
	mov     bh, 15d		; Fila
        call    m_cursr
        call 	w_char
        inc	di
        cmp 	di, len3
        jb	lupi3
	
        ret


section	.data1
msg1	db	"corona virus, corona virus"	; length: 26
len1 	equ	$-msg1

section .data2
msg2	db 	"lavense las manos"		; length: 17
len2 	equ	$-msg2

section .data3
msg3	db 	"haganlo seguido  "		; length: 15
len3 	equ	$-msg3
