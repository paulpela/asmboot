USE16
ORG 0x7C00

boot_stage_one:
    mov ah, 0x00
    mov dl, 0
    int 0x13
    mov ah, 0x02
    mov al, 0x20 ; # of sectors to read (sectors are 512B)
    mov dl, 0
    mov ch, 0
    mov dh, 0
    mov cl, 2
    mov bx, 0x8000
    int 0x13
    jmp 0x8000

pad_boot_sector:
    times ((0x200 - 2) - ($ - $$)) db 0x00

boot_sector_magic_signeture:
    dw 0xAA55

