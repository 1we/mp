.model small
.data
array db 85h,95h,25h
len dw $-array
.code
mov ax,@data
mov ds,ax
mov bx,len
dec bx
np:mov cx,bx
mov si,0
ni:mov al,array[si]
inc si
cmp al,array[si]
jbe next
xchg al,array[si]
mov array[si-1],al
next:loop ni
dec bx
jnz np
mov ah,4ch
int 21h
end
