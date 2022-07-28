        global _start
        section .text
_start:
        mov     rax, 1
        xor     rcx, rcx
        mov     r8, 16

fibonacci:
        push    rcx
        push    rax

        ; add     rax, rcx

        mov     rcx, 10
        xor     rbx, rbx

divide:
        xor     rdx, rdx
        div     rcx
        push    rdx
        inc     rbx

        test    rax, rax
        jnz     divide

        mov     rcx, rbx
        lea     rsi, strOutput

get_digit:
        pop     rax
        add     rax, '0'
        mov     [rsi], rax
        inc     rsi
        dec     rcx

        test    rcx, rcx
        jnz     get_digit

        mov     rax, 10
        mov     [rsi], rax

        mov     rax, 1
        mov     rdi, 1
        mov     rsi, strOutput
        mov     rdx, 4
        syscall

        pop     rax
        pop     rdx
        mov     rcx, rax
        add     rax, rdx

        dec     r8
        test    r8, r8
        jnz     fibonacci

        mov     rax, 60
        xor     rdi, rdi
        syscall

        section .data
strOutput:      db      16 dup (0)

