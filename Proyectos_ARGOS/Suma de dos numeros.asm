	.file	"Suma de dos numeros.c"
	.comm	a, 4, 2
	.comm	b, 4, 2
	.comm	resp, 4, 2
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Suma de dos numeros enteros\0"
.LC1:
	.ascii "Ingrese el primer numero: \0"
.LC2:
	.ascii "%d\0"
.LC3:
	.ascii "Ingrese el segundo numero: \0"
.LC4:
	.ascii "El resultado de la suma es: \0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rcx
	call	puts
	leaq	.LC1(%rip), %rcx
	call	printf
	leaq	a(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	scanf
	leaq	.LC3(%rip), %rcx
	call	printf
	leaq	b(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	scanf
	leaq	a(%rip), %rax
	movl	(%rax), %edx
	leaq	b(%rip), %rax
	movl	(%rax), %eax
	addl	%eax, %edx
	leaq	resp(%rip), %rax
	movl	%edx, (%rax)
	leaq	.LC4(%rip), %rcx
	call	printf
	leaq	resp(%rip), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC2(%rip), %rcx
	call	printf
	movl	$0, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev3, Built by MSYS2 project) 5.2.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
