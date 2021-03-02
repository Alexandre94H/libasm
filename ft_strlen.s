section .text
	global	_ft_strlen

ft_strlen:
	mov	rax, 1
	jmp	loop

loop:
	cmp	BYTE [rdi + rax], 0
	je return
	inc	rax
	jmp loop

return:
	ret