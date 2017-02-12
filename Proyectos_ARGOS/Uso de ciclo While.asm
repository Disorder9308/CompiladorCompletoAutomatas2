	.file	"Uso de ciclo While.c"
	.comm	_cantidad, 4, 2
	.comm	_it, 4, 2
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Impresion de numeros en ciclo\0"
	.align 4
LC1:
	.ascii "\12Ingrese la cantidad de numeros a imprimir: \0"
LC2:
	.ascii "%d\0"
LC3:
	.ascii "Empecemos...\0"
LC4:
	.ascii "\12Numero: \0"
LC5:
	.ascii "\12Se imprimieron \0"
LC6:
	.ascii " numeros\0"
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
	movl	$0, _it
	movl	$LC0, (%esp)
	call	_printf
	movl	$LC1, (%esp)
	call	_printf
	movl	$_cantidad, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	$LC3, (%esp)
	call	_printf
	jmp	L2
L3:
	movl	_it, %eax
	addl	$1, %eax
	movl	%eax, _it
	movl	$LC4, (%esp)
	call	_printf
	movl	_it, %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
L2:
	movl	_it, %edx
	movl	_cantidad, %eax
	cmpl	%eax, %edx
	jl	L3
	movl	$LC5, (%esp)
	call	_printf
	movl	_cantidad, %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
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
