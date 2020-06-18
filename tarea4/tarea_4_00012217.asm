        org 	100h

section .text
        mov 	dx, msg
        call    texto
        call 	w_strng
        xor 	si, si

lupi:	call 	kb
        mov 	[300h+si], al
        sub     al, 30h
        mov     [200h+si], al
        
        cmp 	si, 04h
        je	    fin

        inc 	si
        jmp 	lupi


texto:	mov 	ah, 00h
        mov	    al, 03h
        int 	10h
        ret


kb: 	mov	    ah, 1h
        int 	21h
        ret


w_strng:mov	    ah, 09h
        int 	21h
        ret


fin:    ; promedio

        mov     ax, [200h]
        add     ax, [201h]
        add     ax, [202h]
        add     ax, [203h]
        add     ax, [204h]
        mov     ah, 00h
        mov     bl, 5d
        div     bl
        
        ; respuesta

        mov     dx, msg1 
        cmp     al, 01h
        je      w_strng

        mov     dx, msg2
        cmp     al, 02h
        je      w_strng
        
        mov     dx, msg3
        cmp     al, 03h
        je      w_strng

        mov     dx, msg4
        cmp     al, 04h
        je      w_strng

        mov     dx, msg5
        cmp     al, 05h
        je      w_strng

        mov     dx, msg6
        cmp     al, 06h
        je      w_strng

        mov     dx, msg7
        cmp     al, 07h
        je      w_strng

        mov     dx, msg8
        cmp     al, 08h
        je      w_strng

        mov     dx, msg9
        cmp     al, 09h
        je      w_strng

        mov     dx, msg10
        cmp     al, 0Ah
        je      w_strng

        ret


section .data
msg 	db  "Carnet: $"
msg1 	db 	0xA, 0xD, "Solo necesito el 0 $"
msg2 	db 	0xA, 0xD, "Aun se pasa $"
msg3 	db 	0xA, 0xD, "Hay salud $"
msg4 	db 	0xA, 0xD, "Me recupero $"
msg5 	db 	0xA, 0xD, "En el segundo $"
msg6 	db 	0xA, 0xD, "Peor es nada $"
msg7 	db 	0xA, 0xD, "Muy bien $"
msg8 	db 	0xA, 0xD, "Colocho $"
msg9 	db 	0xA, 0xD, "Siempre me esfuerzo $"
msg10 	db 	0xA, 0xD, "Perfecto solo Dios $"
