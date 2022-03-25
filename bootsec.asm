;.8086
;http://kernelx.weebly.com/writing-a-bootsector.html

; CONVERT THIS TO NASM.

.MODEL TINY

_DATA SEGMENT WORD PUBLIC 'DATA'

MyString db 'Hello World!'

_DATA ENDS

.segment

        ORG 07C00h      ; BIOS calls int19 and loads sector 1, head 0, track 0, from the first drive into 0000h:7C00h.

init:


.data

_TEXT   ENDS

END  init