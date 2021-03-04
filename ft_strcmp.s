section .text
	global	ft_strcmp

ft_strcmp:
	cmp		byte [rdi], 0
	je		return
	cmpsb
	je		ft_strcmp
	dec		rdi
	dec		rsi


return:
	movzx	rax, byte [rdi]
	movzx	rbx, byte [rsi]
	sub		rax, rbx
	ret