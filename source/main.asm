BITS 64

%ifndef MAIN
%define MAIN

%include 'source/constants.asm'
%include 'source/functions.asm'

global _start

section .text

_start:
    call input_str
    call print_won_message
    call print_more_message
    call print_less_message
    call exit

%endif

