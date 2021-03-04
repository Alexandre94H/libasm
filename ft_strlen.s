section .text
	global	ft_strlen

incrax:
	inc		rax

loop:
	cmp		byte [rdi + rax], 0
	jne 	incrax
	ret

ft_strlen:
	xor		rax, rax
	jmp		loop
