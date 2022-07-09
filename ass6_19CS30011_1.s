	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"##################################################################################################################\n"
.LC1:
	.string	"This Program implements LCM\n"
.LC2:
	.string	"Enter 2 Integers to Find the GCD: \n"
.LC3:
	.string	"GCD of given numbers is: "
.LC4:
	.string	"\n"
.LC5:
	.string	"##################################################################################################################\n"
	.text	
	.globl	gcd
	.type	gcd, @function
gcd: 
.LFB0:
	.cfi_startproc
	pushq 	%rbp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movq 	%rsp, %rbp
	.cfi_def_cfa_register 5
	subq	$88, %rsp
	movq	%rdi, -20(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, %eax
	movl 	%eax, -36(%rbp)
	movl	-16(%rbp), %eax
	cmpl	-36(%rbp), %eax
	je .L2
	jmp .L3
	jmp .L4
.L2: 
	movl	-20(%rbp), %eax
	movl 	%eax, -24(%rbp)
	jmp .L4
.L3: 
	movl	-20(%rbp), %eax
	movl 	%eax, -28(%rbp)
	movl	-16(%rbp), %eax
	movl 	%eax, -32(%rbp)
	movl 	-20(%rbp), %eax
	cltd
	idivl 	-16(%rbp)
	movl 	%eax, -52(%rbp)
	movl 	-16(%rbp), %eax
	imull 	-52(%rbp), %eax
	movl 	%eax, -56(%rbp)
	movl 	-20(%rbp), %eax
	movl 	-56(%rbp), %edx
	subl 	%edx, %eax
	movl 	%eax, -60(%rbp)
	movl	-60(%rbp), %eax
	movl 	%eax, -28(%rbp)
	movl 	-16(%rbp), %eax
	movq 	-16(%rbp), %rdi
movl 	-28(%rbp), %eax
	movq 	-28(%rbp), %rsi
	call	gcd
	movl	%eax, -72(%rbp)
	movl	-72(%rbp), %eax
	movl 	%eax, -24(%rbp)
.L4: 
	movl	-24(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	gcd, .-gcd
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
	subq	$152, %rsp

	movq 	$.LC0, -28(%rbp)
	movl 	-28(%rbp), %eax
	movq 	-28(%rbp), %rdi
	call	printStr
	movl	%eax, -32(%rbp)
	movl	$1, %eax
	movl 	%eax, -56(%rbp)
	movl	-56(%rbp), %eax
	movl 	%eax, -52(%rbp)
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
	leaq	-52(%rbp), %rax
	movq 	%rax, -80(%rbp)
	movl 	-80(%rbp), %eax
	movq 	-80(%rbp), %rdi
	call	readInt
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	movl 	%eax, -40(%rbp)
	leaq	-52(%rbp), %rax
	movq 	%rax, -92(%rbp)
	movl 	-92(%rbp), %eax
	movq 	-92(%rbp), %rdi
	call	readInt
	movl	%eax, -96(%rbp)
	movl	-96(%rbp), %eax
	movl 	%eax, -44(%rbp)
	movl 	-40(%rbp), %eax
	movq 	-40(%rbp), %rdi
movl 	-44(%rbp), %eax
	movq 	-44(%rbp), %rsi
	call	gcd
	movl	%eax, -108(%rbp)
	movl	-108(%rbp), %eax
	movl 	%eax, -48(%rbp)
	movq 	$.LC3, -116(%rbp)
	movl 	-116(%rbp), %eax
	movq 	-116(%rbp), %rdi
	call	printStr
	movl	%eax, -120(%rbp)
	movl 	-48(%rbp), %eax
	movq 	-48(%rbp), %rdi
	call	printInt
	movl	%eax, -128(%rbp)
	movq 	$.LC4, -132(%rbp)
	movl 	-132(%rbp), %eax
	movq 	-132(%rbp), %rdi
	call	printStr
	movl	%eax, -136(%rbp)
	movq 	$.LC5, -140(%rbp)
	movl 	-140(%rbp), %eax
	movq 	-140(%rbp), %rdi
	call	printStr
	movl	%eax, -144(%rbp)
	movl	$0, %eax
	movl 	%eax, -148(%rbp)
	movl	-148(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident		"Compiled by 18CS10069"
	.section	.note.GNU-stack,"",@progbits
