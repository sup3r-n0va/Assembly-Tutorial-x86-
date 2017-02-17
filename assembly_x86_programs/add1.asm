section   .text
	global _start	;must be declared for using gcc
_start:			;tell linker entry point
	mov eax, '3'	;hardcoded number 3
	sub eax, '0'	;subtract ascii 0 from eax
	mov eax, '4'	;hardcoded number 4
	sub ebx, '0'	;subtract ascii 0 from the ebx register
	add eax, ebx	;add the two values
	add eax, '0' 	;add  ascii 0 to the eax register to convert to integer
	mov [sum], eax	;move the eax register to sum variable
	mov ecx, msg	;move msg ecx register
	mov ebx,1	;file descriptor (stdout)
	mov eax,4	;system call number (sys_write)
	int 0x80	;call kernel
	mov ecx, sum	;move the sum to ecx register
	mov edx, 1  
	mov ebx, 1	;file descriptor(stdout)
	mov eax, 4	;system call number (sys_write)
	int 0x80	;call kernel
	mov eax, 1	;system call number (sys_exit)

	int 0x80	;call kernel

section .data
	msg db "The sum is:", 0xA, 0xD
	len equ $ - msg
	segment .bss
	sum resb 1

