;C:\nasmexe>lib /def:C:\...\\kernel32.def /out:C:\...\kernel32.lib /machine:x64 /list
default rel
extern GetStdHandle, WriteConsoleA

section .data
    message db 'HelloWorld', 0Ah
    message_len equ $ - message

section .bss
    bytes_written resd 1

section .text
    global main
    main:
        sub rsp, 8
        mov rcx, -11
        call GetStdHandle
        mov rcx, rax
        lea rdx, [message]
        mov r8d, message_len
        lea r9, [bytes_written]
        call WriteConsoleA
        
