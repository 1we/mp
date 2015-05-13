.model small
.stack 100
.data
str db 'monm'
n db $-str
rstr db 10 dup(0)
msg1 db 'string is palidrome$'
msg2 db 'not a palidrome$'
.code
mov ax,@data
mov ds,ax
mov es,ax
mov cl,n
mov si,0
dec cl
mov di,cx
inc cx
bak:mov ah,str[di]
mov rstr[si],ah
inc si
dec di
loop bak
lea si,str
lea di,rstr
cld
mov cl,n
repe cmpsb
je dmsg1
lea dx,msg2
jmp xit
dmsg1:lea dx,msg1
xit:mov ah,09h
int 21h
mov ah,4ch
int 21h
end

