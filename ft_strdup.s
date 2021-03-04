section .text
	global	ft_strdup
	extern	ft_strlen
	extern	malloc
	extern	ft_strcpy

ft_strdup:
	mov		rbx, rdi
	call	ft_strlen
	mov		r12, rax
	inc		rax
	mov		rdi, rax
	call	malloc
	mov		byte [rax + r12], 0
	mov		rdi, rax
	mov		rsi, rbx
	call	ft_strcpy
	ret
