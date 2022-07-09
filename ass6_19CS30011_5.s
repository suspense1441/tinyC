	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"###################################################################################\n"
.LC1:
	.string	"FUNCTION TO PRINT LOWER TRIANGLE USING NESTED LOOPS:\n"
.LC2:
	.string	"ENTER SIZE OF THE TRIANGLE: "
.LC3:
	.string	"\n"
.LC4:
	.string	"*"
.LC5:
	.string	"\n"
.LC6:
	.string	"###################################################################################\n"
	.text	
	.globl	main
	.type	main, @function
main: 
.LFB0:
	.cfi_startproc
	pushq 	%rbp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movq 	%rsp, %rbp
	.cfi_def_cfa_register 5
	subq	$168, %rsp

	movq 	$.LC0, -32(%rbp)
	movl 	-32(%rbp), %eax
	movq 	-32(%rbp), %rdi
	call	printStr
	movl	%eax, -36(%rbp)
	movq 	$.LC1, -40(%rbp)
	movl 	-40(%rbp), %eax
	movq 	-40(%rbp), %rdi
	call	printStr
	movl	%eax, -44(%rbp)
	movq 	$.LC2, -48(%rbp)
	movl 	-48(%rbp), %eax
	movq 	-48(%rbp), %rdi
	call	printStr
	movl	%eax, -52(%rbp)
	leaq	-76(%rbp), %rax
	movq 	%rax, -80(%rbp)
	movl 	-80(%rbp), %eax
	movq 	-80(%rbp), %rdi
	call	readInt
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	movl 	%eax, -60(%rbp)
	movl	$0, %eax
	movl 	%eax, -92(%rbp)
	movl	-92(%rbp), %eax
	movl 	%eax, -64(%rbp)
.L2: 
	movl	$2, %eax
	movl 	%eax, -100(%rbp)
	movl 	-100(%rbp), %eax
	imull 	-60(%rbp), %eax
	movl 	%eax, -104(%rbp)
	movl	$1, %eax
	movl 	%eax, -108(%rbp)
	movl 	-104(%rbp), %eax
	movl 	-108(%rbp), %edx
	subl 	%edx, %eax
	movl 	%eax, -112(%rbp)
	movl	-64(%rbp), %eax
	cmpl	-112(%rbp), %eax
	jl .L4
	jmp .L8
.L3: 
	movl	-64(%rbp), %eax
	movl 	%eax, -116(%rbp)
	addl 	$1, -64(%rbp)
	jmp .L2
.L4: 
	movq 	$.LC3, -120(%rbp)
	movl 	-120(%rbp), %eax
	movq 	-120(%rbp), %rdi
	call	printStr
	movl	%eax, -124(%rbp)
	movl	$0, %eax
	movl 	%eax, -128(%rbp)
	movl	-128(%rbp), %eax
	movl 	%eax, -68(%rbp)
.L5: 
	movl	-68(%rbp), %eax
	cmpl	-64(%rbp), %eax
	jle .L7
	jmp .L3
.L6: 
	movl	-68(%rbp), %eax
	movl 	%eax, -136(%rbp)
	addl 	$1, -68(%rbp)
	jmp .L5
.L7: 
	movq 	$.LC4, -140(%rbp)
	movl 	-140(%rbp), %eax
	movq 	-140(%rbp), %rdi
	call	printStr
	movl	%eax, -144(%rbp)
	jmp .L6
	jmp .L3
.L8: 
	movq 	$.LC5, -148(%rbp)
	movl 	-148(%rbp), %eax
	movq 	-148(%rbp), %rdi
	call	printStr
	movl	%eax, -152(%rbp)
	movq 	$.LC6, -156(%rbp)
	movl 	-156(%rbp), %eax
	movq 	-156(%rbp), %rdi
	call	printStr
	movl	%eax, -160(%rbp)
	movl	$0, %eax
	movl 	%eax, -164(%rbp)
	movl	-164(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident		"Compiled by 18CS10069"
	.section	.note.GNU-stack,"",@progbits
