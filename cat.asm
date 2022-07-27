            global  _start
            section .text
_start:     
            push    rbp         ; initialize stack base pointer
            mov     rbp, rsp    ; set stack base pointer to stack pointer
            mov     rdi, 16     ; set rdi to 16
            sub     rsp, rdi    ; subtract rdi from rsp and store in rsp, this moves stack pointer 16 above stack (newest item on stack has smallest address)

            xor     rax, rax    ; set rax to 0 (selects read syscall)
            xor     rdi, rdi    ; set rdi to 0 (selects stdin function descriptor) (reads from terminal input)
            mov     rsi, rsp    ; set rsi (location to store data) to stack pointer
            mov     rdx, 16     ; set rdx (size of data) to 16
            syscall             ; does the system call to read the data
            
            mov     rax, 1      ; sets rax to 1  (selects write syscall)
            mov     rdi, 1      ; sets rdi to 1 (selects stdout function descriptor) (write to terminal output)
            mov     rsi, rsp    ; sets rsi (location of the data which is to be written) to the stack pointer
            mov     rdx, 16     ; sets rdx (size of data) to 16
            syscall             ; does the system call to write the data

            mov     rax, 60     ; sets rax to 60 (selects exit syscall)
            xor     rdi, rdi    ; sets rdi to 0 (sets error code to 0 (no error))
            syscall             ; does the system call to exit the program