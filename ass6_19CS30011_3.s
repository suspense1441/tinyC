	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"##################################################################################################################\n"
.LC1:
	.string	"Enter two numbers\n"
.LC2:
	.string	"Enter first number: "
.LC3:
	.string	"Enter second number: "
.LC4:
	.string	"Sum is equal to: "
.LC5:
	.string	"\n"
.LC6:
	.string	"##################################################################################################################\n"
	.text	
	.globl	addInt
	.type	addInt, @function
addInt: 
.LFB0:
	.cfi_startproc
	pushq 	%rbp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movq 	%rsp, %rbp
	.cfi_def_cfa_register 5
	subq	$140, %rsp
	movq	%rdi, -20(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$2, %eax
	movl 	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	movl 	%eax, -32(%rbp)
	movl	$10, %eax
	movl 	%eax, -84(%rbp)
	movl 	-20(%rbp), %eax
	movl 	-16(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -88(%rbp)
	movl	-88(%rbp), %eax
	movl 	%eax, -24(%rbp)
	movl	$2, %eax
	movl 	%eax, -96(%rbp)
	movl	-96(%rbp), %eax
	movl 	%eax, -32(%rbp)
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jg .L2
	jmp .L5
	jmp .L3
.L2: 
	movl	$2, %eax
	movl 	%eax, -104(%rbp)
	movl 	-104(%rbp), %eax
	imull 	-40(%rbp), %eax
	movl 	%eax, -108(%rbp)
	movl	-108(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jne .L4
	jmp .L5
.L3: 
	jmp .L6
.L4: 
	movl	-20(%rbp), %eax
	movl 	%eax, -112(%rbp)
	addl 	$1, -20(%rbp)
	jmp .L6
.L5: 
	movl	$2, %eax
	movl 	%eax, -116(%rbp)
	movl 	-116(%rbp), %eax
	imull 	-16(%rbp), %eax
	movl 	%eax, -120(%rbp)
	movl 	-20(%rbp), %eax
	movl 	-120(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -124(%rbp)
	movl	-124(%rbp), %eax
	movl 	%eax, -40(%rbp)
.L6: 
	movl	-24(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	addInt, .-addInt
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
	subq	$212, %rsp

	movq 	$.LC0, -28(%rbp)
	movl 	-28(%rbp), %eax
	movq 	-28(%rbp), %rdi
	call	printStr
	movl	%eax, -32(%rbp)
	movl	$2, %eax
	movl 	%eax, -40(%rbp)
	movl	-40(%rbp), %eax
	movl 	%eax, -36(%rbp)
	movl	$10, %eax
	movl 	%eax, -88(%rbp)
	movq 	$.LC1, -112(%rbp)
	movl 	-112(%rbp), %eax
	movq 	-112(%rbp), %rdi
	call	printStr
	movl	%eax, -116(%rbp)
	movq 	$.LC2, -120(%rbp)
	movl 	-120(%rbp), %eax
	movq 	-120(%rbp), %rdi
	call	printStr
	movl	%eax, -124(%rbp)
	leaq	-108(%rbp), %rax
	movq 	%rax, -132(%rbp)
	movl 	-132(%rbp), %eax
	movq 	-132(%rbp), %rdi
	call	readInt
	movl	%eax, -136(%rbp)
	movl	-136(%rbp), %eax
	movl 	%eax, -96(%rbp)
	movq 	$.LC3, -144(%rbp)
	movl 	-144(%rbp), %eax
	movq 	-144(%rbp), %rdi
	call	printStr
	movl	%eax, -148(%rbp)
	leaq	-108(%rbp), %rax
	movq 	%rax, -152(%rbp)
	movl 	-152(%rbp), %eax
	movq 	-152(%rbp), %rdi
	call	readInt
	movl	%eax, -156(%rbp)
	movl	-156(%rbp), %eax
	movl 	%eax, -100(%rbp)
	movl 	-96(%rbp), %eax
	movq 	-96(%rbp), %rdi
movl 	-100(%rbp), %eax
	movq 	-100(%rbp), %rsi
	call	addInt
	movl	%eax, -168(%rbp)
	movl	-168(%rbp), %eax
	movl 	%eax, -104(%rbp)
	movq 	$.LC4, -176(%rbp)
	movl 	-176(%rbp), %eax
	movq 	-176(%rbp), %rdi
	call	printStr
	movl	%eax, -180(%rbp)
	movl 	-104(%rbp), %eax
	movq 	-104(%rbp), %rdi
	call	printInt
	movl	%eax, -188(%rbp)
	movq 	$.LC5, -192(%rbp)
	movl 	-192(%rbp), %eax
	movq 	-192(%rbp), %rdi
	call	printStr
	movl	%eax, -196(%rbp)
	movq 	$.LC6, -200(%rbp)
	movl 	-200(%rbp), %eax
	movq 	-200(%rbp), %rdi
	call	printStr
	movl	%eax, -204(%rbp)
	movl	$0, %eax
	movl 	%eax, -208(%rbp)
	movl	-208(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident		"Compiled by 18CS10069"
	.section	.note.GNU-stack,"",@progbits
