	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"Value stored in pointer argument: "
.LC1:
	.string	"\n"
.LC2:
	.string	"###################################################################################\n"
.LC3:
	.string	"TESTING FUNCTIONS WITH POINTER ARGUMENTS:\n"
.LC4:
	.string	"Passing parameter to function : int test(int *a)    \n"
.LC5:
	.string	"Value passed to function: "
.LC6:
	.string	"\n"
.LC7:
	.string	"Value returned from function is: "
.LC8:
	.string	"\n"
.LC9:
	.string	"###################################################################################\n"
	.text	
	.globl	test
	.type	test, @function
test: 
.LFB0:
	.cfi_startproc
	pushq 	%rbp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movq 	%rsp, %rbp
	.cfi_def_cfa_register 5
	subq	$56, %rsp
	movq	%rdi, -20(%rbp)
	movq 	$.LC0, -28(%rbp)
	movl 	-28(%rbp), %eax
	movq 	-28(%rbp), %rdi
	call	printStr
	movl	%eax, -32(%rbp)
	movl 	-20(%rbp), %eax
	movq 	-20(%rbp), %rdi
	call	printInt
	movl	%eax, -40(%rbp)
	movq 	$.LC1, -44(%rbp)
	movl 	-44(%rbp), %eax
	movq 	-44(%rbp), %rdi
	call	printStr
	movl	%eax, -48(%rbp)
	movl	-20(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	test, .-test
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
	subq	$148, %rsp

	movq 	$.LC2, -40(%rbp)
	movl 	-40(%rbp), %eax
	movq 	-40(%rbp), %rdi
	call	printStr
	movl	%eax, -44(%rbp)
	movq 	$.LC3, -48(%rbp)
	movl 	-48(%rbp), %eax
	movq 	-48(%rbp), %rdi
	call	printStr
	movl	%eax, -52(%rbp)
	movl	$3, %eax
	movl 	%eax, -56(%rbp)
	movl	-56(%rbp), %eax
	movl 	%eax, -28(%rbp)
	leaq	-28(%rbp), %rax
	movq 	%rax, -64(%rbp)
	movl	-64(%rbp), %eax
	movl 	%eax, -32(%rbp)
	movq 	$.LC4, -72(%rbp)
	movl 	-72(%rbp), %eax
	movq 	-72(%rbp), %rdi
	call	printStr
	movl	%eax, -76(%rbp)
	movq 	$.LC5, -80(%rbp)
	movl 	-80(%rbp), %eax
	movq 	-80(%rbp), %rdi
	call	printStr
	movl	%eax, -84(%rbp)
	movl 	-28(%rbp), %eax
	movq 	-28(%rbp), %rdi
	call	printInt
	movl	%eax, -92(%rbp)
	movq 	$.LC6, -96(%rbp)
	movl 	-96(%rbp), %eax
	movq 	-96(%rbp), %rdi
	call	printStr
	movl	%eax, -100(%rbp)
	movl 	-28(%rbp), %eax
	movq 	-28(%rbp), %rdi
	call	test
	movl	%eax, -108(%rbp)
	movl	-108(%rbp), %eax
	movl 	%eax, -24(%rbp)
	movq 	$.LC7, -116(%rbp)
	movl 	-116(%rbp), %eax
	movq 	-116(%rbp), %rdi
	call	printStr
	movl	%eax, -120(%rbp)
	movl 	-24(%rbp), %eax
	movq 	-24(%rbp), %rdi
	call	printInt
	movl	%eax, -124(%rbp)
	movq 	$.LC8, -128(%rbp)
	movl 	-128(%rbp), %eax
	movq 	-128(%rbp), %rdi
	call	printStr
	movl	%eax, -132(%rbp)
	movq 	$.LC9, -136(%rbp)
	movl 	-136(%rbp), %eax
	movq 	-136(%rbp), %rdi
	call	printStr
	movl	%eax, -140(%rbp)
	movl	$0, %eax
	movl 	%eax, -144(%rbp)
	movl	-144(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident		"Compiled by 18CS10069"
	.section	.note.GNU-stack,"",@progbits
