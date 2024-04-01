default rel ; Use relative address references

section .data
    GetStdHandle dq 0x00007FFF786B7D00  ; Declare the address of the GetStdHandle function
    WriteConsoleA dq 0x00007FFF786C0D00  ; Declare the address of the WriteConsoleA function
    message db 'HelloWorld', 0Ah  ; Declare a string ending with 0Ah, i.e., "HelloWorld\n"
    message_len equ $ - message  ; Calculate the length of the message

section .bss
    bytes_written resd 1  ; Allocate 4 bytes of space to store the number of bytes written

section .text
    global main  ; Declare the main function as the program entry point
    main:
        mov rax, qword [GetStdHandle]  ; Load the address of the GetStdHandle function into the rax register
        sub rsp, 8  ; Allocate 8 bytes of space for the stack frame
        mov rcx, -11  ; Set the rcx register to -11
        call rax ; Call the GetStdHandle function and store the return value in the rax register

        mov rcx, rax  ; Store the return value of the GetStdHandle function (in rax) in rcx
        mov rax, qword [WriteConsoleA]  ; Load the address of the WriteConsoleA function into the rax register
        lea rdx, [message]  ; Load the address of the message into the rdx register
        mov r8d, message_len  ; Load the length of the message into the r8d register
        lea r9, [bytes_written]  ; Load the address of bytes_written into the r9 register
        call rax ; Call the WriteConsoleA function



;https://www.nasm.us/pub/nasm/releasebuilds/2.16.01/win64/
;nasm -f win64 C:\nasmexe\h.asm -o C:\nasmexe\h.obj

;https://visualstudio.microsoft.com/
;cd "C:\your file name" 
;link /SUBSYSTEM:CONSOLE /ENTRY:main h.obj /ALIGN:16 /OPT:REF /OPT:ICF /HEADERALIGN /DEBUG:NONE /MERGE:.data=m /MERGE:.text=m /MERGE:.rdata=m /MERGE:.text=m