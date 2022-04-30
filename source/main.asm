BITS 64

%ifndef MAIN
%define MAIN

%include 'source/constants.asm'
%include 'source/functions.asm'

global _start

section .text

_start:
    .begin:
        call input_int

        cmp rax, -1
        je .error_user_input

        cmp rax, mystery_number
        jg .lower
        jl .greater
        je .end

    .error_user_input:
        call print_error_message
        jmp .begin

    .lower:
        call print_less_message
        jmp .begin

    .greater:
        call print_more_message
        jmp .begin

    .end:
        call print_won_message
        call exit

%endif

