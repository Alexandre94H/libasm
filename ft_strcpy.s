section .text
	global	ft_strcpy

return:
	mov		rax, rdi
	ret

ft_strcpy:
	xor		rbx, rbx

loop:
	mov		al, byte [rsi + rbx]
	mov		byte [rdi + rbx], al
	cmp		byte [rsi + rbx], 0
	je		return
	inc		rbx
	jmp		loop
