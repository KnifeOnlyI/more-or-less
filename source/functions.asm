BITS 64

%ifndef FUNCTIONS
%define FUNCTIONS

%include 'source/constants.asm'

section .text

print_message:
    push rax
    push rdi
    push rsi
    push rcx

    mov rsi, rax
    mov rdx, rdi
    mov rax, sys_write
    mov rdi, stdout
    syscall

    pop rax
    pop rdi
    pop rsi
    pop rcx

    ret

exit:
    push rax
    push rdi
    push rsi
    push rcx

    mov rax, sys_exit
    mov rdi, rdi
    syscall

    pop rax
    pop rdi
    pop rsi
    pop rcx

    ret

%endif

