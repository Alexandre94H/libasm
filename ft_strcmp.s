section .text
	global	ft_strcmp

ft_strcmp:
	xor		rbx, rbx
	jmp		loop

return:
	xor 	al, al
	add 	al, byte[rdi + rbx]
	sub 	al, byte[rsi + rbx]
	movsx	rax, al
	ret

incrbx:
	inc		rbx

loop:
	cmp		byte [rdi + rbx], 0
	je		return
	mov		al, byte [rsi + rbx]
	cmp		byte [rdi + rbx], al
	je		incrbx
	jmp		return
