	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"##################################################################################################################\n"
.LC1:
	.string	"Program to compute fibonacci number\n"
.LC2:
	.string	"Enter a Number: "
.LC3:
	.string	"\nNth fibonacci number is: "
.LC4:
	.string	"\n"
.LC5:
	.string	"##################################################################################################################\n"
	.text	
	.globl	fib
	.type	fib, @function
fib: 
.LFB0:
	.cfi_startproc
	pushq 	%rbp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movq 	%rsp, %rbp
	.cfi_def_cfa_register 5
	subq	$100, %rsp
	movq	%rdi, -20(%rbp)
	movl	$1, %eax
	movl 	%eax, -28(%rbp)
	movl 	-20(%rbp), %eax
	movl 	-28(%rbp), %edx
	subl 	%edx, %eax
	movl 	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	movl 	%eax, -24(%rbp)
	movl	$0, %eax
	movl 	%eax, -44(%rbp)
	movl	-24(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jle .L2
	jmp .L3
	jmp .L4
.L2: 
	movl	$1, %eax
	movl 	%eax, -48(%rbp)
	movl	-48(%rbp), %eax
	movl 	%eax, -36(%rbp)
	jmp .L4
.L3: 
	movl 	-24(%rbp), %eax
	movq 	-24(%rbp), %rdi
	call	fib
	movl	%eax, -60(%rbp)
	movl	-60(%rbp), %eax
	movl 	%eax, -36(%rbp)
	movl	$1, %eax
	movl 	%eax, -68(%rbp)
	movl 	-24(%rbp), %eax
	movl 	-68(%rbp), %edx
	subl 	%edx, %eax
	movl 	%eax, -72(%rbp)
	movl	-72(%rbp), %eax
	movl 	%eax, -24(%rbp)
	movl 	-24(%rbp), %eax
	movq 	-24(%rbp), %rdi
	call	fib
	movl	%eax, -80(%rbp)
	movl	-80(%rbp), %eax
	movl 	%eax, -40(%rbp)
	movl 	-36(%rbp), %eax
	movl 	-40(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -88(%rbp)
	movl	-88(%rbp), %eax
	movl 	%eax, -36(%rbp)
.L4: 
	movl	-36(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	fib, .-fib
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
	subq	$132, %rsp

	movq 	$.LC0, -28(%rbp)
	movl 	-28(%rbp), %eax
	movq 	-28(%rbp), %rdi
	call	printStr
	movl	%eax, -32(%rbp)
	movl	$1, %eax
	movl 	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	movl 	%eax, -40(%rbp)
	movq 	$.LC1, -48(%rbp)
	movl 	-48(%rbp), %eax
	movq 	-48(%rbp), %rdi
	call	printStr
	movl	%eax, -52(%rbp)
	movq 	$.LC2, -56(%rbp)
	movl 	-56(%rbp), %eax
	movq 	-56(%rbp), %rdi
	call	printStr
	movl	%eax, -60(%rbp)
	leaq	-40(%rbp), %rax
	movq 	%rax, -68(%rbp)
	movl 	-68(%rbp), %eax
	movq 	-68(%rbp), %rdi
	call	readInt
	movl	%eax, -72(%rbp)
	movl	-72(%rbp), %eax
	movl 	%eax, -36(%rbp)
	movq 	$.LC3, -80(%rbp)
	movl 	-80(%rbp), %eax
	movq 	-80(%rbp), %rdi
	call	printStr
	movl	%eax, -84(%rbp)
	movl 	-36(%rbp), %eax
	movq 	-36(%rbp), %rdi
	call	fib
	movl	%eax, -96(%rbp)
	movl	-96(%rbp), %eax
	movl 	%eax, -88(%rbp)
	movl 	-88(%rbp), %eax
	movq 	-88(%rbp), %rdi
	call	printInt
	movl	%eax, -108(%rbp)
	movq 	$.LC4, -112(%rbp)
	movl 	-112(%rbp), %eax
	movq 	-112(%rbp), %rdi
	call	printStr
	movl	%eax, -116(%rbp)
	movq 	$.LC5, -120(%rbp)
	movl 	-120(%rbp), %eax
	movq 	-120(%rbp), %rdi
	call	printStr
	movl	%eax, -124(%rbp)
	movl	$0, %eax
	movl 	%eax, -128(%rbp)
	movl	-128(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident		"Compiled by 18CS10069"
	.section	.note.GNU-stack,"",@progbits
