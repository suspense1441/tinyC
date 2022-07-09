	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"###################################################################################\n"
.LC1:
	.string	"CALCULATING a^b USING RECURSIVE FUNCTION:\n"
.LC2:
	.string	"Enter the BASE     : "
.LC3:
	.string	"Enter the EXPONENT : "
.LC4:
	.string	"The value of "
.LC5:
	.string	"^"
.LC6:
	.string	" is : "
.LC7:
	.string	"\n"
.LC8:
	.string	"###################################################################################\n"
	.text	
	.globl	pow
	.type	pow, @function
pow: 
.LFB0:
	.cfi_startproc
	pushq 	%rbp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movq 	%rsp, %rbp
	.cfi_def_cfa_register 5
	subq	$80, %rsp
	movq	%rdi, -20(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, %eax
	movl 	%eax, -28(%rbp)
	movl	-16(%rbp), %eax
	cmpl	-28(%rbp), %eax
	je .L2
	jmp .L3
	jmp .L6
.L2: 
	movl	$1, %eax
	movl 	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	movl 	%eax, -24(%rbp)
	jmp .L6
.L3: 
	movl	$1, %eax
	movl 	%eax, -40(%rbp)
	movl	-16(%rbp), %eax
	cmpl	-40(%rbp), %eax
	je .L4
	jmp .L5
	jmp .L6
.L4: 
	movl	-20(%rbp), %eax
	movl 	%eax, -24(%rbp)
	jmp .L6
.L5: 
	movl	$1, %eax
	movl 	%eax, -52(%rbp)
	movl 	-16(%rbp), %eax
	movl 	-52(%rbp), %edx
	subl 	%edx, %eax
	movl 	%eax, -56(%rbp)
	movl 	-20(%rbp), %eax
	movq 	-20(%rbp), %rdi
movl 	-56(%rbp), %eax
	movq 	-56(%rbp), %rsi
	call	pow
	movl	%eax, -60(%rbp)
	movl 	-20(%rbp), %eax
	imull 	-60(%rbp), %eax
	movl 	%eax, -64(%rbp)
	movl	-64(%rbp), %eax
	movl 	%eax, -24(%rbp)
.L6: 
	movl	-24(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	pow, .-pow
	.globl	main
	.type	main, @function
main: 
.LFB1:
	.cfi_startproc
	pushq 	%rbp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movq 	%rsp, %rbp
	.cfi_def_cfa_register 5
	subq	$176, %rsp

	movl	$5, %eax
	movl 	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	movl 	%eax, -28(%rbp)
	leaq	-36(%rbp), %rax
	movq 	%rax, -44(%rbp)
	movl	-44(%rbp), %eax
	movl 	%eax, -40(%rbp)
	movq 	$.LC0, -52(%rbp)
	movl 	-52(%rbp), %eax
	movq 	-52(%rbp), %rdi
	call	printStr
	movl	%eax, -56(%rbp)
	movq 	$.LC1, -60(%rbp)
	movl 	-60(%rbp), %eax
	movq 	-60(%rbp), %rdi
	call	printStr
	movl	%eax, -64(%rbp)
	movq 	$.LC2, -68(%rbp)
	movl 	-68(%rbp), %eax
	movq 	-68(%rbp), %rdi
	call	printStr
	movl	%eax, -72(%rbp)
	movl 	-40(%rbp), %eax
	movq 	-40(%rbp), %rdi
	call	readInt
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	movl 	%eax, -24(%rbp)
	movq 	$.LC3, -88(%rbp)
	movl 	-88(%rbp), %eax
	movq 	-88(%rbp), %rdi
	call	printStr
	movl	%eax, -92(%rbp)
	movl 	-40(%rbp), %eax
	movq 	-40(%rbp), %rdi
	call	readInt
	movl	%eax, -96(%rbp)
	movl	-96(%rbp), %eax
	movl 	%eax, -28(%rbp)
	movl 	-24(%rbp), %eax
	movq 	-24(%rbp), %rdi
movl 	-28(%rbp), %eax
	movq 	-28(%rbp), %rsi
	call	pow
	movl	%eax, -108(%rbp)
	movl	-108(%rbp), %eax
	movl 	%eax, -36(%rbp)
	movq 	$.LC4, -116(%rbp)
	movl 	-116(%rbp), %eax
	movq 	-116(%rbp), %rdi
	call	printStr
	movl	%eax, -120(%rbp)
	movl 	-24(%rbp), %eax
	movq 	-24(%rbp), %rdi
	call	printInt
	movl	%eax, -128(%rbp)
	movq 	$.LC5, -132(%rbp)
	movl 	-132(%rbp), %eax
	movq 	-132(%rbp), %rdi
	call	printStr
	movl	%eax, -136(%rbp)
	movl 	-28(%rbp), %eax
	movq 	-28(%rbp), %rdi
	call	printInt
	movl	%eax, -140(%rbp)
	movq 	$.LC6, -144(%rbp)
	movl 	-144(%rbp), %eax
	movq 	-144(%rbp), %rdi
	call	printStr
	movl	%eax, -148(%rbp)
	movl 	-36(%rbp), %eax
	movq 	-36(%rbp), %rdi
	call	printInt
	movl	%eax, -152(%rbp)
	movq 	$.LC7, -156(%rbp)
	movl 	-156(%rbp), %eax
	movq 	-156(%rbp), %rdi
	call	printStr
	movl	%eax, -160(%rbp)
	movq 	$.LC8, -164(%rbp)
	movl 	-164(%rbp), %eax
	movq 	-164(%rbp), %rdi
	call	printStr
	movl	%eax, -168(%rbp)
	movl	$0, %eax
	movl 	%eax, -172(%rbp)
	movl	-172(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident		"Compiled by 18CS10069"
	.section	.note.GNU-stack,"",@progbits
