.model small
.data
n dw 5
r dw 3
ncr dw 0
.code
mov ax,@data
mov ds,ax
mov ax,n
mov bx,r
call ncrpro
mov ah,4ch
int 21h
ncrpro:cmp bx,ax
je res1
cmp bx,0
je res1
cmp bx,1
je resn
dec ax
cmp bx,ax
je incr
push ax
push bx
call ncrpro
pop bx
pop ax
dec bx
push ax
push bx
call ncrpro
pop bx
pop ax
ret
res1:inc ncr
ret
incr:inc ncr
resn:add ncr,ax
ret
end
