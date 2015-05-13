.model small
.data
msg db 'what is your name?'
nam db 50 dup(0)
.code
mov ax,@data
mov ds,ax
mov si,0
mov ah,1
bak:int 21h
mov nam[si],al
inc si
cmp al,13
jne bak
mov byte ptr nam[si],'$'
call clr
call setc
lea dx,msg
mov ah,9
int 21h
mov ah,4ch
int 21h
clr:mov ah,6
mov al,0
mov bh,7
mov ch,0
mov cl,0
mov dh,35
mov dl,35
int 10h
ret
setc:mov ah,2
mov bh,0
mov dh,20
mov dl,20
int 10h
ret
end     
          
