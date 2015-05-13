include c:\masm\rd.mac
include c:\masm\disp.mac
.model small
.data
str db 10 dup(?)
.code
mov ax,@data
mov ds,ax
mov si,0
read1:read
        cmp al,0dh
        je here
        mov str[si],al
        inc si
        jmp read1
here:mov cx,si
        mov si,0
        mov dl,10
        display
disp1:mov dl,str[si]
        display
        inc si
        loop disp1
        mov ah,4ch
        int 21h
        end
