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

print_won_message:
    push rax
    push rdi

    mov rax, won_message
    mov rdi, 10
    call print_message

    pop rax
    pop rdi

    ret

print_more_message:
    push rax
    push rdi

    mov rax, more_message
    mov rdi, 5
    call print_message

    pop rax
    pop rdi

    ret

print_less_message:
    push rax
    push rdi

    mov rax, less_message
    mov rdi, 5
    call print_message

    pop rax
    pop rdi

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

