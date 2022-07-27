            global  _start
            section .text
_start:
            mov     rax, 1
            mov     rdi, 1
            mov     rsi, flag
            mov     rdx, 24
            syscall             ; prints flag

            mov     rax, 60
            xor     rsi, rsi
            syscall

            section .data
flag:       db      "PECTF{hellothisisgaming}", 10