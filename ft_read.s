section .text
	global	ft_read

ft_read:
	mov		rax, 0
	syscall
	je		error
	ret

error:
	mov		rax, -1
	ret
