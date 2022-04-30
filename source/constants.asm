BITS 64

%ifndef CONSTANTS
%define CONSTANTS

section .data

    sys_write equ 1
    sys_exit equ 60
    stdout equ 1

    message: db "Hello World !", 10

%endif

