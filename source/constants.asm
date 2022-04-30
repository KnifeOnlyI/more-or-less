BITS 64

%ifndef CONSTANTS
%define CONSTANTS

section .data

    sys_read equ 0
    sys_write equ 1
    sys_exit equ 60
    stdin equ 0
    stdout equ 1

    mystery_number equ 50 ; TODO: Generate a random mystery number

    prompt_message: db "Number : "
    won_message: db "You won !", 10
    more_message: db "More", 10
    less_message: db "Less", 10
    error_message: db "Not a number", 10

%endif

