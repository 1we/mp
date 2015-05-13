.model small
.code
mov ah,2ch
int 21h
mov al,ch
call disp
mov dl,':'
mov ah,2
int 21h
mov al,cl
call disp
mov dl,':'
mov ah,2
int 21h
mov al,dh
call disp
mov ah,4ch
int 21h
disp:
aam
add ax,3030h
mov bx,ax
mov dl,bh
mov ah,02
int 21h
mov dl,bl
mov ah,02
int 21h
ret
end
