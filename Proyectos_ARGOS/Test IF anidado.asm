	.file	"Test IF anidado.c"
	.comm	_a, 4, 2
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Prueba de IF anidados\0"
LC1:
	.ascii "\12Ingrese un numero: \0"
LC2:
	.ascii "%d\0"
LC3:
	.ascii "El numero es positivo\0"
	.align 4
LC4:
	.ascii "El numero tambien es menor de 100\0"
LC5:
	.ascii "El numero es negativo\0"
	.align 4
LC6:
	.ascii "Fin de la prueba de IF anidados\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_printf
	movl	$LC1, (%esp)
	call	_printf
	movl	$_a, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	_a, %eax
	testl	%eax, %eax
	jle	L2
	movl	$LC3, (%esp)
	call	_puts
	movl	_a, %eax
	cmpl	$99, %eax
	jg	L4
	movl	$LC4, (%esp)
	call	_puts
	jmp	L4
L2:
	movl	$LC5, (%esp)
	call	_puts
L4:
	movl	$LC6, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.ident	"GCC: (GNU) 4.9.3"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
