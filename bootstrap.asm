;https://wiki.osdev.org/Boot_Sequence

bits 16                         ; Tell assembler that this is 16-bit code.

org 0x7c00                      ; BIOS calls int19 and loads sector 1, head 0, track 0, from the first drive into 0000h:7C00h.

        global init             ; Program entry point.
        section .text
init:
        mov cx, [str_len]       ; Setup the loop to print the correct number of characters.
        mov si, string          ; Move the address of our string into si

printchar:
        lodsb                   ; Loads the byte at ds:si into AL
        mov ah, 0Eh             ; Set the function number for char output.
        int 10H                 ; Call the BIOS interrupt to invoke Int 10/AH=0Eh

        loop printchar          ; Loop until we've displayed all characters of the string.

done:
        hlt                     ; Finished with bootsec code. Halt the system for now.

string:         db      "G-DOS: Initializing ..."               ; This is the string that we'll print.
str_len:        db      $-string
padding:        times 510 - ($-$$) db 0                         ; Bootsec needs to be exactly 512 bytes. Calculate how much padding we need.
signiture:      dw 0xAA55                                       ; The last two bytes of bootsec have to be this boot signiture.