BITS 64

%ifndef MAIN
%define MAIN

%include 'source/constants.asm'
%include 'source/functions.asm'

global _start

section .text

_start:   
    mov rax, message
    mov rdi, 14
    call print_message

    call exit

%endif

