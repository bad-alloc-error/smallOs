ORG 0x7c00 
BITS 16

start:

    mov si, message     ; move para o reg o primeiro char da string
    call print
    jmp $               ; loop que itera char por char

print:
    mov bx, 0

.loop:
    lodsb               ; carrega o char que o reg si esta apontando
    cmp al, 0
    je .done
    call print_char
    jmp .loop

.done:    
    ret

print_char:
    mov ah, 0eh
    int 0x10
    ret

message: db 'smallOS Bootloader', 0

times 510-($ - $$) db 0 ; preenche os bytes restantes com zero
dw 0xAA55               ; intel é little endianess


    


