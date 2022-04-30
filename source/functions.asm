BITS 64

%ifndef FUNCTIONS
%define FUNCTIONS

%include 'source/constants.asm'

section .bss

    user_input resb 4

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

    ; TODO: Clean buffer to avoid BufferOverlow hacks
    mov rax, sys_read
    mov rdi, stdin
    mov rsi, user_input
    mov rdx, 20
    syscall
    
    pop rax
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop r11

    ret

input_int:
    call input_str

    mov rdi, user_input
    call atoi

    ret

atoi:
    push rdi
    push rsi
    push rcx

    mov rax, 0                  ; Set initial to 0
    mov rcx, 0                  ; Set the counter to 0

    .convert:
        movzx rsi, byte[rdi]    ; Get the current character
        cmp rsi, 0              ; Check for \0
        je .done
        cmp rsi, 10             ; Check for \n
        je .done

        cmp rsi, 48             ; Anything less than 0 is invalid
        jl .error

        cmp rsi, 57             ; Anything greater than 9 is invalid
        jg .error

        sub rsi, 48             ; Convert ASCII to decimal
        imul rax, 10            ; Multiply total by 10
        add rax, rsi            ; Add current digit to total

        inc rdi                 ; Get the address of the next character
        inc rcx                 ; Increment counter
        jmp .convert

    .error:
        mov rax, -1
        inc rcx

    .done:
        cmp rcx, 0              ; If counter = 0, no character to convert
        je .error

        pop rdi
        pop rsi
        pop rcx

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

print_error_message:
    push rdi
    push rsi

    mov rdi, error_message
    mov rsi, 13
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

