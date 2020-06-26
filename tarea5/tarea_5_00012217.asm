	org 	100h

section .text
	call 	grafico

	xor 	si, si
	xor 	di, di

	; Letra K
	; mov 	si, 25d
	; mov 	di, 25d
	; mov	bp, 45d
	; call 	linea_h

	; mov	si, 25d
	; mov 	di, 25d
	; mov	bp, 175d
	; call 	linea_v

	; mov 	si, 25d
	; mov 	di, 175d
	; mov	bp, 45d
	; call 	linea_h

	; mov	si, 45d
	; mov 	di, 25d
	; mov	bp, 85d
	; call 	linea_v

	; mov	si, 45d
	; mov 	di, 115d
	; mov	bp, 175d
	; call 	linea_v

	; mov 	si, 105d
	; mov 	di, 25d
	; mov	bp, 125d
	; call 	linea_h

	; mov 	si, 105d
	; mov 	di, 175d
	; mov	bp, 125d
	; call 	linea_h

	; Letra d
	mov	si, 25d
	mov 	di, 115d
	mov	bp, 175d
	call 	linea_v

	mov	si, 25d
	mov 	di, 115d
	mov	bp, 65d
	call 	linea_h

	mov	si, 25d
	mov 	di, 175d
	mov	bp, 65d
	call 	linea_h

	mov	si, 65d
	mov 	di, 175d
	mov	bp, 180d
	call 	linea_v

	mov	si, 65d
	mov 	di, 180d
	mov	bp, 85d
	call 	linea_h

	mov	si, 85d
	mov 	di, 25d
	mov	bp, 180d
	call 	linea_v

	mov	si, 65d
	mov 	di, 25d
	mov	bp, 85d
	call 	linea_h

	mov	si, 65d
	mov 	di, 25d
	mov	bp, 115d
	call 	linea_v

	mov	si, 45d
	mov 	di, 135d
	mov	bp, 65d
	call 	linea_h

	mov	si, 45d
	mov 	di, 135d
	mov	bp, 155d
	call 	linea_v

	mov	si, 45d
	mov 	di, 155d
	mov	bp, 65d
	call 	linea_h

	mov	si, 65d
	mov 	di, 135d
	mov	bp, 155d
	call 	linea_v


	; Detener ejecución
	call 	kb
	int 	20h


grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret


kb: 	mov	ah, 00h
	int 	16h
	ret


pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret


; Parámetros : si -> X1 : di -> Y : bp -> X2
linea_h:
lupi_h:	mov 	cx, 0d
	add 	cx, si
	mov	dx, di
	call 	pixel
	inc 	si
	cmp 	si, bp
	jne 	lupi_h
	ret


; Parámetros : si -> X : di -> Y : bp -> Y2
linea_v:
lupi_v:	mov 	cx, si
	mov	dx, 0d
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, bp
	jne 	lupi_v
	ret
