ORG 0 
BITS 16

start:
    cli                 ; reseta as interrupções
    mov ax, 0x7c0
    mov ds, ax
    mov es, ax
    mov ax, 0x00
    mov ss, ax
    mov sp, 0x7c00
    sti                 ; ativa as interrupções pois cli desativa
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


    


