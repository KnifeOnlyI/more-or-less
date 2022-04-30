BITS 64

%ifndef CONSTANTS
%define CONSTANTS

section .data

    sys_write equ 1
    sys_exit equ 60
    stdout equ 1

    won_message: db "You won !", 10
    more_message: db "More", 10
    less_message: db "Less", 10

%endif

