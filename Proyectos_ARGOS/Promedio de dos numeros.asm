	.file	"Promedio de dos numeros.c"
	.comm	_num1, 4, 2
	.comm	_num2, 4, 2
	.comm	_resultado, 4, 2
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Promedio de dos numeros\0"
LC1:
	.ascii "Ingrese el primer numero: \0"
LC2:
	.ascii "%d\0"
LC3:
	.ascii "\12Ingrese el segundo numero: \0"
LC5:
	.ascii "\12El resultado es: \0"
LC6:
	.ascii "%f\0"
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
	subl	$32, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_puts
	movl	$LC1, (%esp)
	call	_printf
	movl	$_num1, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	$LC3, (%esp)
	call	_printf
	movl	$_num2, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	_num1, %edx
	movl	_num2, %eax
	addl	%edx, %eax
	movl	%eax, 28(%esp)
	fildl	28(%esp)
	fstps	_resultado
	flds	_resultado
	flds	LC4
	fdivrp	%st, %st(1)
	fstps	_resultado
	movl	$LC5, (%esp)
	call	_printf
	flds	_resultado
	fstpl	4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.section .rdata,"dr"
	.align 4
LC4:
	.long	1073741824
	.ident	"GCC: (GNU) 4.9.3"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
