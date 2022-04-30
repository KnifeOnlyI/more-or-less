BITS 64

%ifndef FUNCTIONS
%define FUNCTIONS

%include 'source/constants.asm'

section .bss

    user_input resb 3

section .text

input_str:
    push rax
    push rdi
    push rsi
    push rdx
    push rcx
    push r11

    mov rdi, prompt_message
    mov rsi, 9
    call print_message

    mov rax, sys_read
    mov rdi, stdin
    mov rsi, user_input
    mov rdx, 3
    syscall
    
    pop rax
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop r11

    ret

print_message:
    push rax
    push rdi
    push rsi
    push rdx
    push rcx
    push r11

    mov rdx, rsi
    mov rsi, rdi
    mov rax, sys_write
    mov rdi, stdout
    syscall

    pop rax
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop r11
    
    ret

print_prompt_message:
    push rdi
    push rsi

    mov rdi, prompt_message
    mov rsi, 10
    call print_message

    pop rdi
    pop rsi

    ret

print_won_message:
    push rdi
    push rsi

    mov rdi, won_message
    mov rsi, 10
    call print_message

    pop rdi
    pop rsi

    ret

print_more_message:
    push rdi
    push rsi

    mov rdi, more_message
    mov rsi, 5
    call print_message

    pop rdi
    pop rsi

    ret

print_less_message:
    push rdi
    push rsi

    mov rdi, less_message
    mov rsi, 5
    call print_message

    pop rdi
    pop rsi

    ret

exit:
    push rax
    push rdi
    push rcx
    push r11

    mov rax, sys_exit
    mov rdi, rdi
    syscall

    pop rax
    pop rdi
    pop rcx
    pop r11

    ret

%endif

