; memory.asm

section .data
    bNum db 123
    wNum dw 12345
    warray times 5 dw 0	; array of 5 double words containing 0
    dNum dd 12345
    qNum1 dq 12345
    text1 db "abc",0
    qNum2 dq  3.141592654
    text2 db "cde",0
section .bss
    bvar resb	1
    dvar resd	1
    wvar	resw	10
    qvar resq	30000

section .text
    global main
main:
    ;mov rbp, rsp           ;for correct debugging
    push rbp
    mov rbp,rsp
    lea rax, [bNum]	;load address of bNum in rax
    mov rax, bNum		;load address of bNum in rax
    mov rax, [bNum]	;load value at bNum in rax
    XOR RAX, RAX            ; Pongo RAX todo en 0
    MOV AL, [bNum]          ; Pongo bNum en un registro del tamaño correcto
    mov [bvar], rax	;load value in rax in at address bvar
                            ; Esto trunca RAX a solo el primer byte porque bvar mide mide un byte
    MOV [bvar], AL          ; Acá se pone solo los 8 bytes inferiores de RAX que sí entran en bvar
                            ; En este caso debería comportarse igual
    lea rax, [bvar]	;load address of bvar in rax
    lea rax, [wNum]	;load address of wNum in rax
    mov rax, [wNum]	;load content of wNum in rax
    lea rax, [text1]	;load address of text1 in rax
    mov rax, text1		;load address of text1 in rax
    mov rax, text1+1	;load address second character in rax
    lea rax, [text1+1]	;load address second character in rax
    mov rax, [text1]	;load content starting at text1 in rax	
    mov rax, [text1+1]	;load content starting at text1+1 in rax
    mov rsp,rbp
    pop rbp
ret
