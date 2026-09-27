[bits 16]

global start
extern kernal
start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00

    sti                         ; Turn on interrupts for BIOS
    mov ah, 0x02                ; Read sectors function
    mov al, 5                   ; Number of sectors to read
    mov ch, 0                   ; Cylinder 0
    mov dh, 0                   ; Head 0
    mov cl, 2                   ; Start reading at Sector 2
    mov bx, 0x7e00              ; ES:BX -> Destination address in RAM (0x7E00)
    int 0x13                    ; Call BIOS
    cli

    lgdt [gdt_des]

    mov eax, cr0
    or eax, 0x1
    mov cr0, eax

    jmp 0x08:reload_cs

tab_gdt:
; null index
    dq 0x0000000000000000
; 1 index
;offset 0x08
; base = 0,granular = 0xCF,access=0x9A
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 0x9A
    db 0xCF
    db 0x00

; 2 index
; offset 0x10
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 0x92
    db 0xCF
    db 0x00
tab_gdt_end:

gdt_des:
    dw (tab_gdt_end - tab_gdt) - 1
    dd tab_gdt

[bits 32]
reload_cs:

    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov esp, 0x90000

   call kernal

hang:
    hlt
    jmp hang


times 510-($-$$) db 0
dw 0xAA55
